Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7B17D539C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 16:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343524AbjJXOFB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 10:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbjJXOEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 10:04:52 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD0E1BEF
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 06:56:53 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6ce29d1db6eso2572058a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1698155813; x=1698760613; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eTBft1cB7VMfCDuvJUKwg2smQ1+xPGXa8dtfqsGxZfg=;
        b=la1fcQDYvcCoQgt2D6MAk5/USlsCV41uJWI7vFcJh7hylVk7T/13gxacnguCT14O5g
         Pt9jGWhu5/S7nb3Ko6Ek9Sf5Ozjx+WgvzNj4hm0gVIgrhC1nhiK48SrKDSjMxQ6XzRi9
         CSC4B56XmU4kVgpzI3gBvEHOUNsB+p/nRmA44vE5ocOPu/YUZ1xEQLDhL8hr+5cgXqy8
         B5t2MupPjfYOfST9OUaYb+BXxYKsn08rX7Z/s3mtCrL7cnpnBGzP5UNOfG8ZKtmR82X0
         s8QtuG5s3yn5Md+kuGlxV0CSS8fr+VSw4AJy9ehNj5iwRabHznJUUFzMDT92vON091Ls
         vzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155813; x=1698760613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTBft1cB7VMfCDuvJUKwg2smQ1+xPGXa8dtfqsGxZfg=;
        b=ZYR2R7xKBK0zeNkbuLX+RH2+YIAJG63uv26lJ+2UyoidHCRFR9MjEQ60DUXVoNg9sj
         fE7WbnXnLp+zj1AuFlI1Jm7bc5WsWBwzEqPw8T3YETgspk8uIEEoTXIrUZ799VlZ1d+J
         YQv4t1eM7rI6ikesrXw7ADZ0K+duNUpPtsbs2uXQRsX7YYNCWXl5azy6mGETfj+S+KH5
         1vhVRkQdlRLYdUt+yditlRuGiQet+qCouW4F/pfGYPCOHOHaZYVHQBZ+Jr83kB2F6Tif
         zb5Jc4vpcWix9ss3ouLyATU86+HYKvOfC0GahvC20Z51SwMT2ntqjeCA5vorOqetGx1s
         Skqw==
X-Gm-Message-State: AOJu0YypcNXDZty6joYfVYZfpj5bAWqxjmSaJj2+ovahixBa2QadOO/U
        ZTD0TWbA+z5xrTuY8RNmeWptIB8iF8ag1S3kI33HXIkurtk9jwkbzq0=
X-Google-Smtp-Source: AGHT+IGujn5vykzwhp7Ek9SLWyypfVqaBTSE+BoFBctCl53yf5eu76gyzLjnq0vcf6V2HF9XGStYhPLNcRPImzJwTlo=
X-Received: by 2002:a05:6871:5d3:b0:1c5:dcd:5d64 with SMTP id
 v19-20020a05687105d300b001c50dcd5d64mr8225547oan.7.1698155812779; Tue, 24 Oct
 2023 06:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231024133910.738828-1-phil@gadgetoid.com> <20231024133910.738828-2-phil@gadgetoid.com>
