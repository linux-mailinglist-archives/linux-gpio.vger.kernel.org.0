Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E7F63BFBC
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbiK2MH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbiK2MGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:06:53 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C1B11A0D
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:06:35 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NM1FC4DPKzJny3;
        Tue, 29 Nov 2022 20:03:11 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 20:06:33 +0800
Subject: Re: [PATCH v2] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_build_functions()
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        <lakshmi.sowjanya.d@intel.com>, <linus.walleij@linaro.org>,
        <kiran.kumar1.s@intel.com>
CC:     <linux-gpio@vger.kernel.org>
References: <20221129113410.1555592-1-cuigaosheng1@huawei.com>
 <6a7329e3-448f-bf1f-dfd3-34f6dd495408@milecki.pl>
From:   cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <fe71b483-a792-6d0e-b178-8f7febebb789@huawei.com>
Date:   Tue, 29 Nov 2022 20:06:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6a7329e3-448f-bf1f-dfd3-34f6dd495408@milecki.pl>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>
> This patch still leaves *existing* kfree(funcs); in the
> thunderbay_add_functions(). Maybe you can get rid of that one and just
> handle freeing in the thunderbay_build_functions()? 

Thanks for taking time to review this patch, I have updated this patch 
and submitted it,

If you have any suggestions, please let me know, thanks again!


On 2022/11/29 19:36, Rafał Miłecki wrote:
>
>
> On 29.11.2022 12:34, Gaosheng Cui wrote:
>> The thunderbay_add_functions() will free memory of thunderbay_funcs
>> when everything is ok, but thunderbay_funcs will not be freed when
>> thunderbay_add_functions() fails, then there will be a memory leak,
>> so add kfree() when thunderbay_add_functions() fails to fix it.
>>
>> Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>> v2:
>> - Free the memory in thunderbay_build_functions, and update the commit
>>    message and the fixes tag, thanks!
>>   drivers/pinctrl/pinctrl-thunderbay.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-thunderbay.c 
>> b/drivers/pinctrl/pinctrl-thunderbay.c
>> index 9328b17485cf..84b64c3217a5 100644
>> --- a/drivers/pinctrl/pinctrl-thunderbay.c
>> +++ b/drivers/pinctrl/pinctrl-thunderbay.c
>> @@ -817,6 +817,7 @@ static int thunderbay_build_functions(struct 
>> thunderbay_pinctrl *tpc)
>>       struct function_desc *thunderbay_funcs;
>>       void *ptr;
>>       int pin;
>> +    int ret;
>>         /*
>>        * Allocate maximum possible number of functions. Assume every pin
>> @@ -860,7 +861,13 @@ static int thunderbay_build_functions(struct 
>> thunderbay_pinctrl *tpc)
>>           return -ENOMEM;
>>         thunderbay_funcs = ptr;
>> -    return thunderbay_add_functions(tpc, thunderbay_funcs);
>> +    ret = thunderbay_add_functions(tpc, thunderbay_funcs);
>> +    if (ret < 0) {
>> +        kfree(thunderbay_funcs);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>>   }
>>     static int thunderbay_pinconf_set_tristate(struct 
>> thunderbay_pinctrl *tpc,
>
> Sorry, I probably wasn't precise enough.
>
> This patch still leaves *existing* kfree(funcs); in the
> thunderbay_add_functions(). Maybe you can get rid of that one and just
> handle freeing in the thunderbay_build_functions()?
>
> .
