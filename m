Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF19F7BEC2A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 23:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378065AbjJIVAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 17:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378132AbjJIVAK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 17:00:10 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A11AC
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 14:00:07 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-57ddde51033so3037829eaf.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 14:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1696885207; x=1697490007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xY1LhNKxHfqHzxYuaEiJvbnkcnye1Ch7cffIuHboIiU=;
        b=Zp82+g1HBxXRqCvdvbPs8XxKtTmhlZK/LG9mwEVcnogoQ4fI/4OeBPlD7rvvNA9zqn
         vHd0sMQWDcOvrfIdbQxknPqYigjN+J/6AvLOt/mcYlkGw4Nb3U8kBW2LqNrEzpU0oLSV
         tteDlOVxSaCQnx0oCBALFB46si0EUQvHA+3MLpFetYTesGeSkBLqlCu+lDlv2Wg0spBA
         CcSQuZoRt9I+W5t2TjV8AKF/747KO2G1AZFhHpmeE6E8bZq5pDjLFXJgADPfAzAF/j5I
         f5E6NckqwNHndbF+xoB9xsuIV0SoAD3TmDzuhJ2SQkm1mBpJ1cD/JVLQQNdbrX0J+Wvf
         VhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885207; x=1697490007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY1LhNKxHfqHzxYuaEiJvbnkcnye1Ch7cffIuHboIiU=;
        b=iSexT4EFFdDazTYlhawfY9sHdj8MVsZC2mwarOJaDOPM0J8R2e5jeHpu7IPBKIinUE
         r6kLs2oHd+/llkZS5H7V0F+T/dhFiQMkJox7Wn54vBtp0ri5E8NhC0u4qTZrmnjivxoe
         j69lFwf9vLS8c8z1esHebP7NTLZPPEguKsswTiiX/2VVU3NQDDq3/aUSZhKAjQQCVxNQ
         NZw5OkcsUL3Ta0Gkm/cdXj4h4TzeKwjg615XpGS9RbayvkOF1xDl8jOobSjk7TCevQW9
         MQJJyMP+HBmiBZY/nXnaH+LrM6VmWUTfzGs1DQH9UT3tc8dL7xDbXg9F7r9MOZETZElM
         eJ4A==
X-Gm-Message-State: AOJu0YwchuMEabBwd7k6z9zWZR/FN9DCzOkFJKt0AV20JGElGBEq2RQf
        5dHXXYoO7Y2zzNNT+A8gTRJ+nBdVj+vuYs/2fJgXXQ==
X-Google-Smtp-Source: AGHT+IFV6WOJZlLUq2N/1pfaFYbUXr7woxF+yBQseR5CJTL+GeHrEGKsI5g0hTZWBsXVOm06FMAKeckKd71lnqyMMFk=
X-Received: by 2002:a05:6870:3101:b0:1c5:dcd:5d64 with SMTP id
 v1-20020a056870310100b001c50dcd5d64mr6909601oaa.7.1696885207035; Mon, 09 Oct
 2023 14:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231009190729.38675-1-brgl@bgdev.pl>
In-Reply-To: <20231009190729.38675-1-brgl@bgdev.pl>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Mon, 9 Oct 2023 21:59:56 +0100
Message-ID: <CA+kSVo-pkmque7Zig3a7iwRN=4OtHmi0dpyO5Zc9ttOabYd8XA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: replace PyModule_AddObjectRef()
 with PyModule_AddObjectRef()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
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

On Mon, 9 Oct 2023 at 20:07, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> PyModule_AddObjectRef() was added in cpython v3.10 while libgpiod claims
> to depend on python v3.9. Replace it with an older variant that steals the
> reference to the added object on success.

Ah, fixing this makes much more sense than bumping the dependent
version, thank you, I will update my patch.

>
> Reported-by: Phil Howard <phil@gadgetoid.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/python/gpiod/ext/module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
> index 25c252a..b456190 100644
> --- a/bindings/python/gpiod/ext/module.c
> +++ b/bindings/python/gpiod/ext/module.c
> @@ -178,9 +178,9 @@ PyMODINIT_FUNC PyInit__ext(void)
>                 return NULL;
>         }
>
> -       ret = PyModule_AddObjectRef(module, "__all__", all);
> -       Py_DECREF(all);
> +       ret = PyModule_AddObject(module, "__all__", all);
>         if (ret) {
> +               Py_DECREF(all);
>                 Py_DECREF(module);
>                 return NULL;
>         }
> --
> 2.39.2
>
