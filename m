Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600F2E9C4E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 14:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfJ3NbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 09:31:14 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56058 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJ3NbN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 09:31:13 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDV5vB101659;
        Wed, 30 Oct 2019 08:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572442265;
        bh=STjwO10Amw2PZ9XYXEda6DiaqThl/EwMnKhScqY6AdQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TYqPsN7NUV/OLsDdttH86+fZ8BHWyOi4WuAyZ+QF4jEKxX4ZuYyo+0SD6RSz4B8U8
         RpH805j8GTmIQS8kbR+fnlsQZNv7QZkBlK5Kbd+BL6GDgeGFDxxhDrBBOAto4WMPQ+
         G5k3JfpVxKkQbnkwrKfzFSsCtkd4laKkTxcqGMXM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UDV4l4062652
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 08:31:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 08:30:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 08:30:51 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UDV1M8022289;
        Wed, 30 Oct 2019 08:31:02 -0500
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Rob Herring <robh+dt@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
 <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
Date:   Wed, 30 Oct 2019 15:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 30/10/2019 15.12, Rob Herring wrote:
> On Wed, Oct 30, 2019 at 7:03 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>
>> Hi,
>>
>> The shared GPIO line for external components tends to be a common issue and
>> there is no 'clean' way of handling it.
>>
>> I'm aware of the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag, which must be provided when
>> a driver tries to request a GPIO which is already in use.
>> However the driver must know that the component is going to be used in such a
>> way, which can be said to any external components with GPIO line, so in theory
>> all drivers must set this flag when requesting the GPIO...
>>
>> But with the GPIOD_FLAGS_BIT_NONEXCLUSIVE all clients have full control of the
>> GPIO line. For example any device using the same GPIO as reset/enable line can
>> reset/enable other devices, which is not something the other device might like
>> or can handle.
>> For example a device needs to be configured after it is enabled, but some other
>> driver would reset it while handling the same GPIO -> the device is not
>> operational anymmore as it lost it's configuration.
>>
>> With the gpio-shared gpiochip we can overcome this by giving the gpio-shared
>> the role of making sure that the GPIO line only changes state when it will not
>> disturb any of the clients sharing the same GPIO line.
> 
> Why can't we just add a shared flag like we have for interrupts?
> Effectively, we have that for resets too, it's just hardcoded in the
> the drivers.

This would be kind of the same thing what the
GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
fixed-regulators afaik.

But let's say that a board design will pick two components (C1 and C2)
and use the same GPIO line to enable them. We already have the drivers
for them and they are used in boards already.

Both needs the GPIO line to be high for normal operation.
One or both of them needs register writes after they are enabled.

During boot both requests the GPIO (OUTPUT_LOW) and sets it high, then
run the register setup.

C1 request GPIO (LOW)
C1 gpio_set(1)
C1 register writes
C2 requests GPIO (LOW)
 C1 placed to reset and looses the configuration
C2 gpio_set(1)
 C1 also enabled
C2 register writes

At this point C2 is operational, C1 is not.

In shared GPIO case the GPIO should be handled like a regulator with a
twist that the 'sticky' state of the GPIO might be low or high depending
on the needs of the components it is connected to.

The shared GPIO line is a board design quirk and basically any device
which have reset/enable GPIO must be able to work in a situation when
they are sharing that line with other components and the driver should
not know much about this small detail.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
