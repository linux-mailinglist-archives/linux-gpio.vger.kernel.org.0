Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F122CAA61
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 19:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404115AbgLASBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 13:01:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:56586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgLASBK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Dec 2020 13:01:10 -0500
Received: from thinkpad (unknown [103.59.133.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3DE22067D;
        Tue,  1 Dec 2020 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606845629;
        bh=1A3M3IZxhjNTlfEppcuI+Cqimzqb6oCIf9GcfsYOUKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J5WZtdv37182NGhggCUz9MRj8u1nbxav9WG15ogkm2dyuGlWVViKlVpjS+MZqOBqf
         J9AOe4N4t295jj418sTQ/oC075XhWgmeRt+INQ2XLr78uexYAxusHmPl47Q34UcULb
         0IG3Zrt5bvDVvQ8n/78uTwLfkqQArrSuWBc87VCs=
Date:   Tue, 1 Dec 2020 23:30:18 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        angelo.dureghello@timesys.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20201201180018.GA78529@thinkpad>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Dec 01, 2020 at 03:37:38PM +0100, Linus Walleij wrote:
> On Sun, Nov 22, 2020 at 6:08 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> 
> > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > for controlling the available gpios.
> >
> > Inspired from cp210x usb to serial converter driver.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> This looks good to me overall, provided that it plays well with the
> serial port.
> 
> One minor notice:
> 
> > +enum gpio_pins {
> > +       GPIO_RI = 0,
> > +       GPIO_CD,
> > +       GPIO_DSR,
> > +       GPIO_DTR,
> > +       GPIO_CTS,
> > +       GPIO_RTS,
> > +       GPIO_MAX,
> > +};
> 
> You know the names of the pins...
> 
> > +       port_priv->gc.ngpio = 6;
> > +       port_priv->gc.label = "xr_gpios";
> > +       port_priv->gc.request = xr_gpio_request;
> > +       port_priv->gc.free = xr_gpio_free;
> > +       port_priv->gc.get_direction = xr_gpio_direction_get;
> > +       port_priv->gc.direction_input = xr_gpio_direction_input;
> > +       port_priv->gc.direction_output = xr_gpio_direction_output;
> > +       port_priv->gc.get = xr_gpio_get;
> > +       port_priv->gc.set = xr_gpio_set;
> > +       port_priv->gc.owner = THIS_MODULE;
> > +       port_priv->gc.parent = &port->dev;
> > +       port_priv->gc.base = -1;
> > +       port_priv->gc.can_sleep = true;
> 
> So assign port_priv->gc.names here as well with an array
> of strings with the names ("RI", "CD", ... etc).
> This makes it look really nice in userspace if you do
> e.g. "lsgpio".
> 

As Johan stated, this doesn't work with multiple devices attached to the system.
That's the reason for not adding the line names.

This gives me the motivation to get my hands dirty with gpiolib (but I fear of
breaking the ABI)...

> With that:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 

Thanks for the review!

Regards,
Mani

> Yours,
> Linus Walleij
