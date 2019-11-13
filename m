Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 460CAFBA43
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 21:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfKMUy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 15:54:27 -0500
Received: from mx.0dd.nl ([5.2.79.48]:47994 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfKMUy1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 15:54:27 -0500
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id 3BCBE5FCC4;
        Wed, 13 Nov 2019 21:54:26 +0100 (CET)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key; secure) header.d=vdorst.com header.i=@vdorst.com header.b="OWduscY+";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id E0A956B0F2;
        Wed, 13 Nov 2019 21:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com E0A956B0F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1573678465;
        bh=gDfan4nKiDWTZHGQTw/WzltG5KDzbMqgMOSB5yEHkhg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OWduscY+5/W1oCUNaipbCRB6y4itFKczM00XtEGsVOP1R1suYb5ryEc0/0uMzcBBU
         E81r8yWDsMym+UXBUskTG0xsVnn0brmECnqGjD1ywIQoimNyIiq3B7KBa03nzHWkr5
         Sp920LzBAcnhxs5qBQAl+bY224U2qGnqYO9LeS2CnTRKDySQsvdEz5p/dI6ta/1CHn
         BVoSbafS4dnSp4Z3K8DSW7GUUzGB3bBGwx5nlzKNQB8Ksz0LxGE4eNtzLxNOts9Ub5
         0B5caT7003avBWUaKzbJd57bM20Ctxv57feuI93Q6FAITdqYXWahFbhAd6zKEuOUCb
         l/rnBXgCKnMGg==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Wed, 13 Nov 2019 20:54:25 +0000
Date:   Wed, 13 Nov 2019 20:54:25 +0000
Message-ID: <20191113205425.Horde.MPwTgNxw4tJljEU5DoeUTIr@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: mt7621: gpio-hog not working properly
References: <20191107214812.Horde.z_ETelVXryT7bme5Ed6oB16@www.vdorst.com>
 <CACRpkdaz23Eug+e+ghKQWWaDHegfdngPQ_UQkaP6zAbnic-7_w@mail.gmail.com>
In-Reply-To: <CACRpkdaz23Eug+e+ghKQWWaDHegfdngPQ_UQkaP6zAbnic-7_w@mail.gmail.com>
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

> On Thu, Nov 7, 2019 at 10:48 PM René van Dorst <opensource@vdorst.com> wrote:
>
>> DTS:
>>
>> &gpio {
>>         sfp_i2c_clk_gate {
>>                 gpio-hog;
>>                 gpios = <7 GPIO_ACTIVE_LOW>;
>>                 output-high;
>>         };
>> };
>>
>> root@OpenWrt:/# dmesg | grep hog
>> [    3.095360] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high
>
> This looks correct, output/high and "high" in this case means
> asserted and it's active low so that should mean it is driven
> low.
>
>> gpiochip0: GPIOs 480-511, parent: platform/1e000600.gpio,  
>> 1e000600.gpio-bank0:
>>   gpio-487 (                    |sfp_i2c_clk_gate    ) out hi ACTIVE LOW
>
> So that is wrong :(
>
>> DTS:
>>
>> &gpio {
>>         sfp_i2c_clk_gate {
>>                 gpio-hog;
>>                 gpios = <7 GPIO_ACTIVE_HIGH>;
>>                 output-high;
>>         };
>> };
> (...)
>>   gpio-487 (                    |sfp_i2c_clk_gate    ) out hi
>
> OK that worked... sheer luck I guess.
>
>> DTS:
>>
>> &gpio {
>>         sfp_i2c_clk_gate {
>>                 gpio-hog;
>>                 gpios = <7 GPIO_ACTIVE_HIGH>;
>>                 output-low;
>>         };
>> };
> (...)
>>   gpio-487 (                    |sfp_i2c_clk_gate    ) out hi
>
> Yeah now it is wrong again...
>
>> So as you can see gpio-hog is parsed well by the kernel.
>> But it setting up the data value is not.
>
> Please drill into the functions.
>
> What happens down in the callback to the actual driver?
> Can you check whether the .set_value() gets the right value
> or not so we see if there is a logical or physical problem?
> The mt7621 driver uses gpio-mmio so you should patch
> drivers/gpio/gpio-mmio.c function bgpio_set() or
> bgpio_set_set() I think.

Hi Linus,

Thanks for pointing me in the direction where to start debuging.


mt7621 used bgpio_set_with_clear() because we have `set` and `clear`  
registers.

[    3.096085] gpiochip_find_base: found new base at 480
[    3.106063] bgpio_set_with_clear: gpio-480 gpio:7 val:0x0 mask:0x80  
reg:0xbe000640

[    3.118968] bgpio_set_with_clear: before: gpio:7 reg:0xbe000640:  
value-of-data-reg:0xb75f7de, masked data:0x80
[    3.134845] bgpio_write32: 0xbe000640 <= 0x80
[    3.142116] bgpio_set_with_clear:  after: gpio:7 reg:0xbe000640:  
value-of-data-reg:0xb75f7de, masked data:0x80

It seems that writing to the 'clear' register doesn't do anything.
I noticed that register address is 0x1e000000 in the DTS but in the  
code it is 0xbe000000.

[    3.158002] bgpio_write32: 0xbe000600 <= 0x80
[    3.165258] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high
[    3.177532] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x843

When using program 'io' writing to the `clear` register 0x1e000640  
does have effect.

root@OpenWrt:/# io -4 0x1e000620
1e000620:  0b75f7de
root@OpenWrt:/# io -4 -w 0x1e000640 0x80
root@OpenWrt:/# io -4 0x1e000620
1e000620:  0b75f74e



If I change the bgpio_init() values so that we don't have the `set`  
and `clear` registers.
With the patch below I do get right results.

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index d1d785f983a7..186e8d6f3c64 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -228,7 +228,8 @@ mediatek_gpio_bank_probe(struct device *dev,
         diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);

         ret = bgpio_init(&rg->chip, dev, 4,
-                        dat, set, ctrl, diro, NULL, 0);
+                        dat, NULL, NULL, diro, NULL, 0);
+
         if (ret) {
                 dev_err(dev, "bgpio_init() failed\n");
                 return ret;

Any idea what this can be?

Greats,

René

>
> Yours,
> Linus Walleij



