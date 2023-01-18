Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9252967198C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 11:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjARKqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 05:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjARKpC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 05:45:02 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2B18387E
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 01:51:19 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ss4so74556116ejb.11
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 01:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sX+49dW48LkYIGnKEoL7aTld2NsWTNPcFAiaKWv43Ms=;
        b=nIwd6EiQdQNVwgTZM5MSxI1sPRaU2aFt8Kb4BqEXXe2ZzSjWp5HZggIm9kqQMWFcSm
         a3Es3gOEa2uFgHRvmHNz4CuJf0X/WjI4TC3+O15mdO5HXBJoJkaRkhOXAm+Hy/XC9WdE
         wfHKtGwwylp54N5zUQAwajtlcQda+U2shbYqZ1rCbxR/+EILGJ0ixVhQPcoySBzGmMkx
         bv8waVCS3rmKRn8FEXnk+eK1803gtMB9i+2fWyG3KYtLel9jWDHo+hegIeDsgUI9g0qz
         fS2nUaRkyeU2lb1/EZBYPhUOVzI7Z9gL7cMEKrn6rUm6HJjyLaZXLFMFRqDm59xuv1gD
         NBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX+49dW48LkYIGnKEoL7aTld2NsWTNPcFAiaKWv43Ms=;
        b=E6We8UNE1at3rQUPa+nejax3t8fJ5G4rlNvZJshtbk020VWLQpf6fFAKnn/Gvsc9p6
         Z57998pMyUo/SEJUQQEc0cBl1+3ctKtj0km4Psl1eYVHcoEQ5r3Hua/itxaVX/zOLi9Y
         W2tCnqzycdpZZYz2FnyaoY6Gq8014JONuUzfXH2pA1nvG/9P2TKN9OoRzxSt468rpYda
         BbKYaQgIXhnOw246CQ1LrGae99mvBkyvvjF6kfn9qcTdAscwY3A2t/ricXs1pIRMALcx
         lAiDwgXfCZvquf+CuapMBbwG3XaSGC6JoTBpxcg/+2HMgoWdRp5/+JmhC2dKd5qIyJM7
         mOmw==
X-Gm-Message-State: AFqh2kq9YCQSM+dQWy7OLhGdI1iEPEHePn3PuhuJvQlIsugUR3kl/0/W
        Avnaoxxbts953LEe4G1ES4EvYm3io5ldFjdz3q2VFVVADdIlfw==
X-Google-Smtp-Source: AMrXdXsLRNIIf8l7yrXoxC8hTT8vMt65ricjR+m3GjrRjMSvumH76NjfZwuuqNB85vHIhzcCLzCSzV7jVwcyzo+w3aQ=
X-Received: by 2002:a17:906:5d9:b0:7b9:631b:7dfb with SMTP id
 t25-20020a17090605d900b007b9631b7dfbmr508458ejt.32.1674035478396; Wed, 18 Jan
 2023 01:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20230118091145.224897-1-jf@faschingbauer.co.at>
In-Reply-To: <20230118091145.224897-1-jf@faschingbauer.co.at>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Wed, 18 Jan 2023 10:51:06 +0100
Message-ID: <CACMJSeuYAQAVu46NMG-z9gfGxOscuVx=9umxUfJWQe4UHryMfg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] bindings: python: fix out-of-source build
To:     jf@faschingbauer.co.at
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 18 Jan 2023 at 10:11, <jf@faschingbauer.co.at> wrote:
>
> From: Joerg Faschingbauer <jf@faschingbauer.co.at>
>
> Makefile.am delegates the build of the python extension to its
> setup.py file, which references the extension .c files relative to the
> source dir. This makes it impossible to build in a directory that is
> different from the source directory (for example, for PC and ARM but
> from the same source).
>
> * Invoke setup.py from $(srcdir)
> * Modify setup.py to pick up .c files relative from setup.py's own
>   directory.
>
> Signed-off-by: Joerg Faschingbauer <jf@faschingbauer.co.at>
> ---
> Fixed the commit message, sorry for that.
> Thanks,
> Joerg
>
>  bindings/python/Makefile.am |  4 ++--
>  bindings/python/setup.py    | 23 +++++++++++++----------
>  2 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> index 3212a8f..9fb2e95 100644
> --- a/bindings/python/Makefile.am
> +++ b/bindings/python/Makefile.am
> @@ -12,13 +12,13 @@ endif
>  all-local:
>         GPIOD_VERSION_STRING=$(VERSION_STR) \
>         GPIOD_WITH_TESTS=$(BUILD_TESTS) \
> -       $(PYTHON) setup.py build_ext --inplace \
> +       $(PYTHON) $(srcdir)/setup.py build_ext --inplace \
>                 --include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
>                 --library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
>
>  install-exec-local:
>         GPIOD_WITH_TESTS= \
> -       $(PYTHON) setup.py install --prefix=$(prefix)
> +       $(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
>
>  SUBDIRS = gpiod
>
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index a951069..e748295 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -1,18 +1,21 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>
> -from os import environ
> +from os import environ, path
>  from setuptools import setup, Extension, find_packages
>
> +def src(filename):
> +    return path.join(path.dirname(__file__), filename)
> +
>  gpiod_ext = Extension(
>      "gpiod._ext",
>      sources=[
> -        "gpiod/ext/chip.c",
> -        "gpiod/ext/common.c",
> -        "gpiod/ext/line-config.c",
> -        "gpiod/ext/line-settings.c",
> -        "gpiod/ext/module.c",
> -        "gpiod/ext/request.c",
> +        src("gpiod/ext/chip.c"),
> +        src("gpiod/ext/common.c"),
> +        src("gpiod/ext/line-config.c"),
> +        src("gpiod/ext/line-settings.c"),
> +        src("gpiod/ext/module.c"),
> +        src("gpiod/ext/request.c"),
>      ],
>      define_macros=[("_GNU_SOURCE", "1")],
>      libraries=["gpiod"],
> @@ -21,7 +24,7 @@ gpiod_ext = Extension(
>
>  gpiosim_ext = Extension(
>      "tests.gpiosim._ext",
> -    sources=["tests/gpiosim/ext.c"],
> +    sources=[src("tests/gpiosim/ext.c")],
>      define_macros=[("_GNU_SOURCE", "1")],
>      libraries=["gpiosim"],
>      extra_compile_args=["-Wall", "-Wextra"],
> @@ -29,7 +32,7 @@ gpiosim_ext = Extension(
>
>  procname_ext = Extension(
>      "tests.procname._ext",
> -    sources=["tests/procname/ext.c"],
> +    sources=[src("tests/procname/ext.c")],
>      define_macros=[("_GNU_SOURCE", "1")],
>      extra_compile_args=["-Wall", "-Wextra"],
>  )
> @@ -39,7 +42,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
>      extensions.append(gpiosim_ext)
>      extensions.append(procname_ext)
>
> -with open("gpiod/version.py", "r") as fd:
> +with open(src("gpiod/version.py"), "r") as fd:
>      exec(fd.read())
>
>  setup(
> --
> 2.38.1
>

Applied, thanks!

Bart
