Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161FA1ADB35
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 12:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgDQKfq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 06:35:46 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57632 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726469AbgDQKfp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 06:35:45 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3298B398AFE379EAA7D0;
        Fri, 17 Apr 2020 18:35:43 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 18:35:36 +0800
Subject: Re: [PATCH] pinctrl: rza1: remove unused 'rza1l_swio_pins'
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>,
        Chris Brandt <Chris.Brandt@renesas.com>
References: <20200417092042.11994-1-yanaijie@huawei.com>
 <CAMuHMdUfwbsfLNSxJLqkwTNEQims1RHBn_EwBvBUqEZshHZHdQ@mail.gmail.com>
From:   Jason Yan <yanaijie@huawei.com>
Message-ID: <76de8e85-d9a5-c58f-206e-15da59ee110e@huawei.com>
Date:   Fri, 17 Apr 2020 18:35:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUfwbsfLNSxJLqkwTNEQims1RHBn_EwBvBUqEZshHZHdQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 2020/4/17 17:31, Geert Uytterhoeven 写道:
> Hi Jason,
> 
> On Fri, Apr 17, 2020 at 10:54 AM Jason Yan <yanaijie@huawei.com> wrote:
>> Fix the following gcc warning:
>>
>> drivers/pinctrl/pinctrl-rza1.c:401:35: warning: ‘rza1l_swio_pins’
>> defined but not used [-Wunused-const-variable=]
>>   static const struct rza1_swio_pin rza1l_swio_pins[] = {
>>                                     ^~~~~~~~~~~~~~~
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/pinctrl/pinctrl-rza1.c
>> +++ b/drivers/pinctrl/pinctrl-rza1.c
>> @@ -398,15 +398,6 @@ static const struct rza1_bidir_pin rza1l_bidir_pins_p9[] = {
>>          { .pin = 5, .func = 3 },
>>   };
>>
>> -static const struct rza1_swio_pin rza1l_swio_pins[] = {
>> -       { .port = 2, .pin = 8, .func = 2, .input = 0 },
>> -       { .port = 5, .pin = 6, .func = 3, .input = 0 },
>> -       { .port = 6, .pin = 6, .func = 3, .input = 0 },
>> -       { .port = 6, .pin = 10, .func = 3, .input = 0 },
>> -       { .port = 7, .pin = 10, .func = 2, .input = 0 },
>> -       { .port = 8, .pin = 2, .func = 3, .input = 0 },
>> -};
>> -
>>   static const struct rza1_bidir_entry rza1l_bidir_entries[RZA1_NPORTS] = {
>>          [1] = { ARRAY_SIZE(rza1l_bidir_pins_p1), rza1l_bidir_pins_p1 },
>>          [3] = { ARRAY_SIZE(rza1l_bidir_pins_p3), rza1l_bidir_pins_p3 },
> 
> rza1l_swio_pins[] is unused because rza1l_swio_entries[] refers to the
> wrong array. So I'd rather see a patch to fix that instead.
> 

Thanks for the explanation, I will send a new one.

> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

