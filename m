Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25E392408
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 14:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfHSM77 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 08:59:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5156 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727128AbfHSM77 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Aug 2019 08:59:59 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id ACA9CA8B24C2C0ADD55A;
        Mon, 19 Aug 2019 20:59:55 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 19 Aug 2019
 20:59:49 +0800
Subject: Re: [PATCH v2] gpio: pl061: Fix the issue failed to register the ACPI
 interrtupion
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
References: <1565946336-20080-1-git-send-email-xuwei5@hisilicon.com>
 <CAHp75VfjE4V7yY1b3JYd_Mk9-8RTok2WCN=-MMrUBw5NN90o2A@mail.gmail.com>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "Len Brown" <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linuxarm <linuxarm@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>, <salil.mehta@huawei.com>,
        <shiju.jose@huawei.com>, <jinying@hisilicon.com>,
        <zhangyi.ac@huawei.com>, <liguozhu@hisilicon.com>,
        <tangkunshan@huawei.com>, huangdaode <huangdaode@hisilicon.com>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5D5A9D43.4040508@hisilicon.com>
Date:   Mon, 19 Aug 2019 20:59:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfjE4V7yY1b3JYd_Mk9-8RTok2WCN=-MMrUBw5NN90o2A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thanks!

On 2019/8/16 21:40, Andy Shevchenko wrote:
> On Fri, Aug 16, 2019 at 12:07 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>> Invoke acpi_gpiochip_request_interrupts after the acpi data has been
>> attached to the pl061 acpi node to register interruption.
>>
>> Otherwise it will be failed to register interruption for the ACPI case.
>> Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
>> after gpiochip_add_irqchip but at that time the acpi data has not been
>> attached yet.
>> 2. cat /proc/interrupts in the guest console:
>>
>>          estuary:/$ cat /proc/interrupts
>>                     CPU0
>>          2:         3228     GICv3  27 Level     arch_timer
>>          4:           15     GICv3  33 Level     uart-pl011
>>          42:           0     GICv3  23 Level     arm-pmu
>>          IPI0:         0       Rescheduling interrupts
>>          IPI1:         0       Function call interrupts
>>          IPI2:         0       CPU stop interrupts
>>          IPI3:         0       CPU stop (for crash dump) interrupts
>>          IPI4:         0       Timer broadcast interrupts
>>          IPI5:         0       IRQ work interrupts
>>          IPI6:         0       CPU wake-up interrupts
>>          Err:          0
>>
>> But on QEMU v3.0.0 and Linux kernel v5.2.0-rc7, pl061 interruption is
>> there as below:
>>
>>          estuary:/$ cat /proc/interrupts
>>                     CPU0
>>            2:       2648     GICv3  27 Level     arch_timer
>>            4:         12     GICv3  33 Level     uart-pl011
>>           42:          0     GICv3  23 Level     arm-pmu
>>           43:          0  ARMH0061:00   3 Edge      ACPI:Event
>>          IPI0:         0       Rescheduling interrupts
>>          IPI1:         0       Function call interrupts
>>          IPI2:         0       CPU stop interrupts
>>          IPI3:         0       CPU stop (for crash dump) interrupts
>>          IPI4:         0       Timer broadcast interrupts
>>          IPI5:         0       IRQ work interrupts
>>          IPI6:         0       CPU wake-up interrupts
>>          Err:          0
> In above show only affected line.

OK. Will update it in v3.

>> And the whole dmesg log on Linux kernel v5.2.0-rc7 is as below:
> NO!
> Please, remove this huge noise!

Sorry for the noise!
I will drop it in v3.

Best Regards,
Wei



