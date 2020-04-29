Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB8F1BE597
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 19:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgD2Rri (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 13:47:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:58978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgD2Rri (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 13:47:38 -0400
Received: from Mani-XPS-13-9360 (unknown [157.46.25.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0C0521D7B;
        Wed, 29 Apr 2020 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588182457;
        bh=r8sc/05h1cK547jVXshgKR35cDRc+aZhoCzMM02oCxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tXUW56abLC8abdMIs32nPbHuT1IlqZsOQr0oxpDt71VxEGDJr8QWhPhGqfQSLfrqg
         S8l0dNxLrUk9eSsWqcQ4YaWy6DPClWzhX8zDiYeLXHlKDbROfHaDbBx8aH9L7588zD
         Xab5EI2SxfQsJPpA43MaUwh8DpWd7vn9c56GCwzo=
Date:   Wed, 29 Apr 2020 23:17:27 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     johan@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, patong.mxl@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20200429174727.GF6443@Mani-XPS-13-9360>
References: <20200428195651.6793-1-mani@kernel.org>
 <20200428195651.6793-3-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428195651.6793-3-mani@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Greg,

On Wed, Apr 29, 2020 at 01:26:51AM +0530, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  drivers/usb/serial/xr_serial.c | 186 ++++++++++++++++++++++++++++++++-
>  drivers/usb/serial/xr_serial.h |   7 ++
>  2 files changed, 192 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
> index ea4a0b167d3f..d86fd40839f8 100644
> --- a/drivers/usb/serial/xr_serial.c
> +++ b/drivers/usb/serial/xr_serial.c
> @@ -476,6 +476,189 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
>  		   state);
>  }
>  
> +#ifdef CONFIG_GPIOLIB
> +

[...]

> +
> +static int xr_gpio_init(struct usb_serial_port *port)
> +{
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	int ret = 0;
> +
> +	if (port_priv->idProduct == XR21V141X_ID)
> +		ret = xr21v141x_gpio_init(port);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	port_priv->gc.label = "xr_gpios";
> +	port_priv->gc.request = xr_gpio_request;
> +	port_priv->gc.get_direction = xr_gpio_direction_get;
> +	port_priv->gc.direction_input = xr_gpio_direction_input;
> +	port_priv->gc.direction_output = xr_gpio_direction_output;
> +	port_priv->gc.get = xr_gpio_get;
> +	port_priv->gc.set = xr_gpio_set;
> +	port_priv->gc.owner = THIS_MODULE;
> +	port_priv->gc.parent = &port->dev;
> +	port_priv->gc.base = -1;
> +	port_priv->gc.can_sleep = true;
> +
> +	ret = gpiochip_add_data(&port_priv->gc, port);
> +	if (!ret)
> +		port_priv->gpio_registered = true;
> +
> +	return ret;
> +}
> +
> +static void xr_gpio_remove(struct usb_serial_port *port)
> +{
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +
> +	if (port_priv->gpio_registered) {
> +		gpiochip_remove(&port_priv->gc);
> +		port_priv->gpio_registered = false;
> +	}
> +}
> +
> +#else
> +
> +static int xr_gpio_init(struct usb_serial_port *port)
> +{
> +	return 0;
> +}
> +
> +static void xr_gpio_remove(struct usb_serial_port *port)
> +{
> +	/* Nothing to do */
> +}
> +
> +#endif
> +
>  static int xr_port_probe(struct usb_serial_port *port)
>  {
>  	struct usb_serial *serial = port->serial;
> @@ -495,13 +678,14 @@ static int xr_port_probe(struct usb_serial_port *port)
>  
>  	usb_set_serial_port_data(port, port_priv);
>  
> -	return 0;
> +	return xr_gpio_init(port);

Just realised that the gpiochip is registered for 2 interfaces exposed by
this chip. This is due to the fact that this chip presents CDC-ACM model,
so there are 2 interfaces (interrupt and bulk IN/OUT).

We shouldn't need gpiochip for interface 0. So what is the recommended way
to filter that?

Thanks,
Mani

>  }
>  
>  static int xr_port_remove(struct usb_serial_port *port)
>  {
>  	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
>  
> +	xr_gpio_remove(port);
>  	kfree(port_priv);
>  
>  	return 0;
> diff --git a/drivers/usb/serial/xr_serial.h b/drivers/usb/serial/xr_serial.h
> index d2977ef847a0..079098cf553a 100644
> --- a/drivers/usb/serial/xr_serial.h
> +++ b/drivers/usb/serial/xr_serial.h
> @@ -3,6 +3,8 @@
>  #ifndef __LINUX_USB_SERIAL_XR_SERIAL_H
>  #define __LINUX_USB_SERIAL_XR_SERIAL_H
>  
> +#include <linux/gpio/driver.h>
> +
>  struct xr_uart_regs {
>  	u8 enable;
>  	u8 format;
> @@ -21,6 +23,11 @@ struct xr_uart_regs {
>  };
>  
>  struct xr_port_private {
> +#ifdef CONFIG_GPIOLIB
> +	struct gpio_chip gc;
> +	bool gpio_registered;
> +	u8 gpio_altfunc;
> +#endif
>  	const struct xr_uart_regs *regs;
>  	u16 idProduct;
>  	u8 reg_width;
> -- 
> 2.17.1
> 
