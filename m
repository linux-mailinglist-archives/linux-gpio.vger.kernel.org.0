Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D40D2D6023
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 16:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391281AbgLJPmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 10:42:09 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51246 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391442AbgLJPmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 10:42:06 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAFeD31120985;
        Thu, 10 Dec 2020 09:40:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607614813;
        bh=XO9fpkCxzX/zoFu+ZhwYzR7BVeSXJTzwpURR5r4FuyY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FekUCvFIyna43CWWR4J1FEsApW/8X/X2wb55sCCZVc2HWKgJ6EbXb0Ej4bIRqzEIS
         jQnrdPqGEIF6dBe46VoAZ8gTa0/ZXF+7NTPub6N05HlBLCr0PJgerKhBgLgOBi2v+L
         6KYupciPMuf+UG/O3f/2O64yDZcaFhW4UcAj2afw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAFeDZ7079260
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Dec 2020 09:40:13 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 09:40:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 09:40:12 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAFe5A3042208;
        Thu, 10 Dec 2020 09:40:07 -0600
Subject: Re: [RFC PATCH] RFC: drivers: gpio: helper for generic pin IRQ
 handling
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <joyce.ooi@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>, <orsonzhai@gmail.com>,
        <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
References: <20201208141429.8836-1-info@metux.net>
 <CAHp75VfMKmJ074R2-04be0Ag6OuKcY=_xhhbRKsL2D0H8hZZLg@mail.gmail.com>
 <CAHp75VfOjb4Rfo9yPmwEYUDbaPXNjfGs6goM27ZnLdAMtiU+jA@mail.gmail.com>
 <0c16ab33-f87f-b32d-53d0-a44a5fecd6dc@ti.com>
 <710efa0f-063e-8a9e-1c3f-49337506b044@metux.net>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <ff1dcd9a-eb83-2cb5-30d3-b25976a227ab@ti.com>
Date:   Thu, 10 Dec 2020 17:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <710efa0f-063e-8a9e-1c3f-49337506b044@metux.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/12/2020 12:23, Enrico Weigelt, metux IT consult wrote:
> On 08.12.20 17:18, Grygorii Strashko wrote:
> 
>>>>> Having all GPIO drivers doing their IRQ management entirely through the
>>>>> GPIO subsystem (eg. never calling generic_handle_irq() and using the
>>>>> builtin
>>>>> IRQ handling) would also allow a more direct (eg. callback-based)
>>>>> pin change
>>>>> notification for GPIO consumers, that doesn't involve registering
>>>>> them as
>>>>> generic IRQ handlers.
>>
>> Above part makes me worry - why?
> 
> Why so ?
> 
> Little clarification, in case i've been a bit confusion - there're two
> separate topics:
> 
> a) consolidating repeated patterns (eg. calling the actual irq handling)
>     into gpiolib, (and later possibly use more fields already existing in
>     struct gpio_chip for irq handling)

Even if there is some pattern It doesn't mean consolidation is always reasonable.
one of the things to think about is compiler optimization and will/will not this change
add additional

> 
> b) a direct consumer callback for change, where the consumer doesn't
>     have to care about IRQs at all (some drivers could even do polling,
>     when hw doesn't have IRQs). This is for consumers that don't use
>     GPIOs as interrupt source, but more more like a very raw serial port,
>     eg. bitbanging of other interfaces (maybe an gpio bus type ? ;-))

in his case they do polling, so what's the issue with this?

or you want gpio-controller to do polling for you?

Actually there are few types of consumers:
- gpio users, no irq
- irq users, no gpio
- gpio users and irq users
- and finally (only few) use the same gpio as gpio and as an irq,
   including dynamic direction change.

> 
> The above paragraph just outlines that b) might be much easier to
> implement, once the suggested refactoring is done and no driver would
> call irq handlers directly anymore. But this hasn't much to do with
> the proposal itself, just an idea for future use.
> 
> --mtx
> 

-- 
Best regards,
grygorii
