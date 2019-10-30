Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAAEE9D91
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 15:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfJ3Oag (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 10:30:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39410 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfJ3Oag (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 10:30:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UEURxE009017;
        Wed, 30 Oct 2019 09:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572445827;
        bh=sjHkzET0W6fegbqYYxLj/nvwD1jevn9Rf6o8Hy+EKt0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nsVLguS5Xvh99O0z62zWL3lSC+MN9kBVqEmmfnm/O7m0YbI3dzpEJ9/LF79owtHnr
         usMVQ1IBXPcMRGu466VKLjcudML79XSK0hQ0OPj4xgGFlq32DI6Skv2fjFvoEEp7h9
         Sfg1kNWjOF/itYDrveMdsYt3Qy5EDOg9xKn84xnk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UEURZJ063645;
        Wed, 30 Oct 2019 09:30:27 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 09:30:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 09:30:14 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UEUNHU130877;
        Wed, 30 Oct 2019 09:30:24 -0500
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Mark Brown <broonie@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
 <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
 <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
 <20191030141736.GN4568@sirena.org.uk>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com>
Date:   Wed, 30 Oct 2019 16:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030141736.GN4568@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 30/10/2019 16.17, Mark Brown wrote:
> On Wed, Oct 30, 2019 at 03:32:09PM +0200, Peter Ujfalusi wrote:
>> On 30/10/2019 15.12, Rob Herring wrote:
> 
>>> Why can't we just add a shared flag like we have for interrupts?
>>> Effectively, we have that for resets too, it's just hardcoded in the
>>> the drivers.
> 
>> This would be kind of the same thing what the
>> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
>> fixed-regulators afaik.
> 
> The theory with that was that any usage of this would need the
> higher level code using the GPIO to cooperate so they didn't step
> on each other's toes so the GPIO code should just punt to it.

But from the client driver point of view a GPIO is still GPIO and if the
components are unrelated then it is hard to patch things together from
the top.

>> But let's say that a board design will pick two components (C1 and C2)
>> and use the same GPIO line to enable them. We already have the drivers
>> for them and they are used in boards already.
> 
> This is basically an attempt to make a generic implementation of
> that cooperation for simple cases.

Without some generic implementation we would need to patch up drivers
(sometimes unrelated) for components which uses the same GPIO line on
some random board.

We have such a thing for tlv310aic3x (for Nokia n900). I would need one
for pcm3168a and there were an attempt for max98927 also.
We also have boards where one GPIO is used for backlight and panel, etc.

If we would have generic way then it can be tuned for more exotic
setups, but again, I believe that board designers are not doing things
just to be evil. What they connect most of the times are 'sane'

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
