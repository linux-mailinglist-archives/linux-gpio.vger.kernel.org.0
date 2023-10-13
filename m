Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D317C83C4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 12:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjJMKxf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 06:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjJMKxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 06:53:34 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFB4BD
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 03:53:31 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1dcfb21f9d9so1098668fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697194411; x=1697799211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx3OT1rGshp/Ir2GcBpAjiy0QL5GaqImc4dojac1F2o=;
        b=V1Dq8RYuJzrqmg+LFh9HpgWhe9JgGyFreXNPGGtL3cUmq+OEwZ9/qrPcn531vkGBUP
         iMhjLOMeLA2d3nkbfBP83HrR6pUph+zSvEdic7bvw3el2XvzkCTXtetuq+MiIII7lXJy
         pQ7xmxVvp90tOIQGot+NfJ6xvcKhFoXCA8lIhgyjk6UlG4ihz8kB+WQiBtQSI3U9zXxO
         NDQQRyqIOdmg6PvrkGlwKmwfEtaF4gjqL3F9SLhGlCmUOF7BXgodwPwjR0fG5aqm06k/
         bUAHIhGitNmeN7dUk7gS1uGrXxg9d9Enh7eQOoSWZJkdHagElXgfivB+L2izWwiicuZR
         QE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697194411; x=1697799211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx3OT1rGshp/Ir2GcBpAjiy0QL5GaqImc4dojac1F2o=;
        b=wBrUXYdL61TQhU0HvncJdOQjT9Xp+1eqKtA+FlbwTBUBtfXoJA/42F6e8zhx7C5bew
         cd36qOELBYDSYaLs4QLz8e7lK2nNLK2qrACHdsDWSwziY6XFlLDKmmNL+oSeCQqqnjGw
         wwbjs6aMzFNzjgU8bIydHj41pJa0uDECOUWNugcvOADpfGqG73PCO57xQZlzWxGfq1Su
         SEfRxbXSjpz/8Jpui4dWPRH4e2K2nBqg3IxxoydGsbMY4SfqQCqXvupZ4tCHfNbJekxA
         AYTz9SuWK257SzTqlmnMmBtdubZhv43FUARhi4Q39mwcf5Qr0PZuvSu7PvRNs1x+c+JH
         sBoA==
X-Gm-Message-State: AOJu0Yw9FPPmIpoo+062D2Y1jDISV4SYm2P+Q9Zyxm5VBI7/VbKBj7/Z
        CJMYPwaDCfTUQocqdak5KtvNHbZI9BqKx9E01TtDhw==
X-Google-Smtp-Source: AGHT+IFKmN4OjL2qECbdSdSJ6bjm2KUigI0e4cDjpRQY8IuJ0WX7b3V0yNgZnCVo9xn+mUI22m8/Brr1oNNmlXj2dI4=
X-Received: by 2002:a05:6870:89a5:b0:1bf:77e2:95cc with SMTP id
 f37-20020a05687089a500b001bf77e295ccmr30439918oaq.17.1697194410863; Fri, 13
 Oct 2023 03:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231012210228.101513-1-phil@gadgetoid.com> <20231012210228.101513-2-phil@gadgetoid.com>
 <CAMRc=MepcYb87SLikSO77Hnbi8T4dUK6heWX8H52TTw_xPOU=A@mail.gmail.com>
In-Reply-To: <CAMRc=MepcYb87SLikSO77Hnbi8T4dUK6heWX8H52TTw_xPOU=A@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Fri, 13 Oct 2023 11:53:17 +0100
Message-ID: <CA+kSVo_o61ivFSMWpVBpH09X7AH_cXOqHoU_sLv7qONhY3Maew@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 1/2] bindings: python: optionally include
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

On Fri, 13 Oct 2023 at 10:22, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Oct 12, 2023 at 11:02=E2=80=AFPM Phil Howard <phil@gadgetoid.com>=
 wrote:
> >
> > Build libgpiod into Python module for build_ext or bdist_wheel.
> >
> > Include libgpiod source in sdist so that the Python module
> > can be built from source by end users, even with a missing
> > or mismatched system libgpiod.
> >
> > Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1" to
> > generate a module via build_ext or bdist_wheel that links
> > against system libgpiod.
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
> >  bindings/python/MANIFEST.in |  4 ++
> >  bindings/python/setup.py    | 95 +++++++++++++++++++++++++++++++------
> >  2 files changed, 84 insertions(+), 15 deletions(-)
> >
> > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> > index c7124d4..eff8977 100644
> > --- a/bindings/python/MANIFEST.in
> > +++ b/bindings/python/MANIFEST.in
> > @@ -11,3 +11,7 @@ recursive-include gpiod/ext *.h
> >
> >  recursive-include tests/gpiosim *.c
> >  recursive-include tests/procname *.c
> > +
> > +recursive-include lib *.c
> > +recursive-include lib *.h
> > +recursive-include include *.h
> > diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> > index fd674aa..e3b571c 100644
> > --- a/bindings/python/setup.py
> > +++ b/bindings/python/setup.py
> > @@ -4,7 +4,30 @@
> >  from os import environ, path
> >  from setuptools import setup, Extension, find_packages
> >  from setuptools.command.build_ext import build_ext as orig_build_ext
> > -from shutil import rmtree
> > +from setuptools.command.sdist import sdist as orig_sdist
> > +from shutil import rmtree, copytree
> > +
> > +
> > +def copy_libgpiod_files(func):
> > +    """
> > +    In order to include the lib and include directories in the sdist
> > +    we must temporarily copy them up into the python bindings director=
y.
> > +
> > +    If "./lib" exists we are building from an sdist package and will n=
ot
> > +    try to copy the files again.
> > +    """
> > +
> > +    def wrapper(self):
> > +        copy_src =3D not path.exists("./lib")
> > +        if copy_src:
> > +            copytree("../../lib", "./lib")
> > +            copytree("../../include", "./include")
> > +        func(self)
> > +        if copy_src:
> > +            rmtree("./lib")
> > +            rmtree("./include")
> > +
> > +    return wrapper
> >
> >
> >  class build_ext(orig_build_ext):
> > @@ -14,24 +37,69 @@ class build_ext(orig_build_ext):
> >      were built (and possibly copied to the source directory if inplace=
 is set).
