Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C18210B91
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 15:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730845AbgGANCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 09:02:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41183 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730763AbgGANCQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jul 2020 09:02:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id z24so1925963ljn.8;
        Wed, 01 Jul 2020 06:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pONDTE3q4C4ergFWZALFTmpNQdd6P301hOAS15uLVek=;
        b=ZusZp9pHj6NjfYZIKrt+eOFDMgAVC610SHqJ2eqv+YMkISjLN6fuEt6v4f5bL7W0mR
         unXbyFW1vC9t0f8r74qpf6NM68Ejns0qZvE1lJrloO5ekCRs16i5JcCMVFiF9cCOlF9c
         N8z15drYxzJiazRPew7/7WtK6YTdCGCWnxf7sejujjlnMS9EpZK3eTavL22u9XrRWlWD
         G19T6XJoMkDRBEBItzu5Ix+9ZpnjnA/wJUUG41Vkv7ctBfFZBBLKkkOAsZi3dEGUMsS9
         CfughaMvnBmu/lW2kKGaU+3KYxypjdM75X2x54Ngq6Tss5pp2dz+MK2VIkS6AeHX5G0e
         JBuQ==
X-Gm-Message-State: AOAM530iQjim05AsFzxg+UuWfUEk59/AfotQN1w/5zn5rbQ2s171p0Yd
        yCVLblzQFhTtvPKL5q5M8FQf3EkoWpI=
X-Google-Smtp-Source: ABdhPJxRp62vEJvwwakzJZLy1MQMlRAKWi4FPOGPRdB7In7mhIB6SqZXzsLfpgpnM4RfLz5oLWjSEg==
X-Received: by 2002:a2e:a419:: with SMTP id p25mr6965067ljn.164.1593608532682;
        Wed, 01 Jul 2020 06:02:12 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y69sm2028366lfa.86.2020.07.01.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 06:02:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jqcNK-0007Wz-Nh; Wed, 01 Jul 2020 15:02:07 +0200
Date:   Wed, 1 Jul 2020 15:02:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [RESEND PATCH v4 2/3] usb: serial: xr_serial: Add gpiochip
 support
Message-ID: <20200701130206.GD3334@localhost>
References: <20200607162350.21297-1-mani@kernel.org>
 <20200607162350.21297-3-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200607162350.21297-3-mani@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 07, 2020 at 09:53:49PM +0530, Manivannan Sadhasivam wrote:
> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.
> 
> Inspired from cp210x usb to serial converter driver.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  drivers/usb/serial/xr_serial.c | 209 ++++++++++++++++++++++++++++++++-
>  1 file changed, 208 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
> index bb7df79cc129..2240fbc9ea7f 100644
> --- a/drivers/usb/serial/xr_serial.c
> +++ b/drivers/usb/serial/xr_serial.c
> @@ -10,6 +10,7 @@
>   * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
>   */
>  
> +#include <linux/gpio/driver.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -17,6 +18,18 @@
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

Try to avoid littering the driver with GPIOLIB ifdefs. One or two is
fine, but no more even if it means declaring an unused type. Add
stubbed out helpers where appropriate.

> +
>  static void xr_set_termios(struct tty_struct *tty,
>  			   struct usb_serial_port *port,
>  			   struct ktermios *old_termios);
> @@ -39,6 +52,11 @@ struct xr_uart_regs {
>  };
>  
>  struct xr_port_private {
> +#ifdef CONFIG_GPIOLIB
> +	struct gpio_chip gc;
> +	bool gpio_registered;
> +	enum gpio_pins pin_status[GPIO_MAX];
> +#endif
>  	const struct xr_uart_regs *regs;
>  	bool port_open;
>  };
> @@ -390,6 +408,13 @@ static void xr_set_flow_mode(struct tty_struct *tty,
>  	 */
>  	gpio_mode &= ~UART_MODE_GPIO_MASK;
>  	if (cflag & CRTSCTS) {
> +#ifdef CONFIG_GPIOLIB
> +		/* Check if the CTS/RTS pins are occupied */
> +		if (port_priv->pin_status[GPIO_RTS] ||
> +		    port_priv->pin_status[GPIO_CTS])
> +			return;
> +#endif

You cannot just bail out as this could leave software flow enabled etc.

You also need to claim these pins once at open or leave them be. We
don't want CRTSCTS to suddenly start toggling because a pin is released
by gpiolib.

That is, determine who owns each pin at open() and keep it that way till
close() (by setting some flags at open).

> +
>  		dev_dbg(&port->dev, "Enabling hardware flow ctrl\n");
>  		flow = UART_FLOW_MODE_HW;
>  		gpio_mode |= UART_MODE_RTS_CTS;
> @@ -497,6 +522,17 @@ static int xr_tiocmset_port(struct usb_serial_port *port,
>  	u8 gpio_set = 0;
>  	u8 gpio_clr = 0;
>  
> +#ifdef CONFIG_GPIOLIB
> +	/* Check if the RTS/DTR pins are occupied */
> +	if (set & TIOCM_RTS || clear & TIOCM_RTS)
> +		if (port_priv->pin_status[GPIO_RTS])
> +			return -EBUSY;
> +
> +	if (set & TIOCM_DTR || clear & TIOCM_DTR)
> +		if (port_priv->pin_status[GPIO_DTR])
> +			return -EBUSY;
> +#endif

Same here. And perhaps just ignoring the pins managed by gpiolib is
better (cf. gpiolib and pinctrl being orthogonal).

> +
>  	/* Modem control pins are active low, so set & clr are swapped */
>  	if (set & TIOCM_RTS)
>  		gpio_clr |= UART_MODE_RTS;
> @@ -589,9 +625,175 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
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
> +	/*
> +	 * Do not proceed if the port is open. This is done to avoid changing
> +	 * the GPIO configuration used by the serial driver.
> +	 */
> +	if (port_priv->port_open)
> +		return -EBUSY;
> +
> +	/* Mark the GPIO pin as busy */
> +	port_priv->pin_status[offset] = true;

You need a lock to serialise against open/close properly.

> +
> +	return 0;
> +}
> +
> +static void xr_gpio_free(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct usb_serial_port *port = gpiochip_get_data(gc);
> +	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
> +
> +	/* Mark the GPIO pin as free */
> +	port_priv->pin_status[offset] = false;
> +}

Johan
