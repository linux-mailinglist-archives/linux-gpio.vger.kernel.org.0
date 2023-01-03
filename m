Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B50865BFEF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jan 2023 13:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237415AbjACMfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Jan 2023 07:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjACMfB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2023 07:35:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696D4FD38;
        Tue,  3 Jan 2023 04:34:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 894A2108;
        Tue,  3 Jan 2023 13:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672749296;
        bh=wepXydtjzK/muuQNNIk6gR37qVRHqiHnsbuxffbt3Fs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RDUyM+QIxqu/rRF500zbd/WlaWsvPAoPVdHrG86tqouRqt0rHKpCfXDcxi+OiAiu3
         3+QHB5mfzshagcMV1OUzTKMR5z+EbE4l0MYP+Qe2f0grBFqP/IjPXxdqvly8qCuaha
         zCXhmsYV5H2U0YLdVtsItSdPVTz4FH2AzBY49+Dw=
Date:   Tue, 3 Jan 2023 14:34:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpio: Add optional ramp-up delay
 property
Message-ID: <Y7Qg7DzyJkdFGsyz@pendragon.ideasonboard.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
 <CACRpkdZ2G=HUTBMpXJrXeSh3kYgQQc8p8zaJZPL71HWA9362ZA@mail.gmail.com>
 <Y6DtQ7PXPZ809P4C@pendragon.ideasonboard.com>
 <2798796.Y6S9NjorxK@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2798796.Y6S9NjorxK@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 03, 2023 at 12:56:38PM +0100, Alexander Stein wrote:
> Am Dienstag, 20. Dezember 2022, 00:01:23 CET schrieb Laurent Pinchart:
> > On Thu, Dec 15, 2022 at 11:56:57AM +0100, Linus Walleij wrote:
> > > On Tue, Dec 13, 2022 at 12:45 PM Laurent Pinchart wrote:
> > > > The circuit we're looking at is
> > > > 
> > > >   +----------+           +-----------+
> > > >   | SoC      |           |    VCC    |
> > > >   |          |           |     _     |
> > > >   |          |           |    | | R  |
> > > >   |          |           |    |_|    |
> > > >   |          |           |     |     |
> > > >   |      [IOx|-----+-----|EN]--+     |
> > > >   |          |     |     | SN65DSI83 |
> > > >   +----------+    --- C  +-----------+
> > > >                   ---
> > > >                    -
> > > >                   GND
> > > > 
> > > > The IOx pin is an open-drain output, the board has a 470nF capacitor to
> > > > ground, and the SN65DSI83 has an internal pull-up off 200kΩ. This gives
> > > > an RC time constant of 94ms, far from being negligible.
> > > > 
> > > > The delay is caused by the combination of the open-drain nature of the
> > > > output (an intrinsic property of the GPIO controller), the pull-up
> > > > resistor (an intrinsic property of the SN65DSI83) and the capacitor on
> > > > the line (a property of the board). DT is notoriously bad at modelling
> > > > this kind of setup.
> > > 
> > > Yeah :/
> > > 
> > > It's not like we don't model discrete electronics, we do that a lot,
> > > but as you say, it is really hard to know where to draw the line
> > > in cases like this.
> > > 
> > > > The alternative I proposed, adding a "GPIO delay" DT node to model this,
> > > > would also offer a centralized solution to the problem, but with
> > > > additional complexity both at probe time and runtime.
> > > 
> > > I have a slight preference for this, as it will be very explicit in the
> > > device tree and we can just put all the code inside its own file and
> > > depend on GPIO_OF so other HW description systems do not
> > > need to include it.
> > > 
> > > At the same time it feels a bit overengineered, so maybe just adding
> > > this delay as in the patch with some strings attached like comments
> > > and docs is yet the best. It feels like we need some more input to
> > > reach consensus.
> > > 
> > > > The regulator delays model the intrinsic delays when enabling or
> > > > disabling a regulator, and they should stay. They address a different
> > > > problem.
> > > 
> > > OK right. But someone not knowing exactly what they are doing
> > > will end up abusing the delay property on the delay line
> > > also for this delay. The risk of that is lesser with a separate
> > > delay box.
> > 
> > That may be true, but I think we can also try to catch abuses in
> > reviews. I would be a bit sad if we made life more difficult (and less
> > efficient at runtime too) for legitimate users just because we are
> > worried about abuses.
> 
> What is a legitimate user for you? Given the example in v2 of this series it's 
> clear that this feature is an opt-in, both for the DT node as well as for 
> specifying a delay.
> Another benefit of using a dedicated driver: It also automatically handles 
> things like setting multiple GPIOs at once.

Your use case is totally legitimate I think. An illegitimate case would
be someone modelling the internal enable delay of a regulator controlled
by a GPIO as a GPIO delay instead of using the regulator enable delay DT
property defined by the regulators bindings.

> > Another thing I've been thinking about is that we may not always want to
> > wait for the GPIO delay. Some consumers may not care when the GPIO line
> > reaches the desired state as long as it eventually does, or maybe they
> > need to perform multiple operations (such as enabling/disabling
> > regulators and/or clocks) and only need a synchronization point for a
> > group of operations. All that would be pretty hard to handle, and maybe
> > it's a problem we'll look at only when needed (and hopefully never).
> 
> If you don't care about rising time, do not use gpio-delay for that GPIO, or 
> just don't specify a ramp-up delay in the gpio-cells, aka setting to 0.
> The more complex synchronisation example you mentioned probably needs a 
> similar dedicated driver for grouping those resources.

You're right that in cases where there is a single consumer, and the
consumer is well known, and the fact that it doesn't care about rising
time is an intrinsic property of that consumer, then DT should simply
not specify any delay. For more complex cases, I'd say it's likely
overkill to try and design a solution now without real use cases.

-- 
Regards,

Laurent Pinchart
