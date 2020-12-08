Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872082D2F53
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 17:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729771AbgLHQUU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 11:20:20 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42592 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgLHQUU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 11:20:20 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GISHL022626;
        Tue, 8 Dec 2020 10:18:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607444308;
        bh=f+1zQWX3bzrQvGic9sYZTm9ErEECcOnG3+Kc4bYcx7s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=O1gySBPJsMVlXOyUd02v0rhD/X5a1ECQ6iqza/EzlFKZxgxRqrNWLc3DmzZEcI+sx
         mAAe0JWo/bF9nv76rfnMfO4nm3sT1Sxtu1IdzuvQ+7w4g2DduCkK8UYKp/J/8aPdoV
         Ia3YNkA7WivmCqXNzEV28RBlT1Wo4KYPDr5HiX9Y=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8GIS5K070027
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 10:18:28 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 10:18:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 10:18:28 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GIMO3054655;
        Tue, 8 Dec 2020 10:18:22 -0600
Subject: Re: [RFC PATCH] RFC: drivers: gpio: helper for generic pin IRQ
 handling
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
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
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <0c16ab33-f87f-b32d-53d0-a44a5fecd6dc@ti.com>
Date:   Tue, 8 Dec 2020 18:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfOjb4Rfo9yPmwEYUDbaPXNjfGs6goM27ZnLdAMtiU+jA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 08/12/2020 16:38, Andy Shevchenko wrote:
> On Tue, Dec 8, 2020 at 4:19 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, Dec 8, 2020 at 4:14 PM Enrico Weigelt, metux IT consult
>> <info@metux.net> wrote:
>>>
>>> Many gpio drivers already use gpiolib's builtin irqchip handling
>>> (CONFIG_GPIOLIB_IRQCHIP), but still has some boilerplate for retrieving
>>> the actual Linux IRQ number and calling into the generic handler.
>>> That boilerplate can be reduced by moving that into a helper function.
>>>
>>> This is an RFC patch to outline how that could be done. Note: it's
>>> completely untested yet.
>>>
>>> Several drivers still have their completely IRQ own implementation and
>>> thus can't be converted yet. Some of them perhaps could be changed to
>>> store their irq domain in the struct gpio, so the new helper could
>>> also be used for those.
>>>
>>> Having all GPIO drivers doing their IRQ management entirely through the
>>> GPIO subsystem (eg. never calling generic_handle_irq() and using the builtin
>>> IRQ handling) would also allow a more direct (eg. callback-based) pin change
>>> notification for GPIO consumers, that doesn't involve registering them as
>>> generic IRQ handlers.

Above part makes me worry - why?

>>>
>>> Further reduction of boilerplate could be achieved by additional helpers
>>> for common patterns like for_each_set_bit() loops on irq masks.
>>
>> Have you able to test them all?
>> As the PCA953x case showed us this is not so simple, besides the name
>> which sucks — we don't *raise* and IRQ we *handle* it.
>>
>> NAK.
> 
> To be on constructive side what I think can help here:
> - split patch on per driver basis (and first patch is a simple
> introduction of new API)
> - rename function
> - in each new per-driver patch explain what is the difference in behaviour
> - test as many as you can and explain in a cover letter what has been
> done and what are the expectations on the ones that you weren't able
> to test.
> 

agree.

-- 
Best regards,
grygorii
