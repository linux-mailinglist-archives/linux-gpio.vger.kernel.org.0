Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9E1301111
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 00:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbhAVXkA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 18:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbhAVXj7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 18:39:59 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40C1C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 15:39:18 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 77B203EEDE;
        Sat, 23 Jan 2021 00:39:13 +0100 (CET)
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
 <1e34145b-a04a-1cbb-7fbc-87c69b8dcfd7@somainline.org>
 <CACRpkdacfa6usOZtc+A=ZxEpB1ij_gAKX2PLMOaX0mY_0qHp6A@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <f9cc7046-1855-cbe5-51ed-ab5f76716805@somainline.org>
Date:   Sat, 23 Jan 2021 00:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdacfa6usOZtc+A=ZxEpB1ij_gAKX2PLMOaX0mY_0qHp6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 22/01/21 10:59, Linus Walleij ha scritto:
> On Mon, Jan 18, 2021 at 3:38 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> 
>> By the way, this is really LEVEL irq, not EDGE... To avoid any
>> misunderstanding, I think that the best way to show you what I
>> am seeing is to just copy-paste the relevant piece from the
>> datasheet for this hardware (it's not a confidential datasheet
>> and freely found on the internet).
>>
>> Check this out:
>> " External MCU is required acknowledge by INTN pin. INTN is open-drain
>> out-
>> put, low-level active, and need external pull-up resistor.
> 
> This talks about what polarity (active low) the pin from the expander
> to the SoC/CPU is. It has nothing to do with the line into the
> expander.
> 
>> When AW9523B detect port change, any input state from high-level to
>> low-level or from
>>    low-level to high-level will generate interrupt after
>> 8us internal deglitch. "
>>
>> ...but since the datasheet is sometimes unclear about "things" (I am
>> mostly sure that they have translated it to english from chinese), I
>> have actually checked whether the INTN pin was pushed LOW when one of
>> the inputs goes from HIGH to LOW.. and.. it does... and as you imagine
>> yeah.. it's slow.. and yes, as slow as you can imagine. :)
>>
>> So, in short, this chip is raising an interrupt when any input changes
>> state, regardless of the change being LOW->HIGH or HIGH->LOW.
> 
> This means that the expander only supports
> IRQ_TYPE_EDGE_BOTH and nothing else.
> 
> "port change" above means edges.
> 
> Augment your driver to only accept this type.
> 
> The consumers better request IRQ_TYPE_EDGE_BOTH
> (from a device tree for example) and consumers better
> handle the fact that they get interrupts on both rising
> and falling edge as well, else they may need special
> code to handle it. This is not a very nice feature of
> the expander, it would be more helpful to users to
> get interrupts on only rising or only falling edges, but
> as written, it will generate interrupts on both transitions.
> 
> Yours,
> Linus Walleij
> 

I see the reading mistake now... oh wow, that was... sad, from me.
I will fix this ASAP and will send back a v3.

Thank you!

- Angelo
