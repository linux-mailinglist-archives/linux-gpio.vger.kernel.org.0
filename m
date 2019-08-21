Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD7C97470
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 10:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfHUIIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 04:08:40 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58799 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfHUIIj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 04:08:39 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i0Lfa-0005rp-3h; Wed, 21 Aug 2019 10:08:38 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i0LfZ-0007cW-2c; Wed, 21 Aug 2019 10:08:37 +0200
Date:   Wed, 21 Aug 2019 10:08:37 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
Message-ID: <20190821080837.p5whh7pyqpg4kasc@pengutronix.de>
References: <20190815085341.28088-1-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190815085341.28088-1-sr@denx.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Stefan,

On Thu, Aug 15, 2019 at 10:53:41AM +0200, Stefan Roese wrote:
> This patch fixes a backward compatibility issue, when boards use the
> old style GPIO suffix "-gpio" instead of the new "-gpios". This
> potential problem has been introduced by commit d99482673f95 ("serial:
> mctrl_gpio: Check if GPIO property exisits before requesting it").
> 
> This patch now fixes this issue by using gpiod_count() which iterates
> over all supported GPIO suffixes (thanks to Linus for suggesting this).
> 
> With this change, the local string is not needed any more. This way
> we can remove the allocation in the loop.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2
> - Use gpiod_count() to check if the GPIO exists (Linus)
> - Remove the now unnecessary malloc in the loop (kasprintf)
> 
>  drivers/tty/serial/serial_mctrl_gpio.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
> index 2b400189be91..ce73b142c66b 100644
> --- a/drivers/tty/serial/serial_mctrl_gpio.c
> +++ b/drivers/tty/serial/serial_mctrl_gpio.c
> @@ -117,18 +117,11 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
>  
>  	for (i = 0; i < UART_GPIO_MAX; i++) {
>  		enum gpiod_flags flags;
> -		char *gpio_str;
> -		bool present;
> +		int count;
>  
>  		/* Check if GPIO property exists and continue if not */
> -		gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
> -				     mctrl_gpios_desc[i].name);
> -		if (!gpio_str)
> -			continue;
> -
> -		present = device_property_present(dev, gpio_str);
> -		kfree(gpio_str);
> -		if (!present)
> +		count = gpiod_count(dev, mctrl_gpios_desc[i].name);
> +		if (count <= 0)
>  			continue;

Can you explain why this check is necessary (both the new and the old
variant)? I would expect that it doesn't add any value over the
gpiod_get_index_optional that follows later.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
