Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44F97CAB5A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 16:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbjJPOZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 10:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbjJPOZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 10:25:05 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A8F9F
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 07:25:03 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-49d0d90a7ddso1539001e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697466302; x=1698071102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UTXlcznzsqTW1QC+xDUx/2A4sUVLhGWpAUguFRhfJQ=;
        b=EjxVFt++bvD6QQdT1VV4ov/90rTj00XYu8SrPnSLRJpT4pblgUvQsusNMVuq4a0D+i
         U+v9+q7kZTBdkSzSB7jpAuG5pPGxHO0jkc2ehbDqF8ESnh9zMdjXarjsF4YBbutiSVfZ
         01xdeU7k7SrUW9SsLBnpL4Nfv9f/5sU0/QdGNomMXk6K51nwEFPzcu9fbBYpBAWZBAzg
         Wx3y9jTfsSBKIxP6HhWpRBAzFSTdd1xeG3IcjnUgkmaIFXXPuQT5+k4ak0QMan3KwswI
         PLhwJc1kNghPEBiDJDTXjv/M/+DmVWFxt6pGVbd6Xav3+kqcR7KDht69F4Mrc9NVoOA/
         4ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697466302; x=1698071102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UTXlcznzsqTW1QC+xDUx/2A4sUVLhGWpAUguFRhfJQ=;
        b=XghlvBzv81Unh4l8o1EZ8NznlSVPu1rvsYEngumRBboMmctkA/qs1FZ0FhHqBkg0nS
         GXZkX1jvmPWp9MU/2LNOSj1uxDrnaCuXtUNJZ8CdfFd8SAlbLNGQZHjC2Uih8nqXI1Xg
         L/0G+atxlQwC1f+gPxSAFiPyv1kJgbC09AblltYhDBjwu0r9YzecyDFMFuQrts57nUAQ
         fotjXgS0YNkNM+DTHtEJ2u1b8Ql5PncDvMdWAM57zBFeKRhv6SnUcXX162oYGWKfoGB+
         xS0qEmG9hsgztV/guiCqNZ6pLkkqVf3UYXUayRBWYC0FUhZJG6VJDuUqBOdOcgIKBr45
         RsCg==
X-Gm-Message-State: AOJu0YysY38uEYdkqTxGM/qsM/r3gz2fTa5bKzv7YDH1Gps5o78M3kTR
        rj2jg/NNeZuZx97mAuI7ZxFOPIlUcgc2C6FJusOHRA==
X-Google-Smtp-Source: AGHT+IG8kUJDz4ArGnhjAi4zpHOsxTydTtztaI6+ISHowmy8ptbZv2549nj7vTxOzlEF07jajvfo3UUPCBJmVv6HmFw=
X-Received: by 2002:a1f:e041:0:b0:49a:6dc0:5a89 with SMTP id
 x62-20020a1fe041000000b0049a6dc05a89mr26945803vkg.5.1697466302077; Mon, 16
 Oct 2023 07:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231013112812.148021-1-phil@gadgetoid.com> <20231013112812.148021-2-phil@gadgetoid.com>
 <CAMRc=Mdc=XXasOm0=wya6vhC1SMDW7BJDSZ4n3h+0Qcg-MQ4TQ@mail.gmail.com> <CA+kSVo8v-9g5zYQD66JrtuVw6GGsqxwbWf=kxtr_PxUQKUNJQQ@mail.gmail.com>
In-Reply-To: <CA+kSVo8v-9g5zYQD66JrtuVw6GGsqxwbWf=kxtr_PxUQKUNJQQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Oct 2023 16:24:51 +0200
Message-ID: <CAMRc=MeHT38RoY=5LQ+qd1RDgRfH69QnMrr+yAepXGBWUSiWhA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 1/1] bindings: python: optionally include
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

