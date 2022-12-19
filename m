Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE6965169E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Dec 2022 00:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbiLSXGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Dec 2022 18:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbiLSXEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Dec 2022 18:04:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A26D17068;
        Mon, 19 Dec 2022 15:01:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABF178A4;
        Tue, 20 Dec 2022 00:01:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671490887;
        bh=Avpyi39igdnb4TOZX9U00SKRVc/33vt28tC5r6iQrp4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mMJP3kUXuhzuG+//CC6jSG2NcVcb0nZtY4Cr13hYsP2LA7tTYrm/UMACmXWoN/dWU
         0+pNuFU+LwKpqPRqP3lPP89/MBqtan1Kp0w9xR+P3cDbT51I7Sxw0qAsNGS4Maj9XI
         59CB+LetKKEGqPubNCjUfl+t0oG/rknuAvoPiTP0=
Date:   Tue, 20 Dec 2022 01:01:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpio: Add optional ramp-up delay
 property
Message-ID: <Y6DtQ7PXPZ809P4C@pendragon.ideasonboard.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
 <20221212103525.231298-2-alexander.stein@ew.tq-group.com>
 <CACRpkdYioW1GROHFxA1vuAEiXqHh6fAu5CXNLcTvW_w3mWjSPw@mail.gmail.com>
 <Y5hl1Sb8csSkbrDh@pendragon.ideasonboard.com>
 <CACRpkdZ2G=HUTBMpXJrXeSh3kYgQQc8p8zaJZPL71HWA9362ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ2G=HUTBMpXJrXeSh3kYgQQc8p8zaJZPL71HWA9362ZA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 15, 2022 at 11:56:57AM +0100, Linus Walleij wrote:
> Hi Laurent,
> 
> thanks for the detailed brief!
> 
> On Tue, Dec 13, 2022 at 12:45 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> 
> > The circuit we're looking at is
> >
> >   +----------+           +-----------+
> >   | SoC      |           |    VCC    |
> >   |          |           |     |     |
> >   |          |           |     _     |
> >   |          |           |    | | R  |
> >   |          |           |    |_|    |
> >   |          |           |     |     |
> >   |      [IOx|-----+-----|EN]--+     |
> >   |          |     |     |           |
> >   |          |     |     | SN65DSI83 |
> >   +----------+    --- C  +-----------+
> >                   ---
> >                    |
> >                    -
> >                   GND
> >
> > The IOx pin is an open-drain output, the board has a 470nF capacitor to
> > ground, and the SN65DSI83 has an internal pull-up off 200kΩ. This gives
> > an RC time constant of 94ms, far from being negligible.
> >
> > The delay is caused by the combination of the open-drain nature of the
> > output (an intrinsic property of the GPIO controller), the pull-up
> > resistor (an intrinsic property of the SN65DSI83) and the capacitor on
> > the line (a property of the board). DT is notoriously bad at modelling
> > this kind of setup.
> 
> Yeah :/
> 
> It's not like we don't model discrete electronics, we do that a lot,
> but as you say, it is really hard to know where to draw the line
> in cases like this.
> 
> > The alternative I proposed, adding a "GPIO delay" DT node to model this,
> > would also offer a centralized solution to the problem, but with
> > additional complexity both at probe time and runtime.
> 
> I have a slight preference for this, as it will be very explicit in the
> device tree and we can just put all the code inside its own file and
> depend on GPIO_OF so other HW description systems do not
> need to include it.
> 
> At the same time it feels a bit overengineered, so maybe just adding
> this delay as in the patch with some strings attached like comments
> and docs is yet the best. It feels like we need some more input to
> reach consensus.
> 
> > The regulator delays model the intrinsic delays when enabling or
> > disabling a regulator, and they should stay. They address a different
> > problem.
> 
> OK right. But someone not knowing exactly what they are doing
> will end up abusing the delay property on the delay line
> also for this delay. The risk of that is lesser with a separate
> delay box.

That may be true, but I think we can also try to catch abuses in
reviews. I would be a bit sad if we made life more difficult (and less
efficient at runtime too) for legitimate users just because we are
worried about abuses.

Another thing I've been thinking about is that we may not always want to
wait for the GPIO delay. Some consumers may not care when the GPIO line
reaches the desired state as long as it eventually does, or maybe they
need to perform multiple operations (such as enabling/disabling
regulators and/or clocks) and only need a synchronization point for a
group of operations. All that would be pretty hard to handle, and maybe
it's a problem we'll look at only when needed (and hopefully never).

-- 
Regards,

Laurent Pinchart
