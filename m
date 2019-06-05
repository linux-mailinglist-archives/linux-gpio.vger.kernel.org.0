Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C526A35FF1
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 17:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbfFEPMs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 11:12:48 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48864 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfFEPMs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 11:12:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x55FCk3g110054;
        Wed, 5 Jun 2019 10:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559747566;
        bh=Inienvm9gOICy/UB/TwfBQ4GevAD5jXz3rtnGwbNT90=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KDcC91zaBAjY/jDaPnJQ0EoR31zRKscNxb/XRkXrPYvL8s2RBdRidzoQNzzifAyCM
         d3kRjmo41zmEUCGoYYdXtQnNWvPGKQYFHD65e6EnbKLPToph+3UpdUisGFJauJxUCh
         +FVT7kaeRH8zHJrm81GfgDqDUettVt0Z7kFWtJhY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x55FCkS1051136
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 10:12:46 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 10:12:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 10:12:46 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x55FChC3053628;
        Wed, 5 Jun 2019 10:12:44 -0500
Subject: Re: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654
 SoCs
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>, <lokeshvutla@ti.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190605080259.2462-1-j-keerthy@ti.com>
 <20190605080259.2462-3-j-keerthy@ti.com>
 <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com>
Date:   Wed, 5 Jun 2019 20:43:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/06/19 7:56 PM, Bartosz Golaszewski wrote:
> śr., 5 cze 2019 o 10:02 Keerthy <j-keerthy@ti.com> napisał(a):
>>
>> Add new compatible for K3 AM654 SoCs.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> ---
>>   drivers/gpio/gpio-davinci.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index 0977590eb996..fc494a84a29d 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -632,6 +632,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>
>>   static const struct of_device_id davinci_gpio_ids[] = {
>>          { .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
>> +       { .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
> 
> Please add a patch adding this compatible to the binding document as well.

https://patchwork.kernel.org/patch/10976445/

Posted but did not add you in Cc. Sorry about that.

- Keerthy
> 
> Bart
> 
>>          { .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
>>          { /* sentinel */ },
>>   };
>> --
>> 2.17.1
>>
