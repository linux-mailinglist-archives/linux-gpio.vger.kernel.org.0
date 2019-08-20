Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D84E95AF8
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 11:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbfHTJ2A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 05:28:00 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:54048 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729198AbfHTJ17 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Aug 2019 05:27:59 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2D54676D1AECF0BE440E;
        Tue, 20 Aug 2019 17:27:57 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Tue, 20 Aug 2019
 17:27:49 +0800
Subject: Re: [PATCH v3] gpio: pl061: Fix the issue failed to register the ACPI
 interrtupion
To:     Linus Walleij <linus.walleij@linaro.org>
References: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
 <CACRpkdZFwANp-+fSmPPENLoh2Za2-fyf+aZ0VK79AnyRJs1H3A@mail.gmail.com>
CC:     Salil Mehta <salil.mehta@huawei.com>, <jinying@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        "John Garry" <john.garry@huawei.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Shameerali Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>,
        Linuxarm <linuxarm@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        huangdaode <huangdaode@hisilicon.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Len Brown <lenb@kernel.org>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5D5BBD15.4030507@hisilicon.com>
Date:   Tue, 20 Aug 2019 17:27:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZFwANp-+fSmPPENLoh2Za2-fyf+aZ0VK79AnyRJs1H3A@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2019/8/20 16:01, Linus Walleij wrote:
> On Mon, Aug 19, 2019 at 3:29 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>
>> Invoke acpi_gpiochip_request_interrupts after the acpi data has been
>> attached to the pl061 acpi node to register interruption.
>>
>> Otherwise it will be failed to register interruption for the ACPI case.
>> Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
>> after gpiochip_add_irqchip but at that time the acpi data has not been
>> attached yet.
> We need to fix this problem in gpiochip_add_data_with_key() instead.
Thanks!

Best Regards,
Wei

> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>


