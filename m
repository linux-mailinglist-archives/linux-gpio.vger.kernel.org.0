Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B7F7CC3D1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbjJQM6E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbjJQM6D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:58:03 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42376FA
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:58:01 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-57b9231e91dso3407372eaf.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697547480; x=1698152280; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p77jx26R1Wew2+vuXjVpdDI/7vKuLnDSbu/aIxUbcz4=;
        b=XQTV6DLq+t9E7O8oWdUcOBV3T8GGlJ3MEwvAv6B8C38i3BBwVB+IPfOvm645NdgUvf
         6S19qGMIad7qPsChCXo+Zz43MjH1vU7M4dObAXIwqIwCSm4hpPZzYHx+/dj7PM03PKlD
         ZfoN19jk8cbnp14BF5YuVJ2JyLY3FbmSfnxlaVQXQMgQqp7Ip6yGH3YMNcQjXwvTcDhl
         Nal4Y6qdFqaF7n5vFezyq5UUMkq9U9Dpcy/p8kArs0QJTslvXOFJgX1ZtpL4oQOzg2l4
         x891+uwPaRVwiMboyF269UwHrad8tytFfpJgRU8+eU4hY9WrINW0UnYFGR2I1VfHSCLh
         6QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697547480; x=1698152280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p77jx26R1Wew2+vuXjVpdDI/7vKuLnDSbu/aIxUbcz4=;
        b=kTDjpmtrS9FzDw5Tsl7CgH3cvPrKcLlbyewtsfACq6K+YW8TfcWaRAXSHyMzjTPygJ
         o4U5MGwY5NJyPcJ24FNR6L43kx0YY4V9JOQ9iPugXSINsR3hkpYUWVnxDVaSPgvibokE
         fTmVtvV6SO478czAzHT808HR7Du1qk0/XDlXUOADvhrv0dBngsNurTb0SgK30/oSGqKb
         gXd7NUId/ybMicnGi5Ak1KgxEsoJ96b6Ci0rRYoMy919K2SsrShjLo8Xe95VXte0H4OC
         PYqYmbYhEKjGFXK7X9MOr7+PHRSuDuEuSNIrMwUIvwjp7gkjKn34Lw6PJG612fr/ClRG
         QB3w==
X-Gm-Message-State: AOJu0Yxju+juEMW6UmpHGQvEdbpz1JLiEsJ2LoZ/lhCt8fwkqcZfKMU/
        nF+cufg4WNTCAQ7tEvqbPrgn1L0X/X4CRYrCPNujLA==
X-Google-Smtp-Source: AGHT+IF1qhyCYKRC0sMP7NPuWI4HjWmRxZYvb7p3IJ3SL1rp+ysiq2KtIiU35gFTwiNkPb//ScnS4ZCAcZRQaut/Nqw=
X-Received: by 2002:a05:6870:7808:b0:1e9:b6aa:a629 with SMTP id
 hb8-20020a056870780800b001e9b6aaa629mr2500639oab.6.1697547480562; Tue, 17 Oct
 2023 05:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231017114159.51979-1-brgl@bgdev.pl>
In-Reply-To: <20231017114159.51979-1-brgl@bgdev.pl>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Tue, 17 Oct 2023 13:57:49 +0100
Message-ID: <CA+kSVo8H0+Hu9AfKeMDYwYDY98nTnXtfkhQusfHrGhRGcHg-4Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: change the package name to 'gpiod'
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Oct 2023 at 12:42, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We now control the name 'gpiod' on pypi. Let's change the project name
> as the package we import in python code is named 'gpiod' and not
> 'libgpiod'
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/python/setup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index 168c1af..fbe5bc5 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -148,7 +148,7 @@ if environ.get("GPIOD_WITH_TESTS") == "1":
>      extensions.append(procname_ext)
>
>  setup(
> -    name="libgpiod",
> +    name="gpiod",
>      packages=find_packages(exclude=["tests", "tests.*"]),
>      python_requires=">=3.9.0",
>      ext_modules=extensions,
> --
> 2.39.2
>

lgtm
