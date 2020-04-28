Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6101BBCBB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 13:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgD1LpE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 07:45:04 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3324 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726285AbgD1LpE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 07:45:04 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id ED5169C0DE979926EC9A;
        Tue, 28 Apr 2020 19:44:59 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 19:44:50 +0800
Subject: Re: [PATCH] pinctrl: remove unused 'pwm37_pins'
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20200417092112.12303-1-yanaijie@huawei.com>
 <CACRpkdb5Ozz_MKAUDoyOxdnu_NkN72vRu=ZY7j_Lb5uMAiS3SA@mail.gmail.com>
 <20200428113049.GA5259@Mani-XPS-13-9360>
From:   Jason Yan <yanaijie@huawei.com>
Message-ID: <57bc1105-06e9-2951-45c0-04b048f65d2e@huawei.com>
Date:   Tue, 28 Apr 2020 19:44:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200428113049.GA5259@Mani-XPS-13-9360>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 2020/4/28 19:30, Manivannan Sadhasivam 写道:
> On Tue, Apr 28, 2020 at 11:58:01AM +0200, Linus Walleij wrote:
>> On Fri, Apr 17, 2020 at 10:54 AM Jason Yan <yanaijie@huawei.com> wrote:
>>
>>> Fix the following gcc warning:
>>>
>>> drivers/pinctrl/pinctrl-bm1880.c:263:27: warning: ‘pwm37_pins’ defined
>>> but not used [-Wunused-const-variable=]
>>>   static const unsigned int pwm37_pins[] = { 110 };
>>>                             ^~~~~~~~~~
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>>
>> I'm sceptic about this. I think PWM37 exists and just need to be
>> properly defined.
>>
>> Mani will know the right solution to this.
>>
> 
> Sorry for missing this thread before. The original patch didn't land in my
> inbox.
> 
> Anyway the issue is, pwm37 is not added to BM1880_PINCTRL_GRP. So the proper
> fix would be to add it.
> 
> Jason, will you be able to send a patch for adding it? Otherwise I'll do that.
> 

OK, I will send v2 soon.

Thanks,
Jason

> Thanks,
> Mani
> 
>> Yours,
>> Linus Walleij
> 

