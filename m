Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C895E3CB056
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 03:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhGPBUA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 21:20:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:7020 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhGPBT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 21:19:59 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GQtVM0LC2zXdsl;
        Fri, 16 Jul 2021 09:11:23 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 09:17:03 +0800
Received: from [10.174.179.0] (10.174.179.0) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 16 Jul
 2021 09:17:02 +0800
Subject: Re: [PATCH] pinctrl: single: Fix error return code in
 pcs_parse_bits_in_pinctrl_entry()
To:     "weiyongjun (A)" <weiyongjun1@huawei.com>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manjunathappa Prakash <prakash.pm@ti.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210715064206.3193-1-thunder.leizhen@huawei.com>
 <55d02087-e2c7-9a0c-e20e-ff6f106703a3@huawei.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <ab9e3a1a-551c-92e5-06cc-45b1081243e3@huawei.com>
Date:   Fri, 16 Jul 2021 09:17:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <55d02087-e2c7-9a0c-e20e-ff6f106703a3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2021/7/15 19:49, weiyongjun (A) wrote:
>> Fix to return -ENOTSUPP instead of 0 when PCS_HAS_PINCONF is true, which
>> is the same as that returned in pcs_parse_pinconf().
>>
>> In addition, I found the value of pcs->flags is not overwritten in
>> pcs_parse_bits_in_pinctrl_entry() and its subfunctions, so moving this
>> check to the beginning of the function eliminates unnecessary rollback
>> operations.
>>
>> Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>   drivers/pinctrl/pinctrl-single.c | 21 ++++++++-------------
>>   1 file changed, 8 insertions(+), 13 deletions(-)
>>
>>
>>       npins_in_row = pcs->width / pcs->bits_per_pin;
>>         vals = devm_kzalloc(pcs->dev,
>> @@ -1212,29 +1217,19 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
>>           goto free_pins;
>>       }
>>   -    gsel = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
>> -    if (gsel < 0) {
>> -        res = gsel;
>> +    res = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
>> +    if (res < 0)
>>           goto free_function;
>> -    }
> 
> 
> This change cause 'gsel' not set.

The local variable 'gsel' is no longer needed. I have deleted it.

> 
> Do not mix this cleanup with bugfix.

Yes, it might be clearer.

> 
> 
> 
> .
> 
