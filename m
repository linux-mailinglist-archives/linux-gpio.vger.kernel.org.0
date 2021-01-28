Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D734830737C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 11:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhA1KQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 05:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhA1KQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 05:16:31 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4E5C061573;
        Thu, 28 Jan 2021 02:15:50 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id u14so4091792wmq.4;
        Thu, 28 Jan 2021 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=X6RDItrY5JI4kSvEX9xosTh4JhyBUWPA2pMw68LrgEY=;
        b=iS63EOcNtJwwEUpPWzMvfbmmU0bylkbzhA3qtwjc3MwmMnd6wbizSfIWgRu1K9K5BE
         f2g3P7FXXaXTKdoMSxXTmXEZC4A9JuGVadDzO/ohWo+9J71oPv/h2pUsO8zOxtmywsW2
         5tkOWu39kcJ63WSRsTs7sfYjETkq9/JhWnzXbjaBfMrthJYfsRlVoCke4pui9pvQPVje
         VHHOkhU2s0pGLpg4rsFpRaypMyeue4si0Y/NY1U/yC3D6Cz9j/NOPo1n7P1gwpa86ieA
         SKHJAKa4W7auOYm/TZCNLtgNyvV+350/uHbUdTBNXbtJwfBWxzKPg/k2uS0p6Y5dC+i5
         PbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=X6RDItrY5JI4kSvEX9xosTh4JhyBUWPA2pMw68LrgEY=;
        b=mdmwSEMYgySXnoDvdVRsbybJHmiBFkaoyGKvDH4BvowCrGl4ryjxHLSml2qKo+jFC3
         XqOEY5bGPPBXNHpsijisAus6/v/9QkPpw/Pfuy2o/0swikcSzAZ2SEjbPiDUaHeCYD4o
         ZXMBPdi2jQjR2Jh/A8euhKAvuPj4kNqzBU1eeOgPdi5ElfGeq89EPJKkUO1jOqj9V4Bd
         2VPZXtWPWHQJFyrmH8lAAnETFZJUHE1Oz+gXKkEzLGk/g0YD3c26q0r082s8OOjmDP8/
         jHBvsLZZbQzzGsR0cFMXWLUpxAlHw1+Y6RUcDREZYGSuS7DNkph+mBzC/6CpHh2kUD2X
         FRXQ==
X-Gm-Message-State: AOAM531o0IRGYBPEWrooHs7MwqEpseK8+0px73RVIu2MOwVejAqC04ly
        ndUvi4HePsKonNyRZuDjTxU=
X-Google-Smtp-Source: ABdhPJwf3YCyk/GOdLH/X2GqIBIxl61bgW5jNzAdzBSycpuPmn7HHodTV7X9He80nQVksgFy9Zrsxg==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr7942471wme.101.1611828949270;
        Thu, 28 Jan 2021 02:15:49 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id h187sm5687737wmf.30.2021.01.28.02.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 02:15:48 -0800 (PST)
Message-ID: <11b5b8dad17be4b9edb7e06e10a161f86098edcc.camel@gmail.com>
Subject: Re: [PATCH v2 3/9] gpio: ep93xx: Fix wrong irq numbers in port F
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 28 Jan 2021 11:15:47 +0100
In-Reply-To: <20210127104617.1173-4-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-4-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> Port F irq's should be statically mapped to EP93XX_GPIO_F_IRQ_BASE.
> 
> So we need to specify girq->first otherwise:
> 
> "If device tree is used, then first_irq will be 0 and
> irqs get mapped dynamically on the fly"
> 
> And that's not the thing we want.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

I have no code out-of-the-box to test the GPIO interrupts on EP93xx,
so I just did a bootup with this patch. But the change looks fine to
me:

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/gpio/gpio-ep93xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 2eea02c906e0..9c3d049e5af7 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -430,6 +430,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>                 girq->default_type = IRQ_TYPE_NONE;
>                 girq->handler = handle_level_irq;
>                 gc->to_irq = ep93xx_gpio_f_to_irq;
> +               girq->first = EP93XX_GPIO_F_IRQ_BASE;
>         }
>  
>         return devm_gpiochip_add_data(dev, gc, epg);

-- 
Alexander Sverdlin.


