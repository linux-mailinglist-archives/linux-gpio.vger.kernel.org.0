Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6127F102387
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 12:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKSLqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 06:46:18 -0500
Received: from ns.iliad.fr ([212.27.33.1]:58414 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfKSLqS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Nov 2019 06:46:18 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 2FD4520C6F;
        Tue, 19 Nov 2019 12:46:16 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 1577820C65;
        Tue, 19 Nov 2019 12:46:16 +0100 (CET)
Subject: Re: Using a GPIO as an interrupt line
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
 <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
 <20191119105814.GZ25745@shell.armlinux.org.uk>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <9356da2a-2190-03fd-f5cc-6a0fd8c38e89@free.fr>
Date:   Tue, 19 Nov 2019 12:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119105814.GZ25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Nov 19 12:46:16 2019 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/11/2019 11:58, Russell King - ARM Linux admin wrote:

> On Tue, Nov 19, 2019 at 11:46:21AM +0100, Marc Gonzalez wrote:
>
>> On 19/11/2019 10:57, Russell King - ARM Linux admin wrote:
>>
>>> On Tue, Nov 19, 2019 at 10:28:15AM +0100, Marc Gonzalez wrote:
>>>
>>>> The board I'm working on provides a TCA9539 I/O expander.
>>>> Or, as the datasheet(*) calls it, a "Low Voltage 16-Bit I2C and
>>>> SMBus Low-Power I/O Expander with Interrupt Output, Reset Pin,
>>>> and Configuration Registers"
>>>>
>>>> (*) http://www.ti.com/lit/ds/symlink/tca9539.pdf
>>>>
>>>> The binding is documented in Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>>>>
>>>> I have some doubts about the interrupt output, described as:
>>>>
>>>> Optional properties:
>>>>  - interrupts: interrupt specifier for the device's interrupt output.
>>>>
>>>> In my board's DT, the I/O expander is described as:
>>>>
>>>> 	exp1: gpio@74 {
>>>> 		compatible = "ti,tca9539";
>>>> 		reg = <0x74>;
>>>> 		gpio-controller;
>>>> 		#gpio-cells = <2>;
>>>> 		reset-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
>>>> 		pinctrl-names = "default";
>>>> 		pinctrl-0 = <&top_exp_rst>;
>>>> 		interrupt-parent = <&tlmm>;
>>>> 		interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
>>
>> As pointed out by ukleinek on IRC, I might have (??) specified the wrong
>> trigger type. The data-sheet states:
>> "The TCA9539 open-drain interrupt (INTn) output is activated when any input state
>> differs from its corresponding Input Port register state, and is used to indicate
>> to the system master that an input state has changed."
>> (The data sheet speaks of "INT with a line on top"; what is the typical way to
>> write that in ASCII? I was told that adding a trailing 'n' or 'b' was common.)
> 
> /INT or nINT are commonly used - I've never heard or seen 'b' (which is
> commonly used as a suffix on binary numbers) or a trailing 'n'.

Perhaps the 'b' suffix is only used in French...
'b' might stand for "barre" (i.e. the line above the symbol).


> Is pin 42 something that can be muxed?  If so, it seems sane to specify
> configuration for it.  Whether it needs to be a GPIO or whether it has
> a specific "interrupt" function mux state depends on the SoC.

According to drivers/pinctrl/qcom/pinctrl-msm8998.c
PINGROUP(42, EAST, blsp_spi6, blsp_uart3_b, blsp_uim3_b, _, qdss, _, _, _, _)

I don't think there is an explicit "interrupt" function in
this pinctrl driver... except FUNCTION(ssc_irq).

static const char * const ssc_irq_groups[] = {
	"gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63", "gpio78",
	"gpio79", "gpio80", "gpio117", "gpio118", "gpio119", "gpio120",
	"gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
};

@Bjorn, do you know what these are used for?

Regards.
