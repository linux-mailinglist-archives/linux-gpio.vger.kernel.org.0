Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2982CA777
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 16:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389503AbgLAPvi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 10:51:38 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45773 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391886AbgLAPvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 10:51:38 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so3659941ljc.12;
        Tue, 01 Dec 2020 07:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7pLlIXqniIb8lLwcUv8C5IJZPzU955Z7Fl+CrmV2OEM=;
        b=uYvoluBnXyroJbptCW+Ar8hQraDaB7efOpodeAryrR+f0TFXYZQTI9Ob3eotE/344U
         r+BNzSYfkpn3diiNfUSBk+iw7fnKXap9uKY2gN8QvsNF231+So1PLidDqHlqig8gOBsT
         ulkD8sIQTMrqyrtULzhKzsnYWtklZh/qISO3CkkLXWfLSxJZx6IerVLLAjZ/Li4q31GQ
         1nfZm8vYaTKeGZf7hUuvT0P6aqKeaDrMo2rapYaf+FcKXkwGv7n6X3vc8+qk0DCpfbMr
         rDMQ1ZMVZJVRDgtDSS4ypQ2f4WHdG9xcGIRhuz+eQ9J4CR24j0al0kNoejyEedIEYMWM
         Dw/w==
X-Gm-Message-State: AOAM533jcit9LZUEqdQx+Y68W+XbndZG5Uc/Znw4W15GkCPIoFkm06+g
        b4eXhcQ7TpHFq6GP23tJaYo=
X-Google-Smtp-Source: ABdhPJyhTjIgdv44tVnheFanh1pnwuEnyZJ/oM1M51QMxVVcd7XlZQKoZ+kvHyYbdjILfHiOD6l3PA==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr1685019ljg.60.1606837855694;
        Tue, 01 Dec 2020 07:50:55 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id w3sm238215lfn.293.2020.12.01.07.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 07:50:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kk7w5-0001qm-32; Tue, 01 Dec 2020 16:51:25 +0100
Date:   Tue, 1 Dec 2020 16:51:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        angelo.dureghello@timesys.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <X8ZmfbQp7/BGgxec@localhost>
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

On Tue, Dec 01, 2020 at 03:37:38PM +0100, Linus Walleij wrote:
> On Sun, Nov 22, 2020 at 6:08 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> 
> > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > for controlling the available gpios.

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

Last time we tried that gpiolib still used a flat namespace so that you
can't have have more than one device using the same names. Unless that
has changed this is a no-go. See

	https://lore.kernel.org/r/20180930122703.7115-1-johan@kernel.org

for our previous discussion about this.

Johan
