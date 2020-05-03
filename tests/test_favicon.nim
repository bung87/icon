import unittest
import iconpkg/favicon
import sequtils
import asyncdispatch
import iconpkg/png 
import os

suite "favicon":
    test "generateFavicon":
        let images = REQUIRED_IMAGE_SIZES.map(proc(size:int):ImageInfo{.closure.} =
            let filePath = getCurrentDir() / "examples/data" /  $size & ".png"
            result = ImageInfo(size:size, filePath:filePath)
        )
        let opts = FavOptions(name:"",pngSizes: @[],icoSizes: @[])
        var results = waitFor generateFavicon(images, getTempDir(), opts)
        check len(results) == 11