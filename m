Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E2D7D5399
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 16:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbjJXOEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 10:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343784AbjJXOEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 10:04:04 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3473F10E7
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 07:04:00 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-581f78a0206so2536999eaf.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698156239; x=1698761039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1id1Ni+hoBlhYATzg1Q2wg4nHrokCgbZlDVzYMQTcv4=;
        b=xifuR5pe0Leir6DadRKxm7lob31MsDdG4UkD5h8z7J2Zp5n+zZ8KvGmX78G/0Jcrns
         i4vSF/oqqi49G/h/s8rhWe0qaioAIZj8oNkZVj4Ou/vURMPLimxyHIPGEGDCAi98p6W1
         1aZ5voDoPR20KaxDh87w1wD/mk0MNpv2xWc42b4byOnW3r31q/ktvKvjjdZvPNHpC/VR
         pdZ0A0+gqFpsozygtuBuyekqHYk5t4z1vUkW3HORDENUJgjTMkPLfcU8uRxwbUglLOoR
         m4toxkTCmqz3GF/BsNeZgvDYqP4GYqJvOGW22E473xY/lJVoSxi8EGB+UJGH7x8nFW8b
         q9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698156239; x=1698761039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1id1Ni+hoBlhYATzg1Q2wg4nHrokCgbZlDVzYMQTcv4=;
        b=GYIxhu8X/cjYpF1IZlogL7qJdZm0Px8/+qDKTCYReTe68hNVBfr8kuRdZopvDSLqm0
         XD8SsMGzhgg8GmCoudB0f0YHY/CrIKS1hoSLKkJxQO0I2X/UaqNU+RbblQzfFtL7SR+V
         DJh7uvHpj3Nm9GgKYqCsAEqG6z1eced9oXyPfVYJkCzd7E0ko+spw46DWCKIdrvCw5M2
         +H8VP4ADVT6Y6qUchpd/tCGdvNOvk+vRGfW19ALBEZ58FVEb5gXdVomSdVe3WU4Rsk12
         WLN4K6GUjh97Y8+UOkdqg6Vz8DRSZzLORX6aS5aoCIBCvSIhmxFC+ODfFSmbiihWwfXn
         Urwg==
X-Gm-Message-State: AOJu0Yxp6qbbIdD3FdlFn9SW1ssnetMyu1DvSS8pcisOrsdylokPei1X
        67cmAqb19tNIAzvM/nUm+/d2dH8daFRrwdVN0PCGqQ==
X-Google-Smtp-Source: AGHT+IHhQwqPmb4h4VjFIETPDd8OZo+UpREf0jH/k8kpz0qVDzj7OH5kagRrSl7QkrE+RJPw82Op1x5cj7cGhO2InHs=
X-Received: by 2002:a05:6359:5aa:b0:168:e419:f7db with SMTP id
 ee42-20020a05635905aa00b00168e419f7dbmr4927372rwb.14.1698156239290; Tue, 24
 Oct 2023 07:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231024133910.738828-1-phil@gadgetoid.com> <20231024133910.738828-2-phil@gadgetoid.com>
 <CA+kSVo8fisN9vEBchWONY603Les9to3+k-STpLV7SK61NVV+GQ@mail.gmail.com>
In-Reply-To: <CA+kSVo8fisN9vEBchWONY603Les9to3+k-STpLV7SK61NVV+GQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Oct 2023 16:03:48 +0200
Message-ID: <CAMRc=MfdwtpCkqjqQmTcr_uFsnaxUx7YJ9GukUXRuXb3p2ZYvg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v8 1/1] bindings: python: optionally include
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

