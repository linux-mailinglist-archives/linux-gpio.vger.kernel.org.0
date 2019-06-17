Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDA848557
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 16:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfFQO2C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 10:28:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53880 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQO2B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 10:28:01 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HERvpF067026;
        Mon, 17 Jun 2019 09:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560781677;
        bh=qu4EIJzsqvFnFCLTxt7GEkoeq2YaEXRCexOLDNeMZ9c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GEd9PaIjP1JfTWpr2FxG12RuW1y2L4JsrovbAMJnv4q9BQhVjrMqTEt1YvMJbY/mF
         RI0G9Y8vWbE2AE7PTkP7t4c3PayqywTgD7vzT1/Q6l41Uda8T4pRGSftKxCKV1Qt05
         XtLmMwYl1cyJM3O7S1YiEMtmWbhOPi31ZLPviwwA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HERvgB022277
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Jun 2019 09:27:57 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 17
 Jun 2019 09:27:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 17 Jun 2019 09:27:55 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HERqXT061958;
        Mon, 17 Jun 2019 09:27:53 -0500
Subject: Re: [RFC RESEND PATCH v2 1/4] dt-bindings: gpio: davinci: Add k3
 am654 compatible
To:     keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     ext Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190606095620.6211-1-j-keerthy@ti.com>
 <20190606095620.6211-2-j-keerthy@ti.com>
 <CACRpkdY-yK3+uZvq1Xk7qJ2Nd7mgRkQ9C22AYO4AiZP5Cs719w@mail.gmail.com>
 <bcaf05c2-e4a2-8fe6-50f8-9df603d65a21@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <1b2bf190-4474-fd65-8a6b-58d2539c1b10@ti.com>
Date:   Mon, 17 Jun 2019 17:27:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bcaf05c2-e4a2-8fe6-50f8-9df603d65a21@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/06/2019 06:51, keerthy wrote:
> 
> 
> On 6/8/2019 4:09 AM, Linus Walleij wrote:
>> On Thu, Jun 6, 2019 at 11:55 AM Keerthy <j-keerthy@ti.com> wrote:
>>
>>> The patch adds k3 am654 compatible, specific properties and
>>> an example.
>>>
>>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>>
>> Patch applied with the three others, so now all
>> GPIO changes are in tree.
>>
>> Please funnel all the DTS changes through ARM SoC.
> 
> Thank you Linus!
> 
> Tero,
> 
> Could you pull the dts changes on top of intr dts patches.

Queued patches #2...#4 towards 5.3, thanks.

-Tero

> 
> Regards,
> Keerthy
>>
>> Yours,
>> Linus Walleij
>>

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
