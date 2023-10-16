Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFEEC7CA8F7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 15:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbjJPNL0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 09:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233759AbjJPNLI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 09:11:08 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABA51A4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 06:10:40 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7b08ac3ce7fso1831930241.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697461839; x=1698066639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxD1jrIIi9Jp4rjANcB3ND2VYxnoxb6jK9XRbui6T8c=;
        b=kAmmaQk2/sgebnuwSqAtWwLqTHBVn1mb+OFzb4JL+KJMhbWMOJrDJLndz6EBM69s3N
         YM52LEBqUdH47I8QOqbw7oqk9HSrqoEwxZqlVLwMHqLh36DBXQZZxu63hBAfq+ncqbxY
         4g3+ssh0ghTyZy+hWMa1l6VQ7F5AsbSnjB8nn308tF2ykMnT36JqniVMQ6WN5PUon2br
         TnJx0AjgIp8nyM+tIvutN723PGWgBHacLDqK1QGsVBIuPNd3rk/9W3dtJ/A4HhT+Ziis
         aTaaJaUPk0yWThjWWLrJR15ZvrfCBoaz2nQCVmvBiZzC0ORwq4XoCKlR0Bnhuw31iTum
         GA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697461839; x=1698066639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxD1jrIIi9Jp4rjANcB3ND2VYxnoxb6jK9XRbui6T8c=;
        b=miA0j2WoNhfsfcoqozYmJ/3KXB+jfB8ZLd4ZnSt2RTEvVBFsm/Tsz9CaZvZy2gQn44
         /O90gutihjlnU71fGyXlw/MmkUjxkjaH+kHir2A6VSRzvHjc+2FUo2fy4p1e+PRBj1sq
         E57xTHws8vDxwEn/0ke/PGJs1qksRPmfbcAUsfhtRCzRRwf5gBzlk/Rhiq019t1re5Ci
         ORTzBl75o6DOQPW4eVM0VMM1wU8pTwArjQE8kOWt5DVgVxgEresAPZ8qCBap2xRsdFjw
         gCX5+m/yg6QtjhviW4KTQO4MZZDmUdUrICwfxvwe89XX+qsf4KHUqsS2D3zz56K8lXkh
         nP3Q==
X-Gm-Message-State: AOJu0YzTDxHTzGmS9cw6aMt5tF2ejiVvnifSqxqhiaOGgZlu4rDfYFah
        RvqVoWhWSIrebP8YkU1l5TV7pfQ+NrlEvUPMrgfKXg==
X-Google-Smtp-Source: AGHT+IHvSBe3SbSvvBZ5+7+/D00+NumR0ob2jfmeEzcR++lA76GloKJEoG6L5jIXxD2n72hDPe6fwOEBgj0T6Mf6xfU=
X-Received: by 2002:a1f:6283:0:b0:49a:1605:ee6a with SMTP id
 w125-20020a1f6283000000b0049a1605ee6amr29326574vkb.5.1697461839525; Mon, 16
 Oct 2023 06:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231013112812.148021-1-phil@gadgetoid.com> <20231013112812.148021-2-phil@gadgetoid.com>
In-Reply-To: <20231013112812.148021-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Oct 2023 15:10:28 +0200
Message-ID: <CAMRc=Mdc=XXasOm0=wya6vhC1SMDW7BJDSZ4n3h+0Qcg-MQ4TQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 13, 2023 at 1:28=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Build libgpiod into Python module for build_ext or bdist_wheel.
>
> Include libgpiod source in sdist so that the Python module
> can be built from source by end users, even with a missing
> or mismatched system libgpiod.
>
> Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1" to
> generate a module via build_ext or bdist_wheel that links
> against system libgpiod.
>
> Update build to pass "GPIOD_VERSION_STR" as an environment
> variable when calling setup.py. This is saved to
> "gpiod-version-str.txt" and included in the sdist for
> standalone builds.
>
> The old make/make install behaviour is preserved by
> supplying "LINK_SYSTEM_LIBGPIOD=3D1" and an additional sdist
> package is built and saved into dist/ for upload to pypi.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in |   5 ++
>  bindings/python/Makefile.am |   5 ++
>  bindings/python/setup.py    | 107 ++++++++++++++++++++++++++++++------
>  3 files changed, 101 insertions(+), 16 deletions(-)
>
> diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> index c7124d4..acf9391 100644
> --- a/bindings/python/MANIFEST.in
> +++ b/bindings/python/MANIFEST.in
> @@ -2,6 +2,7 @@
>  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@=
linaro.org>
>
>  include setup.py
> +include gpiod-version-str.txt
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
> diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> index 079ceb1..fda8f94 100644
> --- a/bindings/python/Makefile.am
> +++ b/bindings/python/Makefile.am
> @@ -12,10 +12,15 @@ BUILD_TESTS =3D 1
>  endif
>
>  all-local:
> +       GPIOD_VERSION_STR=3D$(VERSION_STR) \
>         GPIOD_WITH_TESTS=3D$(BUILD_TESTS) \
> +       LINK_SYSTEM_LIBGPIOD=3D1 \
>         $(PYTHON) setup.py build_ext --inplace \
>                 --include-dirs=3D$(top_srcdir)/include/:$(top_srcdir)/tes=
ts/gpiosim/ \
>                 --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_srcdir)=
/tests/gpiosim/.libs/
> +       GPIOD_VERSION_STR=3D$(VERSION_STR) \
> +       $(PYTHON) setup.py sdist
> +
>
>  install-exec-local:
>         GPIOD_WITH_TESTS=3D \
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index df10e18..878c38d 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -1,10 +1,43 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>
> -from os import environ, path
> +from os import environ, path, unlink
>  from setuptools import setup, Extension, find_packages
>  from setuptools.command.build_ext import build_ext as orig_build_ext
> -from shutil import rmtree
> +from setuptools.command.sdist import sdist as orig_sdist
> +from shutil import rmtree, copytree
> +
> +
> +def get_gpiod_version_str():
> +    try:
> +        return environ["GPIOD_VERSION_STR"]

