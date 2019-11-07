Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA48AF2A84
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 10:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfKGJYu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 04:24:50 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47113 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727932AbfKGJYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 04:24:50 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA79NYM7019497;
        Thu, 7 Nov 2019 10:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Nb/QEqnZoMmiwFk8QYy7UhscfVZLIh+x/Bdk+co3TD0=;
 b=aSsHwf9oISipVlgti+RbcmRO5jKKaVfy49CVVZoh3lJ599KYvpEp1+0LDMRsYtbIkDW4
 cDLRKlVjqnwEKGWPA/Uj5LpjfQWPVwvudUTL9t3P18nJqsT8WwmiBc5VuVTgf7dhxpPS
 /Yuggi9lsFG0F320F4tzp37XQqg5l+p9HxF2fO/+WakNrKRCVgRkQOHpDHQDnlSzuwh/
 vXDs/CeZ3b/eiPMIpM1L4X7mHBzLNpLOYe9Lk5arNCbZ80rswAV3/oqM6NYw262lhotZ
 b309lMdc893X8B1Pct01HFVzc1Cttd//mffb9rDBBnETYXiZspQri9yq4eVPw5aN7vZG RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2w41vdv6hc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Nov 2019 10:24:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 794A5100039;
        Thu,  7 Nov 2019 10:24:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AEF32AD32A;
        Thu,  7 Nov 2019 10:24:40 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 7 Nov
 2019 10:24:39 +0100
Subject: Re: [PATCH 1/1] pinctrl: stmfx: fix valid_mask init sequence
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20191104100908.10880-1-amelie.delaunay@st.com>
 <CACRpkdb1c-NHXDQXYS78VTcGPnJApmxjzZbF_cM8SUknhDiQ4Q@mail.gmail.com>
 <64f8096f-cec6-fef1-5a4e-ddca3bf8c73d@st.com>
 <CACRpkdbK=aB84hW0FtuMBtzqi3ftKBxedXEpqmnJhbN_vJWx2Q@mail.gmail.com>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <390e6f5b-e7a1-d7ae-34bf-5574e7239d5c@st.com>
Date:   Thu, 7 Nov 2019 10:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbK=aB84hW0FtuMBtzqi3ftKBxedXEpqmnJhbN_vJWx2Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-07_02:2019-11-07,2019-11-07 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/7/19 10:09 AM, Linus Walleij wrote:
> On Tue, Nov 5, 2019 at 4:14 PM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
>> On 11/5/19 3:32 PM, Linus Walleij wrote:
>>> On Mon, Nov 4, 2019 at 11:09 AM Amelie Delaunay <amelie.delaunay@st.com>
>>> wrote:
>>>
>>>> With stmfx_pinctrl_gpio_init_valid_mask callback, gpio_valid_mask was used
>>>> to initialize gpiochip valid_mask for gpiolib. But gpio_valid_mask was not
>>>> yet initialized. gpio_valid_mask required gpio-ranges to be registered,
>>>> this is the case after gpiochip_add_data call. But init_valid_mask
>>>> callback is also called under gpiochip_add_data. gpio_valid_mask
>>>> initialization cannot be moved before gpiochip_add_data because
>>>> gpio-ranges are not registered.
>>>
>>> Sorry but this doesn't add up, look at this call graph:
>>>
>>> gpiochip_add_data()
>>>     gpiochip_add_data_with_key()
>>>       gpiochip_alloc_valid_mask()
>>>       of_gpiochip_add()
>>>       of_gpiochip_add_pin_range()
>>>       gpiochip_init_valid_mask()
>>>
>>> So the .initi_valid_mask() is clearly called *after*
>>> of_gpiochip_add_pin_range() so this cannot be the real reason,
>>> provided that the ranges come from the device tree. AFAICT that
>>> is the case with the stmfx.
>>>
>>> Can you check and see if the problem is something else?
>>>
>>
>> stmfx_pinctrl_gpio_init_valid_mask uses pctl->gpio_valid_mask to
>> initialize gpiochip valid_mask.
>>
>> pctl->gpio_valid_mask is initialized in
>> stmfx_pinctrl_gpio_function_enable depending on gpio ranges.
>>
>> stmfx_pinctrl_gpio_function_enable is called after gpiochip_add_data
>> because it requires gpio ranges to be registered.
>>
>> So, in stmfx driver the call graph is
>>
>> stmfx_pinctrl_probe
>>     gpiochip_add_data()
>>       gpiochip_add_data_with_key()
>>         gpiochip_alloc_valid_mask()
>>         of_gpiochip_add()
>>         of_gpiochip_add_pin_range()
>>         gpiochip_init_valid_mask()
>>           stmfx_pinctrl_gpio_init_valid_mask (but pctl->gpio_valid_mask
>> is not yet initialized so gpiochip valid_mask is wrong)
>>     stmfx_pinctrl_gpio_function_enable (pctl->gpio_valid_mask is going to
>> be initialized thanks to gpio ranges)
>>
>> When consumer tries to take a pin (it is the case for the joystick on
>> stm32mp157c-ev1), it gets the following issue:
>> [    3.347391] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
>> didn't like hwirq-0x0 to VIRQ92 mapping (rc=-6)
>> [    3.356418] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
>> didn't like hwirq-0x1 to VIRQ92 mapping (rc=-6)
>> [    3.366512] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
>> didn't like hwirq-0x2 to VIRQ92 mapping (rc=-6)
>> [    3.376671] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
>> didn't like hwirq-0x3 to VIRQ92 mapping (rc=-6)
>> [    3.387169] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
>> didn't like hwirq-0x4 to VIRQ92 mapping (rc=-6)
>> [    3.397065] gpio-keys joystick: Found button without gpio or irq
>> [    3.403041] gpio-keys: probe of joystick failed with error -22
>>
>> I can reword the commit message to make it clearer.
> 
> No need I understand it now, thanks for explaining!
> 
> We need to populate the valid mask some other way if you
> want to safeguard this, I don't know if the existing
> gpio-reserved-ranges would work? But it feels a bit unsafe
> if you actually determine this some other way.
> 

Before this patch, I made a "draft" version using the 
gpio-reserved-ranges property but then I had to use 
gpiochip_line_is_valid in pinconf_get/_set/_dbg_show in addition of 
pinctrl_find_gpio_range_from_pin... With an update of the bindings for 
optional property gpio-reserved-ranges.
I was not really fond of this solution, it sounded redundant.

Thanks for applying the patch.

Regards,
Amelie
