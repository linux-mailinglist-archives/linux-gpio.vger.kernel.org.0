Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFF9D7C7690
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 21:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347366AbjJLTRj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 15:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344140AbjJLTRj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 15:17:39 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C161EB7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:17:37 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7b625ed7208so639212241.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697138257; x=1697743057; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWlcOqQJAlOvQMeSN7HvN9BPiuEy/WlCkRpM5FGqZu0=;
        b=mLPlHdcLoWNXiuxisaim/AyippKaq3AyMkqRhmE7cByO8o1bghK/Ccyq+cIGThApwH
         TT4EWU8Pravdm5U+ro2lcevOBhiZAqqVKM1+DCp+1Km9f07w8LqYSozjNr/CZyoefkTo
         jbtQdh31N2H8PNkFsMpUDBjU9HHS5h3SBcjrz9dMzJ+yygFMyQncgo+Fog/S5NXOvsih
         MaXTEYeNxKpLWbzWEPI5Ct68WaXI+c99cPBswKwwCcrmfEiLZGXUKI6aYR614rhkTkdw
         wyePHs/NLuiyj/EbsD9KDySrMG4DuJg7KL1zh9qxOzfbG0dWKkl38yjcraQWigMZ4+E2
         QEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697138257; x=1697743057;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWlcOqQJAlOvQMeSN7HvN9BPiuEy/WlCkRpM5FGqZu0=;
        b=GjV138N9l2wjHpsghTc4gD2pDQeM6tJye8mniJvsbOEQFd0inLHTRXeQ+6RgfOBrQF
         xgHjzApB4BG590XsJM7nYnGSya0UwMz14ns8VvHu7Ja+QRcMMT6AX79BY+VA53S8TTSE
         S9kp8n2KPEN9B5dSi5H9cCFCXrsSw6Gdod+SSvVLNc1aFn6RdgAsI/eF/0ymwGh2pbVb
         +j0yCskrWQCBXAClWBSoPJYIsjMKvALAUzkhErXS+/qIwO3GOiCyzEjPd2lBtvGkKNvn
         sTANoEPSWS5mXL+9ZXMgWDL5OwmcF9RNWztyTqzBm7bzYvGvPMOGqj7VW01So3bT3vq7
         LcmQ==
X-Gm-Message-State: AOJu0Yx7+j0ij8qRiYFw8eQLDGbGxSyhrl/yY43BRzmEo4mKFS219iCH
        QBYXqLJBJjkaffpvjtIZt0KYvTm6x+VGywXZgYQXCw==
X-Google-Smtp-Source: AGHT+IGrA5kF3HcOtUPVT43XJ1zxNH2szPpy6WwhWhnH3/667zKWyI8Q9/VTzKpURDNSvTgSAOPy8KO3OtxI+JdUjJc=
X-Received: by 2002:a67:ea59:0:b0:450:c666:fe14 with SMTP id
 r25-20020a67ea59000000b00450c666fe14mr21646364vso.30.1697138256780; Thu, 12
 Oct 2023 12:17:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Oct 2023 12:17:36 -0700
From:   Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20231012120925.58508-2-phil@gadgetoid.com>
MIME-Version: 1.0
References: <20231012120925.58508-1-phil@gadgetoid.com> <20231012120925.58508-2-phil@gadgetoid.com>
Date:   Thu, 12 Oct 2023 12:17:36 -0700
Message-ID: <CAMRc=MfG0AUYoy7mRTB+K=zKPcOPeojF2a=3Ctab8Tr+xhVaKA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] bindings: python: don't use exec to get __version__
To:     Phil Howard <phil@gadgetoid.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Oct 2023 14:09:25 +0200, Phil Howard <phil@gadgetoid.com> said:
> Import __version__ from gpiod.version instead of using exec
> since the latter is potentially unsafe and unnecessary.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/setup.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index 66b7908..278baee 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -5,6 +5,7 @@ from os import environ, path
>  from setuptools import setup, Extension, find_packages
>  from setuptools.command.build_ext import build_ext as orig_build_ext
>  from shutil import rmtree
> +from gpiod.version import __version__
>
>
>  class build_ext(orig_build_ext):
> @@ -54,9 +55,6 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
>      extensions.append(gpiosim_ext)
>      extensions.append(procname_ext)
>
> -with open("gpiod/version.py", "r") as fd:
> -    exec(fd.read())
> -
>  setup(
>      name="libgpiod",
>      packages=find_packages(exclude=["tests", "tests.*"]),
> --
> 2.34.1
>
>

I get the following with this patch applied:

GPIOD_WITH_TESTS=1 \
/usr/bin/python setup.py build_ext --inplace \
	--include-dirs=../../include/:../../tests/gpiosim/ \
	--library-dirs=../../lib/.libs/:../../tests/gpiosim/.libs/
Traceback (most recent call last):
  File "/home/brgl/workspace/gitbook/libgpiod/bindings/python/setup.py",
line 8, in <module>
    from gpiod.version import __version__
  File "/home/brgl/workspace/gitbook/libgpiod/bindings/python/gpiod/__init__.py",
line 10, in <module>
    from . import _ext
ImportError: cannot import name '_ext' from partially initialized
module 'gpiod' (most likely due to a circular import)
(/home/brgl/workspace/gitbook/libgpiod/bindings/python/gpiod/__init__.py)

Bart
