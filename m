Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E73C1D9722
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 15:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgESNHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 09:07:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34100 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgESNHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 09:07:47 -0400
Received: by mail-lj1-f195.google.com with SMTP id b6so13655858ljj.1;
        Tue, 19 May 2020 06:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fFW0yU7PTSC3s/LgZ1vagPs95+BYYWWy0AK3MQOTufQ=;
        b=hY7YPWMmDiB205O5UaTMXSjF0V/uccgJiXGfnHSMQCHPrxsejZ3eDTeZR3hoOYISc6
         pLl5rQPywwNTmcep1Pus5dGo5Ow/r9z0mpJFQxm54k05Cu0+Ppqc6hrYc7xPQ/lmGOMB
         u3nwrkwaC8gNxZOTLcYOZs2eXv/fmo83FVesL2GRw0QWt02+MBND008i0+n2vuDmHSuP
         LinlcTE4nGgDVmcpCO3mjnAJZntsmBJ+mejvC91Qa4JJIM0xt3xp1Dkd54k4x7vT7HiY
         itjXmmfUPA+SoLGe7cEjs13//RGpvPNp4wCohUdtn/A9khdSgHA3LHm7KoAOm95vxZ9X
         iUdw==
X-Gm-Message-State: AOAM531dSfXMK982ofTVkx/R9Mh4LqhWMY31w7CS5Xzd035RKdG8nShH
        PjEYiAyLUKWUOxDY0AQV484=
X-Google-Smtp-Source: ABdhPJwRXdsFuiTrwUVT+G6emDGlpWAIC/qKyiYj+Qi6fJz9Bh+wKQInEQqY83u5QgmUMJ+NVtrygA==
X-Received: by 2002:a2e:920f:: with SMTP id k15mr12641342ljg.131.1589893662352;
        Tue, 19 May 2020 06:07:42 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 4sm7362533ljc.65.2020.05.19.06.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 06:07:41 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jb1y8-0002cL-Q3; Tue, 19 May 2020 15:07:40 +0200
Date:   Tue, 19 May 2020 15:07:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     mani@kernel.org
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20200519130740.GE27787@localhost>
References: <20200430184924.31690-1-mani@kernel.org>
 <20200430184924.31690-3-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430184924.31690-3-mani@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 01, 2020 at 12:19:24AM +0530, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.

You should mention that you've based this implementation on the other
usb-serial gpio-chip implementations (e.g. cp210x).

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  drivers/usb/serial/xr_serial.c | 199 ++++++++++++++++++++++++++++++++-
>  1 file changed, 198 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
> index fdb9ddf8bd95..255a30540b52 100644
> --- a/drivers/usb/serial/xr_serial.c
> +++ b/drivers/usb/serial/xr_serial.c
> @@ -7,6 +7,7 @@
>   * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
>   */
>  
> +#include <linux/gpio/driver.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -32,6 +33,11 @@ struct xr_uart_regs {
>  };
>  
>  struct xr_port_private {
> +#ifdef CONFIG_GPIOLIB
> +	struct gpio_chip gc;
> +	bool gpio_registered;
> +	u8 gpio_altfunc;
> +#endif
>  	const struct xr_uart_regs *regs;
>  };
>  
> @@ -562,6 +568,196 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
>  		   state);
>  }
>  
> +#ifdef CONFIG_GPIOLIB
> +
> +static int xr_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +
> +	/* Check if the requested GPIO is occupied */
> +	if (port_priv->gpio_altfunc & BIT(offset))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int xr_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	int ret;
> +	u8 gpio_status;
> +
> +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> +			 port_priv->regs->gpio_status, &gpio_status);
> +	if (ret)
> +		return ret;
> +
> +	return !!(gpio_status & BIT(gpio));
> +}
> +
> +static void xr_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +
> +	if (val)
> +		xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> +			   port_priv->regs->gpio_set, BIT(gpio));
> +	else
> +		xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> +			   port_priv->regs->gpio_clr, BIT(gpio));

I see no coordination with the serial driver which may toggle the DTR
and RTS pins.

