Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2DF1F6C38
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 18:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgFKQdZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 12:33:25 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:20050 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgFKQdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jun 2020 12:33:24 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id 05BGXLiI021561
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Jun 2020 10:33:21 -0600 (CST)
Received: from [192.168.234.68] (sed198n237.sedsystems.ca [198.169.180.237])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id 05BGXKD4052858
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Thu, 11 Jun 2020 10:33:20 -0600
Subject: Re: [PATCH] gpio: xilinx: Add interrupt support
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
References: <20200605235652.2680545-1-hancock@sedsystems.ca>
 <CAMpxmJWyfVrw_o_YRwyZZoDaNFZ74xm8_Cv28tEu9SbRD2u4Ow@mail.gmail.com>
From:   Robert Hancock <hancock@sedsystems.ca>
Message-ID: <49202374-ff56-88b7-8672-8c96d416861d@sedsystems.ca>
Date:   Thu, 11 Jun 2020 10:33:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJWyfVrw_o_YRwyZZoDaNFZ74xm8_Cv28tEu9SbRD2u4Ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-06-11 2:35 a.m., Bartosz Golaszewski wrote:
> sob., 6 cze 2020 o 01:57 Robert Hancock <hancock@sedsystems.ca> napisał(a):
>>
>> Adds interrupt support to the Xilinx GPIO driver so that rising and
>> falling edge line events can be supported. Since interrupt support is
>> an optional feature in the Xilinx IP, the driver continues to support
>> devices which have no interrupt provided.
>>
>> These changes are based on a patch in the Xilinx Linux Git tree,
>> "gpio: xilinx: Add irq support to the driver" from Srinivas Neeli, but
>> include a number of fixes and improvements such as supporting both
>> rising and falling edge events.
>>
>> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
>> ---
>>   drivers/gpio/Kconfig       |   1 +
>>   drivers/gpio/gpio-xilinx.c | 247 ++++++++++++++++++++++++++++++++++---
>>   2 files changed, 233 insertions(+), 15 deletions(-)
>>
(snip)
>>   /* Read/Write access to the GPIO registers */
>>   #if defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86)
>>   # define xgpio_readreg(offset)         readl(offset)
>> @@ -35,17 +43,27 @@
>>    * @gc: GPIO chip
>>    * @regs: register block
>>    * @gpio_width: GPIO width for every channel
>> - * @gpio_state: GPIO state shadow register
>> + * @gpio_state: GPIO write state shadow register
>> + * @gpio_last_irq_read: GPIO read state register from last interrupt
>>    * @gpio_dir: GPIO direction shadow register
>>    * @gpio_lock: Lock used for synchronization
>> + * @irq: IRQ used by GPIO device
>> + * @irq_enable: GPIO irq enable/disable bitfield
>> + * @irq_rising_edge: GPIO irq rising edge enable/disable bitfield
>> + * @irq_falling_edge: GPIO irq rising edge enable/disable bitfield
>>    */
>>   struct xgpio_instance {
>>          struct gpio_chip gc;
>>          void __iomem *regs;
>>          unsigned int gpio_width[2];
>>          u32 gpio_state[2];
>> +       u32 gpio_last_irq_read[2];
>>          u32 gpio_dir[2];
>> -       spinlock_t gpio_lock[2];
>> +       spinlock_t gpio_lock;
>> +       int irq;
>> +       u32 irq_enable[2];
>> +       u32 irq_rising_edge[2];
>> +       u32 irq_falling_edge[2];
> 
> I don't know this driver very well. Could you explain why the two
> instances of these fields and why are you removing the second lock?

The Xilinx IP has either one or two banks of GPIO inputs, which is why 
there are two instances of most of these fields. However, the interrupt 
status and interrupt mask registers are shared between the banks (there 
are separate bits for each bank), which would make the locking difficult 
to manage if separate locks were used. There seemed to be no real 
downside in using a single lock as there shouldn't be significant 
contention.

>>          chip->gc.base = -1;
>> @@ -336,6 +530,29 @@ static int xgpio_probe(struct platform_device *pdev)
>>
>>          xgpio_save_regs(chip);
>>
>> +       chip->irq = platform_get_irq(pdev, 0);
> 
> Why not simply: platform_get_irq_optional()?

Can do, will update for v2.

-- 
Robert Hancock
Senior Hardware Designer
SED Systems, a division of Calian Ltd.
Email: hancock@sedsystems.ca