On Mon, Oct 16, 2023 at 3:45=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> On Mon, 16 Oct 2023 at 14:10, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Fri, Oct 13, 2023 at 1:28=E2=80=AFPM Phil Howard <phil@gadgetoid.com=
> wrote:
> > >
> > > Build libgpiod into Python module for build_ext or bdist_wheel.
> > >
> > > Include libgpiod source in sdist so that the Python module
> > > can be built from source by end users, even with a missing
> > > or mismatched system libgpiod.
> > >
> > > Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1" to
> > > generate a module via build_ext or bdist_wheel that links
> > > against system libgpiod.
> > >
> > > Update build to pass "GPIOD_VERSION_STR" as an environment
> > > variable when calling setup.py. This is saved to
> > > "gpiod-version-str.txt" and included in the sdist for
> > > standalone builds.
> > >
> > > The old make/make install behaviour is preserved by
> > > supplying "LINK_SYSTEM_LIBGPIOD=3D1" and an additional sdist
> > > package is built and saved into dist/ for upload to pypi.
> > >
> > > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > > ---
> > >  bindings/python/MANIFEST.in |   5 ++
> > >  bindings/python/Makefile.am |   5 ++
> > >  bindings/python/setup.py    | 107 ++++++++++++++++++++++++++++++----=
--
> > >  3 files changed, 101 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.i=
n
> > > index c7124d4..acf9391 100644
> > > --- a/bindings/python/MANIFEST.in
> > > +++ b/bindings/python/MANIFEST.in
> > > @@ -2,6 +2,7 @@
> > >  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszew=
ski@linaro.org>
> > >
> > >  include setup.py
> > > +include gpiod-version-str.txt
> > >
> > >  recursive-include gpiod *.py
> > >  recursive-include tests *.py
> > > @@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
> > >
> > >  recursive-include tests/gpiosim *.c
> > >  recursive-include tests/procname *.c
> > > +
> > > +recursive-include lib *.c
> > > +recursive-include lib *.h
> > > +recursive-include include *.h
> > > diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.a=
m
> > > index 079ceb1..fda8f94 100644
> > > --- a/bindings/python/Makefile.am
> > > +++ b/bindings/python/Makefile.am
> > > @@ -12,10 +12,15 @@ BUILD_TESTS =3D 1
> > >  endif
> > >
> > >  all-local:
> > > +       GPIOD_VERSION_STR=3D$(VERSION_STR) \
> > >         GPIOD_WITH_TESTS=3D$(BUILD_TESTS) \
> > > +       LINK_SYSTEM_LIBGPIOD=3D1 \
> > >         $(PYTHON) setup.py build_ext --inplace \
> > >                 --include-dirs=3D$(top_srcdir)/include/:$(top_srcdir)=
/tests/gpiosim/ \
> > >                 --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_src=
dir)/tests/gpiosim/.libs/
> > > +       GPIOD_VERSION_STR=3D$(VERSION_STR) \
> > > +       $(PYTHON) setup.py sdist
> > > +
> > >
> > >  install-exec-local:
> > >         GPIOD_WITH_TESTS=3D \
> > > diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> > > index df10e18..878c38d 100644
> > > --- a/bindings/python/setup.py
> > > +++ b/bindings/python/setup.py
> > > @@ -1,10 +1,43 @@
> > >  # SPDX-License-Identifier: GPL-2.0-or-later
> > >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > >
> > > -from os import environ, path
> > > +from os import environ, path, unlink
> > >  from setuptools import setup, Extension, find_packages
> > >  from setuptools.command.build_ext import build_ext as orig_build_ext
> > > -from shutil import rmtree
> > > +from setuptools.command.sdist import sdist as orig_sdist
> > > +from shutil import rmtree, copytree
> > > +
> > > +
> > > +def get_gpiod_version_str():
> > > +    try:
> > > +        return environ["GPIOD_VERSION_STR"]
> >
> > Would it be possible - in order to keep the default behavior really
> > backward compatible - to make this optional, and if it wasn't passed
> > then we don't allow built-in libgpiod packaging?
>
> Seems reasonable. I'll change it.
>
> > This way, the yocto recipe wouldn't require any changes at all, which
> > would be preferable.
>
> Ah for some reason I'd thought yocto would just use automake.
>

It actually uses pypi for the python bindings. They were factored out
of the main recipe and put into meta-python.

Bart