> >      """
> >
> > +    @copy_libgpiod_files
> >      def run(self):
> >          super().run()
> >          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DTru=
e)
> >
> >
> > +class sdist(orig_sdist):
> > +    """
> > +    Wrap sdist so that we can copy the lib and include files into . wh=
ere
> > +    MANIFEST.in will include them in the source package.
> > +    """
> > +
> > +    @copy_libgpiod_files
> > +    def run(self):
> > +        super().run()
> > +
> > +
> > +with open("gpiod/version.py", "r") as fd:
> > +    exec(fd.read())
> > +
> > +sources =3D [
> > +    # gpiod Python bindings
> > +    "gpiod/ext/chip.c",
> > +    "gpiod/ext/common.c",
> > +    "gpiod/ext/line-config.c",
> > +    "gpiod/ext/line-settings.c",
> > +    "gpiod/ext/module.c",
> > +    "gpiod/ext/request.c",
> > +]
> > +
> > +if environ.get("LINK_SYSTEM_LIBGPIOD") =3D=3D "1":
> > +    libraries =3D ["gpiod"]
> > +    include_dirs =3D ["gpiod"]
> > +else:
> > +    sources +=3D [
> > +        # gpiod library
> > +        "lib/chip.c",
> > +        "lib/chip-info.c",
> > +        "lib/edge-event.c",
> > +        "lib/info-event.c",
> > +        "lib/internal.c",
> > +        "lib/line-config.c",
> > +        "lib/line-info.c",
> > +        "lib/line-request.c",
> > +        "lib/line-settings.c",
> > +        "lib/misc.c",
> > +        "lib/request-config.c",
> > +    ]
> > +    libraries =3D []
> > +    include_dirs =3D ["include", "lib", "gpiod/ext"]
> > +
> > +
> >  gpiod_ext =3D Extension(
> >      "gpiod._ext",
> > -    sources=3D[
> > -        "gpiod/ext/chip.c",
> > -        "gpiod/ext/common.c",
> > -        "gpiod/ext/line-config.c",
> > -        "gpiod/ext/line-settings.c",
> > -        "gpiod/ext/module.c",
> > -        "gpiod/ext/request.c",
> > -    ],
> > +    libraries=3Dlibraries,
> > +    sources=3Dsources,
> >      define_macros=3D[("_GNU_SOURCE", "1")],
> > -    libraries=3D["gpiod"],
> > -    extra_compile_args=3D["-Wall", "-Wextra"],
> > +    include_dirs=3Dinclude_dirs,
> > +    extra_compile_args=3D[
> > +        "-Wall",
> > +        "-Wextra",
> > +        '-DGPIOD_VERSION_STR=3D"{}"'.format(__version__),
>
> This is incorrect. The version we want to pass here is the version of
> libgpiod, not the version of python bindings which is now decoupled
> from the former.
>
> I'm not sure how to correctly do it. We can read the contents of
> configure.ac for one and get it from there. Maybe you have a better
> idea.

Since configure.ac wont be available in the sdist package we'll need
to copy the version number somewhere.

Since we should probably be plumbing this into autoconf anyway I
think this var should be passed in the same way as
GPIOD_WITH_TESTS, then setup.py can grab it from environ with
a failover to loading from a packaged "gpiod-version-str.txt".

A little out of my wheelhouse, but I'll take a shot.

>
> Bart
>
> > +    ],
> >  )
> >
> >  gpiosim_ext =3D Extension(
> > @@ -54,15 +122,12 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIO=
D_WITH_TESTS"] =3D=3D "1":
> >      extensions.append(gpiosim_ext)
> >      extensions.append(procname_ext)
> >
> > -with open("gpiod/version.py", "r") as fd:
> > -    exec(fd.read())
> > -
> >  setup(
> >      name=3D"libgpiod",
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



--=20
Philip Howard
Technology & Lifestyle Writer
gadgetoid.com

Gadgetoid gadg-et-oid [gaj-it-oid]

                                     -adjective

1. having the characteristics or form of a gadget; resembling a
mechanical contrivance or device.
