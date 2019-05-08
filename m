Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DADBB18126
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 22:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfEHUkU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 16:40:20 -0400
Received: from muru.com ([72.249.23.125]:48208 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbfEHUkU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 May 2019 16:40:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DC89F809F;
        Wed,  8 May 2019 20:40:36 +0000 (UTC)
Date:   Wed, 8 May 2019 13:40:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        linux-gpio@vger.kernel.org,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Ladislav Michl <ladis@linux-mips.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] gpio: gpio-omap: Fix lost edge wake-up interrupts
Message-ID: <20190508204015.GS8007@atomide.com>
References: <20190508181939.1990-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508181939.1990-1-tony@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190508 11:20]:
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1279,7 +1279,14 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
>  	void __iomem *base = bank->base;
>  	u32 nowake;
>  
> +	/*
> +	 * Save datain register to trigger edge interrupts on unidle for GPIOS
> +	 * that are not wake-up capable. Ignore any enabled_non_wakeup_gpios
> +	 * that may have just triggered as we're entering idle. Otherwise unidle
> +	 * will not notice them.
> +	 */
>  	bank->saved_datain = readl_relaxed(base + bank->regs->datain);
> +	bank->saved_datain |= bank->enabled_non_wakeup_gpios;

Oops, sorry this is not complete yet. We need to enable or clear
the possible pending interrupt in saved_datain based on the edge
interrupt polarity. I'll fix and resend.

Regards,

Tony
