Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B4F2E09BE
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 12:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgLVLeo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 06:34:44 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10057 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgLVLeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2020 06:34:44 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0Z2m0WCnzM7yQ;
        Tue, 22 Dec 2020 19:33:04 +0800 (CST)
Received: from [127.0.0.1] (10.40.192.131) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 19:33:53 +0800
Subject: Re: [PATCH v1] gpio: hisi: delete some unused variables in
 hisi_gpio_probe()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1608539124-4914-1-git-send-email-luojiaxing@huawei.com>
 <CAHp75VcV2E+e9e_o7zwrL+gzZ3xUkZYOnTDACxH1j59bxTVifw@mail.gmail.com>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <5be97c5e-39fc-bf58-aee5-39438948b059@huawei.com>
Date:   Tue, 22 Dec 2020 19:33:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcV2E+e9e_o7zwrL+gzZ3xUkZYOnTDACxH1j59bxTVifw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.40.192.131]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/21 18:35, Andy Shevchenko wrote:
> On Mon, Dec 21, 2020 at 10:25 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
>> kernel test rebot report that dat, set and clr in hisi_gpio_probe() is
>> unused variables. So delete it.
> Fixes: tag?


Fixes: 356b01a986a5 ("gpio: gpio-hisi: Add HiSilicon GPIO support")


Should I send v2 to add this tag? or we can ask linus to help to add it 
when apply this?


Thanks

Jiaxing

>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>

