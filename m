Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC357D4F8B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 14:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbjJXMNG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 08:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjJXMNG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 08:13:06 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD817F9
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 05:13:01 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-457dc26ec2eso1747252137.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698149581; x=1698754381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3w/BRg7dVn/uX6FHiCka5vrDd3r6Vvt4UcTxMjCx3k=;
        b=EuDJgLpicqxzNVYCilbRrwlQ60m9KAa63Org67i6n1mMHpJqNAyu2U9Kfxsh9ewU8R
         fJJjiQgPDesR73KFcji6ikBMky+83ZolkhlGL8RP14nNRsSpVyeaOMOhu2Z39pCozNzB
         rtG3UOOArem5iI8gRmkDCMb7Ny89uMAOt8GRJIbcyvX1ay5hYC6j0Bf28x7F+Z8vtBLm
         Hup9peADxqY8IeJtpgIgs3DbKVSmLk0tsNS/Zl82EhdC9y9Mj+urcGGGadNn5v25D1nR
         wMeCMVLwIHQQbTl9B5zJxDbRFtMG66CmyZsivFkNLq/dLayoQozpRmgHEYiRWDZUd6cq
         Jntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149581; x=1698754381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3w/BRg7dVn/uX6FHiCka5vrDd3r6Vvt4UcTxMjCx3k=;
        b=ZHEOPMScMx960fSeJ/qd2qsEDQv9hc5ffiFgIJhgmjc67D0e8EAgDVgR9WBKCo0pbM
         df9RS2Wj3Wp/y//Pvf6l8TUY3s/ibCUarChxgt3QoVHnlPDKLmh1WdKFUaKOVQ+wpyBw
         UeQr+k5ygIi4x9y3ANM7l11RbXUfhOaR7VeUH5gEjrE/dJU1T2vjlS559vRareALMiok
         ZIFKYzygN8Cxo9fzUFmgCIFh5++vyKrdMKOJjQedeojDYpb+m5p+q8pKzIHjiVaxkXi7
         0ZjK0TwXMrXMNfR/aLvTFqkYooqU7WtIAiXbLatsNgm6WKSnv5Kn6K4BeXSguoJT6T4Q
         xOzg==
X-Gm-Message-State: AOJu0Yxqog4BWuuIpzIS+wBJcsl95eyaTcdON6Xl71QCjPuQD+RZAsQC
        1RIS+m/DF7YCweuYPCdbD+19tB0yaKHW+7CUo0CKrjWqQAZ0bQ+I
X-Google-Smtp-Source: AGHT+IElmCDDQnYGm6gqumemME5X01daKgt6q3mKNoWa3QT4fSq0dAoYmf1SM2+JNf/vFSZsFpmTuvMlT0j6g33DFM0=
X-Received: by 2002:a67:ef51:0:b0:457:dbe3:ef45 with SMTP id
 k17-20020a67ef51000000b00457dbe3ef45mr11675602vsr.19.1698149580872; Tue, 24
 Oct 2023 05:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231024095605.713554-1-phil@gadgetoid.com> <20231024095605.713554-2-phil@gadgetoid.com>
In-Reply-To: <20231024095605.713554-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Oct 2023 14:12:49 +0200
Message-ID: <CAMRc=Me9JFGx4cTK0u6iUYUfZPcLDzXLqA06L1PnSi50WHJg8w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v7 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 24, 2023 at 11:56=E2=80=AFAM Phil Howard <phil@gadgetoid.com> w=
rote:
>
> Optionally vendor libgpiod source into sdist so that the Python module ca=
n
> be built from source, even with a missing or mismatched system libgpiod.
>
> Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> "GPIOD_VERSION" to control what kind of package setup.py will build.
>
> In order to build an sdist or wheel package with a vendored libgpiod a
> version must be specified via the "GPIOD_VERSION" environment variable.
>
> This will instruct setup.py to verify the given version against the list
> in sha256sums.asc and ensure it meets or exceeds a GPIOD_MINIMUM_VERSION
> required for compatibility with the bindings.
>
> It will then fetch the tarball matching the requested version from
> mirrors.edge.kernel.org, verify the sha256 signature, unpack it, and copy
> the lib and include directories into the package root so they can be
> included in sdist or used to build a binary wheel.
>
> eg: GPIOD_VERSION=3D2.1.0 python3 setup.py sdist
>
> Will build a source distribution with gpiod version 2.1.0 source included=
.
>
> It will also save the gpiod version into "gpiod-version.txt" so that it
> can be passed to the build when the sdist is built by pip.
>
> Requiring an explicit version ensures that the Python bindings - which
> can be changed and versions independent of libgpiod - are built against a
> stable libgpiod release.
>
> In order to force a package with vendored gpiod source to link the system
> libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:
>
> eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in    |   5 +
>  bindings/python/pyproject.toml |   2 +-
>  bindings/python/setup.py       | 196 +++++++++++++++++++++++++++++++--
>  3 files changed, 191 insertions(+), 12 deletions(-)
>
> diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> index 459b317..66fe9b8 100644
> --- a/bindings/python/MANIFEST.in
> +++ b/bindings/python/MANIFEST.in
> @@ -3,6 +3,7 @@
>
>  include setup.py
>  include README.md
> +include gpiod-version.txt
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
> diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.t=
oml
> index fcf6bbe..f6bf43c 100644
> --- a/bindings/python/pyproject.toml
> +++ b/bindings/python/pyproject.toml
> @@ -2,4 +2,4 @@
>  # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
>
>  [build-system]
> -requires =3D ["setuptools", "wheel"]
> +requires =3D ["setuptools", "wheel", "packaging"]
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index c8db0a0..ac8b241 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -1,24 +1,201 @@
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
> +LINK_SYSTEM_LIBGPIOD =3D getenv("LINK_SYSTEM_LIBGPIOD") =3D=3D "1"
> +GPIOD_MINIMUM_VERSION =3D "2.1.0"

