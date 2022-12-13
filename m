Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098AC64B8EF
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 16:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236341AbiLMPuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 10:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236340AbiLMPtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 10:49:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA4518E26;
        Tue, 13 Dec 2022 07:47:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 074E57C5;
        Tue, 13 Dec 2022 16:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670946465;
        bh=Hh7Byyc+wRRVtOFshuzLhuZNKJvSEOwdnUKnfVvnjB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u0OiRnu3WJJ/IltBW8gS5CMc7FK5BlQC0ywXce53gd7DqgV+WeoVEHJE049BmDrEu
         aMppFcDIHU+bLYeONVl0ZPLi8DY+mQxbJp/Pvj5OPJD7U/hrx2nKRmqihn09a3oK4N
         L2kHEopEGW9vwp+r9pihOyCmvqK1UDYk6HFcs8jE=
Date:   Tue, 13 Dec 2022 17:47:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH 0/3] gpiolib: ramp-up delay support
Message-ID: <Y5ienUu9qHFmR2Yv@pendragon.ideasonboard.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
 <CAL_JsqLeqpMuRkvpT2-x5q+8e4bHf4oLDML2QqCOgRMAg8=CsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLeqpMuRkvpT2-x5q+8e4bHf4oLDML2QqCOgRMAg8=CsA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Tue, Dec 13, 2022 at 08:20:57AM -0600, Rob Herring wrote:
> On Mon, Dec 12, 2022 at 4:35 AM Alexander Stein wrote:
> >
> > Hi all,
> >
> > this series is an RFC for a general approach to solve the issue at [1]. While
> > a device specific property works as well, a more generic approach is preferred.
> > In short: When enabling a GPIO the actual ramp-up time might be (much) bigger
> > than what software usually assume, in my case >100ms. Adding a delay to each
> > driver is cumbersome.
> 
> At least for DT, I think this belongs (if at all) in the consumers,
> rather than a producer property. The options there are
> 'foo-gpios-ramp-us' for 'foo-gpios' or add some delay bits to GPIO
> flags.

My main requirement is to handle these properties in a central place,
without having to patch individual drivers, so this would work for me.

> We already have some of the former for various 'generic' power
> sequencing related delays. Of course, there's no real pattern to them
> as they all get added as we go without much foresight. In this case
> even, there are 4 possible delays: pre and post ramp up and down.
> 
> > Instead the (optional) ramp-up delay is added to each gpio_desc. The delays can
> > be specified per gpio-controller, similar to 'gpio-line-names'. Actually the
> > parsing code is almost a 1:1 copy of devprop_gpiochip_set_names(). Due to
> > (temporary) memory allocation, I opted for a separate function, there is code
> > duplication, but handling both properties in a single function seemed too
> > tedious, let alone the to be added ramp-down delays.
> >
> > This feature could also be added as a callback in gpio_chip, but the callbacks
> > have to be added to each driver then. I would prefer a single one-fits-all
> > implementation and another indirection in the GPIO call chain.
> >
> > Laurent suggest to add a GPIO delay node in DT. IMHO this increased the DT
> > complexity unnecessarily. But comments are welcome.
> >
> > The following 3 patches are a proof-of-concept on my platform, consisting of:
> > Patch 1 is the proposed bindings and straight forward.
> > Patch 2 is the current implementation
> > Patch 3 is an actual usage example for specifying the delays
> >
> > TODO:
> > 1. Adding ramp-down delays (Just the inverse copy of ramp-up delay)
> > 2. Should these delays take active low flags into account?
> > 3. How to deal with setting multiple GPIOs at once?
> >
> > I skipped 1. for now, because this is just a copy with ramp-up being replaced
> > with ramp-down.
> >
> > I'm not that well versed in gpiolib code, so I'm not sure if I got all placed
> > where GPIOs are set. So patch 2 might be incomplete.
> >
> > For now I skipped setting multiple GPIOs at once completely, so to get some
> > feedback on this approach. A possible solution is to check for the bigest delay
> > in the set and use that for all afterwards. But I'm not sure about the overhead
> > in this case.
> >
> > I hope there is some feedback. While thinking about this issue appears to be
> > more widespread than I expected.
> 
> Many/most GPIO controllers can read the actual state of an output
> (IIRC, i.MX ctrlr can). Perhaps that capability could be used to delay
> until the state of the signal matches the set state. And you'd
> probably want to measure how long that took and then add some more
> time based on it. This of course gets into the electricals of at what
> levels a low or high state will register. If you can't read the state,
> then you would be stuck with some maximum timeout.

-- 
Regards,

Laurent Pinchart
