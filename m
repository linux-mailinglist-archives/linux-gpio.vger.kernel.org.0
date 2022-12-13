Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041F264B467
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 12:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234707AbiLMLpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 06:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbiLMLpc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 06:45:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F93B59;
        Tue, 13 Dec 2022 03:45:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 760134A7;
        Tue, 13 Dec 2022 12:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670931928;
        bh=w9dLZnMEZZ//q+8/CynjxWUeAS8/qVNnlXid94PyXUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vlqutjs29i7EJ9plVVq/ewmjpTKwyAOUjMzXSWal2YcImSn+XumM0rnDh76kIbVvq
         PIWxXcICmUfo6rjYNAeNtsV+x8UGxwyJYzz50e0QsiVHMn8ywwmvZkTY27+SH0v21r
         B8MSEgMm5sV4Hg8PQUnJljwr1SE1qEvZ4MtUWAwc=
Date:   Tue, 13 Dec 2022 13:45:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpio: Add optional ramp-up delay
 property
Message-ID: <Y5hl1Sb8csSkbrDh@pendragon.ideasonboard.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
 <20221212103525.231298-2-alexander.stein@ew.tq-group.com>
 <CACRpkdYioW1GROHFxA1vuAEiXqHh6fAu5CXNLcTvW_w3mWjSPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYioW1GROHFxA1vuAEiXqHh6fAu5CXNLcTvW_w3mWjSPw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Dec 13, 2022 at 10:08:19AM +0100, Linus Walleij wrote:
> On Mon, Dec 12, 2022 at 11:35 AM Alexander Stein wrote:
> 
> > This adds a ramp-up delay (in us) for adding a delay after enabling
> > GPIO. This is necessary if the ramp-up time is increased by some external
> > components. Usually this is quite fast, but certain combinations can
> > increase this to grater than 100ms.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> (...)
> > +gpio-controller@00000000 {
> > +       compatible = "foo";
> > +       reg = <0x00000000 0x1000>;
> > +       gpio-controller;
> > +       #gpio-cells = <2>;
> > +       gpio-ramp-up-delays-us = <0>, <0>, <0>, <0>,
> > +                                <0>, <0>, <120000>, <0>,
> > +                                <0>, <0>, <0>, <0>,
> > +                                <0>, <0>, <0>, <0>;
> 
> Why would this be different per-gpio-line?
> 
> If this should be on the GPIO controller, this should be the ramp-up for the
> GPIO controller output itself, not for the random electronics that may or may
> not be attached to the line.

The goal of this series is to cover the delay of the RC filter on the
signal between the GPIO controller and the GPIO consumer.

> Otherwise the ramp-up should certainly be on the consumer side. And that
> seems very much like what is going on here.

The circuit we're looking at is

  +----------+           +-----------+
  | SoC      |           |    VCC    |
  |          |           |     |     |
  |          |           |     _     |
  |          |           |    | | R  |
  |          |           |    |_|    |
  |          |           |     |     |
  |      [IOx|-----+-----|EN]--+     |
  |          |     |     |           |
  |          |     |     | SN65DSI83 |
  +----------+    --- C  +-----------+
                  ---
		   |
		   -
		  GND

The IOx pin is an open-drain output, the board has a 470nF capacitor to
ground, and the SN65DSI83 has an internal pull-up off 200kΩ. This gives
an RC time constant of 94ms, far from being negligible.

The delay is caused by the combination of the open-drain nature of the
output (an intrinsic property of the GPIO controller), the pull-up
resistor (an intrinsic property of the SN65DSI83) and the capacitor on
the line (a property of the board). DT is notoriously bad at modelling
this kind of setup.

Note that we would have a similar issue with a GPIO controller that
would drive the signal actively and a consumer without an internal
pull-up if the board had an RC filter on the line.

Alexander started with a patch that added a ti,enable-delay-us property
to the SN65DSI83 DT binding. I don't think that's a good idea, as the
issue is far from being specific to the SN65DSI83, patching all GPIO
consumers as needed to support signal propagation delays doesn't scale.
Patching every GPIO controller driver would be equally bad. I've thus
proposed modelling this with a standard property on the GPIO provider
side, handled by gpiolib, to have a centralized solution.

The alternative I proposed, adding a "GPIO delay" DT node to model this,
would also offer a centralized solution to the problem, but with
additional complexity both at probe time and runtime.

> Consider a gpio-regulator:
> 
> 
> Documentation/devicetree/bindings/regulator/fixed-regulator.yamlproperties:
>   compatible:
>     enum:
>       - regulator-fixed
>       - regulator-fixed-clock
>       - regulator-fixed-domain
> 
>   regulator-name: true
> 
>   gpio:
>     description: gpio to use for enable control
>     maxItems: 1
> (...)
>   startup-delay-us:
>     description: startup time in microseconds
> 
>   off-on-delay-us:
>     description: off delay time in microseconds
> 
> 
> There is one consumer, and if you add ramp-up and ramp-down delays to the
> GPIO lines like this you have just created two ways of doing the same thing.
> When there is a ramp-up for a regulator now the used can choose to put it
> on the regulator or on the gpio.

The regulator delays model the intrinsic delays when enabling or
disabling a regulator, and they should stay. They address a different
problem.

> This is clearly ambiguous so NAK to this approach. IMO the property goes
> on the consumer due to precedence.
> 
> [Other context]
> > Laurent suggest to add a GPIO delay node in DT. IMHO this increased the DT
> > complexity unnecessarily. But comments are welcome.
> 
> If the consumer subsystem don't want it, I guess this is where you would
> have to go in and add more DT descriptions for the electronics on the
> board, which I understand is a bit frustrating, and it is hard to find the
> right trade-off. It makes me think about the classical problem "how long is
> the coast of Britain?" by Benoit Mandelbrot:
> https://en.wikipedia.org/wiki/How_Long_Is_the_Coast_of_Britain%3F_Statistical_Self-Similarity_and_Fractional_Dimension
> 
> The DT maintainers will have the final word on it I guess.

-- 
Regards,

Laurent Pinchart