I'm wondering how to handle it. We need these changes in the v2.1
release but without the release it will not work. I think we'll need
to bite the bullet and just apply this, do the v2.1 libgpiod release,
do the v2.1.0 python release and then upload to pypi.

> +GPIOD_VERSION =3D getenv("GPIOD_VERSION")

I thought I mentioned it before but I cannot find it now. Let's call
this LIBGPIOD_VERSION and LIBGPIOD_MINIMUM_VERSION to emphasise that
we mean the C library and not the wider GPIOD project.

> +GPIOD_WITH_TESTS =3D getenv("GPIOD_WITH_TESTS") =3D=3D "1"

This is fine with the GPIOD_ prefix as it's a global setting in the project=
.

> +SRC_BASE_URL =3D "https://mirrors.edge.kernel.org/pub/software/libs/libg=
piod/"
> +TAR_FILENAME =3D "libgpiod-{version}.tar.gz"
> +ASC_FILENAME =3D "sha256sums.asc"
> +SHA256_CHUNK_SIZE =3D 2048
> +
> +# __version__
> +with open("gpiod/version.py", "r") as fd:
> +    exec(fd.read())
> +
> +
> +def sha256(filename):
> +    """
> +    Return a sha256sum for a specific filename, loading the file in chun=
ks
> +    to avoid potentially excessive memory use.
> +    """
> +    from hashlib import sha256
> +
> +    sha256sum =3D sha256()
> +    with open(filename, "rb") as f:
> +        for chunk in iter(lambda: f.read(SHA256_CHUNK_SIZE), b""):
> +            sha256sum.update(chunk)
> +
> +    return sha256sum.hexdigest()
> +
> +
> +def find_sha256sum(asc_file, tar_filename):
> +    """
> +    Search through a local copy of sha256sums.asc for a specific filenam=
e
> +    and return the associated sha256 sum.
> +    """
> +    with open(asc_file, "r") as f:
> +        for line in f:
> +            if line[66:-1] =3D=3D tar_filename:

I can't say I like it. Could you maybe try to split it first and then
see if the second token exists and check if it equals tar_filename?

> +                return line.split("  ")[0]
> +
> +    raise BaseError(f"no signature found for {tar_filename}")
> +
> +
> +def fetch_tarball(command):
> +    """
> +    Verify the requested GPIOD_VERSION tarball exists in sha256sums.asc,
> +    fetch it from https://mirrors.edge.kernel.org/pub/software/libs/libg=
piod/
> +    and verify its sha256sum.
> +
> +    If the check passes, extract the tarball and copy the lib and includ=
e
> +    dirs into our source tree.
> +    """
> +
> +    # If no GPIOD_VERSION is specified in env, just run the command
> +    if GPIOD_VERSION is None:
> +        return command
> +
> +    # If GPIOD_VERSION is specified, apply the tarball wrapper
> +    def wrapper(self):
> +        # Just-in-time import of tarfile and urllib.request so these are
> +        # not required for Yocto to build a vendored or linked package
> +        import tarfile
> +        from tempfile import TemporaryDirectory
> +        from urllib.request import urlretrieve
> +
> +        from packaging.version import Version
> +
> +        # Early exit for build tree with dirty lib/include dirs
> +        for check_dir in "lib", "include":
> +            if path.isdir(f"./{check_dir}"):
> +                raise BaseError(f"refusing to overwrite ./{check_dir}")
> +
> +        with TemporaryDirectory(prefix=3D"libgpiod-") as temp_dir:
> +            tarball_filename =3D TAR_FILENAME.format(version=3DGPIOD_VER=
SION)
> +            tarball_url =3D f"{SRC_BASE_URL}{tarball_filename}"
> +            asc_url =3D f"{SRC_BASE_URL}{ASC_FILENAME}"
> +
> +            log.info(f"fetching: {asc_url}")
> +
> +            asc_filename, _ =3D urlretrieve(asc_url, path.join(temp_dir,=
 ASC_FILENAME))
