Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22E5CF1327
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 11:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbfKFKAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 05:00:39 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47097 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730019AbfKFKAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 05:00:38 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iSI77-000065-LM; Wed, 06 Nov 2019 11:00:33 +0100
Message-ID: <576d5e496a79c00857820289f8f772d3bb090e35.camel@pengutronix.de>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Date:   Wed, 06 Nov 2019 11:00:32 +0100
In-Reply-To: <e209692a-18a3-4079-fda7-1cc7b6b74667@ti.com>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
         <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
         <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
         <20191030141736.GN4568@sirena.org.uk>
         <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com>
         <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
         <1258a5bf-a829-d47a-902f-bf2c3db07513@ti.com>
         <CAL_Jsq+V0oAdVCaW+S12CUa4grCJhZD8OGDeu=0ohcGgxOkPVg@mail.gmail.com>
         <5669a4c1-2bc1-423b-1407-073317f7df7e@ti.com>
         <CAL_JsqJbhG+-zVs9bjHg8asGuM1+FNnGJ0xx7qcPBwuRX35ijw@mail.gmail.com>
         <CACRpkdbiG5mt3WGEeHWsu-L3dzQJUQjxjGwQXK0cLgZNZ74yWg@mail.gmail.com>
         <109f9ff2-81e0-6d3d-db60-d48cb0a4e74f@ti.com>
         <ffb8e042-7f22-0e6e-f855-afa0dc3236bb@ti.com>
         <61c8c126-3061-e297-8dab-7333316b0754@ti.com>
         <e209692a-18a3-4079-fda7-1cc7b6b74667@ti.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2019-11-06 at 11:23 +0200, Peter Ujfalusi wrote:
> 
> On 05/11/2019 20.07, Grygorii Strashko wrote:
> > > > (but hey - if this is boot only then gpio-hogs should work. Are they?)
> > > 
> > > That is another thing which almost works ;)
> > > w/o gpio binding deferred probing is not possible if the GPIO controller
> > > is probed later.
> > > In some cases it might be even impossible to make sure that the GPIO
> > > controller would probe first (GPIO extender on different i2c bus than
> > > the user(s) of the gpio line)
> > > In some cases moving around nodes in DT might artificially make things
> > > work, but then someone compiles the expander as module, or some 'small'
> > > change in kernel and the probe order on the bus changes.
> > > I don't think it is a valid thing to have commits on the DT files
> > > saying: move the expander front/after the hog affected user since since
> > > Monday the probe order has changed. Then move it back two weeks later ;)
> > > 
> > 
> > Ok. Above sounds like real problem. The implicit dependence is exist,
> > but can't
> > be resolved if any driver depends on gpio-hog of some gpio-controller.
> > Probe deferring of gpio-controller will not lead to probe differing of
> > dependent driver.
> > 
> > Question: will gpio-hog mechanism resolve your case if it works (and
> > probe differing issues)?
> 
> I see gpio-hog to fulfill different role, use cases. It is more like
> controlling muxes on boards to select between different exclusive
> features. Things like route the I2S lines to analog codec or HDMI, route
> RGB video to LCD panel or to HDMI, etc.
> 
> But, if it would work it could be used for components which can be
> enabled all the time. On the other hand, if a device has reset/enable
> line then the driver should have a way to control it.

I wonder if it would be useful to differentiate between required and
suggested state in the consumer facing GPIO API for nonexclusive GPIOs.

A driver that is ok with the enable line going into active state at any
time while the device is suspended could use

	gpiod_set_value(en_gpio, 1);

to resume, but

	gpiod_politely_suggest_value(en_gpio, 0);

or similar to suspend, and the core could allow other drivers to
override this state. Similarly to how the regulator framework allows
consumers to set a voltage range, and the core decides on the actual
voltage that fits the constraints.

regards
Philipp

