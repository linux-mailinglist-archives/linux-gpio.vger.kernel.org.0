Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF205805C6
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 22:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236675AbiGYUg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 16:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiGYUg4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 16:36:56 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39412228B
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 13:36:55 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ss3so22557996ejc.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 13:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v0WfX/BEC5c1DJBNnylvcJ1KKlREW3ynbtuR8cGigJY=;
        b=g15SphUP15ZyEpfBuCeE5bjPWoqlD11hR6gBIf/v8UYgAZN089ZdO8DU2l8mBvbKEZ
         EwJZ+3LNdrVw1gvARDsZRn2gnMWLcQwlKfSAziT2/+lhehZCB+z81dFLWsnCQuxS54sx
         M558Zb88xJXE7NBxqmJk0o0LU8ZaL52mQErm9hgPNFrxICUxKj0/RgSHSdSlPbCaEa3T
         wRPQQvFXDBTwNVCUobguem20S3NJA5TMIxgY4QlprIjBZFqsKKLsvPnlX7IU6SmuZcAs
         qNwm6sYHRsfnOuvjNJWFQW078otFjRX6V8ICNMOzP702mIuK3f95wL9wRmmtROvVn4KJ
         Qe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v0WfX/BEC5c1DJBNnylvcJ1KKlREW3ynbtuR8cGigJY=;
        b=0WpivnqLwkTWpyKpDiV7YVLKFOhrZzwteRhP9DwrkRIKPJX2B79BUFyF24QNu5dRvH
         FUti+YMqAiw1tZfryaWLcsswQwLR6UnoR0GHDy80jUah3fOAzPMZ7kjAiyN+WrU7U9/P
         Fp1+kRp5vp55DCZLmUx+YBxhAPTobkNlwOBYCgfIS+TOug1wmdLr/E+nPUufcIPcdLhW
         RaNcv5UHMrdG5HdzCQil4u9pylbfm0N1EHCiT04dV3t7IMql/nR/j1ryujkCcpMwnFFQ
         bBEjIewPlm8sKXd+y2FczAL9ieMjHdHX7smnGU9g7WOeTwqNOzNQqteLnjrO+hW8Z9Ay
         PjmA==
X-Gm-Message-State: AJIora803fLb0J2tppM4TTkmiYbG5SlvSdnZbdDDZh9spimnbTfAKCqM
        jJmPQ6ZGvLrU5T50oYaMhnBsC9t1ToqQKZ9wopk=
X-Google-Smtp-Source: AGRyM1vJoGJ3/A4a8eQ6NG890YOC0VwDTFKnlQ4hF0QzFj5dGxIcaRNGc8cOM/mO0h2s5LV9t4ow5cD4amOzhIAn1rM=
X-Received: by 2002:a17:906:8a4a:b0:72b:5b23:3065 with SMTP id
 gx10-20020a1709068a4a00b0072b5b233065mr11734897ejc.557.1658781414204; Mon, 25
 Jul 2022 13:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220724171057.18549-1-marex@denx.de> <20220724171057.18549-2-marex@denx.de>
In-Reply-To: <20220724171057.18549-2-marex@denx.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jul 2022 22:36:18 +0200
Message-ID: <CAHp75VfW6s56uYdEBYD_gcX6_PoBMJXmDQWYT7rERqW75=XoOA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
To:     Marek Vasut <marex@denx.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 24, 2022 at 7:21 PM Marek Vasut <marex@denx.de> wrote:
>
> Always configure GPIO pins which are used as interrupt source as INPUTs.
> In case the default pin configuration is OUTPUT, or the prior stage does
> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> INPUT and no interrupts are received.
>
> Always configure interrupt source GPIO pin as input to fix the above case.

the interrupt

...

I'm wondering if it's configured as output (by who?) shouldn't you
issue a warning?

-- 
With Best Regards,
Andy Shevchenko
