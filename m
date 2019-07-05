Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD6D60626
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 14:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbfGEMoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 08:44:16 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:8146 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727665AbfGEMoQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jul 2019 08:44:16 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1D377A7AB501FDE1A7EA;
        Fri,  5 Jul 2019 20:44:13 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Fri, 5 Jul 2019
 20:44:12 +0800
Subject: Re: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20190705123220.54008-1-yuehaibing@huawei.com>
 <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <74ffe8ea-e6fb-bd2a-42bd-08392eb27c69@huawei.com>
Date:   Fri, 5 Jul 2019 20:44:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019/7/5 20:40, Bartosz Golaszewski wrote:
> pt., 5 lip 2019 o 14:34 YueHaibing <yuehaibing@huawei.com> napisał(a):
>>
>> If CONFIG_DEBUG_FS is not set, building fails:
>>
>> drivers/gpio/gpio-tegra.c: In function tegra_gpio_probe:
>> drivers/gpio/gpio-tegra.c:665:2: error: implicit declaration of function debugfs_create_file;
>>  did you mean bus_create_file? [-Werror=implicit-function-declaration]
>>   debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
>>   ^~~~~~~~~~~~~~~~~~~
>>   bus_create_file
>> drivers/gpio/gpio-tegra.c:666:9: error: tegra_dbg_gpio_fops undeclared (first use in this function);
>>  did you mean tegra_gpio_pm_ops?
>>         &tegra_dbg_gpio_fops);
>>          ^~~~~~~~~~~~~~~~~~~
>>          tegra_gpio_pm_ops
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: a4de43049a1d ("gpio: tegra: Clean-up debugfs initialisation")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/gpio/gpio-tegra.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>> index 59b99d8..40fd6bd 100644
>> --- a/drivers/gpio/gpio-tegra.c
>> +++ b/drivers/gpio/gpio-tegra.c
>> @@ -662,8 +662,10 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>>                 }
>>         }
>>
>> +#ifdef CONFIG_DEBUG_FS
>>         debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
>>                             &tegra_dbg_gpio_fops);
>> +#endif
>>
>>         return 0;
>>  }
>> --
>> 2.7.4
>>
>>
> 
> Nack, there are inline stubs for all debugfs functions in
> ./include/linux/debugfs.h if CONFIG_DEBUG_FS is not selected. Just
> move the #include <linux/debugfs.h> to the top of the source file.

yes, agree this, but 'tegra_dbg_gpio_fops' is still undeclared.

> 
> Bart
> 
> .
> 

