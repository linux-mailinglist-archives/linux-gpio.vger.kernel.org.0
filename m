Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82413CB03D
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 03:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhGPBHN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 21:07:13 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:11429 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhGPBHN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 21:07:13 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GQtGH3Hmnzcdjr;
        Fri, 16 Jul 2021 09:00:55 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 09:04:04 +0800
Received: from [10.174.179.0] (10.174.179.0) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 16 Jul
 2021 09:04:03 +0800
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
Message-ID: <bb27626a-fb4f-9974-35bd-64453e0f29a7@huawei.com>
Date:   Fri, 16 Jul 2021 09:04:03 +0800
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
> 
> Do not mix this cleanup with bugfix.

gsel已经不需要了，已经被我删掉了

> 
> 
> 
> .
> 
