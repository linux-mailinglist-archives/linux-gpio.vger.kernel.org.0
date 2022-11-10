Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2C26241E8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 13:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiKJMEf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 07:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiKJMEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 07:04:34 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAA51EEEE
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 04:04:33 -0800 (PST)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N7L9J6qszzRpCX;
        Thu, 10 Nov 2022 20:04:20 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 20:04:31 +0800
Message-ID: <4ca04229-f2ab-7696-1719-5b24a83b4368@huawei.com>
Date:   Thu, 10 Nov 2022 20:04:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] pinctrl: devicetree: fix null pointer dereferencing in
 pinctrl_dt_to_map
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <dong.aisheng@linaro.org>, <swarren@wwwdotorg.org>,
        <linux-gpio@vger.kernel.org>, <liwei391@huawei.com>
References: <20221110082056.2014898-1-zengheng4@huawei.com>
 <CACRpkdZQiTzLiP5ObRxp6bU=jFnJUFKS6_itSDwtn41x9-2+mQ@mail.gmail.com>
From:   Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <CACRpkdZQiTzLiP5ObRxp6bU=jFnJUFKS6_itSDwtn41x9-2+mQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2022/11/10 19:27, Linus Walleij wrote:
> On Thu, Nov 10, 2022 at 9:22 AM Zeng Heng <zengheng4@huawei.com> wrote:
>
>> Here is the BUG report by KASAN about null pointer dereference:
>>
>> BUG: KASAN: null-ptr-deref in strcmp+0x2e/0x50
>> Read of size 1 at addr 0000000000000000 by task python3/2640
>> Call Trace:
>>   strcmp
>>   __of_find_property
>>   of_find_property
>>   pinctrl_dt_to_map
>>
>> kasprintf() would return NULL pointer when kmalloc() fail to allocate.
>> So directly return ENOMEM, if kasprintf() return NULL pointer.
>>
>> Fixes: 57291ce295c0 ("pinctrl: core device tree mapping table parsing support")
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Patch applied for fixes.
>
> Interesting that you managed to locate this using *kasan* of all
> things, it kind of requires that you manage to run out of memory
> exactly at this time...
>
> Yours,
> Linus Walleij

yes, actually it runs with *kasan* & companied with fault-inject into 
every single time.

Best regards,

Zeng Heng