Would it be possible - in order to keep the default behavior really
backward compatible - to make this optional, and if it wasn't passed
then we don't allow built-in libgpiod packaging?

This way, the yocto recipe wouldn't require any changes at all, which
would be preferable.

Bart

> +    except KeyError:
> +        return open("gpiod-version-str.txt", "r").read()
> +
> +
> +def copy_libgpiod_files(func):
> +    """
> +    In order to include the lib and include directories in the sdist
> +    we must temporarily copy them up into the python bindings directory.
> +
> +    If "./lib" exists we are building from an sdist package and will not
> +    try to copy the files again.
> +    """
> +
> +    def wrapper(self):
> +        copy_src =3D not path.exists("./lib")
> +        if copy_src:
> +            gpiod_version_str =3D get_gpiod_version_str()
> +            open("gpiod-version-str.txt", "w").write(gpiod_version_str)
> +            copytree("../../lib", "./lib")
> +            copytree("../../include", "./include")
> +        func(self)
> +        if copy_src:
> +            unlink("gpiod-version-str.txt")
> +            rmtree("./lib")
> +            rmtree("./include")
> +
> +    return wrapper
>
>
>  class build_ext(orig_build_ext):
> @@ -14,24 +47,69 @@ class build_ext(orig_build_ext):
>      were built (and possibly copied to the source directory if inplace i=
s set).
>      """
>
> +    @copy_libgpiod_files
>      def run(self):
>          super().run()
>          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DTrue)
>
>
> +class sdist(orig_sdist):
> +    """
> +    Wrap sdist so that we can copy the lib and include files into . wher=
e
> +    MANIFEST.in will include them in the source package.
> +    """
> +
> +    @copy_libgpiod_files
> +    def run(self):
> +        super().run()
> +
> +
> +with open("gpiod/version.py", "r") as fd:
> +    exec(fd.read())
> +
> +sources =3D [
> +    # gpiod Python bindings
> +    "gpiod/ext/chip.c",
> +    "gpiod/ext/common.c",
> +    "gpiod/ext/line-config.c",
> +    "gpiod/ext/line-settings.c",
> +    "gpiod/ext/module.c",
> +    "gpiod/ext/request.c",
> +]
> +
> +if environ.get("LINK_SYSTEM_LIBGPIOD") =3D=3D "1":
> +    libraries =3D ["gpiod"]
> +    include_dirs =3D ["gpiod"]
> +else:
> +    sources +=3D [
> +        # gpiod library
> +        "lib/chip.c",
> +        "lib/chip-info.c",
> +        "lib/edge-event.c",
> +        "lib/info-event.c",
> +        "lib/internal.c",
> +        "lib/line-config.c",
> +        "lib/line-info.c",
> +        "lib/line-request.c",
> +        "lib/line-settings.c",
> +        "lib/misc.c",
> +        "lib/request-config.c",
> +    ]
> +    libraries =3D []
> +    include_dirs =3D ["include", "lib", "gpiod/ext"]
> +
> +
>  gpiod_ext =3D Extension(
>      "gpiod._ext",
> -    sources=3D[
> -        "gpiod/ext/chip.c",
> -        "gpiod/ext/common.c",
> -        "gpiod/ext/line-config.c",
> -        "gpiod/ext/line-settings.c",
> -        "gpiod/ext/module.c",
> -        "gpiod/ext/request.c",
> -    ],
> +    libraries=3Dlibraries,
> +    sources=3Dsources,
>      define_macros=3D[("_GNU_SOURCE", "1")],
> -    libraries=3D["gpiod"],
> -    extra_compile_args=3D["-Wall", "-Wextra"],
> +    include_dirs=3Dinclude_dirs,
> +    extra_compile_args=3D[
> +        "-Wall",
> +        "-Wextra",
> +        '-DGPIOD_VERSION_STR=3D"{}"'.format(get_gpiod_version_str()),
> +    ],
>  )
>
>  gpiosim_ext =3D Extension(
> @@ -54,15 +132,12 @@ if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
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
