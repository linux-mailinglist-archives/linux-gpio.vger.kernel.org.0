Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E601006E8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfKRN7D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:59:03 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47292 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbfKRN7D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 08:59:03 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAIDwo8A028342;
        Mon, 18 Nov 2019 07:58:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574085530;
        bh=M4zywV29ZtLq77cA4R+/+b3aPpMR1A6bjWsDO7FMqeI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LXkytG49vXFxHq1gUofmKC33lZbsMS8OqAdHTl1bDI30GCDQgWRbyNFun/ETpDnUb
         xyVFXZGPQrIKnaRm7Lfpn6zfqA0eX63fM50OHPHS3k9+gT1uBbf3e+rdhniwGkaOh/
         T0OMsQP0NNyWj6lXUmhNTiKMFnhWmZ3snkv3dnR4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAIDwoVf027645
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 07:58:50 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 07:58:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 07:58:50 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAIDwlg7019882;
        Mon, 18 Nov 2019 07:58:47 -0600
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <t-kristo@ti.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
 <3c384b40-f353-eaec-b1d6-ba74f5338ce1@metux.net>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <faf6f7e3-b64d-1e03-9e17-90b5c352cb32@ti.com>
Date:   Mon, 18 Nov 2019 16:00:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3c384b40-f353-eaec-b1d6-ba74f5338ce1@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 18/11/2019 14.15, Enrico Weigelt, metux IT consult wrote:
> On 30.10.19 13:04, Peter Ujfalusi wrote:
> 
> Hi,
> 
>> For example any device using the same GPIO as reset/enable line can
>> reset/enable other devices, which is not something the other device might like
>> or can handle.
> 
> IMHO, for such cases, invidual drivers shouldn't fiddle w/ raw gpio's
> directly, but be connected to (gpio-based) reset controllers or
> regulators instead.

Which is a (linux) software abstraction of an electric wire coming out
from the gpio (or gpo) controller then split into two (or more branch)
and connect to external components...

> I believe, GPIO isn't the correct abstraction layer
> for such cases: it's not even IO, just O.

A GPIO pin configured as output is O ;)

> Let's sit back and rethink what the driver really wants to tell in those
> cases. For the enable lines we have:
> 
> a) make sure the device is enabled/powered
> b) device does not need to be enabled/powered anymore
> c) device must be powercycled
> 
> You see, it's actually tristate, which gets relevant if multiple devices
> on one line.

Yes. Things gets a bit blurry when a GPIO line is used to enable/gate
signals from/to a chip on top of enable/disable, like muting an
amplifier's analog output.

> Now add reset lines:
> 
> a) force device into reset state
> b) force device out of reset state
> c) allow device going into reset state (but no need to force)
> d) allow device coming out of reset state (but no need to force)

I would say that coming out of reset is always forced as there is a
reason why you want to take it out - it is going to be used.

> It even gets more weird if a device can be reset or powercycled
> externally.
> 
> hmm, not entirely trivial ...

When we have only one user of the GPIO reset/enable line we will have a)
and b) happening. If the GPIO is shared most likely the intention of the
hw design dictates c) and d)

>> For example a device needs to be configured after it is enabled, but some other
>> driver would reset it while handling the same GPIO -> the device is not
>> operational anymmore as it lost it's configuration.
> 
> Yeah, at least we need some signalling to the driver, so it can do the
> necessary steps. From the driver's PoV, it's an "foreign reset".

Notification callback for state change?

>> With the gpio-shared gpiochip we can overcome this by giving the gpio-shared
>> the role of making sure that the GPIO line only changes state when it will not
>> disturb any of the clients sharing the same GPIO line.
> 
> How exactly do we know when such disturbance can / cannot happen ?
> That would be depending on individual chips *and* how they're wired on
> the board. We'd end up with some logical multiplexer, that's board
> specific.
> 
> <snip>
> 
>> If any of the codec requests the GPIO to be high, the line will go up and will
>> only going to be low when both of them set's their shared line to low.
> 
> So, if one driver request reset, all attached devices will be reset ?
> Or if all drivers request reset, all attached devices will be reset ?

The later.

> Doesn't look so quite non-disturbing to me :o

This is what regulators and the reset framework is doing, no?

>> I have also looked at the reset framework, but again it can not be applied in a
>> generic way for GPIOs shared for other purposes 
> 
> What are the exact scenarios you have in mind ?

grep -R enable-gpios Documentation/devicetree/bindings/*

pick two random device from the output, place it on a board with shared
enable GPIO line.
I know I over simplify (or complicate) the real world use.

>> and all existing drivers must
>> be converted to use the reset framework (and adding a linux only warpper on top
>> of reset GPIOs).
> 
> Maybe a bit time consuming, but IMHO not difficult. We could add generic
> helpers for creating a reset driver on a gpio. So the drivers wouldn't
> even care about gpio itself anymore, but let the reset subsystem so it
> all (eg. look for DT node and request corresponding gpio, etc).

You mean that users would use reset_control_get_optional_shared() only
and if there is no valid reset binding that the reset core would look
for a gpio binding and instantiate a gpio-reset controller?
But before instantiating it, it would look around in some list to see if
the gpio-reset controller for the same gpio line is already exist?

> IMHO, that's something we should do nevertheless, even if it's just for
> cleaner code.

I'm not sure about that.
D1 have ENABLE pin (enable-gpios as per dt documentation),
 if the line is high, the device is enabled, if low it is disabled.

D2 have RESET pin (reset-gpios as per dt documentation),
 if the line is high, the device is enabled, if low it is disabled.

D1's driver would:
enable-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;

priv->reset = reset_control_get_optional_shared(dev, "enable");

/* Place it to reset: ENABLE pin should be pulled low */
reset_control_assert(priv->reset);
/* Remove from reset: ENABLE pin should be high */
reset_control_deassert(priv->reset);

D2's driver would:
reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;

priv->reset = reset_control_get_optional_shared(dev, "reset");

/* Place it to reset: RESET pin should be pulled low */
reset_control_assert(priv->reset);
/* Remove from reset: RESET pin should be high */
reset_control_deassert(priv->reset);

The reset framework must know somehow that the reset control for D1 is
an enable type of gpio, so it must treat it as inverted polarity while
the reset type of binding should be follow the selected active level.

Then it must protect (most likely) the deasserted state: it does not
mater if there is any assert request for the reset_control if we have
one deassert active as at least one device must be enabled.

For new dts files the virtual reset-gpio controller node can be present
and the level of assert and deassert is told to it via the gpio binding.

Something like this?

> After that we could put any kind of funny logic behind the scenes (eg.
> one could connect the reset pin to a spare uart instead of gpio, etc),
> w/o ever touching the individual drivers.

Not sure if I follow you here.

On the other hand the gpio line itself can be seen as a regultator
itself (3.3V most of the time) so in theory all GPIOs can be regulators
as well, but regulator framework protects the >0 volt state while there
are devices which can be enabled when the ENABLE/RST pin is pulled low.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
