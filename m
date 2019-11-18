Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13B461006A2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfKRNig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:38:36 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42357 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfKRNif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 08:38:35 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iWhEe-0007H7-BQ; Mon, 18 Nov 2019 14:38:32 +0100
Message-ID: <44e94274debadbd778ac529497b77ec1bc52b097.camel@pengutronix.de>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        m.szyprowski@samsung.com, broonie@kernel.org, t-kristo@ti.com,
        mripard@kernel.org, devicetree@vger.kernel.org
Date:   Mon, 18 Nov 2019 14:38:31 +0100
In-Reply-To: <3c384b40-f353-eaec-b1d6-ba74f5338ce1@metux.net>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
         <3c384b40-f353-eaec-b1d6-ba74f5338ce1@metux.net>
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

Hi,

On Mon, 2019-11-18 at 13:15 +0100, Enrico Weigelt, metux IT consult wrote:
> On 30.10.19 13:04, Peter Ujfalusi wrote:
[...]
> Let's sit back and rethink what the driver really wants to tell in those
> cases. For the enable lines we have:
> 
> a) make sure the device is enabled/powered
> b) device does not need to be enabled/powered anymore
> c) device must be powercycled
> 
> You see, it's actually tristate, which gets relevant if multiple devices
> on one line.

Is this just a GPIO-controlled power domain?

> Now add reset lines:
> 
> a) force device into reset state
> b) force device out of reset state
> c) allow device going into reset state (but no need to force)
> d) allow device coming out of reset state (but no need to force)
> 
> It even gets more weird if a device can be reset or powercycled
> externally.

And some drivers just require "b), but device must have been in reset
state at any point in the past".

> hmm, not entirely trivial ...
> 
> > For example a device needs to be configured after it is enabled, but some other
> > driver would reset it while handling the same GPIO -> the device is not
> > operational anymmore as it lost it's configuration.
> 
> Yeah, at least we need some signalling to the driver, so it can do the
> necessary steps. From the driver's PoV, it's an "foreign reset".

This could become complicated fast. It's trivial to add a notification
mechanism and to let notified drivers veto the foreign reset. But what
if driver (a) wants to reset its hardware and driver (b) could save its
state and handle being reset, but only after some currently active
transfer is finished. Now whether the reset succeeds would depend on how
long driver (b) expects its transfer to last and on how long driver (a)
would be willing to wait for the reset?

[...]
> > and all existing drivers must
> > be converted to use the reset framework (and adding a linux only warpper on top
> > of reset GPIOs).
> 
> Maybe a bit time consuming, but IMHO not difficult. We could add generic
> helpers for creating a reset driver on a gpio. So the drivers wouldn't
> even care about gpio itself anymore, but let the reset subsystem so it
> all (eg. look for DT node and request corresponding gpio, etc).
> 
> IMHO, that's something we should do nevertheless, even if it's just for
> cleaner code.

We can't change the current DT bindings though. One thing we could do is
teach the reset controller framework to handle reset-gpios properties
itself. Still, that wouldn't help with the enable and powerdown GPIOs.

> After that we could put any kind of funny logic behind the scenes (eg.
> one could connect the reset pin to a spare uart instead of gpio, etc),
> w/o ever touching the individual drivers.

I'm not convinced at all that this is a good thing to do behind the
scenes. For those cases I'd prefer adding a "resets" property to the
device bindings and explicitly describing a "uart-reset-controller" in
the device tree, see for example the "pwm-clock".

regards
Philipp

