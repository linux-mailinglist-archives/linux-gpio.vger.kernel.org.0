Return-Path: <linux-gpio+bounces-9390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5D96481A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605411C2407C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CF91B143C;
	Thu, 29 Aug 2024 14:20:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388E1B0126;
	Thu, 29 Aug 2024 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941215; cv=none; b=MAwXV1z+mCKIKdJZtCgPSm7iGQuuax4kyICXLnJwymqMCFWxyNwxAycxfeJT5Q0LwqbD/l8A4pNlcTOLioKt9zAkg1HvknWa7RF3S4MlTQRXX5CG+/yEuO5/BVRs2owYJSiE/dmAQnllnVh/602+Unw6GLyES9EGdzILisOu7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941215; c=relaxed/simple;
	bh=vVnHDMPRWEqw78UqpM0GcVu6kdAO83JBT5gVll4IiqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9L9rqGfCFQ9DUqX0D52R3bTtLFBHn6Jbi87nTTBI5QxUioY8XQzdJCYAgEVI28FEKixPPoWZmRr+zO0+ViTKqERAdGmZOhMWh/UyC/nAygvmn4/gr7zBACnxTvfNkHfzHrDJISKeOluSBY3GwA60eqIWbR6oPCRea1eESdf23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id AD15240D7C7C;
	Thu, 29 Aug 2024 10:11:14 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uXjXtRG2l_4c; Thu, 29 Aug 2024 10:11:14 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 2659445735E9;
	Thu, 29 Aug 2024 10:11:14 -0400 (EDT)
Date: Thu, 29 Aug 2024 10:11:13 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <ZtCBgWrdFI6h3zbo@freedom.csh.rit.edu>
References: <20240814191509.1577661-1-mstrodl@csh.rit.edu>
 <CACRpkdYyo9MD6zfiPde+3vSdpH96r+ZO12bdmMAfjw5PCNJ1BQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYyo9MD6zfiPde+3vSdpH96r+ZO12bdmMAfjw5PCNJ1BQ@mail.gmail.com>

On Sat, Aug 24, 2024 at 04:25:59PM +0200, Linus Walleij wrote:
> thanks for your patch!

Thank you for reviewing!

> > +config GPIO_MPSSE
> > +       tristate "FTDI MPSSE GPIO support"
> > +       help
> > +         GPIO driver for FTDI's MPSSE interface. These can do input and
> > +         output. Each MPSSE provides 16 IO pins.
> 
> select GPIOLIB_IRQCHIP

Will-do!

> > +struct mpsse_priv {
> > +       struct gpio_chip gpio;
> > +       struct usb_device *udev;     /* USB device encompassing all MPSSEs */
> > +       struct usb_interface *intf;  /* USB interface for this MPSSE */
> > +       u8 intf_id;                  /* USB interface number for this MPSSE */
> > +       struct irq_chip irq;
> 
> What is this irq_chip? You already have an immutable one lower in the code.

Oops. Forgot to remove this, thanks.

> 
> > +       struct work_struct irq_work; /* polling work thread */
> > +       struct mutex irq_mutex;      /* lock over irq_data */
> > +       atomic_t irq_type[16];       /* pin -> edge detection type */
> > +       atomic_t irq_enabled;
> > +       int id;
> > +
> > +       u8 gpio_outputs[2];          /* Output states for GPIOs [L, H] */
> > +       u8 gpio_dir[2];              /* Directions for GPIOs [L, H] */
> 
> Caching states of lines is a bit regmap territory. Have you looked into
> just using regmap?

Do you mean gpio_regmap or using regmap directly? I'm not sure that gpio_regmap
will do what I want because I need to provide an irq_chip (and I don't see a way
to "break the glass" and access the gpio_chip directly)

> If this doesn't need to be atomic you should use
> __set_bit() and __clear_bit().
> 
> Yeah I know it's confusing... I think you should use the __variants
> everywhere.

Oops, thanks.

> Is there something wrong with just using the gpiolib irqchip library
> 
> select GPIOLIB_IRQCHIP
> 
> there are several examples in other drivers of how to use this.

I've ripped out all the extra stuff, I didn't realise how much was
already being done for me!

> > +static int gpio_mpsse_probe(struct usb_interface *interface,
> > +                           const struct usb_device_id *id)
> > +{
> > +       struct mpsse_priv *priv;
> > +       struct device *dev;
> > +       int err, irq, offset;
> > +
> > +       dev = &interface->dev;
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       priv->udev = usb_get_dev(interface_to_usbdev(interface));
> > +       priv->intf = interface;
> > +       priv->intf_id = interface->cur_altsetting->desc.bInterfaceNumber;
> > +
> > +       priv->id = ida_simple_get(&gpio_mpsse_ida, 0, 0, GFP_KERNEL);
> > +       if (priv->id < 0)
> > +               return priv->id;
> > +
> > +       devm_mutex_init(dev, &priv->io_mutex);
> > +       devm_mutex_init(dev, &priv->irq_mutex);
> > +
> > +       priv->gpio.label = devm_kasprintf(dev, GFP_KERNEL,
> > +                                         "gpio-mpsse.%d.%d",
> > +                                         priv->id, priv->intf_id);
> > +       if (!priv->gpio.label) {
> > +               err = -ENOMEM;
> > +               goto err;
> > +       }
> 
> So you are accomodating for several irqchips in the same device,
> and handling it like we don't really know how many they will be?
> Does it happen in practice that this is anything else than 0?

Are you asking about intf_id? Yes, the hardware I'm supporting here populates
as a composite USB device with 2 MPSSEs.

The terminology is kind of confusing by the way. MPSSE is a functional unit inside one
chip. The device I have here has one chip, and shows up as one usb device with two interfaces:

$ lsusb -t # trimmed down to just the relevant bits
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
    |__ Port 5: Dev 4, If 0, Class=Vendor Specific Class, Driver=gpio-mpsse, 480M
    |__ Port 5: Dev 4, If 1, Class=Vendor Specific Class, Driver=gpio-mpsse, 480M
$ lsusb
Bus 001 Device 004: ID 0c52:a064 Sealevel Systems, Inc. USB <-> Serial Converter

Other models of this chip (FT232) only have 1 MPSSE. I don't have any to test with,
but my assumption is that the 2nd interface won't populate.

As for `priv->id`, I do that because these are USB peripherals, it's conceivable
that more than one of these chips could be attached at once.

> Yours,
> Linus Walleij

Thanks for taking the time to review!

Mary Strodl

