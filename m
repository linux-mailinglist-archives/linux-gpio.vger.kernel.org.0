Return-Path: <linux-gpio+bounces-41-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E77E96D6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 08:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81B66280D3A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 07:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65969F9F8;
	Mon, 13 Nov 2023 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF5B468F
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 07:04:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550BB10EB
	for <linux-gpio@vger.kernel.org>; Sun, 12 Nov 2023 23:04:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1r2Qzx-0001wn-TD; Mon, 13 Nov 2023 08:04:41 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1r2Qzv-008gAp-J9; Mon, 13 Nov 2023 08:04:39 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1r2Qzv-001lKu-GQ; Mon, 13 Nov 2023 08:04:39 +0100
Date: Mon, 13 Nov 2023 08:04:39 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mxc: implement get_direction callback
Message-ID: <20231113070439.GL3359458@pengutronix.de>
References: <20231112192428.6832-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112192428.6832-1-wahrenst@gmx.net>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi Stefan,

On Sun, Nov 12, 2023 at 08:24:28PM +0100, Stefan Wahren wrote:
> gpiolib's gpiod_get_direction() function returns an erro if
> .get_direction callback is not defined.
> 
> The patch implements the callback for IMX platform which is useful
> for debugging and also the kernel docs about struct gpio_chip
> recommends it.
> 
> Inspired by drivers/gpio/gpio-mxs.c
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpio/gpio-mxc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 4cb455b2bdee..ad8a4c73d47b 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -418,6 +418,18 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
>  	}
>  }
> 
> +static int mxc_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct mxc_gpio_port *port = gpiochip_get_data(gc);
> +	u32 dir;
> +
> +	dir = readl(port->base + GPIO_GDIR);
> +	if (dir & BIT(offset))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
> +}
> +
>  static int mxc_gpio_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -490,6 +502,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	port->gc.request = mxc_gpio_request;
>  	port->gc.free = mxc_gpio_free;
>  	port->gc.to_irq = mxc_gpio_to_irq;
> +	port->gc.get_direction = mxc_gpio_get_direction;

The driver passes port->base + GPIO_GDIR as *dirout argument to
bgpio_init(). This should result in the .get_direction hook already
being set to bgpio_get_dir() in the bgpio code. Doesn't this work as
expected?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

