Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D5A643AE3
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 02:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbiLFBmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 20:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbiLFBmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 20:42:10 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EDFB7B
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 17:42:08 -0800 (PST)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NR33K36MPzJp54;
        Tue,  6 Dec 2022 09:38:37 +0800 (CST)
Received: from [10.174.179.191] (10.174.179.191) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 09:42:06 +0800
Message-ID: <ff96aac6-d5e5-222a-307a-d17ccc8b3201@huawei.com>
Date:   Tue, 6 Dec 2022 09:42:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] gpio/rockchip: fix refcount leak in
 rockchip_gpiolib_register()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     <linus.walleij@linaro.org>, <heiko@sntech.de>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <jay.xu@rock-chips.com>
References: <1670221196-36806-1-git-send-email-wangyufen@huawei.com>
 <f6bab0d1-008d-c5c0-ef29-28a61df91e65@huawei.com>
 <CAMRc=MfD84WstmUO+qnkrAYviq_ESwvk554TGCjZq0P9JAG24w@mail.gmail.com>
From:   wangyufen <wangyufen@huawei.com>
In-Reply-To: <CAMRc=MfD84WstmUO+qnkrAYviq_ESwvk554TGCjZq0P9JAG24w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.191]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 2022/12/5 18:26, Bartosz Golaszewski 写道:
> On Mon, Dec 5, 2022 at 7:21 AM wangyufen <wangyufen@huawei.com> wrote:
>>
>>
>>
>> 在 2022/12/5 14:19, Wang Yufen 写道:
>>> The node returned by of_get_parent() with refcount incremented,
>>> of_node_put() needs be called when finish using it. So add it in the
>>> end of of_pinctrl_get().
>>>
>>> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
>>> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
>>> ---
>>>    drivers/gpio/gpio-rockchip.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
>>> index 870910b..200e43a 100644
>>> --- a/drivers/gpio/gpio-rockchip.c
>>> +++ b/drivers/gpio/gpio-rockchip.c
>>> @@ -610,6 +610,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>>>                        return -ENODATA;
>>>
>>>                pctldev = of_pinctrl_get(pctlnp);
>>> +             of_node_put(pctlnp);
>>>                if (!pctldev)
>>>                        return -ENODEV;
>>>
> 
> Something went wrong when sending the patch? Did you use git send-email?
> 

The patch itself is fine, but I forgot to Cc the author of the patch I 
fixed, so I added a Cc.

Thanks,
Wang

> Bart
> 