> +
> +            tarball_sha256 =3D find_sha256sum(asc_filename, tarball_file=
name)
> +
> +            if Version(GPIOD_VERSION) < Version(GPIOD_MINIMUM_VERSION):
> +                raise BaseError(f"requires gpiod>=3D{GPIOD_MINIMUM_VERSI=
ON}")
> +
> +            log.info(f"fetching: {tarball_url}")
> +
> +            downloaded_tarball, _ =3D urlretrieve(
> +                tarball_url, path.join(temp_dir, tarball_filename)
> +            )
> +
> +            log.info(f"verifying: {tarball_filename}")
> +            if sha256(downloaded_tarball) !=3D tarball_sha256:
> +                raise BaseError(f"signature mismatch for {tarball_filena=
me}")
> +
> +            # Unpack the downloaded tarball
> +            log.info(f"unpacking: {tarball_filename}")
> +            with tarfile.open(downloaded_tarball) as f:
> +                f.extractall(temp_dir)
> +
> +            # Copy the include and lib directories we need to build libg=
piod
> +            base_dir =3D path.join(temp_dir, f"libgpiod-{GPIOD_VERSION}"=
)
> +            copytree(path.join(base_dir, "include"), "./include")
> +            copytree(path.join(base_dir, "lib"), "./lib")
> +
> +        # Save the gpiod version for sdist
> +        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
> +
> +        # Run the command
> +        command(self)
> +
> +        # Clean up the build directory
> +        rmtree("./lib", ignore_errors=3DTrue)
> +        rmtree("./include", ignore_errors=3DTrue)
> +        unlink("gpiod-version.txt")
> +
> +    return wrapper
>
>
>  class build_ext(orig_build_ext):
>      """
> -    setuptools install all C extentions even if they're excluded in setu=
p().
> -    As a workaround - remove the tests directory right after all extensi=
ons
> -    were built (and possibly copied to the source directory if inplace i=
s set).
> +    Wrap build_ext to amend the module sources and settings to build
> +    the bindings and gpiod into a combined module when a version is
> +    specified and LINK_SYSTEM_LIBGPIOD=3D1 is not present in env.
> +
> +    run is wrapped with @fetch_tarball in order to fetch the sources
> +    needed to build binary wheels when GPIOD_VERSION is specified, eg:
> +
> +    GPIOD_VERSION=3D"2.0.2" python3 -m build .
>      """
>
> +    @fetch_tarball
>      def run(self):
> +        # Try to get the gpiod version from the .txt file included in sd=
ist
> +        try:
> +            gpiod_version =3D open("gpiod-version.txt", "r").read()
> +        except OSError:
> +            gpiod_version =3D GPIOD_VERSION
> +
> +        if gpiod_version and not LINK_SYSTEM_LIBGPIOD:
> +            # When building the extension from an sdist with a vendored
> +            # amend gpiod._ext sources and settings accordingly.
> +            gpiod_ext =3D self.ext_map["gpiod._ext"]
> +            gpiod_ext.sources +=3D [
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
> +            gpiod_ext.libraries =3D []
> +            gpiod_ext.include_dirs =3D ["include", "lib", "gpiod/ext"]
> +            gpiod_ext.extra_compile_args.append(
> +                f'-DGPIOD_VERSION_STR=3D"{gpiod_version}"',
> +            )
> +
>          super().run()
> +
> +        # We don't ever want the module tests directory in our package
> +        # since this might include gpiosim._ext or procname._ext from a
> +        # previous dirty build tree.
>          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DTrue)
>
>
> +class sdist(orig_sdist):
> +    """
> +    Wrap sdist in order to fetch the libgpiod source files for vendoring
> +    into a source distribution.
> +
> +    run is wrapped with @fetch_tarball in order to fetch the sources
> +    needed to build binary wheels when GPIOD_VERSION is specified, eg:
> +
> +    GPIOD_VERSION=3D"2.0.2" python3 -m build . --sdist
> +    """
> +
> +    @fetch_tarball
> +    def run(self):
> +        super().run()
> +
> +
>  gpiod_ext =3D Extension(
>      "gpiod._ext",
>      sources=3D[
> @@ -50,19 +227,16 @@ procname_ext =3D Extension(
>  )
>
>  extensions =3D [gpiod_ext]
> -if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
> +if GPIOD_WITH_TESTS:
>      extensions.append(gpiosim_ext)
>      extensions.append(procname_ext)
>
> -with open("gpiod/version.py", "r") as fd:
> -    exec(fd.read())
> -
>  setup(
>      name=3D"gpiod",
>      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
>      python_requires=3D">=3D3.9.0",
>      ext_modules=3Dextensions,
> -    cmdclass=3D{"build_ext": build_ext},
> +    cmdclass=3D{"build_ext": build_ext, "sdist": sdist},
>      version=3D__version__,
>      author=3D"Bartosz Golaszewski",
>      author_email=3D"brgl@bgdev.pl",
> --
> 2.34.1
>

Other than the above, this looks pretty nice. I think we're getting there.

Bart
