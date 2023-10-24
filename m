Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432A17D51EC
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 15:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbjJXNhQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 09:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbjJXNg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 09:36:59 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF26561A2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 06:25:59 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1dcfb2a3282so3032805fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1698153959; x=1698758759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqShACt8e+FafZLouNKg8WpBvktPWnw4ec/S1xU6Fs4=;
        b=YrduBTySp2AhWiaLpMEBHlzQbMVMGdMRAMgf1D7jBKFI0yX5OY4L7iKeC+d2j3qutn
         YIC1anr1paaaQEDmQK/kCBypWafwGlvaxqns87fZM+GqZBdVn3JXzpY8YG1vHz3EWj7W
         c+dBKhrCUyb/IOSawbN0etE5QGc63dYIVDEsJT+HBEwPsoYNGEJi9rfIKwVeIpgje5a4
         l36bouLU8aWtWn/jbovvXWtvLRvhEn8plrB/YdUrCeYBEIfEBxehV6skKOKwvSAGhD1l
         WYmyV4IjCtlYEg1N07Bf5NtfwMrOPdw1okcQnvFwRWzBFhHabIjC61lwrPp4QlPYJ5MS
         Oyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698153959; x=1698758759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqShACt8e+FafZLouNKg8WpBvktPWnw4ec/S1xU6Fs4=;
        b=Z5VLkmoHjjenKMlM37M2ngZaR1OQXf94EhvRhluU7UdY5A87jimdHdgi8LFqCDz/QS
         8pFStXDSCtH1sS5SBhCh34WuGEkx/KmoX4wM8dfKDTbcOL4fLXNuix47gofrm8bO//sm
         9mJ7hHjGDulxOLqNtAh41nwWWaPU/J+pvE8GupQc54MIN1APPBPgRI9KyXRiSn7wtUyV
         Av9s1Hnipp5bnayLbLlfrG8g/Xddcph5Mz4PoGD8xsaY0avyCE//6jRLFKAV1IwpDPKW
         odZZi9cJOq7unyU0WCbvb0hiNu7G4LP2Mbl2Xx84YBEnivZs7AvrkpfFAR3cv2Iwqaz/
         yqww==
X-Gm-Message-State: AOJu0Yz6J/XL42wO558oQMRBuiT6yNYHWqsCV0zommQwaSu6l/n1c/5r
        Nxlqaa0utCHhmnzpckyiknYp39rYGxVVHOo6sR2Svw==
X-Google-Smtp-Source: AGHT+IGjr0HjNFdL21S5cOspG33RixNURMOI+/DJzmrbkebUjbHxP1ZLRJz2xwIl+dd8E6cN9lSVA2/8QefNDqhPhOE=
X-Received: by 2002:a05:6870:cb8c:b0:1e9:a5f2:aab2 with SMTP id
 ov12-20020a056870cb8c00b001e9a5f2aab2mr16454805oab.37.1698153958698; Tue, 24
 Oct 2023 06:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231024095605.713554-1-phil@gadgetoid.com> <20231024095605.713554-2-phil@gadgetoid.com>
 <CAMRc=Me9JFGx4cTK0u6iUYUfZPcLDzXLqA06L1PnSi50WHJg8w@mail.gmail.com>
In-Reply-To: <CAMRc=Me9JFGx4cTK0u6iUYUfZPcLDzXLqA06L1PnSi50WHJg8w@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Tue, 24 Oct 2023 14:25:47 +0100
Message-ID: <CA+kSVo9E=vQDVJkxKfXz+5E-=cx52GnYDuJxvAWdwt+y3tBVJw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v7 1/1] bindings: python: optionally include
 module in sdist
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Oct 2023 at 13:13, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Oct 24, 2023 at 11:56=E2=80=AFAM Phil Howard <phil@gadgetoid.com>=
 wrote:
> >
> > Optionally vendor libgpiod source into sdist so that the Python module =
can
> > be built from source, even with a missing or mismatched system libgpiod=
.
> >
> > Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> > "GPIOD_VERSION" to control what kind of package setup.py will build.
> >
> > In order to build an sdist or wheel package with a vendored libgpiod a
> > version must be specified via the "GPIOD_VERSION" environment variable.
> >
> > This will instruct setup.py to verify the given version against the lis=
t
> > in sha256sums.asc and ensure it meets or exceeds a GPIOD_MINIMUM_VERSIO=
N
> > required for compatibility with the bindings.
> >
> > It will then fetch the tarball matching the requested version from
> > mirrors.edge.kernel.org, verify the sha256 signature, unpack it, and co=
py
> > the lib and include directories into the package root so they can be
> > included in sdist or used to build a binary wheel.
> >
> > eg: GPIOD_VERSION=3D2.1.0 python3 setup.py sdist
> >
> > Will build a source distribution with gpiod version 2.1.0 source includ=
ed.
> >
> > It will also save the gpiod version into "gpiod-version.txt" so that it
> > can be passed to the build when the sdist is built by pip.
> >
> > Requiring an explicit version ensures that the Python bindings - which
> > can be changed and versions independent of libgpiod - are built against=
 a
