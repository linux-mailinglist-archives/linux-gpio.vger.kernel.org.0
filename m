Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CA7382137
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 23:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234006AbhEPVmN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 17:42:13 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:33582 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbhEPVmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 May 2021 17:42:13 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:186f:4d03:79dc:8c8e] (unknown [IPv6:2a02:a03f:eafb:ee01:186f:4d03:79dc:8c8e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 59C1F1FF4B9;
        Sun, 16 May 2021 23:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621201256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zC492mPkBn9ingCoXgTAUaVrJcaY2gLfvNuMI2kNax8=;
        b=Xrt4KLp5CcPBIjQTQMHw5uJPs+RqSgzwCnzF4VaO8tv/cWnJaA/X+zGtGrh9HLVYwObqOd
        sFg4nDNG+4W/2ReMGDSnjUrOcyDvhbDBIAypqgXgJq3jJKYdfzBd2FdR7olgAJLTW2ZRz+
        6HniZFSYnBP0NX80Y67zhPd5NtZ/9aZtovXjgzDo5ByHVitnsFeGfMPl8O9qrQ/ZkzDVMT
        Ffu0zVnlLxz3eJVSZGcybpeNjeBdID/xbnio2loC+FZabTPcfzugIDQIIUo0bLZYNq4fsc
        wBNpLMgehFEf4tBdH/EODkrAkSDWNwHbe0fjG10GzZW7pUFCFf/rxNuFwEAK6Q==
Message-ID: <b7d39a26bc3a90de4d8e4fdbf8f944de43d12a56.camel@svanheule.net>
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
Date:   Sun, 16 May 2021 23:40:51 +0200
In-Reply-To: <CAHp75VffoKyyPJbdtKMLx575c9LT0S8+EHOk7Mw36j=aTL6Q4Q@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <CAHp75VffoKyyPJbdtKMLx575c9LT0S8+EHOk7Mw36j=aTL6Q4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-05-12 at 18:29 +0300, Andy Shevchenko wrote:
> 
> 
> On Tuesday, May 11, 2021, Sander Vanheule <sander@svanheule.net> wrote:
> > The RTL8231 GPIO and LED expander can be configured for use as an MDIO or
> > SMI
> > bus device. Currently only the MDIO mode is supported, although SMI mode
> > support should be fairly straightforward, once an SMI bus driver is
> > available.
> > 
> > Provided features by the RTL8231:
> >   - Up to 37 GPIOs
> >     - Configurable drive strength: 8mA or 4mA (currently unsupported)
> >     - Input debouncing on high GPIOs (currently unsupported)
> >   - Up to 88 LEDs in multiple scan matrix groups
> >     - On, off, or one of six toggling intervals
> >     - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
> >     - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
> >   - Up to one PWM output (currently unsupported)
> >     - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)
> > 
> > There remain some log warnings when probing the device, possibly due to the
> > way
> > I'm using the MFD subsystem. Would it be possible to avoid these?
> > [    2.602242] rtl8231-pinctrl: Failed to locate of_node [id: -2]
> > [    2.609380] rtl8231-pinctrl rtl8231-pinctrl.0.auto: no of_node; not
> > parsing pinctrl DT
> > 
> > When no 'leds' sub-node is specified:
> > [    2.922262] rtl8231-leds: Failed to locate of_node [id: -2]
> > [    2.967149] rtl8231-leds rtl8231-leds.1.auto: no of_node; not parsing
> > pinctrl DT
> > [    2.975673] rtl8231-leds rtl8231-leds.1.auto: scan mode missing or
> > invalid
> > [    2.983531] rtl8231-leds: probe of rtl8231-leds.1.auto failed with error
> > -22
> > 
> > 
> 
> 
> I have several comments to the series, but I may give them next week.
> 
> Just couple here:
> 1. If subsystem provides a regmap API I would suggest to use it, I.o.w. try
> again to understand what is wrong with MDIO case.

Are you referring to the MDIO regmap interface, or the GPIO regmap interface?

For the MDIO regmap interface, I have been able to resolve the Kconfig
dependency issue. So I can reintroduce that, if that's preferred over the
solution in this v1.

With an extra patch, I was able to use the gpio-regmap interface, dropping most
of the GPIO code. The current gpio-regmap implementation makes the assumption
that an output value can be set while a pin is configured as an input. That
assumption is invalid for this chip, so I had to provide an extra flag for
gpio_regmap_config, similar to how this is handled in gpio-mmio.


> 2. Please, switch to fwnode API in LED driver

Since you had the same comment on my previous patch set, I had already tried to
this this into account as much as possible.

There's a few things I couldn't find the fwnode-equivalent for:
 * I use of_node_name_prefix to enforce the naming required by the binding. I
   could just walk over all (available) child nodes, which would be mostly
   equivalent.
 * To get the address of an LED child node, I use of_get_address, since this
   appeared to provide what I want to do: get the address of the node. I know
   next to nothing about ACPI. Does the equivalent exist there? Or am I taking
   the wrong approach?


I have updated patches ready, if you would rather just review a v2.


Best,
Sander

