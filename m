Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4C02FA34D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 15:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392939AbhAROkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 09:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393042AbhAROjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 09:39:15 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7A5C061574
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 06:38:19 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 888D63EED9;
        Mon, 18 Jan 2021 15:38:16 +0100 (CET)
Subject: Re: [PATCH v2 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO
 Expander
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
 <CACRpkdZp3oqj4VeUZEPu=POwAdf-7R3NzNoN9XehtEi_R_fgkw@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <1e34145b-a04a-1cbb-7fbc-87c69b8dcfd7@somainline.org>
Date:   Mon, 18 Jan 2021 15:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZp3oqj4VeUZEPu=POwAdf-7R3NzNoN9XehtEi_R_fgkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 18/01/21 14:19, Linus Walleij ha scritto:
> On Mon, Jan 11, 2021 at 7:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> 
>> The Awinic AW9523(B) is a multi-function I2C gpio expander in a
>> TQFN-24L package, featuring PWM (max 37mA per pin, or total max
>> power 3.2Watts) for LED driving capability.
>>
>> It has two ports with 8 pins per port (for a total of 16 pins),
>> configurable as either PWM with 1/256 stepping or GPIO input/output,
>> 1.8V logic input; each GPIO can be configured as input or output
>> independently from each other.
>>
>> This IC also has an internal interrupt controller, which is capable
>> of generating an interrupt for each GPIO, depending on the
>> configuration, and will raise an interrupt on the INTN pin to
>> advertise this to an external interrupt controller.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> I really like the looks of this new version! :)
> 
> Just some minor questions now:
> 
>> +static int aw9523_gpio_irq_type(struct irq_data *d, unsigned int type)
>> +{
>> +       switch (type) {
>> +       case IRQ_TYPE_NONE:
>> +       case IRQ_TYPE_LEVEL_MASK:
>> +       case IRQ_TYPE_LEVEL_HIGH:
>> +       case IRQ_TYPE_LEVEL_LOW:
>> +               return 0;
> 
> This still doesn't make sense, I think you can see why.
> 
> If level IRQs can fire both when the line is high and low without
> any configuration in any register whatsoever, then IRQs are
> *constantly* fireing. Which I suppose they are not.
> 
> Something is wrong here. Either you just support one
> of them or there is a way to configure whether to act as
> high or low level.
> 
> I'm also mildly sceptic because GPIO expanders ... do they
> really support level IRQs, and does it make sense when you
> think about it? I would rather expect edge IRQs as these have
> a natural trigger point and level IRQs may very well be gone
> by the time you come around to read the status register.
> I suppose it can be done but the events must be really slow
> then, slower than the 400kHz of an I2C bus.
> 
> Can you please look over the interrupt logic in your specs?
> 
> Yours,
> Linus Walleij
> 

Have I misunderstood this part of the API?

By the way, this is really LEVEL irq, not EDGE... To avoid any
misunderstanding, I think that the best way to show you what I
am seeing is to just copy-paste the relevant piece from the
datasheet for this hardware (it's not a confidential datasheet
and freely found on the internet).

Check this out:
" External MCU is required acknowledge by INTN pin. INTN is open-drain
out-
put, low-level active, and need external pull-up resistor.

When AW9523B detect port change, any input state from high-level to
low-level or from
  low-level to high-level will generate interrupt after
8us internal deglitch. "

...but since the datasheet is sometimes unclear about "things" (I am
mostly sure that they have translated it to english from chinese), I
have actually checked whether the INTN pin was pushed LOW when one of
the inputs goes from HIGH to LOW.. and.. it does... and as you imagine
yeah.. it's slow.. and yes, as slow as you can imagine. :)

So, in short, this chip is raising an interrupt when any input changes
state, regardless of the change being LOW->HIGH or HIGH->LOW.

Thanks
- Angelo

