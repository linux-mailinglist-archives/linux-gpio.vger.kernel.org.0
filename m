Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A1B7C7703
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 21:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442234AbjJLThU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 15:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442210AbjJLThU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 15:37:20 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90711A9
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:37:17 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4547428694dso583029137.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697139436; x=1697744236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOmD8i0JrrUs6c6lMqCE0sAtg4KGvFFSR+3CONF503g=;
        b=IgbTqh0dHBwMDzuLqdY0GsipzErfiKJnPjq3ipIz/d4ss8KFObVsly1r/sX8fp+ieN
         nSKViAZWqaB0QeWyNwNJoBwx1PqaF8la1XUMbAYOVIBvwEV5+ZU62LAM21nIAnba94Hr
         e2QPKp91YwsEQ25GyECzZ/z/L4mjBFF8JuoYPW36AAjf+oU8RulhTrL9KJEvuaTniDtI
         uOP3lbPgZDkYm85u2j7g7fLtIpWrrQECwiR5FPIlQtshkYkMUGync2aTBqKc089kGw2F
         dbbA7b75jSn1eoCiKOJsrQPoumJ8WLHU5BGM2zBzqZrHYRKeVBb77GDmaLWqlF69st3A
         NPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697139436; x=1697744236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOmD8i0JrrUs6c6lMqCE0sAtg4KGvFFSR+3CONF503g=;
        b=iIWCEzC9ph2xqy8F+bPyH+Ot72RK+hiTEQbk/Zn/zHFlGsGM5QPVr+TB82jeQ07yUp
         qGzl386uxIh/2gyu5xx6FO0iLVGzjjJoV9pcUVflUS8P7oMbl2jysL4x/j82p+7vlAmS
         xJKbUxPau0prxy9clKEI44Qdv3ZV7CLguvInRADjvd+J6Lv8KoXw6azyDBa8gWDcqUpJ
         uhyOex/QTJSnvT7dkCrfDcCmqssU2YCIfIGj6ugV/wOT7hBoH0ELr5H57SGdVmoLlVYF
         C6eThHd7Hyx7fkFhiF/Gr9nYhxooPFwsySOh5yQYSofXMxfeTc5Q9ygtlcnLQA5lSCiE
         al+w==
X-Gm-Message-State: AOJu0YxU4yTC6+75cVy9aYqHOmq407/p657mm4JyKWYtroJNpL9ccMmw
        49KEsjd0ErrnJMo1GHsRPbXpvX8fWp7cQ4cVxVHTOA==
X-Google-Smtp-Source: AGHT+IGezVCRlCR/x5FLiWVajD91xTg0yU55Q/swTou5HdAZfEP3+sEcl8XsBIQ6etCqYODz+1U2jOmp8YMXQ8c3DNI=
X-Received: by 2002:a67:c205:0:b0:457:b8a8:f58f with SMTP id
 i5-20020a67c205000000b00457b8a8f58fmr1500798vsj.8.1697139436247; Thu, 12 Oct
 2023 12:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231011121246.9467-1-phil@gadgetoid.com> <20231011121246.9467-2-phil@gadgetoid.com>
In-Reply-To: <20231011121246.9467-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 21:37:05 +0200
Message-ID: <CAMRc=MeFeopJB3_UQFY3nkHsQS+kwHU3yqBLhnEH_j1k8xZG6g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/3] bindings: python: optionally include module
 in sdist
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

On Wed, Oct 11, 2023 at 2:13=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Build gpiod into Python module.
>
> Optional environment var USE_SYSTEM_GPIO=3D1 to

Let's call it USE_SYSTEM_GPIOD or USE_SYSTEM_LIBGPIOD or even
LINK_SYSTEM_LIBGPIOD?

> generate a module that depends upon system gpiod.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in |  4 +++
>  bindings/python/include     |  1 +
>  bindings/python/lib         |  1 +
>  bindings/python/setup.py    | 57 ++++++++++++++++++++++++++++---------
>  4 files changed, 50 insertions(+), 13 deletions(-)
>  create mode 120000 bindings/python/include
>  create mode 120000 bindings/python/lib
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
> diff --git a/bindings/python/include b/bindings/python/include
> new file mode 120000
> index 0000000..fcffffb
> --- /dev/null
> +++ b/bindings/python/include
> @@ -0,0 +1 @@
> +../../include
> \ No newline at end of file

Addressing Andy's remark: I think this is just how git generates diffs
for links, nothing we can do about it.

I would prefer not to have links in the repo anyway, it would be great
if we could create them at build-time.

Bart

> diff --git a/bindings/python/lib b/bindings/python/lib
> new file mode 120000
> index 0000000..58677dd
> --- /dev/null
> +++ b/bindings/python/lib
> @@ -0,0 +1 @@
> +../../lib
> \ No newline at end of file
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index 66b7908..2e25981 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -19,19 +19,53 @@ class build_ext(orig_build_ext):
>          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DTrue)
>
>
> +with open("gpiod/version.py", "r") as fd:
> +    exec(fd.read())
> +
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
> +if "USE_SYSTEM_GPIOD" in environ and environ["USE_SYSTEM_GPIOD"] =3D=3D =
"1":
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
> +    ],
>  )
>
>  gpiosim_ext =3D Extension(
> @@ -54,9 +88,6 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WIT=
H_TESTS"] =3D=3D "1":
>      extensions.append(gpiosim_ext)
>      extensions.append(procname_ext)
>
> -with open("gpiod/version.py", "r") as fd:
> -    exec(fd.read())
> -
>  setup(
>      name=3D"libgpiod",
>      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> --
> 2.34.1
>
