Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F0D224E04
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 22:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGRUwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 16:52:04 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57755 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgGRUwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jul 2020 16:52:04 -0400
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A793CC0002;
        Sat, 18 Jul 2020 20:52:01 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v1 2/5] ARM/orion/gpio: Make use of for_each_requested_gpio()
In-Reply-To: <20200615150545.87964-3-andriy.shevchenko@linux.intel.com>
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com> <20200615150545.87964-3-andriy.shevchenko@linux.intel.com>
Date:   Sat, 18 Jul 2020 22:52:00 +0200
Message-ID: <87sgdo35sf.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Make use of for_each_requested_gpio() instead of home grown analogue.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Gregory Clement <gregory.clement@bootlin.com>

Applied on mvebu/arm

Thanks,

Gregory
> ---
>  arch/arm/plat-orion/gpio.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
> index 26a531ebb6e9..734f0be4f14a 100644
> --- a/arch/arm/plat-orion/gpio.c
> +++ b/arch/arm/plat-orion/gpio.c
> @@ -442,6 +442,7 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  
>  	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
>  	u32 out, io_conf, blink, in_pol, data_in, cause, edg_msk, lvl_msk;
> +	const char *label;
>  	int i;
>  
>  	out	= readl_relaxed(GPIO_OUT(ochip));
> @@ -453,15 +454,10 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  	edg_msk	= readl_relaxed(GPIO_EDGE_MASK(ochip));
>  	lvl_msk	= readl_relaxed(GPIO_LEVEL_MASK(ochip));
>  
> -	for (i = 0; i < chip->ngpio; i++) {
> -		const char *label;
> +	for_each_requested_gpio(chip, i, label) {
>  		u32 msk;
>  		bool is_out;
>  
> -		label = gpiochip_is_requested(chip, i);
> -		if (!label)
> -			continue;
> -
>  		msk = 1 << i;
>  		is_out = !(io_conf & msk);
>  
> -- 
> 2.27.0.rc2
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
