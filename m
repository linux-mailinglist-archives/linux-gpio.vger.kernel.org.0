Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D5B66BB99
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 11:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjAPKWJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 05:22:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjAPKWI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 05:22:08 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E498C125B0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 02:22:06 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7D480850D5;
        Mon, 16 Jan 2023 11:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673864525;
        bh=oC+FsD5ZelWs8Dj1ZMlnB/9l2zVFzmBZg5T1NoiVl4o=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YOiUXeeGY6Pb2LhJ8tlbyRRj0RtDpCI+cfto4s4X/blOEuaagUdRRPK1/p1Iaaj72
         RpmZiH9egwq/GJH5cGfEQ3tJmKU8QAs2UjKY3cdiXafSpKILDR11FaJlgcOQ23Gs4+
         +RchqL9XUUpZ96PcN6IzdknJCqb2KpP8al+of0/rFLVTpXfKvt3NrbmxgsqYbuqkcd
         lgIKAANkGtDkuJG5WpkgFXCP0olPAcOkr9GNz/kKi2zy4hubeKjyziWLd6wj+3G/wP
         4t0jH31UiYgrxWkO/62WMhSzYw624FY7o7qs1lSJXki+qxtPt5yNoNBnZJ7KvIO8MK
         8xwD9jizf4dTQ==
Message-ID: <fcaa6629-7f1d-9c31-16cd-613cd48d6675@denx.de>
Date:   Mon, 16 Jan 2023 11:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20230116094957.5756-1-marex@denx.de>
 <CAMRc=McBELorc-+rq1L9JcVYDJrcds2L_AGR2vwy1Vt19UgBKQ@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMRc=McBELorc-+rq1L9JcVYDJrcds2L_AGR2vwy1Vt19UgBKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/16/23 10:55, Bartosz Golaszewski wrote:
> On Mon, Jan 16, 2023 at 10:50 AM Marek Vasut <marex@denx.de> wrote:
>>
>> The driver currently performs register read-modify-write without locking
>> in its irqchip part, this could lead to a race condition when configuring
>> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
>> the register read-modify-write.
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Reviewed-by: Marc Zyngier <maz@kernel.org>
>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Loic Poulain <loic.poulain@linaro.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> ---
>> V3: New patch
>> V4: Include linux/spinlock.h
>> V5: Use raw_spinlock per 3c938cc5cebcb ("gpio: use raw spinlock for gpio chip shadowed data")
>> V6: No change
>> V7: Rebase on current next-20230116
>> ---
>>   drivers/gpio/gpio-mxc.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index d5626c572d24e..2d9d498727f10 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/slab.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/syscore_ops.h>
>>   #include <linux/gpio/driver.h>
>>   #include <linux/of.h>
>> @@ -159,6 +160,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>   {
>>          struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>>          struct mxc_gpio_port *port = gc->private;
>> +       unsigned long flags;
>>          u32 bit, val;
>>          u32 gpio_idx = d->hwirq;
>>          int edge;
>> @@ -197,6 +199,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>                  return -EINVAL;
>>          }
>>
>> +       raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
>> +
>>          if (GPIO_EDGE_SEL >= 0) {
>>                  val = readl(port->base + GPIO_EDGE_SEL);
>>                  if (edge == GPIO_INT_BOTH_EDGES)
>> @@ -217,15 +221,20 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>          writel(1 << gpio_idx, port->base + GPIO_ISR);
>>          port->pad_type[gpio_idx] = type;
>>
>> +       raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
>> +
>>          return 0;
>>   }
>>
>>   static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>>   {
>>          void __iomem *reg = port->base;
>> +       unsigned long flags;
>>          u32 bit, val;
>>          int edge;
>>
>> +       raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
>> +
>>          reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
>>          bit = gpio & 0xf;
>>          val = readl(reg);
>> @@ -243,6 +252,8 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>>                  return;
>>          }
>>          writel(val | (edge << (bit << 1)), reg);
>> +
>> +       raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
>>   }
>>
>>   /* handle 32 interrupts in one status register */
>> --
>> 2.39.0
>>
> 
> Both now applied, thanks and sorry again.

Thanks !
