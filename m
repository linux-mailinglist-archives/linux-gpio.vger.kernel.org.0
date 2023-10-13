Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FC77C81DE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 11:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjJMJWS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 05:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjJMJWR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 05:22:17 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D67BD
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 02:22:12 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7b0a16f0338so960129241.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697188931; x=1697793731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QCxjTi+VFX/ZVzXhJtMnLLyWchc+VoTo5cJKreua94=;
        b=W3EiMeXSSV3kuA+jr+VPB5zBwizbNaQHTIRf2Q7pOY7KSm6sYYjCPVWarXkad7rvA1
         nA4mXKKRNDq0WbAUaMI6TeCou2/QHKSCf/ROhEMV9PWZWgcA9za5cBm1qXP4UeNwcZjt
         I2QkS7O9PZowuZndjcHgZToNggLMnM+0bKECHNdJK1wkI6sOUSHrZq19zxPRIAEFUKtE
         cdamHWbC13O+W4F9T61+MmXoCc6B8cc+mPI6dzBNlA52Dmhuwhb15bflT5/FBKMxXU5+
         CYc/efLt4xYVNKBiRQ29o01Q4ErkVuUTN2sTvRZY4Z09JJjolaKE9Wj9QLYShFTTgcef
         bxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697188931; x=1697793731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QCxjTi+VFX/ZVzXhJtMnLLyWchc+VoTo5cJKreua94=;
        b=NiA0z5bLUA3GqQL1HY8KRKCsAVpBNXu0A32LWd7aODdgVjqkyrBjT7TVfBla3O4m6T
         wgXVfndigOkLGUUxQfn+Hv+uCEZtr3GHiyY9QkhMhvAX4ORWOcN5AQHHu/bDMT6wKAa4
         GIGPOYLneXQrS3XWcgIhsVRMYZr5ZO4M4mYmzUWQcBfEpUyUaXppnyTkM9Ylvo9134+K
         JK2nWqdIJ5Btql8Uma5Je3JU3zX+Kpxs1O6mjavU193lQIV0zU9OOJflz11M0lgP1u9f
         N57OI9NLvIS12XfwyBnRZdT9m7NQJJpWfbraq8HVegAZM2zTcivEABjx3fJNjoqkNyTE
         vQow==
X-Gm-Message-State: AOJu0YwC53AFlLMVg2Ld8JQMDKmtfUBjVuevy0VL7e35YRN45DmRS3wJ
        i42G1Iox6NB5hDQwkR2wBYhYZhoZ1a/P0KhsgZEfcEghc1BJGSqC
X-Google-Smtp-Source: AGHT+IHJDtca7nSCy26WH4ZDJLPvX3NTzrzVpLTXhJqXSAYHmguJp7Bnbiv64PTI4AxSeL34jogyEGrFCpWBxpOVn1A=
X-Received: by 2002:a1f:ca83:0:b0:49d:d91:8b27 with SMTP id
 a125-20020a1fca83000000b0049d0d918b27mr21589132vkg.2.1697188931173; Fri, 13
 Oct 2023 02:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231012210228.101513-1-phil@gadgetoid.com> <20231012210228.101513-2-phil@gadgetoid.com>
In-Reply-To: <20231012210228.101513-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Oct 2023 11:22:00 +0200
Message-ID: <CAMRc=MepcYb87SLikSO77Hnbi8T4dUK6heWX8H52TTw_xPOU=A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 1/2] bindings: python: optionally include
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

On Thu, Oct 12, 2023 at 11:02=E2=80=AFPM Phil Howard <phil@gadgetoid.com> w=
rote:
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
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in |  4 ++
>  bindings/python/setup.py    | 95 +++++++++++++++++++++++++++++++------
>  2 files changed, 84 insertions(+), 15 deletions(-)
>
> diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> index c7124d4..eff8977 100644
> --- a/bindings/python/MANIFEST.in
> +++ b/bindings/python/MANIFEST.in
> @@ -11,3 +11,7 @@ recursive-include gpiod/ext *.h
>
>  recursive-include tests/gpiosim *.c
>  recursive-include tests/procname *.c
> +
> +recursive-include lib *.c
> +recursive-include lib *.h
> +recursive-include include *.h
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index fd674aa..e3b571c 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -4,7 +4,30 @@
>  from os import environ, path
>  from setuptools import setup, Extension, find_packages
>  from setuptools.command.build_ext import build_ext as orig_build_ext
> -from shutil import rmtree
> +from setuptools.command.sdist import sdist as orig_sdist
> +from shutil import rmtree, copytree
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
> +            copytree("../../lib", "./lib")
> +            copytree("../../include", "./include")
> +        func(self)
> +        if copy_src:
> +            rmtree("./lib")
> +            rmtree("./include")
> +
> +    return wrapper
>
>
>  class build_ext(orig_build_ext):
> @@ -14,24 +37,69 @@ class build_ext(orig_build_ext):
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
> +        '-DGPIOD_VERSION_STR=3D"{}"'.format(__version__),

This is incorrect. The version we want to pass here is the version of
libgpiod, not the version of python bindings which is now decoupled
from the former.

I'm not sure how to correctly do it. We can read the contents of
configure.ac for one and get it from there. Maybe you have a better
idea.

Bart

> +    ],
>  )
>
>  gpiosim_ext =3D Extension(
> @@ -54,15 +122,12 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_=
WITH_TESTS"] =3D=3D "1":
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
