Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A0333C683
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 20:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbhCOTJq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 15:09:46 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:53046 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbhCOTJT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 15:09:19 -0400
Received: from [IPv6:2a02:a03f:eaff:9701:b4db:50a7:6f83:328f] (unknown [IPv6:2a02:a03f:eaff:9701:b4db:50a7:6f83:328f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id F14B21DE339;
        Mon, 15 Mar 2021 20:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1615835357;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pskzclMkXR3IRzEZOEFMV+FedUz9vBjzoT3S2ZaEyiU=;
        b=hoowfyuwXjQinpl+0faHCjkwmcG6kVRtut5FejL7IGhiY50Q0obkHABpSZKHILnnOjtQwr
        mlxKwCdD8CQmNZ3E8pBncoCGXxUteSJPVoqQVhiBePT2d6daZcVo0PC3g4BcTuuuFk1vJG
        X8YiGNMgfCX+E/bt20hRl1/bDtynMhCUebieJI5NeZ5Zre8gc/um6/goA0gXPgSjLfGk4g
        zwAqLSVSTM0L/KTvBW/cjYv40Sfs5JoLI7XVzBB/KEYaBGG2Ib9stGy4nvBw89TFlC27wP
        vlTlsQbzPtIKfvhYNqyn33sap6pv9hC9ps1VvqUhDu9d6Tao0rU0pqH3hAWAfg==
Message-ID: <e9f0651e5fb52b7d56361ceb30b41759b6f2ec13.camel@svanheule.net>
Subject: Re: [PATCH 2/2] gpio: Add Realtek Otto GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>
Date:   Mon, 15 Mar 2021 20:09:15 +0100
In-Reply-To: <CACRpkdZ7zWQPBgQ+AjFM7up8x8HJES2EDfBKGmPU9LJwWzB8EA@mail.gmail.com>
References: <20210315082339.9787-1-sander@svanheule.net>
         <20210315082339.9787-3-sander@svanheule.net>
         <CACRpkdZ7zWQPBgQ+AjFM7up8x8HJES2EDfBKGmPU9LJwWzB8EA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-03-15 at 16:10 +0100, Linus Walleij wrote:
> On Mon, Mar 15, 2021 at 9:26 AM Sander Vanheule
> <sander@svanheule.net> wrote:
> 
> > Realtek MIPS SoCs (platform name Otto) have GPIO controllers with
> > up to
> > 64 GPIOs, divided over two banks. Each bank has a set of registers
> > for
> > 32 GPIOs, with support for edge-triggered interrupts.
> > 
> > Each GPIO bank consists of four 8-bit GPIO ports (ABCD and EFGH).
> > Most
> > registers pack one bit per GPIO, except for the IMR register, which
> > packs two bits per GPIO (AB-CD).
> > 
> > Although the byte order is currently assumed to have port A..D at
> > offset
> > 0x0..0x3, this has been observed to be reversed on other, Lexra-
> > based,
> > SoCs (e.g. RTL8196E/97D/97F).
> > 
> > Interrupt support is disabled for the fallback devicetree-
> > compatible
> > 'realtek,otto-gpio'. This allows for quick support of GPIO banks in
> > which the byte order would be unknown. In this case, the port
> > ordering
> > in the IMR registers may not match the reversed order in the other
> > registers (DCBA, and BA-DC or DC-BA).
> > 
> > Signed-off-by: Sander Vanheule <sander@svanheule.net>
> 
> Overall this is a beautiful driver and it makes use of all the
> generic
> frameworks I can think of. I don't see any reason not to merge
> it so:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for the review and the kind comments!


> 
> The following is some notes and nitpicks, nothing blocking any
> merge, more like discussion.
> 
> > +enum realtek_gpio_flags {
> > +       GPIO_INTERRUPTS = BIT(0),
> > +};
> 
> I suppose this looks like this because more flags will be introduced
> when you add more functionality to the driver. Otherwise it seems
> like overkill so a bool would suffice.
> 
> I would add a comment /* TODO: this will be expanded */
> 

That's correct, I would like this to be extendable. Like the commit
message noted, some other SoC appear to have port order D-C-B-A. The
current driver only supports the A-B-C-D port order, so a flag could be
added to differentiate between A-first and D-first.

Another flag that will be added in the future, is one to indicate that
the GPIO block has extra interrupt control registers, located after the
second GPIO bank.

For example, the rtl9300-series appears to have both the reversed port
order, and an extra "interrupt enable" register. This is not yet
implemented, since I don't currently have a device with this type of
SoC.


> > +static inline u32 realtek_gpio_imr_bits(unsigned int pin, u32
> > value)
> > +{
> > +       return ((value & 0x3) << 2*(pin % 16));
> > +}
> 
> I would explain a bit about this, obviouslt it is two bit per
> line, but it took me some time to parse, so a comment
> about the bit layout would be nice.
> 
> > +       unsigned int offset = pin/16;
> 
> Here that number appears again.
> 

I've updated the patch (and added your Reviewed-by tags) for a v2.
Hopefully this is now more obvious from the code and comments.

Best,
Sander

> The use of GPIO_GENERIC and GPIO irqchip is flawless
> and first class.
> 
> Thanks!
> Linus Walleij


