Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D86E1EE347
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfKDPOM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:14:12 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39973 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfKDPOL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:14:11 -0500
Received: by mail-lf1-f67.google.com with SMTP id f4so12517773lfk.7
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ilpqvgDXJg0+dq47GMBv0sWHCDOr8ZTlZSrEqJ5JEgw=;
        b=EiSwqYnUBxCbkcnuaxl/7P3Yp2mm03tUmJVUWsmgBS7j2mkQnpebROAZHzpUMU+WtR
         NKU6ISGuAHeMNgRPQMMHHktji7RcXl9yHu3X5rULr708VPhZRdHwftZDZpbdX/gU4Lpy
         TLyifEzOxaqhpa0TACznUkySBsbKnxFZx1NPRRladig2ana2w1L6XXDG/8DgUW59zGlk
         wnsK4BSjzyzGWpA95DrI5jcruNJ2SMhedMdrj1fjEt8gq9CgZDPvGgFDM1P/muDlPcPv
         hFy+JhUGDKV3CN1EXE0rAkW38AO1XVyQhmDBVZhsXD7SmMgO6dJkl2mwQJoBeiWJ7K4d
         bvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ilpqvgDXJg0+dq47GMBv0sWHCDOr8ZTlZSrEqJ5JEgw=;
        b=NuGPp/mf1mGAaJSUXigYXJT7Z0WC8UrZA/daC//ofjG2ESMBtqZ4pS2i9BUKnwfdvD
         a4wyr87s3zpJpOu6Xf+AmXh/uTtMisRTfAltVWS96OyvN27QqPnp+BKpM5RTBsfu2yab
         1syh+LChIIdQYa2SIRtnbuzZL9JTIl74jsZWerWCsbRXQSTozzmv8Qi47kCKi0VXF8lL
         wiedeuLl6Oc2oVBRUxcoMs+R+tW0lMQ0G1LngAgcj0UnDQDIE/f3TwX7MWxhPMq0ze/W
         xJsatcOQ04ttg14DBIfdCCgLIB3b/ciy+SzevVffubZNOYb/0qqHDPU0RTn04LT/uNvO
         kIlQ==
X-Gm-Message-State: APjAAAWikpmi9PXwpT+RmUZhn2zljz1JwrlknldQHkagjtu+HZx9KsLB
        BYT9nrnY/FIGBc1FBSK6MfmGWdgz6vOvq3ljSv3BFnMU4yA=
X-Google-Smtp-Source: APXvYqyDE31sDBFLxboUH3Nm+n7/yvnTCFuqhoBYYLz+rzIjk1tDejDCAjDP2xnR74vw5Hqg4gs+U1hlXcgztzmSIEU=
X-Received: by 2002:a19:651b:: with SMTP id z27mr16921087lfb.117.1572880449842;
 Mon, 04 Nov 2019 07:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20190813070123.17406-1-linus.walleij@linaro.org> <20191024133846.GW32742@smile.fi.intel.com>
In-Reply-To: <20191024133846.GW32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:13:58 +0100
Message-ID: <CACRpkdb4WN0vNQZGm-e3EMkOEfK0L+EigmJwd5viv=EjkzBmXw@mail.gmail.com>
Subject: Re: [PATCH] RFC: pinctrl: cherryview: Pass irqchip when adding gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 24, 2019 at 3:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Aug 13, 2019 at 09:01:23AM +0200, Linus Walleij wrote:
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip. For more info see
> > drivers/gpio/TODO.
> >
> > This driver is something of a special case, so we need to
> > discuss it.
> >
> > It picks a number of IRQ descriptors before setting up
> > the gpio_irq_chip using devm_irq_alloc_descs() giving a
> > fixed irq base in the IRQ numberspace. It then games the
> > irqchip API by associating IRQs from that base and upward
> > with as many pins there are in the "community" which is a
> > set of pins. Then after each gpio_chip is registered, it
> > fills in the pin to IRQ map for each GPIO range inside
> > that "community" with irq_domain_associate_many() which
> > works fine since the descriptors were allocated
> > previously.
> >
> > This is actually a hierarchical irq_chip as far as I can
> > tell. The problem is that very likely the Intel root IRQ
> > chip is not hierarchical so it does not support using the
> > facilities for hierarchical irqdomains.
> >
> > I will soon merge the patch providing hierarchical irqchip
> > support in gpiolib:
> > https://lore.kernel.org/linux-gpio/20190808123242.5359-1-linus.walleij@linaro.org/
> >
> > Will we need to bite the bullet and convert the root
> > irqchip for the intels to support hierarcical irqdomain?
>
> We have few fixes for this driver, perhaps you can send a new version based on
> them when they appear in your tree.

I'm pretty scared of this driver so I am keeping my hands off it
for the time being. Also this patch has compile errors. I try
not to change to many complicated things at one. Maybe next
kernel cycle...

Yours,
Linus Walleij
