Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BAC2F1D2A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 18:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389421AbhAKRzR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 12:55:17 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:34171 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730148AbhAKRzQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 12:55:16 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 05B3A3E822;
        Mon, 11 Jan 2021 18:54:33 +0100 (CET)
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO
 Expander
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        marek.vasut@gmail.com
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
 <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
 <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com>
 <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
 <CACRpkdZXgN91jKBDvf=P5_6ObOaacQa2PGL3-jP1gBW__ZyOaA@mail.gmail.com>
 <744125a7-ffb6-a3f5-70cb-2ab48fcf31b8@somainline.org>
 <CACRpkdYmVpEZMruu3UcqiGr2q7xSdTQKmwnu7eq2-MPJte8ATA@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <985163d2-9e22-52f2-9632-594c5502bd10@somainline.org>
Date:   Mon, 11 Jan 2021 18:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYmVpEZMruu3UcqiGr2q7xSdTQKmwnu7eq2-MPJte8ATA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 10/01/21 20:35, Linus Walleij ha scritto:
> On Sun, Jan 10, 2021 at 3:32 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> 
>> So, I've retried some basic usage of the regcache, relevant snippets here:
>> static bool aw9523_volatile_reg(struct device *dev, unsigned int reg)
>> {
>>
>>          return reg == AW9523_REG_IN_STATE(0) ||
>>                 reg == AW9523_REG_IN_STATE(AW9523_PINS_PER_PORT) ||
>>                 reg == AW9523_REG_CHIPID;
>> }
> (...)
>> Since REG_IN_STATE is used to read the GPIO input level, it's not
>> cacheable,
> 
> Fair enough.
> 
>> then CHIPID was set as not cacheable for safety: that may be
>> avoided, but that may make no sense.. since it's a one-time readout for
>> init putposes, it'd be useless to keep it cached.
> 
> I guess.
> 
>> Then, the set_bit/clear_bit in aw9523_irq_mask(), aw9523_irq_unmask were
>> replaced with calls to regmap_update_bits_async, example:
>>
>>          regmap_update_bits_async(awi->regmap,
>>                                   AW9523_REG_INTR_DIS(d->hwirq),
>>                                   BIT(n), BIT(n));
>>
>> Where of course the value is either BIT(n) or 0 for mask and unmask
>> respectively.
>> Also, the bus_sync_unlock callback was changed as follows:
>>
>> static void aw9523_irq_bus_sync_unlock(struct irq_data *d)
>>
>> {
>>        struct aw9523 *awi = gpiochip_get_data(irq_data_get_irq_chip_data(d));
>>        regcache_mark_dirty(awi->regmap);
>>        regcache_sync_region(awi->regmap, AW9523_REG_INTR_DIS(0),
>>                             AW9523_REG_INTR_DIS(AW9523_PINS_PER_PORT));
>>         mutex_unlock(&awi->irq->lock);
> (...)
>> One of the biggest / oddest issues that I get when trying to use
>> regcache is that I'm getting badbadbad scheduling while atomic warnings
>> all over and I don't get why, since regcache_default_sync is just
>> calling _regmap_write, which is exactly what (non _prefix) regmap_write
>> also calls...
> 
> OK that is the real problem to solve then.
> 
>> As a reference, this is one out of "many" (as you can imagine) stacktraces:
>>
>> <3>[    1.061428] BUG: scheduling while atomic: kworker/3:1/119/0x00000000
> (...)
>> <4>[    1.063134]  wait_for_completion_timeout+0x8c/0x110
>> <4>[    1.063257]  qup_i2c_wait_for_complete.isra.18+0x1c/0x80
>> <4>[    1.063429]  qup_i2c_xfer_v2_msg+0x2d4/0x3f0
>> <4>[    1.063543]  qup_i2c_xfer_v2+0x290/0xa28
>> <4>[    1.063652]  __i2c_transfer+0x16c/0x380
>> <4>[    1.063798]  i2c_transfer+0x5c/0x138
>> <4>[    1.063903]  i2c_transfer_buffer_flags+0x58/0x80
>> <4>[    1.064060]  regmap_i2c_write+0x1c/0x50
>> <4>[    1.064168]  _regmap_raw_write_impl+0x35c/0x688
>> <4>[    1.064285]  _regmap_bus_raw_write+0x64/0x80
>> <4>[    1.064440]  _regmap_write+0x58/0xa8
>> <4>[    1.064545]  regcache_default_sync+0xcc/0x1a0
>> <4>[    1.064660]  regcache_sync_region+0xdc/0xe8
>> <4>[    1.064811]  aw9523_irq_bus_sync_unlock+0x30/0x48
>> <4>[    1.064931]  __setup_irq+0x798/0x890
>> <4>[    1.065034]  request_threaded_irq+0xe0/0x198
>> <4>[    1.065188]  devm_request_threaded_irq+0x78/0xf8
>> <4>[    1.065311]  gpio_keyboard_probe+0x2a8/0x468
> 
> scheduling while atomic happens when this trace gets called with interrupts
> disabled, usually because someone has taken a spinlock.
> 
> Looking in __setup_irq() it looks safe.
> 
> I would turn on lock debugging (lockdep) and see if I can find it that way.
> 
> Yours,
> Linus Walleij
> 

Hey!
Good news around the corner!

So, the issues were relative to the gpio matrix_keypad driver, which is 
protecting with spinlocks (!), "throwing" us in atomic context and 
obviously producing this kind of havoc.

Regarding this, I feel like we should bring this to the attention of the 
matrix_keypad driver maintainer, Marek Vasut, which I'm including to the 
Cc list of this email... but at the same time, that driver seems to be 
largely outdated and for this reason I've decided to make one on-the-fly 
that uses modern APIs instead and also seems to solve slowness issues on 
my KB matrix connected to the AW9523.

Back to our topic, I have solved the issues that were preventing the 
usage of a FLAT regcache, cleaned up a bit and tested the entire thing 
again.
This works even better than before.

The V2 of this series is coming in a few minutes.
A huge thank you for your help!

-- Angelo
