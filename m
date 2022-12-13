Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAE264B428
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 12:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbiLML01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 06:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234874AbiLMLZy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 06:25:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338441B78B;
        Tue, 13 Dec 2022 03:25:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7FC74A7;
        Tue, 13 Dec 2022 12:25:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670930716;
        bh=Sgvpl3nh6q9qheL5iuGlANUL6ZF9LyW9S2MfR32UuGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nE94/Wiam1Cj7iupbOnouKXUUpl3ndxoefRwc3uSkV3Fgvuq1vRNmZ9wvo8Ow/Rkv
         Adp6xe6E3UWfdJ+1RKZ3z1iQ5u0c6NQUkEZzG97q+WMN7QpxSQDhaN+4pLKFN3ZWYX
         y3GaA3LG8ewm45ggJbNCUMGmuNR6Zu8YiaxzecV4=
Date:   Tue, 13 Dec 2022 13:25:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH 0/3] gpiolib: ramp-up delay support
Message-ID: <Y5hhGlITgIM9M01N@pendragon.ideasonboard.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
 <Y5chUvK+SLMpm9XY@pendragon.ideasonboard.com>
 <2506013.ElGaqSPkdT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2506013.ElGaqSPkdT@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alexander,

On Tue, Dec 13, 2022 at 08:49:06AM +0100, Alexander Stein wrote:
> Am Montag, 12. Dezember 2022, 13:40:50 CET schrieb Laurent Pinchart:
> > On Mon, Dec 12, 2022 at 11:35:22AM +0100, Alexander Stein wrote:
> > > Hi all,
> > > 
> > > this series is an RFC for a general approach to solve the issue at [1].
> > > While
> >
> > I'm impressed by how fast you came up with a solution :-)
> > 
> > > a device specific property works as well, a more generic approach is
> > > preferred. In short: When enabling a GPIO the actual ramp-up time might
> > > be (much) bigger than what software usually assume, in my case >100ms.
> > > Adding a delay to each driver is cumbersome.
> > > Instead the (optional) ramp-up delay is added to each gpio_desc. The
> > > delays can be specified per gpio-controller, similar to
> > > 'gpio-line-names'. Actually the parsing code is almost a 1:1 copy of
> > > devprop_gpiochip_set_names().
> >
> > While I like consistency, I wonder if it wouldn't be better in this case
> > to use a list of <gpio-number delay> cells in gpio-ramp-up-delays-us. In
> > typical use cases, very few GPIOs will need a delay, and a GPIO
> > controller could support a very large number of GPIOs, which would make
> > your current proposal cumbersome.
> 
> That's a good idea. I would even go a step further to specify both ramp-up and 
> ramp-down in one cell, e.g. <gpio-number ramp-up ramp-down>. This way a second 
> property is not needed.
> 
> > > Due to
> > > (temporary) memory allocation, I opted for a separate function, there is
> > > code duplication, but handling both properties in a single function
> > > seemed too tedious, let alone the to be added ramp-down delays.
> > > 
> > > This feature could also be added as a callback in gpio_chip, but the
> > > callbacks have to be added to each driver then. I would prefer a single
> > > one-fits-all implementation and another indirection in the GPIO call
> > > chain.
> > 
> > Agreed.
> > 
> > > Laurent suggest to add a GPIO delay node in DT. IMHO this increased the DT
> > > complexity unnecessarily. But comments are welcome.
> > 
> > It's an alternative approach that could be considered if this one is
> > rejected, but I have a preference for your solution.
> > 
> > > The following 3 patches are a proof-of-concept on my platform, consisting
> > > of: Patch 1 is the proposed bindings and straight forward.
> > > Patch 2 is the current implementation
> > > Patch 3 is an actual usage example for specifying the delays
> > > 
> > > TODO:
> > > 1. Adding ramp-down delays (Just the inverse copy of ramp-up delay)
> > > 2. Should these delays take active low flags into account?
> > 
> > How so ?
> 
> Given the name ramp-up (& ramp-down) I would assume they affect the voltage 
> low -> high change (resp. high -> low), not just gpiod_set_value(..., 1).

Good point. They should indeed.

> > > 3. How to deal with setting multiple GPIOs at once?
> > > 
> > > I skipped 1. for now, because this is just a copy with ramp-up being
> > > replaced with ramp-down.
> > > 
> > > I'm not that well versed in gpiolib code, so I'm not sure if I got all
> > > placed where GPIOs are set. So patch 2 might be incomplete.
> > > 
> > > For now I skipped setting multiple GPIOs at once completely, so to get some
> > > feedback on this approach. A possible solution is to check for the bigest
> > > delay in the set and use that for all afterwards. But I'm not sure about
> > > the overhead in this case.
> > 
> > I assume you're talking about the gpiod_set_array_value() API. That
> > sounds OK as an initial implementation, a caller of that function needs
> > to be prepared for the GPIOs being set in a random order due to hardware
> > delays, so it shouldn't break the API contract. I would however state
> > this explicitly in the function documentation.
> 
> Okay, that seems sensible. Will do it.
> 
> > > I hope there is some feedback. While thinking about this issue appears to
> > > be more widespread than I expected.
> > > 
> > > Best regards,
> > > Alexander
> > > 
> > > [1] https://lore.kernel.org/all/20221209083339.3780776-1-alexander.stein@ew.tq-group.com/
> > >
> > > Alexander Stein (3):
> > >   dt-bindings: gpio: Add optional ramp-up delay property
> > >   gpiolib: Add support for optional ramp-up delays
> > >   arm64: dts: mba8mx: Add GPIO ramp-up delays
> > >  
> > >  .../devicetree/bindings/gpio/gpio.txt         | 22 +++++
> > >  arch/arm64/boot/dts/freescale/mba8mx.dtsi     |  5 ++
> > >  drivers/gpio/gpiolib.c                        | 80 +++++++++++++++++++
> > >  drivers/gpio/gpiolib.h                        |  3 +
> > >  4 files changed, 110 insertions(+)

-- 
Regards,

Laurent Pinchart
