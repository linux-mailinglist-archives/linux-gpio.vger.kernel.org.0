Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EE31E363C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 05:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgE0DKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 23:10:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgE0DKM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 May 2020 23:10:12 -0400
Received: from Mani-XPS-13-9360 (unknown [157.46.56.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F3AC20704;
        Wed, 27 May 2020 03:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590549011;
        bh=+EEyVr661pULoQZPwBYBmG2knPzLWMHEXk/eiLq8QQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vRAeien0o/rxmT9HJJJwIJ6cDc+YUGEYQlYNuMOjeuopN+mlMlQjq102VLeYszuS0
         f/1Qu7JqTW98b1OrZ5ygdT/QyQ3DPO2NpT5OYyiM5ZFgEzBhC/HytvKaEwrVZyiSBL
         Pf0DbVW3wJyHp4ulMzEXpnluzXP4kX77puGh0hzs=
Date:   Wed, 27 May 2020 08:39:59 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, patong.mxl@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20200527030959.GA6129@Mani-XPS-13-9360>
References: <20200430184924.31690-1-mani@kernel.org>
 <20200430184924.31690-3-mani@kernel.org>
 <20200519130740.GE27787@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519130740.GE27787@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 03:07:40PM +0200, Johan Hovold wrote:
> On Fri, May 01, 2020 at 12:19:24AM +0530, mani@kernel.org wrote:
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > for controlling the available gpios.
> 
> You should mention that you've based this implementation on the other
> usb-serial gpio-chip implementations (e.g. cp210x).
> 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> > ---
> >  drivers/usb/serial/xr_serial.c | 199 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 198 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
> > index fdb9ddf8bd95..255a30540b52 100644
> > --- a/drivers/usb/serial/xr_serial.c
> > +++ b/drivers/usb/serial/xr_serial.c
> > @@ -7,6 +7,7 @@
> >   * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
> >   */
> >  
> > +#include <linux/gpio/driver.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/slab.h>
> > @@ -32,6 +33,11 @@ struct xr_uart_regs {
> >  };
> >  
> >  struct xr_port_private {
> > +#ifdef CONFIG_GPIOLIB
> > +	struct gpio_chip gc;
> > +	bool gpio_registered;
> > +	u8 gpio_altfunc;
> > +#endif
> >  	const struct xr_uart_regs *regs;
> >  };
> >  
> > @@ -562,6 +568,196 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
> >  		   state);
> >  }
> >  
> > +#ifdef CONFIG_GPIOLIB
> > +
> > +static int xr_gpio_request(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct usb_serial_port *port = gpiochip_get_data(gc);
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +
> > +	/* Check if the requested GPIO is occupied */
> > +	if (port_priv->gpio_altfunc & BIT(offset))
> > +		return -ENODEV;
> > +
> > +	return 0;
> > +}
> > +
> > +static int xr_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> > +{
> > +	struct usb_serial_port *port = gpiochip_get_data(gc);
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +	int ret;
> > +	u8 gpio_status;
> > +
> > +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			 port_priv->regs->gpio_status, &gpio_status);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return !!(gpio_status & BIT(gpio));
> > +}
> > +
> > +static void xr_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> > +{
> > +	struct usb_serial_port *port = gpiochip_get_data(gc);
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +
> > +	if (val)
> > +		xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			   port_priv->regs->gpio_set, BIT(gpio));
> > +	else
> > +		xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			   port_priv->regs->gpio_clr, BIT(gpio));
> 
> I see no coordination with the serial driver which may toggle the DTR
> and RTS pins.
> 
> > +}
> > +
> > +static int xr_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
> > +{
> > +	struct usb_serial_port *port = gpiochip_get_data(gc);
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +	int ret;
> > +	u8 gpio_dir;
> > +
> > +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			 port_priv->regs->gpio_dir, &gpio_dir);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Logic 0 = input and Logic 1 = output */
> > +	return !(gpio_dir & BIT(gpio));
> > +}
> > +
> > +static int xr_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
> > +{
> > +	struct usb_serial_port *port = gpiochip_get_data(gc);
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +	int ret;
> > +	u8 gpio_dir;
> > +
> > +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			 port_priv->regs->gpio_dir, &gpio_dir);
> > +	if (ret)
> > +		return ret;
> > +
> > +	gpio_dir &= ~BIT(gpio);
> > +
> > +	return xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			  port_priv->regs->gpio_dir, gpio_dir);
> > +}
> > +
> > +static int xr_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
> > +				    int val)
> > +{
> > +	struct usb_serial_port *port = gpiochip_get_data(gc);
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +	int ret;
> > +	u8 gpio_dir;
> > +
> > +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			 port_priv->regs->gpio_dir, &gpio_dir);
> > +	if (ret)
> > +		return ret;
> > +
> > +	gpio_dir |= BIT(gpio);
> > +
> > +	ret = xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			 port_priv->regs->gpio_dir, gpio_dir);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xr_gpio_set(gc, gpio, val);
> 
> If it's possible to set the value before changing direction then that
> may be preferable.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int xr21v141x_gpio_init(struct usb_serial_port *port)
> > +{
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +	int ret;
> > +	u8 gpio_mode;
> > +
> > +	port_priv->gc.ngpio = 6;
> > +
> > +	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
> > +			 port_priv->regs->gpio_mode, &gpio_mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Mark all pins which are not in GPIO mode */
> > +	if (gpio_mode & UART_MODE_RTS_CTS)
> > +		port_priv->gpio_altfunc |= (BIT(4) | BIT(5));
> > +	else if (gpio_mode & UART_MODE_DTR_DSR)
> > +		port_priv->gpio_altfunc |= (BIT(2) | BIT(3));
> > +	else if (gpio_mode & UART_MODE_RS485)
> > +		port_priv->gpio_altfunc |= BIT(5);
> > +	else if (gpio_mode & UART_MODE_RS485_ADDR)
> > +		port_priv->gpio_altfunc |= BIT(5);
> > +	else
> > +		port_priv->gpio_altfunc = 0; /* All GPIOs are available */
> 
> So this clearly isn't sufficient as the serial driver updates the
> gpio-mode settings at runtime, which means you may have the two drivers
> interfering with each other.
> 

Agree. I was not sure earlier on how to handle this.

> You probably need to reserve at least CTS/RTS (gpio 4 and 5) for use
> by the serial driver. But suddenly driving the DSR, RI and CD inputs
> probably isn't a good idea either.
> 
> How would you even what know what these pins are used for generally?
> 
> Perhaps refusing all gpio requests while the port is open and making
> sure that the serial driver never touches a requested pin could work
> (including indirectly through hardware flow control, etc).
> 

Is there an API or recommended way to check if the port is open? I just see a
helper for tty...

Thanks,
Mani

> > +
> > +	return ret;
> > +}
> > +
> > +static int xr_gpio_init(struct usb_serial_port *port)
> > +{
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +	struct usb_serial *serial = port->serial;
> > +	int ret = 0;
> > +	u16 pid;
> > +
> > +	/* Don't register gpiochip for interface 0 */
> > +	if (port->minor == 0)
> > +		return ret;
> 
> Heh. Nice hack. Unfortunately entirely broken as it only works if this
> happens to be the first usb-serial device that is probed (port->minor is
> the usb-serial port minor number, not the interface number).
> 
> > +
> > +	pid = le16_to_cpu(serial->dev->descriptor.idProduct);
> > +
> > +	ret = xr21v141x_gpio_init(port);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	port_priv->gc.label = devm_kasprintf(&port->dev, GFP_KERNEL, "XR%04x",
> > +					     pid);
> 
> No point in adding PID here.
> 
> > +	port_priv->gc.request = xr_gpio_request;
> > +	port_priv->gc.get_direction = xr_gpio_direction_get;
> > +	port_priv->gc.direction_input = xr_gpio_direction_input;
> > +	port_priv->gc.direction_output = xr_gpio_direction_output;
> > +	port_priv->gc.get = xr_gpio_get;
> > +	port_priv->gc.set = xr_gpio_set;
> > +	port_priv->gc.owner = THIS_MODULE;
> > +	port_priv->gc.parent = &port->dev;
> > +	port_priv->gc.base = -1;
> > +	port_priv->gc.can_sleep = true;
> > +
> > +	ret = gpiochip_add_data(&port_priv->gc, port);
> > +	if (!ret)
> > +		port_priv->gpio_registered = true;
> > +
> > +	return ret;
> > +}
> > +
> > +static void xr_gpio_remove(struct usb_serial_port *port)
> > +{
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +
> > +	if (port_priv->gpio_registered) {
> > +		gpiochip_remove(&port_priv->gc);
> > +		port_priv->gpio_registered = false;
> > +	}
> > +}
> > +
> > +#else
> > +
> > +static int xr_gpio_init(struct usb_serial_port *port)
> > +{
> > +	return 0;
> > +}
> > +
> > +static void xr_gpio_remove(struct usb_serial_port *port)
> > +{
> > +	/* Nothing to do */
> 
> Comment not needed.
> 
> > +}
> > +
> > +#endif
> > +
> >  static int xr_port_probe(struct usb_serial_port *port)
> >  {
> >  	struct xr_port_private *port_priv;
> > @@ -575,13 +771,14 @@ static int xr_port_probe(struct usb_serial_port *port)
> >  
> >  	usb_set_serial_port_data(port, port_priv);
> >  
> > -	return 0;
> > +	return xr_gpio_init(port);
> 
> This is broken; you'll leak the port data on errors.
> 
> >  }
> >  
> >  static int xr_port_remove(struct usb_serial_port *port)
> >  {
> >  	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> >  
> > +	xr_gpio_remove(port);
> >  	kfree(port_priv);
> >  
> >  	return 0;
> 
> Johan
