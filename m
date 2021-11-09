Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2753E44AF05
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 14:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbhKINvO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 08:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhKINvO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 08:51:14 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710B6C061764;
        Tue,  9 Nov 2021 05:48:28 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: evelikov)
        with ESMTPSA id B67201F44F35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636465707; bh=5qEsGY70K1k5pgaloIKEQytSeQfjQfJo2OUEknVczDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wleihR17ZG3Cs+LG0bmtOLo1Ks2ViGbG58W0HJvT36b9dh9WLXqpknO58DQGJ6nXL
         heRFgAN/dDcSfTvP4P2zH+o+BUJq8Tuhc5V3kwWN/2O43PjhdczQ2OjOHvm19R1J6A
         EqoE0WTP8xL5d8nEDj0am4w/rcvXJy29VKIUiCzhBh4z5ZCkadA2KnbAz6Khu/4tlf
         vc5lknJcxNXCDCnEwJJQsW/3LVqDwpaUVJUAGuIzrdBfT7M7MA5sgzUCbdCQO9SA4O
         0d5UnwN0PJayWve769ZArJ/uVJ+DsVhrpaPgV6XUQVjFtw+BAIFm3U6iOv92qM0h5W
         ZHXVlPVmJ5Cnw==
Date:   Tue, 9 Nov 2021 13:48:23 +0000
From:   Emil Velikov <emil.velikov@collabora.com>
To:     Shreeya Patel <shreeya.patel@collabora.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, krisman@collabora.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] gpio: Initialize gc->irq.domain before setting gc->to_irq
Message-ID: <YYp8JzxfLK2u0fU4@arch-x1c3>
References: <20211108214148.9724-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108214148.9724-1-shreeya.patel@collabora.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shreeya, all,

On 2021/11/09, Shreeya Patel wrote:
> There is a race in registering of gc->irq.domain when
> probing the I2C driver.
> This sometimes leads to a Kernel NULL pointer dereference
> in gpiochip_to_irq function which uses the domain variable.
> 
> To avoid this issue, set gc->to_irq after domain is
> initialized. This will make sure whenever gpiochip_to_irq
> is called, it has domain already initialized.
> 

What is stopping the next developer to moving the assignment to the
incorrect place? Aka should we add an inline comment about this?

<snip>

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index abfbf546d159..9a6f7c265a91 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1512,7 +1512,6 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
>  	if (gc->to_irq)
>  		chip_warn(gc, "to_irq is redefined in %s and you shouldn't rely on it\n", __func__);
>  

Move the warning alongside the assignment?

HTH
Emil
