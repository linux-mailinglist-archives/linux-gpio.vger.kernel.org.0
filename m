Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A725C22E0F0
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jul 2020 17:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgGZPwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 11:52:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:37644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgGZPwa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 26 Jul 2020 11:52:30 -0400
Received: from Mani-XPS-13-9360 (unknown [157.50.161.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB3D72065F;
        Sun, 26 Jul 2020 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595778749;
        bh=beJKTsPGCuk+xMR/uiqaP/qPznimUQvA1tCziW23lO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1d3FbSrS3Whoq/2Mnpy78kazzBsxqOXaeqWGxa0qMQ4FC0oBGFREcUgCt1eDBtE1Q
         9rWF14DAB0KBfOTCjatbjtsnA5DFUi+JjDNvJ4Odoat4VAEacol77qXDxlUSsrIvtP
         TZZ8AKzsa9tZRSus0T4ZhBmjuuvC5lu9y8kiuDlU=
Date:   Sun, 26 Jul 2020 21:22:23 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, patong.mxl@gmail.com,
        linus.walleij@linaro.org, mchehab+huawei@kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [RESEND PATCH v4 2/3] usb: serial: xr_serial: Add gpiochip
 support
Message-ID: <20200726155223.GB12036@Mani-XPS-13-9360>
References: <20200607162350.21297-1-mani@kernel.org>
 <20200607162350.21297-3-mani@kernel.org>
 <20200701130206.GD3334@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701130206.GD3334@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 01, 2020 at 03:02:06PM +0200, Johan Hovold wrote:
> On Sun, Jun 07, 2020 at 09:53:49PM +0530, Manivannan Sadhasivam wrote:
> > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > for controlling the available gpios.
> > 
> > Inspired from cp210x usb to serial converter driver.
> > 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> > ---
> >  drivers/usb/serial/xr_serial.c | 209 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 208 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
> > index bb7df79cc129..2240fbc9ea7f 100644
> > --- a/drivers/usb/serial/xr_serial.c
> > +++ b/drivers/usb/serial/xr_serial.c
> > @@ -10,6 +10,7 @@
> >   * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
> >   */
> >  
> > +#include <linux/gpio/driver.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/slab.h>
> > @@ -17,6 +18,18 @@
> >  #include <linux/usb.h>
> >  #include <linux/usb/serial.h>
> >  
> > +#ifdef CONFIG_GPIOLIB
> > +enum gpio_pins {
> > +	GPIO_RI = 0,
> > +	GPIO_CD,
> > +	GPIO_DSR,
> > +	GPIO_DTR,
> > +	GPIO_CTS,
> > +	GPIO_RTS,
> > +	GPIO_MAX,
> > +};
> > +#endif
> 
> Try to avoid littering the driver with GPIOLIB ifdefs. One or two is
> fine, but no more even if it means declaring an unused type. Add
> stubbed out helpers where appropriate.
> 
> > +
> >  static void xr_set_termios(struct tty_struct *tty,
> >  			   struct usb_serial_port *port,
> >  			   struct ktermios *old_termios);
> > @@ -39,6 +52,11 @@ struct xr_uart_regs {
> >  };
> >  
> >  struct xr_port_private {
> > +#ifdef CONFIG_GPIOLIB
> > +	struct gpio_chip gc;
> > +	bool gpio_registered;
> > +	enum gpio_pins pin_status[GPIO_MAX];
> > +#endif
> >  	const struct xr_uart_regs *regs;
> >  	bool port_open;
> >  };
> > @@ -390,6 +408,13 @@ static void xr_set_flow_mode(struct tty_struct *tty,
> >  	 */
> >  	gpio_mode &= ~UART_MODE_GPIO_MASK;
> >  	if (cflag & CRTSCTS) {
> > +#ifdef CONFIG_GPIOLIB
> > +		/* Check if the CTS/RTS pins are occupied */
> > +		if (port_priv->pin_status[GPIO_RTS] ||
> > +		    port_priv->pin_status[GPIO_CTS])
> > +			return;
> > +#endif
> 
> You cannot just bail out as this could leave software flow enabled etc.
> 
> You also need to claim these pins once at open or leave them be. We
> don't want CRTSCTS to suddenly start toggling because a pin is released
> by gpiolib.
> 
> That is, determine who owns each pin at open() and keep it that way till
> close() (by setting some flags at open).
> 
> > +
> >  		dev_dbg(&port->dev, "Enabling hardware flow ctrl\n");
> >  		flow = UART_FLOW_MODE_HW;
> >  		gpio_mode |= UART_MODE_RTS_CTS;
> > @@ -497,6 +522,17 @@ static int xr_tiocmset_port(struct usb_serial_port *port,
> >  	u8 gpio_set = 0;
> >  	u8 gpio_clr = 0;
> >  
> > +#ifdef CONFIG_GPIOLIB
> > +	/* Check if the RTS/DTR pins are occupied */
> > +	if (set & TIOCM_RTS || clear & TIOCM_RTS)
> > +		if (port_priv->pin_status[GPIO_RTS])
> > +			return -EBUSY;
> > +
> > +	if (set & TIOCM_DTR || clear & TIOCM_DTR)
> > +		if (port_priv->pin_status[GPIO_DTR])
> > +			return -EBUSY;
> > +#endif
> 
> Same here. And perhaps just ignoring the pins managed by gpiolib is
> better (cf. gpiolib and pinctrl being orthogonal).

You mean, we can just make TX,RX,CTS,RTS pins controlled only by the serial
driver and the rest only by gpiolib?

Thanks,
Mani

> 
> > +
> >  	/* Modem control pins are active low, so set & clr are swapped */
> >  	if (set & TIOCM_RTS)
> >  		gpio_clr |= UART_MODE_RTS;
> > @@ -589,9 +625,175 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
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
> > +	/*
> > +	 * Do not proceed if the port is open. This is done to avoid changing
> > +	 * the GPIO configuration used by the serial driver.
> > +	 */
> > +	if (port_priv->port_open)
> > +		return -EBUSY;
> > +
> > +	/* Mark the GPIO pin as busy */
> > +	port_priv->pin_status[offset] = true;
> 
> You need a lock to serialise against open/close properly.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static void xr_gpio_free(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct usb_serial_port *port = gpiochip_get_data(gc);
> > +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> > +
> > +	/* Mark the GPIO pin as free */
> > +	port_priv->pin_status[offset] = false;
> > +}
> 
> Johan
