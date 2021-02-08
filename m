Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB754312D05
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhBHJNn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:13:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11700 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbhBHJMP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:12:15 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DZ0bH0wXLzlDhn;
        Mon,  8 Feb 2021 17:09:47 +0800 (CST)
Received: from [127.0.0.1] (10.40.192.131) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Mon, 8 Feb 2021
 17:11:30 +0800
Subject: Re: [Linuxarm] [PATCH for next v1 0/2] gpio: few clean up patches to
 replace spin_lock_irqsave with spin_lock
From:   luojiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>, <grygorii.strashko@ti.com>,
        <ssantosh@kernel.org>, <khilman@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
Message-ID: <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
Date:   Mon, 8 Feb 2021 17:11:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.40.192.131]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry, my operation error causes a patch missing from this patch set. I 
re-send the patch set. Please check the new one.

On 2021/2/8 16:56, Luo Jiaxing wrote:
> There is no need to use API with _irqsave in hard IRQ handler, So replace
> those with spin_lock.
>
> Luo Jiaxing (2):
>    gpio: omap: Replace raw_spin_lock_irqsave with raw_spin_lock in
>      omap_gpio_irq_handler()
>    gpio: grgpio: Replace spin_lock_irqsave with spin_lock in
>      grgpio_irq_handler()
>
>   drivers/gpio/gpio-grgpio.c |  5 ++---
>   drivers/gpio/gpio-omap.c   | 15 ++++++---------
>   2 files changed, 8 insertions(+), 12 deletions(-)
>