In-Reply-To: <20231024133910.738828-2-phil@gadgetoid.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Tue, 24 Oct 2023 14:56:41 +0100
Message-ID: <CA+kSVo8fisN9vEBchWONY603Les9to3+k-STpLV7SK61NVV+GQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v8 1/1] bindings: python: optionally include
 module in sdist
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Oct 2023 at 14:39, Phil Howard <phil@gadgetoid.com> wrote:
>
> Optionally vendor libgpiod source into sdist so that the Python module can
> be built from source, even with a missing or mismatched system libgpiod.
>
> Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> "LIBGPIOD_VERSION" to control what kind of package setup.py will build.
>
> In order to build an sdist or wheel package with a vendored libgpiod a
> version must be specified via the "LIBGPIOD_VERSION" environment variable.
>
> This will instruct setup.py to verify the given version against the list
> in sha256sums.asc and ensure it meets or exceeds a LIBGPIOD_MINIMUM_VERSION
> required for compatibility with the bindings.
>
> It will then fetch the tarball matching the requested version from
> mirrors.edge.kernel.org, verify the sha256 signature, unpack it, and copy
> the lib and include directories into the package root so they can be
> included in sdist or used to build a binary wheel.
>
> eg: LIBGPIOD_VERSION=2.1.0 python3 setup.py sdist
>
> Will build a source distribution with gpiod version 2.1.0 source included.
>
> It will also save the gpiod version into "libgpiod-version.txt" so that it
> can be passed to the build when the sdist is built by pip.
>
> Requiring an explicit version ensures that the Python bindings - which
> can be changed and versions independent of libgpiod - are built against a
> stable libgpiod release.
>
> In order to force a package with vendored gpiod source to link the system
> libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:
>
> eg: LINK_SYSTEM_LIBGPIOD=1 pip install libgpiod
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in    |   5 +
>  bindings/python/pyproject.toml |   2 +-
>  bindings/python/setup.py       | 214 +++++++++++++++++++++++++++++++--
>  3 files changed, 209 insertions(+), 12 deletions(-)
>
> diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> index 459b317..efdfd18 100644
> --- a/bindings/python/MANIFEST.in
> +++ b/bindings/python/MANIFEST.in
> @@ -3,6 +3,7 @@
>
>  include setup.py
>  include README.md
> +include libgpiod-version.txt
>
>  recursive-include gpiod *.py
>  recursive-include tests *.py
> @@ -12,3 +13,7 @@ recursive-include gpiod/ext *.h
>
>  recursive-include tests/gpiosim *.c
>  recursive-include tests/procname *.c
> +
> +recursive-include lib *.c
> +recursive-include lib *.h
> +recursive-include include *.h
> diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
> index fcf6bbe..f6bf43c 100644
> --- a/bindings/python/pyproject.toml
> +++ b/bindings/python/pyproject.toml
> @@ -2,4 +2,4 @@
>  # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
>
>  [build-system]
> -requires = ["setuptools", "wheel"]
> +requires = ["setuptools", "wheel", "packaging"]
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index c8db0a0..0129de7 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -1,24 +1,218 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>
> -from os import environ, path
> -from setuptools import setup, Extension, find_packages
> +from os import getenv, path, unlink
> +from shutil import copytree, rmtree
> +
> +from setuptools import Extension, find_packages, setup
>  from setuptools.command.build_ext import build_ext as orig_build_ext
> -from shutil import rmtree
> +from setuptools.command.sdist import log
> +from setuptools.command.sdist import sdist as orig_sdist
> +from setuptools.errors import BaseError
> +
> +LINK_SYSTEM_LIBGPIOD = getenv("LINK_SYSTEM_LIBGPIOD") == "1"
> +LIBGPIOD_MINIMUM_VERSION = "2.1.0"
> +LIBGPIOD_VERSION = getenv("LIBGPIOD_VERSION")
> +GPIOD_WITH_TESTS = getenv("GPIOD_WITH_TESTS") == "1"
> +SRC_BASE_URL = "https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/"
> +TAR_FILENAME = "libgpiod-{version}.tar.gz"
> +ASC_FILENAME = "sha256sums.asc"
> +SHA256_CHUNK_SIZE = 2048
> +
> +# __version__
> +with open("gpiod/version.py", "r") as fd:
> +    exec(fd.read())
> +
> +
> +def sha256(filename):
> +    """
> +    Return a sha256sum for a specific filename, loading the file in chunks
> +    to avoid potentially excessive memory use.
> +    """
> +    from hashlib import sha256
> +
> +    sha256sum = sha256()
> +    with open(filename, "rb") as f:
> +        for chunk in iter(lambda: f.read(SHA256_CHUNK_SIZE), b""):
> +            sha256sum.update(chunk)
> +
> +    return sha256sum.hexdigest()
> +
> +
> +def find_sha256sum(asc_file, tar_filename):
> +    """
> +    Search through a local copy of sha256sums.asc for a specific filename
> +    and return the associated sha256 sum.
> +    """
> +    with open(asc_file, "r") as f:
> +        for line in f:
> +            line = line.strip().split("  ")
> +            if len(line) == 2 and line[1] == tar_filename:
> +                return line[0]
> +
> +    raise BaseError(f"no signature found for {tar_filename}")
> +
> +
> +def fetch_tarball(command):
> +    """
> +    Verify the requested LIBGPIOD_VERSION tarball exists in sha256sums.asc,
> +    fetch it from https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> +    and verify its sha256sum.
> +
> +    If the check passes, extract the tarball and copy the lib and include
> +    dirs into our source tree.
> +    """
> +
> +    # If no LIBGPIOD_VERSION is specified in env, just run the command
> +    if LIBGPIOD_VERSION is None:
> +        return command
> +
> +    # If LIBGPIOD_VERSION is specified, apply the tarball wrapper
> +    def wrapper(self):
> +        # Just-in-time import of tarfile and urllib.request so these are
> +        # not required for Yocto to build a vendored or linked package
> +        import tarfile
> +        from tempfile import TemporaryDirectory
> +        from urllib.request import urlretrieve
> +
> +        from packaging.version import Version
> +        def Version(vstr):
> +            return 1

