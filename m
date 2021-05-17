Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18579382780
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 10:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbhEQIwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 04:52:17 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:45492 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235446AbhEQIwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 04:52:17 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b] (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id CBB6E1FF8B2;
        Mon, 17 May 2021 10:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621241460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h5tsms5xI9mYoU2aDfH9/YdSGrBfg2Dt6aTgdrqgN0M=;
        b=lEd4V0jDDjiTkNzNAmUv+3XSNCwDDz3bv9rUAqw3pFigetdsit0+mGGJuHYsU4owuoAolv
        hs9gEkmRWMg0coyZFZ/28vTjmh8VxGQSs46OC2vWHLc/H6LTutZBnziBMvHMMDasNfFNzy
        NOZO4iPtKGPiDRrKSeWXELv1T8jotVNIkqaBRyVn+N7ta8ZlOp/bRXPjwSrGvLkBjY+5rv
        vrEHx8VY0EVopDg/fi/zGVU9OG2RSBQIiqobJg9YHxOW48zHZDKvUOIH/AGusM4DOUV/ov
        yhl7bdh4BSG4nnSoB5B34ekyketrpKTRQuO8GVIB5q24DXtus0X8kDz60dcgfA==
Message-ID: <a717bd96509b38bdfd8883847b8d085f9bdd919f.camel@svanheule.net>
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Mon, 17 May 2021 10:50:57 +0200
In-Reply-To: <CAHp75VdS63n55b3RG7ZL1=uVgB=7ZiBtTOmV0t+5hw6xKoLFSg@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <CAHp75VffoKyyPJbdtKMLx575c9LT0S8+EHOk7Mw36j=aTL6Q4Q@mail.gmail.com>
         <b7d39a26bc3a90de4d8e4fdbf8f944de43d12a56.camel@svanheule.net>
         <CAHp75VdS63n55b3RG7ZL1=uVgB=7ZiBtTOmV0t+5hw6xKoLFSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-17 at 11:13 +0300, Andy Shevchenko wrote:
> On Mon, May 17, 2021 at 12:40 AM Sander Vanheule <sander@svanheule.net> wrote:
> > On Wed, 2021-05-12 at 18:29 +0300, Andy Shevchenko wrote:
> > > On Tuesday, May 11, 2021, Sander Vanheule <sander@svanheule.net> wrote:
> 
> ...
> 
> > >  * > > > I have several comments to the series, but I may give them next
> > >    week.
> > > 
> > > Just couple here:
> > > 1. If subsystem provides a regmap API I would suggest to use it, I.o.w.
> > > try
> > > again to understand what is wrong with MDIO case.
> > 
> > Are you referring to the MDIO regmap interface, or the GPIO regmap
> > interface?
> 
> MDIO
> 
> > For the MDIO regmap interface, I have been able to resolve the Kconfig
> > dependency issue. So I can reintroduce that, if that's preferred over the
> > solution in this v1.
> > 
> > With an extra patch, I was able to use the gpio-regmap interface, dropping
> > most
> > of the GPIO code. The current gpio-regmap implementation makes the
> > assumption
> > that an output value can be set while a pin is configured as an input. That
> > assumption is invalid for this chip, so I had to provide an extra flag for
> > gpio_regmap_config, similar to how this is handled in gpio-mmio.
> > 
> > 
> > > 2. Please, switch to fwnode API in LED driver
> > 
> > Since you had the same comment on my previous patch set, I had already tried
> > to
> > this this into account as much as possible.
> > 
> > There's a few things I couldn't find the fwnode-equivalent for:
> >  * I use of_node_name_prefix to enforce the naming required by the binding.
> > I
> >    could just walk over all (available) child nodes, which would be mostly
> >    equivalent.
> 
> AFAIU the LED traditional bindings is that you define LED compatible
> nodes and all child nodes of it are the one-per-LED ones, there
> shouldn't be others.

OK, then I can just iterate over all child fwnodes.


> >  * To get the address of an LED child node, I use of_get_address, since this
> >    appeared to provide what I want to do: get the address of the node. I
> > know
> >    next to nothing about ACPI. Does the equivalent exist there? Or am I
> > taking
> >    the wrong approach?
> 
> What are the means of an address in this case?

The chip appears to be intended for use with ethernet switches. The registers
are organised to into a few groups, to provide 2 or 3 status LEDs per switch
port:

 * "LED0" group for 32 ports,
 * "LED1" group for 32 ports,
 * "LED2" group for 24 ports

The number of LEDs that can be used depends on the output mode, so I use a two-
part <#PORT #LED> address, resembling how this is defined by Realtek.

A single linear LED address space would get awkward gaps in bi-color mode (where
only the lower 24 ports can be used), but would still require addresses to be
able to specify which LED is where. For example in case the user want to link
them to a phy trigger for a specific switch port.

Best,
Sander