On Tue, Oct 24, 2023 at 3:56=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> On Tue, 24 Oct 2023 at 14:39, Phil Howard <phil@gadgetoid.com> wrote:
> >
> > Optionally vendor libgpiod source into sdist so that the Python module =
can
> > be built from source, even with a missing or mismatched system libgpiod=
.
> >
> > Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> > "LIBGPIOD_VERSION" to control what kind of package setup.py will build.
> >
> > In order to build an sdist or wheel package with a vendored libgpiod a
> > version must be specified via the "LIBGPIOD_VERSION" environment variab=
le.
> >
> > This will instruct setup.py to verify the given version against the lis=
t
> > in sha256sums.asc and ensure it meets or exceeds a LIBGPIOD_MINIMUM_VER=
SION
> > required for compatibility with the bindings.
> >
> > It will then fetch the tarball matching the requested version from
> > mirrors.edge.kernel.org, verify the sha256 signature, unpack it, and co=
py
> > the lib and include directories into the package root so they can be
> > included in sdist or used to build a binary wheel.
> >
> > eg: LIBGPIOD_VERSION=3D2.1.0 python3 setup.py sdist
> >
> > Will build a source distribution with gpiod version 2.1.0 source includ=
ed.
> >
> > It will also save the gpiod version into "libgpiod-version.txt" so that=
 it
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
> >  bindings/python/setup.py       | 214 +++++++++++++++++++++++++++++++--
> >  3 files changed, 209 insertions(+), 12 deletions(-)
> >
> > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> > index 459b317..efdfd18 100644
> > --- a/bindings/python/MANIFEST.in
> > +++ b/bindings/python/MANIFEST.in
> > @@ -3,6 +3,7 @@
> >
> >  include setup.py
> >  include README.md
> > +include libgpiod-version.txt
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
> > index c8db0a0..0129de7 100644
> > --- a/bindings/python/setup.py
> > +++ b/bindings/python/setup.py
> > @@ -1,24 +1,218 @@
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
> > +LIBGPIOD_MINIMUM_VERSION =3D "2.1.0"
> > +LIBGPIOD_VERSION =3D getenv("LIBGPIOD_VERSION")
> > +GPIOD_WITH_TESTS =3D getenv("GPIOD_WITH_TESTS") =3D=3D "1"
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
> > +            line =3D line.strip().split("  ")
> > +            if len(line) =3D=3D 2 and line[1] =3D=3D tar_filename:
> > +                return line[0]
> > +
> > +    raise BaseError(f"no signature found for {tar_filename}")
> > +
> > +
> > +def fetch_tarball(command):
> > +    """
> > +    Verify the requested LIBGPIOD_VERSION tarball exists in sha256sums=
.asc,
> > +    fetch it from https://mirrors.edge.kernel.org/pub/software/libs/li=
bgpiod/
> > +    and verify its sha256sum.
> > +
> > +    If the check passes, extract the tarball and copy the lib and incl=
ude
> > +    dirs into our source tree.
> > +    """
> > +
> > +    # If no LIBGPIOD_VERSION is specified in env, just run the command
> > +    if LIBGPIOD_VERSION is None:
> > +        return command
> > +
> > +    # If LIBGPIOD_VERSION is specified, apply the tarball wrapper
> > +    def wrapper(self):
> > +        # Just-in-time import of tarfile and urllib.request so these a=
re
> > +        # not required for Yocto to build a vendored or linked package
> > +        import tarfile
> > +        from tempfile import TemporaryDirectory
> > +        from urllib.request import urlretrieve
> > +
> > +        from packaging.version import Version
> > +        def Version(vstr):
> > +            return 1
>
> Words cannot properly express the abject horror I felt when I realised
> this testing
> hack made it into the patch...
>

I'm also not sure how I could have missed that. :)

No worries.

Bart

> Goes without saying, please don't merge, I'll issue a v9 with this
> removed and any
> final tweaks.
>
> Perhaps I should have left my SKIP_LIBGPIOD_VERSION_CHECK support in...
>
> > +
> > +        # The "build" frontend will run setup.py twice within the same
> > +        # temporary output directory. First for "sdist" and then for "=
wheel"
> > +        # This would cause the build to fail with dirty "lib" and "inc=
lude"
> > +        # directories.
> > +        # If the version in "libgpiod-version.txt" already matches our
> > +        # requested tarball, then skip the fetch altogether.
> > +        try:
> > +            if open("libgpiod-version.txt", "r").read() =3D=3D LIBGPIO=
D_VERSION:
> > +                log.info(f"skipping tarball fetch")
> > +                command(self)
> > +                return
> > +        except OSError:
> > +            pass
> > +
> > +        # Early exit for build tree with dirty lib/include dirs
> > +        for check_dir in "lib", "include":
> > +            if path.isdir(f"./{check_dir}"):
> > +                raise BaseError(f"refusing to overwrite ./{check_dir}"=
)
> > +
> > +        with TemporaryDirectory(prefix=3D"libgpiod-") as temp_dir:
> > +            tarball_filename =3D TAR_FILENAME.format(version=3DLIBGPIO=
D_VERSION)
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
> > +            if Version(LIBGPIOD_VERSION) < Version(LIBGPIOD_MINIMUM_VE=
RSION):
> > +                raise BaseError(f"requires libgpiod>=3D{LIBGPIOD_MINIM=
UM_VERSION}")
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
> > +            base_dir =3D path.join(temp_dir, f"libgpiod-{LIBGPIOD_VERS=
ION}")
> > +            copytree(path.join(base_dir, "include"), "./include")
> > +            copytree(path.join(base_dir, "lib"), "./lib")
> > +
> > +        # Save the libgpiod version for sdist
> > +        open("libgpiod-version.txt", "w").write(LIBGPIOD_VERSION)
> > +
> > +        # Run the command
> > +        command(self)
> > +
> > +        # Clean up the build directory
> > +        rmtree("./lib", ignore_errors=3DTrue)
> > +        rmtree("./include", ignore_errors=3DTrue)
> > +        unlink("libgpiod-version.txt")
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
> > +    needed to build binary wheels when LIBGPIOD_VERSION is specified, =
eg:
> > +
> > +    LIBGPIOD_VERSION=3D"2.0.2" python3 -m build .
> >      """
> >
> > +    @fetch_tarball
> >      def run(self):
> > +        # Try to get the gpiod version from the .txt file included in =
sdist
> > +        try:
> > +            libgpiod_version =3D open("libgpiod-version.txt", "r").rea=
d()
> > +        except OSError:
> > +            libgpiod_version =3D LIBGPIOD_VERSION
> > +
> > +        if libgpiod_version and not LINK_SYSTEM_LIBGPIOD:
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
> > +                f'-DGPIOD_VERSION_STR=3D"{libgpiod_version}"',
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
> > +    needed to build binary wheels when LIBGPIOD_VERSION is specified, =
eg:
> > +
> > +    LIBGPIOD_VERSION=3D"2.0.2" python3 -m build . --sdist
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
> > @@ -50,19 +244,17 @@ procname_ext =3D Extension(
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
> > +    url=3D"https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git",
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
>
> --
> Phil