> > stable libgpiod release.
> >
> > In order to force a package with vendored gpiod source to link the syst=
em
> > libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:
> >
> > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
> >  bindings/python/MANIFEST.in    |   5 +
> >  bindings/python/pyproject.toml |   2 +-
> >  bindings/python/setup.py       | 196 +++++++++++++++++++++++++++++++--
> >  3 files changed, 191 insertions(+), 12 deletions(-)
> >
> > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> > index 459b317..66fe9b8 100644
> > --- a/bindings/python/MANIFEST.in
> > +++ b/bindings/python/MANIFEST.in
> > @@ -3,6 +3,7 @@
> >
> >  include setup.py
> >  include README.md
> > +include gpiod-version.txt
> >
> >  recursive-include gpiod *.py
> >  recursive-include tests *.py
> > @@ -12,3 +13,7 @@ recursive-include gpiod/ext *.h
> >
> >  recursive-include tests/gpiosim *.c
> >  recursive-include tests/procname *.c
> > +
> > +recursive-include lib *.c
> > +recursive-include lib *.h
> > +recursive-include include *.h
> > diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject=
.toml
> > index fcf6bbe..f6bf43c 100644
> > --- a/bindings/python/pyproject.toml
> > +++ b/bindings/python/pyproject.toml
> > @@ -2,4 +2,4 @@
> >  # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
> >
> >  [build-system]
> > -requires =3D ["setuptools", "wheel"]
> > +requires =3D ["setuptools", "wheel", "packaging"]
> > diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> > index c8db0a0..ac8b241 100644
> > --- a/bindings/python/setup.py
> > +++ b/bindings/python/setup.py
> > @@ -1,24 +1,201 @@
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> >
> > -from os import environ, path
> > -from setuptools import setup, Extension, find_packages
> > +from os import getenv, path, unlink
> > +from shutil import copytree, rmtree
> > +
> > +from setuptools import Extension, find_packages, setup
> >  from setuptools.command.build_ext import build_ext as orig_build_ext
> > -from shutil import rmtree
> > +from setuptools.command.sdist import log
> > +from setuptools.command.sdist import sdist as orig_sdist
> > +from setuptools.errors import BaseError
> > +
> > +LINK_SYSTEM_LIBGPIOD =3D getenv("LINK_SYSTEM_LIBGPIOD") =3D=3D "1"
> > +GPIOD_MINIMUM_VERSION =3D "2.1.0"
>
> I'm wondering how to handle it. We need these changes in the v2.1
> release but without the release it will not work. I think we'll need
> to bite the bullet and just apply this, do the v2.1 libgpiod release,
> do the v2.1.0 python release and then upload to pypi.

It's a bit of a chicken and egg problem. But yes, we'll have to
release then follow
with the pypi release once the package is available to download and
build the sdist.

>
> > +GPIOD_VERSION =3D getenv("GPIOD_VERSION")
>
> I thought I mentioned it before but I cannot find it now. Let's call
> this LIBGPIOD_VERSION and LIBGPIOD_MINIMUM_VERSION to emphasise that
> we mean the C library and not the wider GPIOD project.

Will change!

