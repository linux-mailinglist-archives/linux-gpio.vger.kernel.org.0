Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B202A430581
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 00:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241091AbhJPW7Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 18:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241088AbhJPW7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Oct 2021 18:59:23 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE77AC061766
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:57:14 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id t20so1096881ljk.8
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2EQxS6LUZ0095r5Vq3OY8v0JO8+NoJey9tlMZreupJo=;
        b=cdZ24gh3v3PzBLsDaFaLb7T9PJjWPJtyAQzXWjzJxRGkBDBU67b8L0hzx71d83E7Lw
         sLSTfgXdyAV0N1TrMPnaYHRQSIjMmpj13EECCK32CHyOrFb3Tziai0E4cBIwEM3AGgri
         YRpQn8rj2LNtY5t2O7c0p0H0RH7SBk8w6x2hW3sO4zfT5b/WLiCEC4G5oV4mZZntvF9N
         ZCCuorDhqUuPq9neK5/hOghVJmxAY+ab12+wIRM62IBSEeoplT/eJRvZDPkT89E/qRcp
         0NPxMj/TD4SL36d6Pb0yGARxMtIs3f01r395hHxWKHAC5k7uu0vxZ7J4pEKPuATpGkyr
         j0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2EQxS6LUZ0095r5Vq3OY8v0JO8+NoJey9tlMZreupJo=;
        b=mZCyOvn8X4c+nsc/jGP6OrWopf/fBp2A6jM93+E/x+hGO4xdF6iEbM0RPhmo8DStEO
         NZ+wm2H8uFb5f8vsdkTq8k1jtTSnaxgCMTevyBhm5RxE7jWwyq3+tQmOZk70ckvg28GT
         hjPjwByKtk89LEHZNjyyuyGL09Wa1MOouyhWVCTIsxhbTiXZ2IY5s7daNn8J88fjedhL
         uZRtydtQJI0SYTlQ8wuJ/LGGH/TRmQncjRBnloE9SyEhzwwAky0pnvGnJE+h06jG+EMR
         2SSjT84ZX7oJa8KfH25+fOWCM7kJ6jNjdFBUc3m4m9vKEbsSQnJROObMbJLq/y43M+a6
         qLCw==
X-Gm-Message-State: AOAM532g7Avf6T3KciA9eZpF0kGAvlUUsDkB/r7soNUr00eVupjVYVSQ
        IA6KmvKIQezXHfXcI8o3qddOoYqFBJpEpTYenvNV6Q==
X-Google-Smtp-Source: ABdhPJyks5aYSgbvOlpsrFk0yrj9aY/rwT0UNRNKnfNGTnygdSGEYsrUdUx2R4YLnfvEZWshNPWXdwVxQ63UoSEVrQs=
X-Received: by 2002:a2e:b748:: with SMTP id k8mr22564504ljo.358.1634425033293;
 Sat, 16 Oct 2021 15:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211016141839.45460-1-joey.gouly@arm.com> <20211016141839.45460-5-joey.gouly@arm.com>
In-Reply-To: <20211016141839.45460-5-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 00:57:02 +0200
Message-ID: <CACRpkdaJwscpxj7UtF5mNsdcdHCr=mXPDYz-pnhA8Q9qNaWxjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 16, 2021 at 4:18 PM Joey Gouly <joey.gouly@arm.com> wrote:

> This driver adds support for the pinctrl / GPIO hardware found
> on some Apple SoCs.
>
> Co-developed-by: Stan Skowronek <stan@corellium.com>
> Signed-off-by: Stan Skowronek <stan@corellium.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>

Hi Joey, this looks really good. I started to write a reply but
noticed that all my comments are already covered by
Marc Z so I scrapped it: do what Marc says.

This is interesting:

> +#define REG_GPIOx_PULL_OFF   0
> +#define REG_GPIOx_PULL_DOWN  1
> +#define REG_GPIOx_PULL_UP_STRONG 2
> +#define REG_GPIOx_PULL_UP    3

Pull-up strong! Nice that you found these details. We don't have a
generic pinconf binding for that but possibly the bias-pull-up
argument can be used if we know how many ohms each is
(preferred).

But this is no problem for the moment because pin config is
for implementing later (I assume). I bet this is going to be important
to get right as well as it usually affects the power dissipation in
suspend-to-RAM.

> +static int apple_gpio_pinmux_enable(struct pinctrl_dev *pctldev, unsigned func,
> +                                   unsigned group)
(...)
> +       .set_mux = apple_gpio_pinmux_enable,

What about just naming it apple_gpio_pinmux_set()?

Next iteration should be good to go I guess!

Yours,
Linus Walleij
