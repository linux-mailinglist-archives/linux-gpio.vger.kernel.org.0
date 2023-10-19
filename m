Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3047CF433
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Oct 2023 11:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjJSJlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Oct 2023 05:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjJSJli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2023 05:41:38 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A7D112
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 02:41:35 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-49d0ae5eb7bso3210575e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697708495; x=1698313295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QIIGdAN85OBS8LTFkzW6DSJ5+Ujg0pw0VxcG8ylmL4=;
        b=Jp/jLLDVQZB2kJvFx/kcJ1pPyaJW5i3QTMVANGNSRuTYHxIDO3eib0TKIQ2kukhCCy
         3SnTTY2AjSsZkdSV5wOmeMz4HU+oA/xRQa6atG5jcVLpAFSKL4Dr6VsZ7IjOvIodN4jq
         YYHUz0gtJV+zopbBQ5/dNq4rI4ANDevUXzcQkwJ7JpY78gZu9U5QfMbXFFgVWXmJwia/
         SGHl1X+11SzPKxDNlcAlZJJ81tcYKDEFjLwezg+ZbEVe59jFm+/0wcIr/UYeGKsPSwby
         XxQLX5A91fcm98zWLH7YVgwhJwRntsI2azUuHeTOMqQijRy8Dza7g/gVF7GXyfxStq2S
         n83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708495; x=1698313295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QIIGdAN85OBS8LTFkzW6DSJ5+Ujg0pw0VxcG8ylmL4=;
        b=JJurOGsl9VGLJwiB0A3MBs8S++Qnz7WjfdnPU/Gvw5eBwym1fBTb7qnFLdqLpgCJ+A
         A6N0NbXI7x38WGsN9TPLzdFeg+nuSGDWr4o6X7P6oPIMTxSfR5PJVngtdSd3fAlmxepr
         OIGLf1aTeTmP8hLIMoQxizCD+FxqrcYw9sypvvAXCQDs9dFNsOq0HdhDBm1SBN8AGLOq
         AoOPI29yjTqgSbY6FWH/DdsFUCnL8i7ZnYGuCreZoSrS/SYHi4QeMgRWtV2LHGvpsk8x
         8Dmi+PgN/RNUHVER9oe9uz1uaguPdAaj9BTxRNDPhISGgP7NdD7Qs7jAk40o+0CReJr2
         zQng==
X-Gm-Message-State: AOJu0Yx3a+w6kasw9eW2cTVlZ4gDdKy1q0DxsYOKWQpAppMxtzAJZsjU
        /l1NgYjtALTJtqxEuHqgvMLiRkITOIgu8V3b60bZW3s6HyU1zSI1NNY=
X-Google-Smtp-Source: AGHT+IHNkkn6JuH0hw2wrfMcGW6YAtUGSp9j2cjNedjQ2bf1OgjoztCva1STozDU85gkVJdVNYBgefYSgkQOwmsZ2d4=
X-Received: by 2002:a05:6122:201f:b0:49b:289a:cc4a with SMTP id
 l31-20020a056122201f00b0049b289acc4amr1581292vkd.3.1697708494732; Thu, 19 Oct
 2023 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231018205728.284068-1-phil@gadgetoid.com> <20231018205728.284068-2-phil@gadgetoid.com>
