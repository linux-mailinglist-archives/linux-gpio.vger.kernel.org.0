Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D001423DC4F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 18:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbgHFQtN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 12:49:13 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39862 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729104AbgHFQsx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 12:48:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id v9so18064113ljk.6;
        Thu, 06 Aug 2020 09:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2CFr1WO/oeNCTJdjwIX/TiCWFfnGU5V/MdaXXMTg4nw=;
        b=o2eaXiemnyv7kEoOxaj3PhunceF4k4Z5gP6KuR88evRcrlcJ//Fu3GjVJNVnqI5/EJ
         o6e0AbJ073jvh4mgMPAHtaeN0xqCrnC9rWc7iTXEOG0ZoyOQdtS7RTZexPDisn+hS8yJ
         iCKgntdqy57zhihUX3JH8BjeB461v45ZkVZs80w4mmyjXVehg6/6XR59bCmi7+L90Rqi
         mPjYp1khXm1SzwOu8nFxNQGBFLzm4yDtX39jKkTHWeMxwjQSjSNOc52lawalfQZN5Qb3
         1WPLFYVxr9OI9nvFTl8j/3INopkqzq5pYc6rEaqQ2H8/1HuEU4I9pfWsFG7Ic6Fqwm4J
         XnVQ==
X-Gm-Message-State: AOAM530n8Jv1UjRK2u5g22DFkMwiV55iV7QkJ6W9g8/uy5wknhqE3DmE
        bpAuIestmCmzsah04tJ1obGg+WIL+r0=
X-Google-Smtp-Source: ABdhPJzBoIhDGLnB9sT9oB5TM5Ps4uAmCPKjH7JBZrcf1F76+eu7r7+YJBa7FmB1d0p5KoyIofGB8g==
X-Received: by 2002:a2e:5c5:: with SMTP id 188mr3701045ljf.466.1596721995016;
        Thu, 06 Aug 2020 06:53:15 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id p11sm2670295lfo.71.2020.08.06.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 06:53:13 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1k3gKa-0003Vy-Vg; Thu, 06 Aug 2020 15:53:17 +0200
Date:   Thu, 6 Aug 2020 15:53:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [RESEND PATCH v4 2/3] usb: serial: xr_serial: Add gpiochip
 support
Message-ID: <20200806135316.GT3634@localhost>
References: <20200607162350.21297-1-mani@kernel.org>
 <20200607162350.21297-3-mani@kernel.org>
 <20200701130206.GD3334@localhost>
 <20200726155223.GB12036@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726155223.GB12036@Mani-XPS-13-9360>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 26, 2020 at 09:22:23PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2020 at 03:02:06PM +0200, Johan Hovold wrote:
> > On Sun, Jun 07, 2020 at 09:53:49PM +0530, Manivannan Sadhasivam wrote:
> > > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > > for controlling the available gpios.
> > > 
> > > Inspired from cp210x usb to serial converter driver.
> > > 
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: linux-gpio@vger.kernel.org
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> > > ---
> > >  drivers/usb/serial/xr_serial.c | 209 ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 208 insertions(+), 1 deletion(-)

> > > @@ -390,6 +408,13 @@ static void xr_set_flow_mode(struct tty_struct *tty,
> > >  	 */
> > >  	gpio_mode &= ~UART_MODE_GPIO_MASK;
> > >  	if (cflag & CRTSCTS) {
> > > +#ifdef CONFIG_GPIOLIB
> > > +		/* Check if the CTS/RTS pins are occupied */
> > > +		if (port_priv->pin_status[GPIO_RTS] ||
> > > +		    port_priv->pin_status[GPIO_CTS])
> > > +			return;
> > > +#endif
> > 
> > You cannot just bail out as this could leave software flow enabled etc.
> > 
> > You also need to claim these pins once at open or leave them be. We
> > don't want CRTSCTS to suddenly start toggling because a pin is released
> > by gpiolib.
> > 
> > That is, determine who owns each pin at open() and keep it that way till
> > close() (by setting some flags at open).
> > 
> > > +
> > >  		dev_dbg(&port->dev, "Enabling hardware flow ctrl\n");
> > >  		flow = UART_FLOW_MODE_HW;
> > >  		gpio_mode |= UART_MODE_RTS_CTS;
> > > @@ -497,6 +522,17 @@ static int xr_tiocmset_port(struct usb_serial_port *port,
> > >  	u8 gpio_set = 0;
> > >  	u8 gpio_clr = 0;
> > >  
> > > +#ifdef CONFIG_GPIOLIB
> > > +	/* Check if the RTS/DTR pins are occupied */
> > > +	if (set & TIOCM_RTS || clear & TIOCM_RTS)
> > > +		if (port_priv->pin_status[GPIO_RTS])
> > > +			return -EBUSY;
> > > +
> > > +	if (set & TIOCM_DTR || clear & TIOCM_DTR)
> > > +		if (port_priv->pin_status[GPIO_DTR])
> > > +			return -EBUSY;
> > > +#endif
> > 
> > Same here. And perhaps just ignoring the pins managed by gpiolib is
> > better (cf. gpiolib and pinctrl being orthogonal).
> 
> You mean, we can just make TX,RX,CTS,RTS pins controlled only by the serial
> driver and the rest only by gpiolib?

No, I think I just meant that you shouldn't return an error here for
signals whose pins happen to be muxed for a different function (gpio).

Johan
