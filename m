Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F142F0797
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jan 2021 15:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbhAJOdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 10 Jan 2021 09:33:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbhAJOdd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Jan 2021 09:33:33 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A85C061786
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jan 2021 06:32:52 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 81F351F4FB;
        Sun, 10 Jan 2021 15:32:47 +0100 (CET)
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO
 Expander
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
 <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
 <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com>
 <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
 <CACRpkdZXgN91jKBDvf=P5_6ObOaacQa2PGL3-jP1gBW__ZyOaA@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <744125a7-ffb6-a3f5-70cb-2ab48fcf31b8@somainline.org>
Date:   Sun, 10 Jan 2021 15:32:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZXgN91jKBDvf=P5_6ObOaacQa2PGL3-jP1gBW__ZyOaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 10/01/21 01:24, Linus Walleij ha scritto:
> On Sun, Jan 10, 2021 at 12:11 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
>> Il 09/01/21 23:11, Linus Walleij ha scritto:
> 
>>> The major review comment is that it'd be nice if you look into
>>> using regmaps register cache instead of rolling your own,
>>> and also possibly using regmaps locking rather than your own
>>> as a result of that.
>>>
>> Actually, I really tried to use regmap's FLAT register cache and after
>> many, many tries... I had to give up. I just couldn't get it working. :(
> 
> This needs to be root-caused. The register cache in regmap is for
> using not for decoration.
> 
> What is the problems you are seeing?
> 
> If it is fundamentally so that regmap has limitations that is one thing,
> but I want to rule out that we're just not using it wrong or that there
> is a bug in it that we should fix.
> 
> Looping in Mark Brown the regmap maintainer.
> 
> Yours,
> Linus Walleij
> 

Oh don't misunderstand me, I would really be happy to make use of the 
regmap register cache, it's a nice one.

So, I've retried some basic usage of the regcache, relevant snippets here:
static bool aw9523_volatile_reg(struct device *dev, unsigned int reg)

{

	return reg == AW9523_REG_IN_STATE(0) ||

	       reg == AW9523_REG_IN_STATE(AW9523_PINS_PER_PORT) ||

	       reg == AW9523_REG_CHIPID;

}

static const struct regmap_config aw9523_regmap = {

....
	.volatile_reg = aw9523_volatile_reg,


	.cache_type = REGCACHE_FLAT,

....

}

Since REG_IN_STATE is used to read the GPIO input level, it's not 
cacheable, then CHIPID was set as not cacheable for safety: that may be 
avoided, but that may make no sense.. since it's a one-time readout for 
init putposes, it'd be useless to keep it cached.

Then, the set_bit/clear_bit in aw9523_irq_mask(), aw9523_irq_unmask were 
replaced with calls to regmap_update_bits_async, example:

	regmap_update_bits_async(awi->regmap,

				 AW9523_REG_INTR_DIS(d->hwirq),

				 BIT(n), BIT(n));



Where of course the value is either BIT(n) or 0 for mask and unmask 
respectively.
Also, the bus_sync_unlock callback was changed as follows:

static void aw9523_irq_mask(struct irq_data *d)

{

	struct aw9523 *awi =
		gpiochip_get_data(irq_data_get_irq_chip_data(d));

	unsigned int n = d->hwirq % AW9523_PINS_PER_PORT;



	regmap_update_bits_async(awi->regmap,

				 AW9523_REG_INTR_DIS(d->hwirq),

				 BIT(n), BIT(n));

}

One of the biggest / oddest issues that I get when trying to use 
regcache is that I'm getting badbadbad scheduling while atomic warnings 
all over and I don't get why, since regcache_default_sync is just 
calling _regmap_write, which is exactly what (non _prefix) regmap_write 
also calls...

As a reference, this is one out of "many" (as you can imagine) stacktraces:

<3>[    1.061428] BUG: scheduling while atomic: kworker/3:1/119/0x00000000

<4>[    1.061575] Modules linked in:

<4>[    1.061716] CPU: 3 PID: 119 Comm: kworker/3:1 Tainted: G        W 
         5.10.0-rc3-31949-ge1680e3101bc-dirty #1162

<4>[    1.061956] Hardware name: F(x)tec Pro1 (QX1000) (DT)

<4>[    1.062081] Workqueue: events deferred_probe_work_func

<4>[    1.062205] Call trace:

<4>[    1.062333]  dump_backtrace+0x0/0x1e0

<4>[    1.062439]  show_stack+0x14/0x60

<4>[    1.062539]  dump_stack+0xd4/0x12c

<4>[    1.062680]  __schedule_bug+0x50/0x70

<4>[    1.062785]  __schedule+0x618/0x650

<4>[    1.062888]  schedule+0x6c/0xf8

<4>[    1.062985]  schedule_timeout+0x1d0/0x260

<4>[    1.063134]  wait_for_completion_timeout+0x8c/0x110

<4>[    1.063257]  qup_i2c_wait_for_complete.isra.18+0x1c/0x80

<4>[    1.063429]  qup_i2c_xfer_v2_msg+0x2d4/0x3f0

<4>[    1.063543]  qup_i2c_xfer_v2+0x290/0xa28

<4>[    1.063652]  __i2c_transfer+0x16c/0x380

<4>[    1.063798]  i2c_transfer+0x5c/0x138

<4>[    1.063903]  i2c_transfer_buffer_flags+0x58/0x80

<4>[    1.064060]  regmap_i2c_write+0x1c/0x50

<4>[    1.064168]  _regmap_raw_write_impl+0x35c/0x688

<4>[    1.064285]  _regmap_bus_raw_write+0x64/0x80

<4>[    1.064440]  _regmap_write+0x58/0xa8

<4>[    1.064545]  regcache_default_sync+0xcc/0x1a0

<4>[    1.064660]  regcache_sync_region+0xdc/0xe8

<4>[    1.064811]  aw9523_irq_bus_sync_unlock+0x30/0x48

<4>[    1.064931]  __setup_irq+0x798/0x890

<4>[    1.065034]  request_threaded_irq+0xe0/0x198

<4>[    1.065188]  devm_request_threaded_irq+0x78/0xf8

<4>[    1.065311]  gpio_keyboard_probe+0x2a8/0x468

<4>[    1.065465]  platform_drv_probe+0x50/0xa0

<4>[    1.065576]  really_probe+0x290/0x4e8

<4>[    1.065682]  driver_probe_device+0xf4/0x160

<4>[    1.065834]  __device_attach_driver+0x98/0x110

<4>[    1.065950]  bus_for_each_drv+0x64/0xc8

<4>[    1.066063]  __device_attach+0xe4/0x168

<4>[    1.066211]  device_initial_probe+0x10/0x18

<4>[    1.066325]  bus_probe_device+0x90/0x98

<4>[    1.066434]  deferred_probe_work_func+0x88/0xe0

<4>[    1.066591]  process_one_work+0x1e4/0x358

<4>[    1.066702]  worker_thread+0x208/0x478

<4>[    1.073273]  kthread+0x14c/0x150

<4>[    1.079858]  ret_from_fork+0x10/0x18



P.S.: Infinite thanks for being so nice and helpful!
