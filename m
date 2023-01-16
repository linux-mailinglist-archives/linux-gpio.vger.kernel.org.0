Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3D466D0B3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 22:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbjAPVHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 16:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbjAPVG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 16:06:59 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312037EC7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 13:06:58 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4b6255ce5baso395780547b3.11
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8Yy2Ksn+WgdMf0jF4r/OvuFXuzazfywVQq1TA4Romk=;
        b=Jg8pGZ6zJqVHPGa0E1QTIlQ6KlXnbrjwYUALY13y1bSJ2xfsewxR9zERYbmKb10GgG
         9MxLrVsL6ZY9lquSoRjGGyW9cmvnB0x63SUx1+BfDpHKB3YoUAMPPoOJYI6DoCTc6gHQ
         pcgbz4iYPzllL/cM3MVvq5m9IbEg5y5mJng7XpKLeH/6bK9P++ZHcsOPHE+/f9lFj1uF
         sH2MuLsbLPA0HsnYOYZnSzj0oM8BwllCzhSozGJqPh+EntYhzmEjVWIEm58PAa1N2Hja
         K/BIrTGyxWXlhLQke1PFaI5vEIdGlcTgPqvvSvrDn/LHMLWd15rzMXt13f+FQ+eR7i2s
         l9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8Yy2Ksn+WgdMf0jF4r/OvuFXuzazfywVQq1TA4Romk=;
        b=u0TFy2zn0zz7RakFXjyJNHv63Y3PbB/0PUwMQD+hWUTU2v6O7rzq6OKtzKyoUa6nl9
         b1Ljb4yLtguzQNduMsdy2oMGIrZjv5i/m3bk3agq8ejL1m0WKINTGV6UMrIws6rZXjp0
         0bSDrXG8I6z5YkSk7g2x6TdR7PyHCF1ByyAGzis1bDr7Fu+8BENUTIRtZDtvZbKzHf/E
         uWQyB/4jc0853ydfvr5BhJ6zKaIjHboSePdGhXaAe5EWvBxgU78GF3jq/RpqlO01tULl
         hyCuOIJtzaHHZpEiKiJkhgOcjL1QS0VzprCbo7dWH0TjfaKuLFVjhhaOsKHrOJqBu6SR
         Ugiw==
X-Gm-Message-State: AFqh2kqmMjkFUybRgmYlo6rmSNAA1+SMd/BbKvQ80dLO5NlHNbq/AfkN
        DSiffaruwVexU0ildIWE0SIMPylTyp6AF+xfe+UiuvbmjiA6lQ==
X-Google-Smtp-Source: AMrXdXspXKcyg8yhuXDoB72hRg+nHx/fA3OdlOhH3iKgXSM/GA+8WioLHVp1XGyY2a9RjJinhkHCfVlGRFW+Bi1/TFs=
X-Received: by 2002:a0d:e083:0:b0:4cd:f764:1911 with SMTP id
 j125-20020a0de083000000b004cdf7641911mr90327ywe.403.1673903217404; Mon, 16
 Jan 2023 13:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20230116181439.171563-1-jf@faschingbauer.co.at>
In-Reply-To: <20230116181439.171563-1-jf@faschingbauer.co.at>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Mon, 16 Jan 2023 22:06:46 +0100
Message-ID: <CACMJSevv8wi+VR-+BqQdL5uGoMCEnegJ0ZiDJmdXMk59Z-jFMQ@mail.gmail.com>
Subject: Re: [PATCH] bindings: python: fix out-of-source build
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

On Mon, 16 Jan 2023 at 19:15, <jf@faschingbauer.co.at> wrote:
>
> From: Joerg Faschingbauer <jf@faschingbauer.co.at>
>
> Makefile.am delegates the build of the python extension to its
> setup.py file, which references the extension .c files relative to the
> source dir. This makes it impossible to build in a directory that is
> different from the source directory (for example, for PC and ARM but
> from the same source).
>

Thanks for sparing me the surprise of finding that out when writing
the bitbake recipe. Great catch!

A couple nits below:

> * Modify Makefile.am to pass automake's $(srcdir) into setup.py via
>   GPIOD_SRCDIR environment variable.
> * Modify setup.py to pick up .c files relative from that directory.

Can you leave your Sign-off here?

> ---
>  bindings/python/Makefile.am |  6 ++++--
>  bindings/python/setup.py    | 23 ++++++++++++++---------
>  2 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> index 3212a8f..6c2f99b 100644
> --- a/bindings/python/Makefile.am
> +++ b/bindings/python/Makefile.am
> @@ -12,13 +12,15 @@ endif
>  all-local:
>         GPIOD_VERSION_STRING=$(VERSION_STR) \
>         GPIOD_WITH_TESTS=$(BUILD_TESTS) \
> -       $(PYTHON) setup.py build_ext --inplace \
> +       GPIOD_SRCDIR=$(srcdir) \
> +       $(PYTHON) $(srcdir)/setup.py build_ext --inplace \
>                 --include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
>                 --library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
>
>  install-exec-local:
>         GPIOD_WITH_TESTS= \
> -       $(PYTHON) setup.py install --prefix=$(prefix)
> +       GPIOD_SRCDIR=$(srcdir) \
> +       $(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
>
>  SUBDIRS = gpiod
>
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index a951069..3ab01e1 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -2,17 +2,22 @@
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>
>  from os import environ
> +import os.path

Maybe `from os import environ, path`?

>  from setuptools import setup, Extension, find_packages
>
> +srcdir = environ.get('GPIOD_SRCDIR', '.')
> +def src(path):
> +    return os.path.join(srcdir, path)
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
> @@ -21,7 +26,7 @@ gpiod_ext = Extension(
>
>  gpiosim_ext = Extension(
>      "tests.gpiosim._ext",
> -    sources=["tests/gpiosim/ext.c"],
> +    sources=[src("tests/gpiosim/ext.c")],
>      define_macros=[("_GNU_SOURCE", "1")],
>      libraries=["gpiosim"],
>      extra_compile_args=["-Wall", "-Wextra"],
> @@ -29,7 +34,7 @@ gpiosim_ext = Extension(
>
>  procname_ext = Extension(
>      "tests.procname._ext",
> -    sources=["tests/procname/ext.c"],
> +    sources=[src("tests/procname/ext.c")],
>      define_macros=[("_GNU_SOURCE", "1")],
>      extra_compile_args=["-Wall", "-Wextra"],
>  )
> @@ -39,7 +44,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
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

Looks good otherwise!

Bart
