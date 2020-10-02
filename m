Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3AB281946
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 19:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387789AbgJBRaJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 13:30:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50226 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgJBRaJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 13:30:09 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 092HU364077389;
        Fri, 2 Oct 2020 12:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601659803;
        bh=5h6WAPqx+jvwJUt2okJdbTHS7CgXZ0txIhafED+O7Iw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=n2FYZYB0Xie8cQNVGDSUMc9m9AVWf3RSh8V8QXl89C+KLq4Nr4FjJFGfQJbo2/piM
         hR91Q5vnhwYGvcW74c0/XgHsuybkI6QXYzJCT8bbDWtYVfnwEGMDNqOiyxP/yHoaVB
         nVBZauprgzmr0WGOCpp0bSIJtpO3OClyDj+QWwJI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 092HU2fq054316
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 2 Oct 2020 12:30:03 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 2 Oct
 2020 12:30:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 2 Oct 2020 12:30:02 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 092HTwoR129410;
        Fri, 2 Oct 2020 12:29:59 -0500
Subject: Re: [PATCH] gpio: pca953x: Use irqchip template
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200717144040.63253-1-linus.walleij@linaro.org>
 <20200930104729.ajufkrklfhf25d55@NiksLab>
 <CACRpkdaOAdcO4P-3MphdV7bq1-CfMr0KR96+iPvJrsEX1nZeNQ@mail.gmail.com>
 <2ced9bd9-9446-5060-18a4-d743238277fc@ti.com>
 <20201002104046.GA3956970@smile.fi.intel.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <106b2f8e-ade2-d36f-482a-7024a6d1f941@ti.com>
Date:   Fri, 2 Oct 2020 20:29:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002104046.GA3956970@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 02/10/2020 13:40, Andy Shevchenko wrote:
> On Fri, Oct 02, 2020 at 12:07:50AM +0300, Grygorii Strashko wrote:
>> On 30/09/2020 16:51, Linus Walleij wrote:
>>> On Wed, Sep 30, 2020 at 12:47 PM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>>>
>>>> I am getting a kernel crash on K3 j721e common processor board
>>>> when HDMI is plugged in. Following is the full log with crash
>>>> for NULL pointer derefence
>>>>
>>>> https://pastebin.ubuntu.com/p/wBPS2ymmqR/
>>>>
>>>> Upon inspection, I found that the "irq_find_mapping" call
>>>> in the "pca953x_irq_handler" returns 0 and the same is passed
>>>> to "handle_nested_irq"
>>>
>>> This would typically happen if the driver using an IRQ
>>> from the PCA953x does not properly request it.
> 
> ...
> 
>> We've just got another similar report, don't know the root cause, but it's not HDMI
> 
> Does
>   e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")
> help?
> 

Looks like it is. Thanks

-- 
Best regards,
grygorii
