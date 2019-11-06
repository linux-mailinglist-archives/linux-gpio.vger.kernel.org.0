Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 474ECF1209
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 10:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731567AbfKFJWN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 04:22:13 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51990 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbfKFJWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 04:22:12 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA69M1wk068510;
        Wed, 6 Nov 2019 03:22:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573032122;
        bh=nDCiTg+AGtGr0dZ/+jhmDYrrfhHz9pKeKyYvNkCel2k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=I8DryP5b7FZM8h0XiWnOIVcVIAcYzWX26Z4VQOGDAZiTfya0SATzcxInZt5vYEX/d
         6N3ancFsu5pKs3fQLUxotE+jvopwpB2E1zavF1HdEKjHk2L5t6KSf/GddZlp0Z7Hrc
         4bpTe6F1y/XVHGGeJ8RMW6YIa927OzRGrCYRyQ4E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA69M1t6009702
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 03:22:01 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 03:21:46 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 03:21:46 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA69Lw8s101919;
        Wed, 6 Nov 2019 03:21:58 -0600
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <e209692a-18a3-4079-fda7-1cc7b6b74667@ti.com>
Date:   Wed, 6 Nov 2019 11:23:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <61c8c126-3061-e297-8dab-7333316b0754@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/11/2019 20.07, Grygorii Strashko wrote:
>>> (but hey - if this is boot only then gpio-hogs should work. Are they?)
>>
>> That is another thing which almost works ;)
>> w/o gpio binding deferred probing is not possible if the GPIO controller
>> is probed later.
>> In some cases it might be even impossible to make sure that the GPIO
>> controller would probe first (GPIO extender on different i2c bus than
>> the user(s) of the gpio line)
>> In some cases moving around nodes in DT might artificially make things
>> work, but then someone compiles the expander as module, or some 'small'
>> change in kernel and the probe order on the bus changes.
>> I don't think it is a valid thing to have commits on the DT files
>> saying: move the expander front/after the hog affected user since since
>> Monday the probe order has changed. Then move it back two weeks later ;)
>>
> 
> Ok. Above sounds like real problem. The implicit dependence is exist,
> but can't
> be resolved if any driver depends on gpio-hog of some gpio-controller.
> Probe deferring of gpio-controller will not lead to probe differing of
> dependent driver.
> 
> Question: will gpio-hog mechanism resolve your case if it works (and
> probe differing issues)?

I see gpio-hog to fulfill different role, use cases. It is more like
controlling muxes on boards to select between different exclusive
features. Things like route the I2S lines to analog codec or HDMI, route
RGB video to LCD panel or to HDMI, etc.

But, if it would work it could be used for components which can be
enabled all the time. On the other hand, if a device has reset/enable
line then the driver should have a way to control it.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
