Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF92FBD1E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 01:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKNAld (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 19:41:33 -0500
Received: from mx.0dd.nl ([5.2.79.48]:57628 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbfKNAld (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 19:41:33 -0500
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id 6FA165FB77;
        Thu, 14 Nov 2019 01:41:31 +0100 (CET)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key; secure) header.d=vdorst.com header.i=@vdorst.com header.b="PWyNgaXH";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id 3A86F74363;
        Thu, 14 Nov 2019 01:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 3A86F74363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1573692091;
        bh=CK01gnyY9vBADNeuvb1NQkZIJKq5su/r4AtN8KFn1Ac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PWyNgaXHFChMPtVhTBzPyAJXwD/OUgiaRcXw/XgyVQImc+2KMJ9H7pAJbhrdPKU1L
         +wlrXXEypKCk54voSaQCOSPXV+Zl7kNdD1h+1EI1WVqCUNEvUO2/4CwZu87DKPf6uy
         vf8MRctIUlo8TmJo0jFnpGfA6+D1KicjHztIjBCYSR5nkh4eaxB8Ghha7siitAjrK0
         ZA5mENFLqCZYuhGDd2YDZ46xMtuBwEO1GuNA5SdQ2VmwuHExsYItcUba0Us3FZ4Gpo
         A3DzQL/F3AmanmUow7SQeF7i5v+vZVLcEK0RmY4aVgZkculwu/6ut8m6AGada+OLc2
         iIGtC+EDBZTqA==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Thu, 14 Nov 2019 00:41:31 +0000
Date:   Thu, 14 Nov 2019 00:41:31 +0000
Message-ID: <20191114004131.Horde.xFUcp6a06EiB9uVXXSKpfgV@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: mt7621: gpio-hog not working properly
References: <20191107214812.Horde.z_ETelVXryT7bme5Ed6oB16@www.vdorst.com>
 <CACRpkdaz23Eug+e+ghKQWWaDHegfdngPQ_UQkaP6zAbnic-7_w@mail.gmail.com>
 <20191113205425.Horde.MPwTgNxw4tJljEU5DoeUTIr@www.vdorst.com>
 <CACRpkdasYwYszTZwZyhvqjoUg2ku7Z7W4gxnD+qEjZzA=1bahQ@mail.gmail.com>
In-Reply-To: <CACRpkdasYwYszTZwZyhvqjoUg2ku7Z7W4gxnD+qEjZzA=1bahQ@mail.gmail.com>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Linus Walleij <linus.walleij@linaro.org>:

> On Wed, Nov 13, 2019 at 9:54 PM René van Dorst <opensource@vdorst.com> wrote:
>
>> mt7621 used bgpio_set_with_clear() because we have `set` and `clear`
>> registers.
> (...)
>> It seems that writing to the 'clear' register doesn't do anything.
>> I noticed that register address is 0x1e000000 in the DTS but in the
>> code it is 0xbe000000.
>
> Do you mean physical memory 0x1e000000 gets remapped
> at virtual memory 0xbe000000?

Yes. mtk->base = be000600.

[    3.094301] mediatek_gpio_bank_probe: mtk->base = be000600
[    3.105165] gpiochip_find_base: found new base at 480
[    3.115135] bgpio_set_with_clear: gc-base-480 gpio:7 val:0x0  
mask:0x80 data-reg-val:0xbe000640
[    3.132196] bgpio_set_with_clear: before: g7 reg:0xbe000640:  
data:0xb75f7da, masked data:0x80
[    3.149297] bgpio_write32: 0xbe000640 <= 0x80
[    3.157935] bgpio_set_with_clear:  after: g7 reg:0xbe000640:  
data:0xb75f7da, masked data:0x80
[    3.175040] bgpio_write32: 0xbe000600 <= 0x80
[    3.183682] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high
[    3.195955] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x843
[    3.207692] gpio gpiochip0: (1e000600.gpio-bank0): added GPIO  
chardev (254:0)


>
>> [    3.158002] bgpio_write32: 0xbe000600 <= 0x80
>> [    3.165258] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high
>> [    3.177532] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x843
>>
>> When using program 'io' writing to the `clear` register 0x1e000640
>> does have effect.
>>
>> root@OpenWrt:/# io -4 0x1e000620
>> 1e000620:  0b75f7de
>> root@OpenWrt:/# io -4 -w 0x1e000640 0x80
>> root@OpenWrt:/# io -4 0x1e000620
>> 1e000620:  0b75f74e
> (...)
>> If I change the bgpio_init() values so that we don't have the `set`
>> and `clear` registers.
>> With the patch below I do get right results.
>
> That's weird!

So this means that changing data register thru the 'set'/'clear'
registers is not working but writing direct to the data register does.

So the question is: why is writel() in bgpio_write32() not working on
the 'set'/'clear' registers.

>
>> Any idea what this can be?
>
> Try to pass the flag BGPIOF_UNREADABLE_REG_SET,
> it seems the code is using the set register to read back the
> value. In this case it is actually working you just don't see
> it in debugfs.

debugfs is showing the actual results.
Also I know when it is working. The kernel prints the SFP module info  
to the dmesg.


read the gpio status:

root@OpenWrt:/# cat /sys/kernel/debug/gpio
gpiochip3: GPIOs 400-415, parent: i2c/0-0025, 0-0025, can sleep:
  gpio-405 (                    |mod-def0            ) in  lo ACTIVE LOW

gpiochip2: GPIOs 416-447, parent: platform/1e000600.gpio, 1e000600.gpio-bank2:

gpiochip1: GPIOs 448-479, parent: platform/1e000600.gpio, 1e000600.gpio-bank1:

gpiochip0: GPIOs 480-511, parent: platform/1e000600.gpio, 1e000600.gpio-bank0:
  gpio-487 (                    |sfp_i2c_clk_gate    ) out hi ACTIVE LOW
  gpio-492 (                    |reset               ) in  hi IRQ ACTIVE LOW
  gpio-496 (                    |sysfs               ) out hi
  gpio-497 (                    |sysfs               ) out lo
  gpio-498 (                    |sysfs               ) out hi
  gpio-499 (                    |sysfs               ) out lo
  gpio-500 (                    |sysfs               ) out hi
root@OpenWrt:/# io -4 0x1e000620
1e000620:  0355f7de

Clear gpio7 via 'clear' register:

root@OpenWrt:/# io -4 -w 0x1e000640 0x80

read the gpio status again:

root@OpenWrt:/# cat /sys/kernel/debug/gpio
gpiochip3: GPIOs 400-415, parent: i2c/0-0025, 0-0025, can sleep:
  gpio-405 (                    |mod-def0            ) in  lo ACTIVE LOW

gpiochip2: GPIOs 416-447, parent: platform/1e000600.gpio, 1e000600.gpio-bank2:

gpiochip1: GPIOs 448-479, parent: platform/1e000600.gpio, 1e000600.gpio-bank1:

gpiochip0: GPIOs 480-511, parent: platform/1e000600.gpio, 1e000600.gpio-bank0:
  gpio-487 (                    |sfp_i2c_clk_gate    ) out lo ACTIVE LOW
  gpio-492 (                    |reset               ) in  hi IRQ ACTIVE LOW
  gpio-496 (                    |sysfs               ) out hi
  gpio-497 (                    |sysfs               ) out lo
  gpio-498 (                    |sysfs               ) out hi
  gpio-499 (                    |sysfs               ) out lo
  gpio-500 (                    |sysfs               ) out hi
root@OpenWrt:/# io -4 0x1e000620
1e000620:  0b75f74e

Values shown by debugfs are correct.

Below the diff of my debug code and assembly of the bgpio_write32();

Greats,

René

>
> Cc:ed Sergio maybe he has some ideas.
>
> It seems to be hardware related then, hm.
>
> Yours,
> Linus Walleij

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index cd07c948649f..18d1b6937092 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -82,6 +82,7 @@ static unsigned long bgpio_read16(void __iomem *reg)

  static void bgpio_write32(void __iomem *reg, unsigned long data)
  {
+       pr_info("%s: 0x%px <= 0x%lx\n", __func__, reg, data);
         writel(data, reg);
  }

@@ -150,6 +151,8 @@ static int bgpio_get_set_multiple(struct gpio_chip  
*gc, unsigned long *mask,
         unsigned long get_mask = 0;
         unsigned long set_mask = 0;

+       pr_info("%s: gpio-%d b0x%lx m0x%lx", __func__, gc->base,  
*bits, *mask);
+
         /* Make sure we first clear any bits that are zero when we  
read the register */
         *bits &= ~*mask;

@@ -222,6 +225,8 @@ static void bgpio_set(struct gpio_chip *gc,  
unsigned int gpio, int val)
         unsigned long mask = bgpio_line2mask(gc, gpio);
         unsigned long flags;

+       pr_info("%s: gpio:%d val:0x%x mask:0x%lx", __func__, gpio, val, mask);
+
         spin_lock_irqsave(&gc->bgpio_lock, flags);

         if (val)
@@ -239,10 +244,22 @@ static void bgpio_set_with_clear(struct  
gpio_chip *gc, unsigned int gpio,
  {
         unsigned long mask = bgpio_line2mask(gc, gpio);

+       pr_info("%s: gc-base-%d gpio:%d val:0x%x mask:0x%lx  
data-reg-val:0x%px\n", __func__, gc->base,
+               gpio, val, mask, val ? gc->reg_set : gc->reg_clr);
+
+       pr_info("%s: before: g%d reg:0x%px: data:0x%lx, masked  
data:0x%lx \n", __func__,
+               gpio, val ? gc->reg_set : gc->reg_clr,
+               gc->read_reg(gc->reg_dat), gc->read_reg(gc->reg_dat) & mask);
+
         if (val)
                 gc->write_reg(gc->reg_set, mask);
         else
                 gc->write_reg(gc->reg_clr, mask);
+
+       pr_info("%s:  after: g%d reg:0x%px: data:0x%lx, masked  
data:0x%lx \n", __func__,
+               gpio, val ? gc->reg_set : gc->reg_clr,
+               gc->read_reg(gc->reg_dat), gc->read_reg(gc->reg_dat) & mask);
+
  }

  static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -250,6 +267,8 @@ static void bgpio_set_set(struct gpio_chip *gc,  
unsigned int gpio, int val)
         unsigned long mask = bgpio_line2mask(gc, gpio);
         unsigned long flags;

+       pr_info("%s: g%d v0x%x m0x%lx", __func__, gpio, val, mask);
+
         spin_lock_irqsave(&gc->bgpio_lock, flags);

         if (val)
@@ -322,6 +341,8 @@ static void bgpio_set_multiple_with_clear(struct  
gpio_chip *gc,
  {
+       pr_info("%s: g%d v0x%x m0x%lx", __func__, gpio, val, mask);
+
         spin_lock_irqsave(&gc->bgpio_lock, flags);

         if (val)
@@ -322,6 +341,8 @@ static void bgpio_set_multiple_with_clear(struct  
gpio_chip *gc,
  {
         unsigned long set_mask, clear_mask;

+       pr_info("%s: gpio-%d b%lx m%lx\n", __func__, gc->base, *bits, *mask);
+
         bgpio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);

         if (set_mask)
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index d1d785f983a7..cff3c79e3561 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -222,13 +222,19 @@ mediatek_gpio_bank_probe(struct device *dev,
         rg->chip.of_node = node;
         rg->bank = bank;

+       pr_info("%s: mtk->base = %px\n", __func__, mtk->base);
+
         dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);
         set = mtk->base + GPIO_REG_DSET + (rg->bank * GPIO_BANK_STRIDE);
         ctrl = mtk->base + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
         diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);

+       //ret = bgpio_init(&rg->chip, dev, 4,
+       //               dat, NULL, NULL, diro, NULL, 0);
+
         ret = bgpio_init(&rg->chip, dev, 4,
                          dat, set, ctrl, diro, NULL, 0);
+
         if (ret) {
                 dev_err(dev, "bgpio_init() failed\n");
                 return ret;
@@ -283,6 +289,8 @@ mediatek_gpio_bank_probe(struct device *dev,
                 return ret;
         }

+       pr_info("%s: data: %px(0x%x), set: %px, clr: %px\n", __func__,  
dat, mtk_gpio_r32(rg, GPIO_REG_DATA) , set, ctrl);
+
         /* set polarity to low for all gpios */
         mtk_gpio_w32(rg, GPIO_REG_POL, 0);

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index dba5f08f308c..ca797fc1528e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1518,6 +1518,8 @@ int gpiochip_add_data_with_key(struct gpio_chip  
*chip, void *data,
                         else
                                 clear_bit(FLAG_IS_OUT, &desc->flags);
                 }
+               if (i == 7)
+                       pr_info("%s: gpiochip%d gpio7: 0x%lx\n",  
__func__, gdev->id, desc->flags);
         }

         acpi_gpiochip_add(chip);


bgpio_write32 decompiled.

Normal:

8037c5b0 <bgpio_write32>:
8037c5b0:	0000000f 	sync
8037c5b4:	ac850000 	sw	a1,0(a0)
8037c5b8:	03e00008 	jr	ra
8037c5bc:	00000000 	nop

With the debug pr_info()

8037cfa8 <bgpio_write32>:
8037cfa8:	27bdffe0 	addiu	sp,sp,-32
8037cfac:	afb10018 	sw	s1,24(sp)
8037cfb0:	00a08825 	move	s1,a1
8037cfb4:	afb00014 	sw	s0,20(sp)
8037cfb8:	3c058077 	lui	a1,0x8077
8037cfbc:	00808025 	move	s0,a0
8037cfc0:	afbf001c 	sw	ra,28(sp)
8037cfc4:	3c048077 	lui	a0,0x8077
8037cfc8:	24a5789c 	addiu	a1,a1,30876
8037cfcc:	24847864 	addiu	a0,a0,30820
8037cfd0:	02203825 	move	a3,s1
8037cfd4:	0c01d729 	jal	80075ca4 <printk>
8037cfd8:	02003025 	move	a2,s0
8037cfdc:	0000000f 	sync
8037cfe0:	ae110000 	sw	s1,0(s0)
8037cfe4:	8fbf001c 	lw	ra,28(sp)
8037cfe8:	8fb10018 	lw	s1,24(sp)
8037cfec:	8fb00014 	lw	s0,20(sp)
8037cff0:	03e00008 	jr	ra
8037cff4:	27bd0020 	addiu	sp,sp,32


