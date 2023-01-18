Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A694F671FB3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 15:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjAROfV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 09:35:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjAROe5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 09:34:57 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094F21E1F5
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 06:24:16 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id k6so26947931vsk.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 06:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WzJ2AllVpCQjdDeFrpPYqEG5GyPx2XaaVjsya9b6Kng=;
        b=UKh/IBSJeoV3qpYibYlpgVMcNDXtbZ1ff8t2MOLEkig51Nt8AZ5i8VDUXqwPmnPfSK
         F7JVwIsb9/NOV7WmwCOOuf5sB9a7v7GIM4sjD6PKJ5OlSys2UnvZIAX3fZbtepjou2GE
         KcFm9q0YRHso4ID/U4icP3SxyD66DF/xukld5G0dksGo52qRw211zoJxE/SgzkiYz620
         XuuYXbg+YjRb6yxJNo0ib0el4QmivpoAxiNKmz/N9L19yIITzCubeZta947yz/jt7aCv
         RbD+IDsOwyfqtQEyIcfVgW1p5oDzZArDMYIcMIHEXx+M422/5PhMVN4zEOcuR1Qu0QDs
         z3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzJ2AllVpCQjdDeFrpPYqEG5GyPx2XaaVjsya9b6Kng=;
        b=qvkerRPiQrz4ZWEQZa4sqTvw3TRYrxn9MK4xHoGeXPng+yv8RZhdwIFAdaJCMiGdL8
         8XN+6CdJbcI9kTq7KExFMJ6FofOs0ite5K18+cND4/FyLUn+OidJxuaG8Qkh1UeRSALB
         6USlRl78xYNC6eQ+6M69h2wDz+BjE9/BEwhH+I1XzJIJFwQ2BvAre6nkeG5u1N2wXGxS
         dGP1GdU6bf+ublTLbtDlNNfXDQhxG+ZA8tvdvMWMTzwBJzV81Lv3i5l4aOYxNK2oQCuy
         hV2VZkYatL8/Z5rbUfA5iYerAws6SDumit7+Uj4t5qmNFR8ZQdSekEiMRIVk1jeZcYOW
         9uyQ==
X-Gm-Message-State: AFqh2kpQJnbnl/bVOEGHInDzYW2Xt8ZrksAR5bTPXYS2kQgPFC7nU4JJ
        011AXJO/ekUW9cH4TYG8UZDE5IBJ2ywQo/H+nxz5rA==
X-Google-Smtp-Source: AMrXdXvgYTvLsjNs4tUuBX8leoMQnU2TvgnW9eQQ2dNCxICVgeX6DtwOvqvwMwuz8wX2yiu+mNZptOQIozghBc39rE4=
X-Received: by 2002:a67:f282:0:b0:3ce:88b3:d7da with SMTP id
 m2-20020a67f282000000b003ce88b3d7damr959458vsk.62.1674051855145; Wed, 18 Jan
 2023 06:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20230117100845.16708-1-nikita.shubin@maquefel.me>
In-Reply-To: <20230117100845.16708-1-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Jan 2023 15:24:04 +0100
Message-ID: <CAMRc=MfFThu6nEokpTJ0F+694a_UsdcacEXUF2NFH7tzOjz_nQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: ep93xx: convert driver to DT
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Lukasz Majewski <lukma@denx.de>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 17, 2023 at 11:08 AM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
>
> This converts ep93xx SOC gpio into device tree driver:
> - dropped banks and legacy defines
> - split AB IRQ and make it shared
>
> We are relying on IRQ number information A, B ports have single shared
> IRQ, while F port have dedicated IRQ for each line.
>
> Also we had to split single ep93xx platform_device into multiple, one
> for each port, without this we can't do a full working transition from
> legacy platform code into device tree capable:
>
> - all GPIO_LOOKUP were change to match new chip namings
> - add lookup table for leds
>
> Fixes: 482c27273f52 ("ARM: ep93xx: renumber interrupts")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> rfc->v0
> Linus Walleij:
> - dropped chip-labels
> - rebase on the top of your leds patch:
> https://lore.kernel.org/linux-arm-kernel/20230111132210.134478-1-linus.walleij@linaro.org/T/
> - i am converting to immutable after this patch, otherwise it will
>   require a fix wich is very similiar to this patch
>
> Hope changes are not that significant so i can still apply Rb tag.
> ---
>  arch/arm/mach-ep93xx/core.c          | 129 +++++++++-
>  arch/arm/mach-ep93xx/edb93xx.c       |   2 +-
>  arch/arm/mach-ep93xx/simone.c        |   4 +-
>  arch/arm/mach-ep93xx/ts72xx.c        |   4 +-
>  arch/arm/mach-ep93xx/vision_ep9307.c |  10 +-
>  drivers/gpio/gpio-ep93xx.c           | 350 +++++++++++----------------
>  6 files changed, 265 insertions(+), 234 deletions(-)
>

This has a Fixes tag but it's a rather big commit. I hope this is not
meant to be backported to stable branches? Doesn't look like stable
material to me.

Could you change the order of the patches so that we can send the
immutable irqchip conversion for stable?

Bart
