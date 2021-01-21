Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA122FE859
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 12:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbhAULGx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 06:06:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:40392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730068AbhAULGr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 06:06:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D1BA23602;
        Thu, 21 Jan 2021 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611227165;
        bh=NyhCfMXZmQGKcSdnIz70pSwAmHZqcxW2NAYXRkZuiaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uga5Pwl5JfVX78OLreQ5FYbmDdvq2tA3M/iS0+kaxJlYyvHyXFj0h3piQm2XbCZBn
         VNfXFifTe9ABVR0zn6fUyP6kSbpoVt5leRfiM7r5CDq3Phr+qNESIiKUx2GSR2A35D
         W4BjZlO8M7wTSlzgqfRME6d/HZktJ2TS5jKvLG7HErw2sEQdgEuDeTweJoCb3VQbwe
         wlLg69KJy2m9uiSepu2ONrYb4Bnk/JPBKSNLiV5tScspUEeDVd/uKOGGbs93trYmC6
         bCs0QNgrACFGG3MYJs1b/rxeUTgTl+J2lHJkJFAiyBHS4g/rimjsRzFk6cReDui9C+
         v9G56UHEWhqeQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l2Xn1-0004gJ-G7; Thu, 21 Jan 2021 12:06:12 +0100
Date:   Thu, 21 Jan 2021 12:06:11 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, angelo.dureghello@timesys.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <YAlgIz4gzL1sC2+G@hovoldconsulting.com>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-3-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201122170822.21715-3-mani@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 22, 2020 at 10:38:21PM +0530, Manivannan Sadhasivam wrote:
> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.
> 
> Inspired from cp210x usb to serial converter driver.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  drivers/usb/serial/xr_serial.c | 267 ++++++++++++++++++++++++++++++++-
>  1 file changed, 261 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
> index e166916554d6..ca63527a5310 100644
> --- a/drivers/usb/serial/xr_serial.c
> +++ b/drivers/usb/serial/xr_serial.c
> @@ -9,6 +9,7 @@
>   * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
>   */
>  
> +#include <linux/gpio/driver.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -16,6 +17,28 @@
>  #include <linux/usb.h>
>  #include <linux/usb/serial.h>
>  
> +#ifdef CONFIG_GPIOLIB
> +enum gpio_pins {
> +	GPIO_RI = 0,
> +	GPIO_CD,
> +	GPIO_DSR,
> +	GPIO_DTR,
> +	GPIO_CTS,
> +	GPIO_RTS,
> +	GPIO_MAX,
> +};
> +#endif
> +
> +struct xr_port_private {
> +#ifdef CONFIG_GPIOLIB
> +	struct gpio_chip gc;
> +	bool gpio_registered;
> +	enum gpio_pins pin_status[GPIO_MAX];

This isn't an array of enum gpio_pins, rather you use the enum as an
index into the array which only stores a boolean value per pin.

Please rename the array and fix the type (e.g. bool) so that it is clear
how from the name how it is being used, for example, "gpio_requested" or
"gpio_in_use".

> +#endif
> +	struct mutex gpio_lock;	/* protects GPIO state */
> +	bool port_open;
> +};
> +
>  struct xr_txrx_clk_mask {
>  	u16 tx;
>  	u16 rx0;
> @@ -106,6 +129,8 @@ struct xr_txrx_clk_mask {
>  #define XR21V141X_REG_GPIO_CLR		0x1e
>  #define XR21V141X_REG_GPIO_STATUS	0x1f
>  
> +static int xr_cts_rts_check(struct xr_port_private *port_priv);
> +
>  static int xr_set_reg(struct usb_serial_port *port, u8 block, u8 reg,
>  		      u8 val)
>  {
> @@ -309,6 +334,7 @@ static int xr_uart_disable(struct usb_serial_port *port)
>  static void xr_set_flow_mode(struct tty_struct *tty,
>  			     struct usb_serial_port *port)
>  {
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
>  	unsigned int cflag = tty->termios.c_cflag;
>  	int ret;
>  	u8 flow, gpio_mode;
> @@ -318,6 +344,17 @@ static void xr_set_flow_mode(struct tty_struct *tty,
>  		return;
>  
>  	if (cflag & CRTSCTS) {
> +		/*
> +		 * Check if the CTS/RTS pins are occupied by GPIOLIB. If yes,

GPIOLIB doesn't "occupy" anything. Use something like "claimed by"
instead.

> +		 * then use no flow control.
> +		 */
> +		if (xr_cts_rts_check(port_priv)) {
> +			dev_dbg(&port->dev,
> +				"CTS/RTS pins are occupied, so disabling flow control\n");

Ditto.

And there's no need to ignore a request for sw flow control if the pins
are in use. Just move the check above the conditional and make the
first branch depend on it.

You also need to clear CRTSCTS in termios if it cannot be set.

> +			flow = XR21V141X_UART_FLOW_MODE_NONE;
> +			goto exit;
> +		}
> +
>  		dev_dbg(&port->dev, "Enabling hardware flow ctrl\n");
>  
>  		/*
> @@ -341,6 +378,7 @@ static void xr_set_flow_mode(struct tty_struct *tty,
>  		flow = XR21V141X_UART_FLOW_MODE_NONE;
>  	}
>  
> +exit:
>  	/*
>  	 * As per the datasheet, UART needs to be disabled while writing to
>  	 * FLOW_CONTROL register.
> @@ -355,18 +393,22 @@ static void xr_set_flow_mode(struct tty_struct *tty,
>  static int xr_tiocmset_port(struct usb_serial_port *port,
>  			    unsigned int set, unsigned int clear)
>  {
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
>  	u8 gpio_set = 0;
>  	u8 gpio_clr = 0;
>  	int ret = 0;
>  
> -	/* Modem control pins are active low, so set & clr are swapped */
> -	if (set & TIOCM_RTS)
> +	/*
> +	 * Modem control pins are active low, so set & clr are swapped. And
> +	 * ignore the pins that are occupied by GPIOLIB.
> +	 */
> +	if ((set & TIOCM_RTS) && !(port_priv->pin_status[GPIO_RTS]))
>  		gpio_clr |= XR21V141X_UART_MODE_RTS;
> -	if (set & TIOCM_DTR)
> +	if ((set & TIOCM_DTR) && !(port_priv->pin_status[GPIO_DTR]))
>  		gpio_clr |= XR21V141X_UART_MODE_DTR;
> -	if (clear & TIOCM_RTS)
> +	if ((clear & TIOCM_RTS) && !(port_priv->pin_status[GPIO_RTS]))
>  		gpio_set |= XR21V141X_UART_MODE_RTS;
> -	if (clear & TIOCM_DTR)
> +	if ((clear & TIOCM_DTR) && !(port_priv->pin_status[GPIO_DTR]))
>  		gpio_set |= XR21V141X_UART_MODE_DTR;
>  
>  	/* Writing '0' to gpio_{set/clr} bits has no effect, so no need to do */
> @@ -464,6 +506,7 @@ static void xr_set_termios(struct tty_struct *tty,
>  
>  static int xr_open(struct tty_struct *tty, struct usb_serial_port *port)
>  {
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
>  	int ret;
>  
>  	ret = xr_uart_enable(port);
> @@ -482,13 +525,23 @@ static int xr_open(struct tty_struct *tty, struct usb_serial_port *port)
>  		return ret;
>  	}
>  
> +	mutex_lock(&port_priv->gpio_lock);
> +	port_priv->port_open = true;
> +	mutex_unlock(&port_priv->gpio_lock);

This needs to be done before calling set_termios() above.

> +
>  	return 0;
>  }
>  
>  static void xr_close(struct usb_serial_port *port)
>  {
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +
>  	usb_serial_generic_close(port);
>  
> +	mutex_lock(&port_priv->gpio_lock);
> +	port_priv->port_open = false;
> +	mutex_unlock(&port_priv->gpio_lock);
> +
>  	xr_uart_disable(port);
>  }
>  
> @@ -553,13 +606,215 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
>  	xr_set_reg_uart(port, XR21V141X_REG_TX_BREAK, state);
>  }
>  
> -static int xr_port_probe(struct usb_serial_port *port)
> +#ifdef CONFIG_GPIOLIB
> +
> +static int xr_cts_rts_check(struct xr_port_private *port_priv)
>  {
> +	if (port_priv->pin_status[GPIO_RTS] || port_priv->pin_status[GPIO_CTS])
> +		return -EBUSY;
> +
>  	return 0;
>  }
>  
> +static int xr_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +	int ret = 0;
> +
> +	mutex_lock(&port_priv->gpio_lock);
> +	/*
> +	 * Do not proceed if the port is open. This is done to avoid changing
> +	 * the GPIO configuration used by the serial driver.
> +	 */
> +	if (port_priv->port_open) {
> +		ret = -EBUSY;
> +		goto err_out;
> +	}
> +
> +	/* Mark the GPIO pin as busy */
> +	port_priv->pin_status[offset] = true;

What about GPIO5/RTS#? It may still be configured for flow control even
if the port is now closed. You need to switch to GPIO mode.

> +
> +err_out:
> +	mutex_unlock(&port_priv->gpio_lock);
> +
> +	return ret;
> +}
> +
> +static void xr_gpio_free(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +
> +	mutex_lock(&port_priv->gpio_lock);
> +	/*
> +	 * Do not proceed if the port is open. This is done to avoid toggling
> +	 * of pins suddenly when the serial port is in use.
> +	 */
> +	if (port_priv->port_open)
> +		goto err_out;
> +
> +	/* Mark the GPIO pin as free */
> +	port_priv->pin_status[offset] = false;

You cannot fail this even if the port is open since otherwise the pin
will remain claimed.

You may need to cache the valid pins at serial port open instead as I
already mentioned.

Also, you need to figure out how to coordinate the pin-configuration
with the serial driver. I suggested added a call to configure DTR/RTS at
outputs on open(), but perhaps this should only be done once in case
they are not really used for modem control and instead needs to be
reconfigured as inputs by the gpio driver (i.e. before opening the
port). 

I'm still not sure about how best to handle this remuxing at runtime in
order to avoid having incidentally setting up an incorrect pin
configuration.

Ideally, the muxing should be determined in EEPROM or be based on
VID/PID and not be allowed to change at runtime at all...

I'm not convinced that the current approach is a good idea yet.

> +
> +err_out:
> +	mutex_unlock(&port_priv->gpio_lock);
> +}

Johan