> > Bart
> >
> > > +    except KeyError:
> > > +        return open("gpiod-version-str.txt", "r").read()
> > > +
> > > +
> > > +def copy_libgpiod_files(func):
> > > +    """
> > > +    In order to include the lib and include directories in the sdist
> > > +    we must temporarily copy them up into the python bindings direct=
ory.
> > > +
> > > +    If "./lib" exists we are building from an sdist package and will=
 not
> > > +    try to copy the files again.
> > > +    """
> > > +
> > > +    def wrapper(self):
> > > +        copy_src =3D not path.exists("./lib")
> > > +        if copy_src:
> > > +            gpiod_version_str =3D get_gpiod_version_str()
> > > +            open("gpiod-version-str.txt", "w").write(gpiod_version_s=
tr)
> > > +            copytree("../../lib", "./lib")
> > > +            copytree("../../include", "./include")
> > > +        func(self)
> > > +        if copy_src:
> > > +            unlink("gpiod-version-str.txt")
> > > +            rmtree("./lib")
> > > +            rmtree("./include")
> > > +
> > > +    return wrapper
> > >
> > >
> > >  class build_ext(orig_build_ext):
> > > @@ -14,24 +47,69 @@ class build_ext(orig_build_ext):
> > >      were built (and possibly copied to the source directory if inpla=
ce is set).
> > >      """
> > >
> > > +    @copy_libgpiod_files
> > >      def run(self):
> > >          super().run()
> > >          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DT=
rue)
> > >
> > >
> > > +class sdist(orig_sdist):
> > > +    """
> > > +    Wrap sdist so that we can copy the lib and include files into . =
where
> > > +    MANIFEST.in will include them in the source package.
> > > +    """
> > > +
> > > +    @copy_libgpiod_files
> > > +    def run(self):
> > > +        super().run()
> > > +
> > > +
> > > +with open("gpiod/version.py", "r") as fd:
> > > +    exec(fd.read())
> > > +
> > > +sources =3D [
> > > +    # gpiod Python bindings
> > > +    "gpiod/ext/chip.c",
> > > +    "gpiod/ext/common.c",
> > > +    "gpiod/ext/line-config.c",
> > > +    "gpiod/ext/line-settings.c",
> > > +    "gpiod/ext/module.c",
> > > +    "gpiod/ext/request.c",
> > > +]
> > > +
> > > +if environ.get("LINK_SYSTEM_LIBGPIOD") =3D=3D "1":
> > > +    libraries =3D ["gpiod"]
> > > +    include_dirs =3D ["gpiod"]
> > > +else:
> > > +    sources +=3D [
> > > +        # gpiod library
> > > +        "lib/chip.c",
> > > +        "lib/chip-info.c",
> > > +        "lib/edge-event.c",
> > > +        "lib/info-event.c",
> > > +        "lib/internal.c",
> > > +        "lib/line-config.c",
> > > +        "lib/line-info.c",
> > > +        "lib/line-request.c",
> > > +        "lib/line-settings.c",
> > > +        "lib/misc.c",
> > > +        "lib/request-config.c",
> > > +    ]
> > > +    libraries =3D []
> > > +    include_dirs =3D ["include", "lib", "gpiod/ext"]
> > > +
> > > +
> > >  gpiod_ext =3D Extension(
> > >      "gpiod._ext",
> > > -    sources=3D[
> > > -        "gpiod/ext/chip.c",
> > > -        "gpiod/ext/common.c",
> > > -        "gpiod/ext/line-config.c",
> > > -        "gpiod/ext/line-settings.c",
> > > -        "gpiod/ext/module.c",
> > > -        "gpiod/ext/request.c",
> > > -    ],
> > > +    libraries=3Dlibraries,
> > > +    sources=3Dsources,
> > >      define_macros=3D[("_GNU_SOURCE", "1")],
> > > -    libraries=3D["gpiod"],
> > > -    extra_compile_args=3D["-Wall", "-Wextra"],
> > > +    include_dirs=3Dinclude_dirs,
> > > +    extra_compile_args=3D[
> > > +        "-Wall",
> > > +        "-Wextra",
> > > +        '-DGPIOD_VERSION_STR=3D"{}"'.format(get_gpiod_version_str())=
,
> > > +    ],
> > >  )
> > >
> > >  gpiosim_ext =3D Extension(
> > > @@ -54,15 +132,12 @@ if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
> > >      extensions.append(gpiosim_ext)
> > >      extensions.append(procname_ext)
> > >
> > > -with open("gpiod/version.py", "r") as fd:
> > > -    exec(fd.read())
> > > -
> > >  setup(
> > >      name=3D"libgpiod",
> > >      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> > >      python_requires=3D">=3D3.9.0",
> > >      ext_modules=3Dextensions,
> > > -    cmdclass=3D{"build_ext": build_ext},
> > > +    cmdclass=3D{"build_ext": build_ext, "sdist": sdist},
> > >      version=3D__version__,
> > >      author=3D"Bartosz Golaszewski",
> > >      author_email=3D"brgl@bgdev.pl",
> > > --
> > > 2.34.1
> > >