Words cannot properly express the abject horror I felt when I realised
this testing
hack made it into the patch...

Goes without saying, please don't merge, I'll issue a v9 with this
removed and any
final tweaks.

Perhaps I should have left my SKIP_LIBGPIOD_VERSION_CHECK support in...

> +
> +        # The "build" frontend will run setup.py twice within the same
> +        # temporary output directory. First for "sdist" and then for "wheel"
> +        # This would cause the build to fail with dirty "lib" and "include"
> +        # directories.
> +        # If the version in "libgpiod-version.txt" already matches our
> +        # requested tarball, then skip the fetch altogether.
> +        try:
> +            if open("libgpiod-version.txt", "r").read() == LIBGPIOD_VERSION:
> +                log.info(f"skipping tarball fetch")
> +                command(self)
> +                return
> +        except OSError:
> +            pass
> +
> +        # Early exit for build tree with dirty lib/include dirs
> +        for check_dir in "lib", "include":
> +            if path.isdir(f"./{check_dir}"):
> +                raise BaseError(f"refusing to overwrite ./{check_dir}")
> +
> +        with TemporaryDirectory(prefix="libgpiod-") as temp_dir:
> +            tarball_filename = TAR_FILENAME.format(version=LIBGPIOD_VERSION)
> +            tarball_url = f"{SRC_BASE_URL}{tarball_filename}"
> +            asc_url = f"{SRC_BASE_URL}{ASC_FILENAME}"
> +
> +            log.info(f"fetching: {asc_url}")
> +
> +            asc_filename, _ = urlretrieve(asc_url, path.join(temp_dir, ASC_FILENAME))
> +
> +            tarball_sha256 = find_sha256sum(asc_filename, tarball_filename)
> +
> +            if Version(LIBGPIOD_VERSION) < Version(LIBGPIOD_MINIMUM_VERSION):
> +                raise BaseError(f"requires libgpiod>={LIBGPIOD_MINIMUM_VERSION}")
> +
> +            log.info(f"fetching: {tarball_url}")
> +
> +            downloaded_tarball, _ = urlretrieve(
> +                tarball_url, path.join(temp_dir, tarball_filename)
> +            )
> +
> +            log.info(f"verifying: {tarball_filename}")
> +            if sha256(downloaded_tarball) != tarball_sha256:
> +                raise BaseError(f"signature mismatch for {tarball_filename}")
> +
> +            # Unpack the downloaded tarball
> +            log.info(f"unpacking: {tarball_filename}")
> +            with tarfile.open(downloaded_tarball) as f:
> +                f.extractall(temp_dir)
> +
> +            # Copy the include and lib directories we need to build libgpiod
> +            base_dir = path.join(temp_dir, f"libgpiod-{LIBGPIOD_VERSION}")
> +            copytree(path.join(base_dir, "include"), "./include")
> +            copytree(path.join(base_dir, "lib"), "./lib")
> +
> +        # Save the libgpiod version for sdist
> +        open("libgpiod-version.txt", "w").write(LIBGPIOD_VERSION)
> +
> +        # Run the command
> +        command(self)
> +
> +        # Clean up the build directory
> +        rmtree("./lib", ignore_errors=True)
> +        rmtree("./include", ignore_errors=True)
> +        unlink("libgpiod-version.txt")
> +
> +    return wrapper
>
>
>  class build_ext(orig_build_ext):
>      """
> -    setuptools install all C extentions even if they're excluded in setup().
> -    As a workaround - remove the tests directory right after all extensions
> -    were built (and possibly copied to the source directory if inplace is set).
> +    Wrap build_ext to amend the module sources and settings to build
> +    the bindings and gpiod into a combined module when a version is
> +    specified and LINK_SYSTEM_LIBGPIOD=1 is not present in env.
> +
> +    run is wrapped with @fetch_tarball in order to fetch the sources
> +    needed to build binary wheels when LIBGPIOD_VERSION is specified, eg:
> +
> +    LIBGPIOD_VERSION="2.0.2" python3 -m build .
>      """
>
> +    @fetch_tarball
>      def run(self):
> +        # Try to get the gpiod version from the .txt file included in sdist
> +        try:
> +            libgpiod_version = open("libgpiod-version.txt", "r").read()
> +        except OSError:
> +            libgpiod_version = LIBGPIOD_VERSION
> +
> +        if libgpiod_version and not LINK_SYSTEM_LIBGPIOD:
> +            # When building the extension from an sdist with a vendored
> +            # amend gpiod._ext sources and settings accordingly.
> +            gpiod_ext = self.ext_map["gpiod._ext"]
> +            gpiod_ext.sources += [
> +                "lib/chip.c",
> +                "lib/chip-info.c",
> +                "lib/edge-event.c",
> +                "lib/info-event.c",
> +                "lib/internal.c",
> +                "lib/line-config.c",
> +                "lib/line-info.c",
> +                "lib/line-request.c",
> +                "lib/line-settings.c",
> +                "lib/misc.c",
> +                "lib/request-config.c",
> +            ]
> +            gpiod_ext.libraries = []
> +            gpiod_ext.include_dirs = ["include", "lib", "gpiod/ext"]
> +            gpiod_ext.extra_compile_args.append(
> +                f'-DGPIOD_VERSION_STR="{libgpiod_version}"',
> +            )
> +
>          super().run()
> +
> +        # We don't ever want the module tests directory in our package
> +        # since this might include gpiosim._ext or procname._ext from a
> +        # previous dirty build tree.
>          rmtree(path.join(self.build_lib, "tests"), ignore_errors=True)
>
>
> +class sdist(orig_sdist):
> +    """
> +    Wrap sdist in order to fetch the libgpiod source files for vendoring
> +    into a source distribution.
> +
> +    run is wrapped with @fetch_tarball in order to fetch the sources
> +    needed to build binary wheels when LIBGPIOD_VERSION is specified, eg:
> +
> +    LIBGPIOD_VERSION="2.0.2" python3 -m build . --sdist
> +    """
> +
> +    @fetch_tarball
> +    def run(self):
> +        super().run()
> +
> +
>  gpiod_ext = Extension(
>      "gpiod._ext",
>      sources=[
> @@ -50,19 +244,17 @@ procname_ext = Extension(
>  )
>
>  extensions = [gpiod_ext]
> -if environ.get("GPIOD_WITH_TESTS") == "1":
> +if GPIOD_WITH_TESTS:
>      extensions.append(gpiosim_ext)
>      extensions.append(procname_ext)
>
> -with open("gpiod/version.py", "r") as fd:
> -    exec(fd.read())
> -
>  setup(
>      name="gpiod",
> +    url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git",
>      packages=find_packages(exclude=["tests", "tests.*"]),
>      python_requires=">=3.9.0",
>      ext_modules=extensions,
> -    cmdclass={"build_ext": build_ext},
> +    cmdclass={"build_ext": build_ext, "sdist": sdist},
>      version=__version__,
>      author="Bartosz Golaszewski",
>      author_email="brgl@bgdev.pl",
> --
> 2.34.1
>


-- 
Phil