In-Reply-To: <20231018205728.284068-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 19 Oct 2023 11:41:23 +0200
Message-ID: <CAMRc=MfsVNY7cPWpFRxV8pF5hoXHQWjXCmBzGsg58sFO+UEeog@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v5 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 18, 2023 at 10:57=E2=80=AFPM Phil Howard <phil@gadgetoid.com> w=
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
> This will instruct setup.py to fetch the tarball matching the requested
> version from git.kernel.org, unpack it, and copy the lib and include
> directories into the package root so they can be included in sdist or use=
d
> to build a binary wheel.
>
> eg: GPIOD_VERSION=3D2.0.2 python3 setup.py sdist
>
> Will build a source distribution with gpiod version 2.0.2 source included=
.
>
> It will also save the gpiod version into "gpiod-version.txt" so that it c=
an
> be passed to the build when the sdist is built by pip.
>
> Requiring an explicit version ensures that the Python bindings - which
> can be changed and versions independent of libgpiod -  are built against =
a
> stable libgpiod release.
>
> In order to force a package with vendored gpiod source to link the system
> libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:
>
> eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in |   5 ++
>  bindings/python/setup.py    | 131 +++++++++++++++++++++++++++++++++---
>  2 files changed, 125 insertions(+), 11 deletions(-)
>
> diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> index c7124d4..0aa9079 100644
> --- a/bindings/python/MANIFEST.in
> +++ b/bindings/python/MANIFEST.in
> @@ -2,6 +2,7 @@
>  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@=
linaro.org>
>
>  include setup.py
> +include gpiod-version.txt
>
>  recursive-include gpiod *.py
>  recursive-include tests *.py
> @@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
>
>  recursive-include tests/gpiosim *.c
>  recursive-include tests/procname *.c
> +
> +recursive-include lib *.c
> +recursive-include lib *.h
> +recursive-include include *.h
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index df10e18..f0d5c1f 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -1,24 +1,136 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>
> -from os import environ, path
> -from setuptools import setup, Extension, find_packages
> +import tarfile
> +from os import getenv, path, unlink
> +from shutil import copytree, rmtree
> +from urllib.request import urlretrieve

Doesn't it make our setup.py depend on additional packages on top of
the standard library?

> +
> +from setuptools import Extension, find_packages, setup
>  from setuptools.command.build_ext import build_ext as orig_build_ext
> -from shutil import rmtree
> +from setuptools.command.sdist import sdist as orig_sdist
> +
> +LINK_SYSTEM_LIBGPIOD =3D getenv("LINK_SYSTEM_LIBGPIOD") =3D=3D "1"
> +GPIOD_VERSION =3D getenv("GPIOD_VERSION")

I'd call it LIBGPIOD_VERSION to be more explicit.

> +GPIOD_WITH_TESTS =3D getenv("GPIOD_WITH_TESTS") =3D=3D "1"
> +SRC_BASE_URL =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.=
git/snapshot/"

I would prefer to use the http mirror at
https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/ rather
than git snapshots. We have better control over what's in there and we
can even verify the checksums after download if needed.

> +SRC_FILENAME =3D "libgpiod-{version}.tar.gz"

Maybe put it in /tmp?

Bart

> +
> +# __version__
> +with open("gpiod/version.py", "r") as fd:
> +    exec(fd.read())
> +
> +
> +def fetch_tarball(func):
> +    # If no GPIOD_VERSION is specified in env, just run the task
> +    if GPIOD_VERSION is None:
> +        return func
> +
> +    # If GPIOD_VERSION is specified, fetch the requested version tarball
> +    # and create gpiod-version.txt so the sdist package knows what versi=
on
> +    # it's building.
> +    def wrapper(self):
> +        TARBALL =3D SRC_FILENAME.format(version=3DGPIOD_VERSION)
> +
> +        print(f"fetching: {SRC_BASE_URL + TARBALL}")
> +
> +        filename, headers =3D urlretrieve(SRC_BASE_URL + TARBALL, TARBAL=
L)
> +
> +        if not tarfile.is_tarfile(filename):
> +            print(f"error: refusing to build sdist (invalid tarball {TAR=
BALL})")
> +            return
> +
> +        # Unpack the downloaded tarball
> +        print(f"unpacking: {filename}")
> +        file =3D tarfile.open(filename)
> +        file.extractall(".")
> +        file.close()
> +        unlink(filename)
> +
> +        # Copy the include and lib directories we need to build libgpiod
> +        copytree(f"libgpiod-{GPIOD_VERSION}/include/", "./include")
> +        copytree(f"libgpiod-{GPIOD_VERSION}/lib/", "./lib")
> +        rmtree(f"libgpiod-{GPIOD_VERSION}")
> +
> +        # Save the gpiod version for sdist
> +        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
> +
> +        func(self)
> +
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
> @@ -50,19 +162,16 @@ procname_ext =3D Extension(
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
>      name=3D"libgpiod",
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
