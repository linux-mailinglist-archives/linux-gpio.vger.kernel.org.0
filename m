Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8032D08E9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 02:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgLGBqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 20:46:17 -0500
Received: from foss.arm.com ([217.140.110.172]:38238 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbgLGBqR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Dec 2020 20:46:17 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A88811D4;
        Sun,  6 Dec 2020 17:45:31 -0800 (PST)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A39313F66B;
        Sun,  6 Dec 2020 17:45:29 -0800 (PST)
Subject: Re: [linux-sunxi] [PATCH 2/8] pinctrl: sunxi: Add support for the
 Allwinner H616 pin controller
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
To:     Icenowy Zheng <icenowy@aosc.io>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>
References: <20201202135409.13683-1-andre.przywara@arm.com>
 <20201202135409.13683-3-andre.przywara@arm.com>
 <CAJiuCcdkzipiCT1g8=qNgcawqRH6RpFXZEN9jfX+C2i1derREw@mail.gmail.com>
 <9030268.RpDFqJRP6T@jernej-laptop>
 <3fba5877-a25a-ca4d-a579-08a21f116133@arm.com>
 <CA53454B-8FC1-4668-955A-DC02A7F815FC@aosc.io>
 <b0dfeffe-14f3-0461-d536-c21c1340104d@arm.com>
Organization: ARM Ltd.
Message-ID: <f7ea5698-de8d-65d5-ea12-287aaac88b8d@arm.com>
Date:   Mon, 7 Dec 2020 01:45:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b0dfeffe-14f3-0461-d536-c21c1340104d@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/12/2020 01:07, André Przywara wrote:
> On 06/12/2020 16:01, Icenowy Zheng wrote:
> 
> Hi,
> 

....

>>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 16)), /*
>>> PI_EINT16 */
>>>>>> +};
>>>>>> +static const unsigned int h616_irq_bank_map[] = { 2, 5, 6, 7, 8 };
>>>>>
>>>>> The BSP driver seems to have more than 5 IRQ Banks.
>>>>>
>>>>> static const unsigned sun50iw9p1_irq_bank_base[] = {
>>>>> SUNXI_PIO_BANK_BASE(PA_BASE, 0),
>>>>> SUNXI_PIO_BANK_BASE(PC_BASE, 1),
>>>>> SUNXI_PIO_BANK_BASE(PD_BASE, 2),
>>>>> SUNXI_PIO_BANK_BASE(PE_BASE, 3),
>>>>> SUNXI_PIO_BANK_BASE(PF_BASE, 4),
>>>>> SUNXI_PIO_BANK_BASE(PG_BASE, 5),
>>>>> SUNXI_PIO_BANK_BASE(PH_BASE, 6),
>>>>> SUNXI_PIO_BANK_BASE(PI_BASE, 7),
>>>>> };
>>>>>
>>>>> So maybe it should be somethings like this:
>>>>> static const unsigned int h616_irq_bank_map[] = { 0, 2, 3, 4, 5, 6,
>>> 7, 8 };
>>>>
>>>> While that's true, I don't see a need for IRQ bank on port A - this
>>> port is 
>>>> internal (not exposed on pins) and none of the functionality on that
>>> port 
>>>> needs IRQ.
>>>
>>> I agree here, since port A isn't even mentioned in the manual (neither
>>
>> I think if we ignore it we have the risk of DT binding issues
>> when we need to add it afterwards.
> 
> You have a point, but which interrupt shall I assign in the .dtsi?

Ah, of course they mention it in their -pinctrl.dtsi...

> And as Jernej mentioned, there is little sense in having those pins as
> interrupt sources, since we cannot use them as GPIOs in a useful way. We
> could bitbang I2C, but I don't see much sense in doing this.
> 
> And to be honest: that issue is a shortcoming of our binding. By moving
> this simple array into the DT we could avoid this problem entirely.
> 
>>> is PortD or PortE),
> 
> I had a look at PortD and PortE in the BSP: they describe LCD, LVDS and
> CSI, mostly, all interfaces which the chip does not support anymore.
> Even if the peripherals are still in, there is no use for having those
> signals internally. And there are surely no pads connected to them
> (there are simply no balls left on the package, according to the datasheet).
> 
> So my theory is that those peripherals are just left in because it was
> too much trouble to remove them (and it doesn't hurt having them in), or
> there is another package variant which exposes those pins.
> 
> So I would lean to not expose those ports (PD, PE) and their interrupts
> (for PA, PD, PE).
> 
> Opinions?

So with those numbers from their .dtsi I can offer to use the array as
Clément showed above, and adjust the indicies in the pin arrays above.
Then have the IRQ numbers as shown in the BSP in our .dtsi.
But I would not have SUNXI_FUNCTION_IRQ_BANK statements for those
unknown ports, in fact no mentions of PortD and PortE at all.

Does that sound acceptable?

Cheers,
Andre

> 
>> I would refrain from listing it here prematurely.
>>> Plus we actually don't know their interrupt numbers: the manual only
>>> mentions GPIOE on top of the already listed interrupts.
>>>
>>> The interrupts work by their index, so skipping ports is not an issue.
>>> I
>>> just tested the PIO interrupt on PortC, and it works.
>>>
>>> Cheers,
>>> Andre
>>>
>>>>>
>>>>>> +
>>>>>> +static const struct sunxi_pinctrl_desc h616_pinctrl_data = {
>>>>>> +       .pins = h616_pins,
>>>>>> +       .npins = ARRAY_SIZE(h616_pins),
>>>>>> +       .irq_banks = 5,
>>>>>
>>>>>  .irq_banks = ARAY_SIZE(h616_irq_bank_map) is better no ?
>>>>>
>>>>>> +       .irq_bank_map = h616_irq_bank_map,
>>>>>> +       .irq_read_needs_mux = true,
>>>>>> +       .io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>>>>>> +};
>>>>>> +
>>>>>> +static int h616_pinctrl_probe(struct platform_device *pdev)
>>>>>> +{
>>>>>> +       return sunxi_pinctrl_init(pdev,
>>>>>> +                                 &h616_pinctrl_data);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct of_device_id h616_pinctrl_match[] = {
>>>>>> +       { .compatible = "allwinner,sun50i-h616-pinctrl", },
>>>>>
>>>>> This is a new compatible and should be documented.
>>>>>
>>>>> Regards,
>>>>> Clement
>>>>>
>>>>>> +       {}
>>>>>> +};
>>>>>> +
>>>>>> +static struct platform_driver h616_pinctrl_driver = {
>>>>>> +       .probe  = h616_pinctrl_probe,
>>>>>> +       .driver = {
>>>>>> +               .name           = "sun50i-h616-pinctrl",
>>>>>> +               .of_match_table = h616_pinctrl_match,
>>>>>> +       },
>>>>>> +};
>>>>>> +builtin_platform_driver(h616_pinctrl_driver);
>>>>>> --
>>>>>> 2.17.5
>>>>>>
>>>>>> --
>>
> 

