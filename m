Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72ECD342795
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 22:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhCSVUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 17:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbhCSVU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 17:20:28 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D36DC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 19 Mar 2021 14:20:28 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eaff:9f01:ffbc:9626:10f7:ec57] (unknown [IPv6:2a02:a03f:eaff:9f01:ffbc:9626:10f7:ec57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 330A21E0419;
        Fri, 19 Mar 2021 22:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616188825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FJ0oUbr/h/YJU7rB7qgMyRK20DZ+5jtsUgv4ejASZ6Q=;
        b=9n1lkndbdrHko8zV2k5jLSj8zMhCUaVl4MKTXqscHC+5OQb4AQf7v5mTJp/H99COVyQKsD
        lN3p9aqF3BnwKURnE0P7fRAtWuBv101UcMBOBIhact/UzMOj6hqQO1e/TKo3JNZthOUaRa
        MWbn/PVgC00bJWY0QGpx+FMuTj7WAkO0GfYyfOxTrZ2KNLzFvquQlfDmC7kdpn+85OE2Qs
        zVcgzvs3s6n+S1ut40MYSEs4SvjgxcsukIHqwxIEabrEubD4Qga6jnXdY1OcEvEh/Oh3IK
        Oo1CSdqjiieVcjnAu9nkcmkn0jlprFqPa1hZaOBJh23wb1Xx240juI09V2xafA==
Message-ID: <9d736f272aae42b154a4fdfbcadc1572ee82f516.camel@svanheule.net>
Subject: Re: [PATCH v2 2/2] gpio: Add Realtek Otto GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>
Date:   Fri, 19 Mar 2021 22:20:22 +0100
In-Reply-To: <CAHp75VdrqE0kBwzK9Jk7pZGjyfFnhatfa8UY0z-3T1w1PrbAbw@mail.gmail.com>
References: <20210315082339.9787-1-sander@svanheule.net>
         <20210315190806.66762-1-sander@svanheule.net>
         <20210315190806.66762-3-sander@svanheule.net>
         <CAHp75Vc6aaDhVN7LzvLNQjuOPguz+nbfmfpZ7TZHK=fNjCRz8w@mail.gmail.com>
         <a7d410216d35ed2b3015bfdd8e21dafd9c42d9d4.camel@svanheule.net>
         <CAHp75VdrqE0kBwzK9Jk7pZGjyfFnhatfa8UY0z-3T1w1PrbAbw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2021-03-19 at 19:57 +0200, Andy Shevchenko wrote:
> On Fri, Mar 19, 2021 at 5:51 PM Sander Vanheule
> <sander@svanheule.net> wrote:
> > On Wed, 2021-03-17 at 15:08 +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 15, 2021 at 11:11 PM Sander Vanheule <
> > > sander@svanheule.net> wrote:
> 
> ...
> 
> > > > +#include <linux/swab.h>
> > > 
> > > Not sure why you need this? See below.
> 
> > > > +       return swab32(readl(ctrl->base +
> > > > REALTEK_GPIO_REG_ISR));
> > > 
> > > Why swab?! How is this supposed to work on BE CPUs?
> > > Ditto for all swabXX() usage.
> > 
> > My use of swab32/swahw32 has little to do with the CPU being BE or
> > LE,
> > but more with the register packing in the GPIO peripheral.
> > 
> > The supported SoCs have port layout A-B-C-D in the registers, where
> > firmware built with Realtek's SDK always denotes A0 as the first
> > GPIO
> > line. So bit 24 in a register has the value for A0 (with the
> > exception
> > of the IMR register).
> > 
> > I wrote these wrapper functions to be able to use the BIT() macro
> > with
> > the GPIO line number, similar to how gpio-mmio uses ioread32be()
> > when
> > the BGPIOF_BIG_ENDIAN_BYTE_ORDER flag is used.
> > 
> > For the IMR register, port A again comes first, but is now 16 bits
> > wide
> > instead of 8, with A0 at bits 16:17. That's why swahw32 is used for
> > this register.
> > 
> > On the currently unsupported RTL9300-series, the port layout is
> > reversed: D-C-B-A. GPIO line A0 is then at bit 0, so the swapping
> > functions won't be required. When support for this alternate port
> > layout is added, some code will need to be added to differentiate
> > between the two cases.
> 
> Yes, you have different endianess on the hardware level, why not to
> use the proper accessors (with or without utilization of the above
> mentioned BGPIOF_BIG_ENDIAN_BYTE_ORDER)?

The point I was trying to make, is that it isn't an endianess issue. I
shouldn't have used a register with single byte values to try to
illustrate that.

Consider instead the interrupt masking registers. To write the IMR bits
for port A (GPIO 0-7), a 16-bit value must be written. This value (e.g.
u16 port_a_imr) is always BE, independent of the packing order of the
ports in the registers:

   // On RTL8380: port A is in the upper word
   writew(port_a_imr, base + OFFSET_IMR_AB);
   
   // On RTL9300: port A is in the lower word
   writew(port_a_imr, base + OFFSET_IMR_AB + 2);

I want the low GPIO lines to be in the lower half-word, so I can
manipulate GPIO lines 0-15 with simple mask and shift operations.

It just so happens, that all registers needed by bgpio_init contain
single-byte values. With BGPIO_BIG_ENDIAN_BYTE_ORDER  the port order is
reversed as required, but it's a bit of a misnomer here.


Best,
Sander

