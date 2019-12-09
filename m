Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4481116617
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 06:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfLIFPK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 00:15:10 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54846 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfLIFPK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2019 00:15:10 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB95F8ZF091561;
        Sun, 8 Dec 2019 23:15:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575868508;
        bh=EyuMnGkYXKYwJOyPgwsdnQQYvmnlhhBxVc+f7mSxO8o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pqr97GYV4K4YVUQauehsTM9ehjKtQFJKvnuazq68cPmczENxNAXVVWBjoCVBmsm8X
         f4o6t9H54dYufP2ak+pjf+p/kz+yklwR6wlOJFNHpurjvHj9uoFPPmDkEX0OYRpiL0
         1vlnVl6gpsGFqk5XMOs1viJkYJiPG806Hs86E+Vg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB95F877085804
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 8 Dec 2019 23:15:08 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 8 Dec
 2019 23:15:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 8 Dec 2019 23:15:06 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB95F4Pm003003;
        Sun, 8 Dec 2019 23:15:05 -0600
Subject: Re: [PATCH] gpio: pca953x: Read irq trigger type from DT
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191205144508.31339-1-vigneshr@ti.com>
 <5837a37d-479d-5c33-45b5-c1b32b0cdc52@ti.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <bfaa7ed4-6acf-3941-0de6-f139eed7cf99@ti.com>
Date:   Mon, 9 Dec 2019 10:45:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5837a37d-479d-5c33-45b5-c1b32b0cdc52@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Grygorii,

On 05/12/19 8:31 pm, Grygorii Strashko wrote:
> 
> 
> On 05/12/2019 16:45, Vignesh Raghavendra wrote:
[...]

>> @@ -768,10 +769,14 @@ static int pca953x_irq_setup(struct pca953x_chip
>> *chip, int irq_base)
>>       bitmap_and(chip->irq_stat, irq_stat, reg_direction,
>> chip->gpio_chip.ngpio);
>>       mutex_init(&chip->irq_lock);
>>   +    irqflags = irq_get_trigger_type(client->irq);
>> +    if (irqflags == IRQF_TRIGGER_NONE)
>> +        irqflags = IRQF_TRIGGER_LOW;
> 
> I think you can just drop IRQF_TRIGGER_LOW:
> - for paltform code it will be set from resources in
> platform_get_irq_optional()
> - for DT code it will be set in __setup_irq()
> 

Ok, will drop setting IRQF_TRIGGER_LOW in v2.

Thanks for the review!

>> +    irqflags |= IRQF_ONESHOT | IRQF_SHARED;
>> +
>>       ret = devm_request_threaded_irq(&client->dev, client->irq,
>>                       NULL, pca953x_irq_handler,
>> -                    IRQF_TRIGGER_LOW | IRQF_ONESHOT |
>> -                    IRQF_SHARED,
>> +                    irqflags,
>>                       dev_name(&client->dev), chip);
>>       if (ret) {
>>           dev_err(&client->dev, "failed to request irq %d\n",
>>
> 

-- 
Regards
Vignesh