>
> > +GPIOD_WITH_TESTS =3D getenv("GPIOD_WITH_TESTS") =3D=3D "1"
>
> This is fine with the GPIOD_ prefix as it's a global setting in the proje=
ct.
>
> > +SRC_BASE_URL =3D "https://mirrors.edge.kernel.org/pub/software/libs/li=
bgpiod/"
> > +TAR_FILENAME =3D "libgpiod-{version}.tar.gz"
> > +ASC_FILENAME =3D "sha256sums.asc"
> > +SHA256_CHUNK_SIZE =3D 2048
> > +
> > +# __version__
> > +with open("gpiod/version.py", "r") as fd:
> > +    exec(fd.read())
> > +
> > +
> > +def sha256(filename):
> > +    """
> > +    Return a sha256sum for a specific filename, loading the file in ch=
unks
> > +    to avoid potentially excessive memory use.
> > +    """
> > +    from hashlib import sha256
> > +
> > +    sha256sum =3D sha256()
> > +    with open(filename, "rb") as f:
> > +        for chunk in iter(lambda: f.read(SHA256_CHUNK_SIZE), b""):
> > +            sha256sum.update(chunk)
> > +
> > +    return sha256sum.hexdigest()
> > +
> > +
> > +def find_sha256sum(asc_file, tar_filename):
> > +    """
> > +    Search through a local copy of sha256sums.asc for a specific filen=
ame
> > +    and return the associated sha256 sum.
> > +    """
> > +    with open(asc_file, "r") as f:
> > +        for line in f:
> > +            if line[66:-1] =3D=3D tar_filename:
>
> I can't say I like it. Could you maybe try to split it first and then
> see if the second token exists and check if it equals tar_filename?

Will change! I didn't expect the length of a sha256sum to change but yes th=
e
strip and split method is a little bit clearer about intent.