> +}
> +
> +static int xr_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	int ret;
> +	u8 gpio_dir;
> +
> +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> +			 port_priv->regs->gpio_dir, &gpio_dir);
> +	if (ret)
> +		return ret;
> +
> +	/* Logic 0 = input and Logic 1 = output */
> +	return !(gpio_dir & BIT(gpio));
> +}
> +
> +static int xr_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	int ret;
> +	u8 gpio_dir;
> +
> +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> +			 port_priv->regs->gpio_dir, &gpio_dir);
> +	if (ret)
> +		return ret;
> +
> +	gpio_dir &= ~BIT(gpio);
> +
> +	return xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> +			  port_priv->regs->gpio_dir, gpio_dir);
> +}
> +
> +static int xr_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
> +				    int val)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	int ret;
> +	u8 gpio_dir;
> +
> +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> +			 port_priv->regs->gpio_dir, &gpio_dir);
> +	if (ret)
> +		return ret;
> +
> +	gpio_dir |= BIT(gpio);
> +
> +	ret = xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> +			 port_priv->regs->gpio_dir, gpio_dir);
> +	if (ret)
> +		return ret;
> +
> +	xr_gpio_set(gc, gpio, val);

If it's possible to set the value before changing direction then that
may be preferable.

> +
> +	return 0;
> +}
> +
> +static int xr21v141x_gpio_init(struct usb_serial_port *port)
> +{
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	int ret;
> +	u8 gpio_mode;
> +
> +	port_priv->gc.ngpio = 6;
> +
> +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> +			 port_priv->regs->gpio_mode, &gpio_mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Mark all pins which are not in GPIO mode */
> +	if (gpio_mode & UART_MODE_RTS_CTS)
> +		port_priv->gpio_altfunc |= (BIT(4) | BIT(5));
> +	else if (gpio_mode & UART_MODE_DTR_DSR)
> +		port_priv->gpio_altfunc |= (BIT(2) | BIT(3));
> +	else if (gpio_mode & UART_MODE_RS485)
> +		port_priv->gpio_altfunc |= BIT(5);
> +	else if (gpio_mode & UART_MODE_RS485_ADDR)
> +		port_priv->gpio_altfunc |= BIT(5);
> +	else
> +		port_priv->gpio_altfunc = 0; /* All GPIOs are available */

So this clearly isn't sufficient as the serial driver updates the
gpio-mode settings at runtime, which means you may have the two drivers
interfering with each other.

You probably need to reserve at least CTS/RTS (gpio 4 and 5) for use
by the serial driver. But suddenly driving the DSR, RI and CD inputs
probably isn't a good idea either.

How would you even what know what these pins are used for generally?

Perhaps refusing all gpio requests while the port is open and making
sure that the serial driver never touches a requested pin could work
(including indirectly through hardware flow control, etc).

> +
> +	return ret;
> +}
> +
> +static int xr_gpio_init(struct usb_serial_port *port)
> +{
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	int ret = 0;
> +	u16 pid;
> +
> +	/* Don't register gpiochip for interface 0 */
> +	if (port->minor == 0)
> +		return ret;

Heh. Nice hack. Unfortunately entirely broken as it only works if this
happens to be the first usb-serial device that is probed (port->minor is
the usb-serial port minor number, not the interface number).

> +
> +	pid = le16_to_cpu(serial->dev->descriptor.idProduct);
> +
> +	ret = xr21v141x_gpio_init(port);
> +	if (ret < 0)
> +		return ret;
> +
> +	port_priv->gc.label = devm_kasprintf(&port->dev, GFP_KERNEL, "XR%04x",
> +					     pid);

No point in adding PID here.

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

Comment not needed.

> +}
> +
> +#endif
> +
>  static int xr_port_probe(struct usb_serial_port *port)
>  {
>  	struct xr_port_private *port_priv;
> @@ -575,13 +771,14 @@ static int xr_port_probe(struct usb_serial_port *port)
>  
>  	usb_set_serial_port_data(port, port_priv);
>  
> -	return 0;
> +	return xr_gpio_init(port);

This is broken; you'll leak the port data on errors.

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

Johan