>
> > +                return line.split("  ")[0]
> > +
> > +    raise BaseError(f"no signature found for {tar_filename}")
> > +
> > +
> > +def fetch_tarball(command):
> > +    """
> > +    Verify the requested GPIOD_VERSION tarball exists in sha256sums.as=
c,
> > +    fetch it from https://mirrors.edge.kernel.org/pub/software/libs/li=
bgpiod/
> > +    and verify its sha256sum.
> > +
> > +    If the check passes, extract the tarball and copy the lib and incl=
ude
> > +    dirs into our source tree.
> > +    """
> > +
> > +    # If no GPIOD_VERSION is specified in env, just run the command
> > +    if GPIOD_VERSION is None:
> > +        return command
> > +
> > +    # If GPIOD_VERSION is specified, apply the tarball wrapper
> > +    def wrapper(self):
> > +        # Just-in-time import of tarfile and urllib.request so these a=
re
> > +        # not required for Yocto to build a vendored or linked package
> > +        import tarfile
> > +        from tempfile import TemporaryDirectory
> > +        from urllib.request import urlretrieve
> > +
> > +        from packaging.version import Version
> > +
> > +        # Early exit for build tree with dirty lib/include dirs
> > +        for check_dir in "lib", "include":
> > +            if path.isdir(f"./{check_dir}"):
> > +                raise BaseError(f"refusing to overwrite ./{check_dir}"=
)
> > +
> > +        with TemporaryDirectory(prefix=3D"libgpiod-") as temp_dir:
> > +            tarball_filename =3D TAR_FILENAME.format(version=3DGPIOD_V=
ERSION)
> > +            tarball_url =3D f"{SRC_BASE_URL}{tarball_filename}"
> > +            asc_url =3D f"{SRC_BASE_URL}{ASC_FILENAME}"
> > +
> > +            log.info(f"fetching: {asc_url}")
> > +
> > +            asc_filename, _ =3D urlretrieve(asc_url, path.join(temp_di=
r, ASC_FILENAME))
> > +
> > +            tarball_sha256 =3D find_sha256sum(asc_filename, tarball_fi=
lename)
> > +
> > +            if Version(GPIOD_VERSION) < Version(GPIOD_MINIMUM_VERSION)=
:
> > +                raise BaseError(f"requires gpiod>=3D{GPIOD_MINIMUM_VER=
SION}")
> > +
> > +            log.info(f"fetching: {tarball_url}")
> > +
> > +            downloaded_tarball, _ =3D urlretrieve(
> > +                tarball_url, path.join(temp_dir, tarball_filename)
> > +            )
> > +
> > +            log.info(f"verifying: {tarball_filename}")
> > +            if sha256(downloaded_tarball) !=3D tarball_sha256:
> > +                raise BaseError(f"signature mismatch for {tarball_file=
name}")
> > +
> > +            # Unpack the downloaded tarball
> > +            log.info(f"unpacking: {tarball_filename}")
> > +            with tarfile.open(downloaded_tarball) as f:
> > +                f.extractall(temp_dir)
> > +
> > +            # Copy the include and lib directories we need to build li=
bgpiod
> > +            base_dir =3D path.join(temp_dir, f"libgpiod-{GPIOD_VERSION=
}")
> > +            copytree(path.join(base_dir, "include"), "./include")
> > +            copytree(path.join(base_dir, "lib"), "./lib")
> > +
> > +        # Save the gpiod version for sdist
> > +        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
> > +
> > +        # Run the command
> > +        command(self)
> > +
> > +        # Clean up the build directory
> > +        rmtree("./lib", ignore_errors=3DTrue)
> > +        rmtree("./include", ignore_errors=3DTrue)
> > +        unlink("gpiod-version.txt")
> > +
> > +    return wrapper
> >
> >
> >  class build_ext(orig_build_ext):
> >      """
> > -    setuptools install all C extentions even if they're excluded in se=
tup().
> > -    As a workaround - remove the tests directory right after all exten=
sions
> > -    were built (and possibly copied to the source directory if inplace=
 is set).
> > +    Wrap build_ext to amend the module sources and settings to build
> > +    the bindings and gpiod into a combined module when a version is
> > +    specified and LINK_SYSTEM_LIBGPIOD=3D1 is not present in env.
> > +
> > +    run is wrapped with @fetch_tarball in order to fetch the sources
> > +    needed to build binary wheels when GPIOD_VERSION is specified, eg:
> > +
> > +    GPIOD_VERSION=3D"2.0.2" python3 -m build .
> >      """
> >
> > +    @fetch_tarball
> >      def run(self):
> > +        # Try to get the gpiod version from the .txt file included in =
sdist
> > +        try:
> > +            gpiod_version =3D open("gpiod-version.txt", "r").read()
> > +        except OSError:
> > +            gpiod_version =3D GPIOD_VERSION
> > +
> > +        if gpiod_version and not LINK_SYSTEM_LIBGPIOD:
> > +            # When building the extension from an sdist with a vendore=
d
> > +            # amend gpiod._ext sources and settings accordingly.
> > +            gpiod_ext =3D self.ext_map["gpiod._ext"]
> > +            gpiod_ext.sources +=3D [
> > +                "lib/chip.c",
> > +                "lib/chip-info.c",
> > +                "lib/edge-event.c",
> > +                "lib/info-event.c",
> > +                "lib/internal.c",
> > +                "lib/line-config.c",
> > +                "lib/line-info.c",
> > +                "lib/line-request.c",
> > +                "lib/line-settings.c",
> > +                "lib/misc.c",
> > +                "lib/request-config.c",
> > +            ]
> > +            gpiod_ext.libraries =3D []
> > +            gpiod_ext.include_dirs =3D ["include", "lib", "gpiod/ext"]
> > +            gpiod_ext.extra_compile_args.append(
> > +                f'-DGPIOD_VERSION_STR=3D"{gpiod_version}"',
> > +            )
> > +
> >          super().run()
> > +
> > +        # We don't ever want the module tests directory in our package
> > +        # since this might include gpiosim._ext or procname._ext from =
a
> > +        # previous dirty build tree.
> >          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DTru=
e)
> >
> >
> > +class sdist(orig_sdist):
> > +    """
> > +    Wrap sdist in order to fetch the libgpiod source files for vendori=
ng
> > +    into a source distribution.
> > +
> > +    run is wrapped with @fetch_tarball in order to fetch the sources
> > +    needed to build binary wheels when GPIOD_VERSION is specified, eg:
> > +
> > +    GPIOD_VERSION=3D"2.0.2" python3 -m build . --sdist
> > +    """
> > +
> > +    @fetch_tarball
> > +    def run(self):
> > +        super().run()
> > +
> > +
> >  gpiod_ext =3D Extension(
> >      "gpiod._ext",
> >      sources=3D[
> > @@ -50,19 +227,16 @@ procname_ext =3D Extension(
> >  )
> >
> >  extensions =3D [gpiod_ext]
> > -if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
> > +if GPIOD_WITH_TESTS:
> >      extensions.append(gpiosim_ext)
> >      extensions.append(procname_ext)
> >
> > -with open("gpiod/version.py", "r") as fd:
> > -    exec(fd.read())
> > -
> >  setup(
> >      name=3D"gpiod",
> >      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> >      python_requires=3D">=3D3.9.0",
> >      ext_modules=3Dextensions,
> > -    cmdclass=3D{"build_ext": build_ext},
> > +    cmdclass=3D{"build_ext": build_ext, "sdist": sdist},
> >      version=3D__version__,
> >      author=3D"Bartosz Golaszewski",
> >      author_email=3D"brgl@bgdev.pl",
> > --
> > 2.34.1
> >
>
> Other than the above, this looks pretty nice. I think we're getting there=
.
>
> Bart

Whew, it's been a journey!
