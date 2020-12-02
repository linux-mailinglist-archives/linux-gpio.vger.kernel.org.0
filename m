Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E4E2CC099
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 16:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730396AbgLBPTH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 10:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728350AbgLBPTH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 10:19:07 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9C9C061A04
        for <linux-gpio@vger.kernel.org>; Wed,  2 Dec 2020 07:18:09 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p8so4394722wrx.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Dec 2020 07:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hmExoOhIx4bEtgrDeuYJTxe4yY7UWDs1vFrYenV/aDs=;
        b=XMGL8QYY6V5TYXWWxdbpZRZaDJg7CxNNYBLvG8czAAHiAsBLGNTXjOMdj5kG4DydUv
         EDCCFeyzPHpgssrtTIYSCk8XJVbtO4j+no05tpKfTlF6CodXbmGX3K/A5qcbeuGWmwAd
         ltMKAoVvD8lnWGXsERQcxWBQ5bYsEMrI6l8m7XLaoa2zHgQaV1UKIcs1YJmvGeF33pi9
         IBPBz6PNVfs46f+FgLH2a0ioehrtVLenehcvxkOgxWNsa1AFIP4tV6zURbbDhznbYF0w
         tAoHJksc8bEaqDc5eK3C+rg7jpDbjrIWdwOXJMlylqj+AZWWCXDYdywZdgudyMpjt+iw
         T1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hmExoOhIx4bEtgrDeuYJTxe4yY7UWDs1vFrYenV/aDs=;
        b=bHROIF/6I7K7OfkgEOeH2DUS1kywdbGewf0Vz6RgHhBavjNKRQZcuRLyldEiqURqVg
         NQNkZuzkFHsc5pSoJRqlDAedTHOgQBhh6Q/MLWl71+plsXTR1kWg5CkWkBVCH023uRe5
         9hYH1St1zYSSjRuIDlm9XtYMUDpLf1andvI7fRxvf78SeviFtXD1kt4PoU/99E2ljAH0
         iwM9wvg+KqXFeBeUBQBIKVfnGVcZtFShfq52E4HD6lmiPSGMqTq7MwRoeFjHtEfBewCs
         pdr8aDAy2Rlhbt6VUB54s0uwLg46yVub4Dzo/q3CmoUlH6I9aL1kV9KTs9WmASmeUMfD
         bzSw==
X-Gm-Message-State: AOAM5300q8BisGbnhva4EBi2howolGnsMXaCWanIFZ7ZEFtLKLIBFiSa
        YGpuuYP4zwsKTXHQDyqnSJaLbw==
X-Google-Smtp-Source: ABdhPJyOVUqkX2KGHH88sWZgXQIpOv0Vjosg4mk2KLPXXt7uLVmCw+jKM97HfDmOqUP9g5N5f4+Ndg==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr4143279wrw.310.1606922288151;
        Wed, 02 Dec 2020 07:18:08 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id b18sm2657700wrt.54.2020.12.02.07.18.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 07:18:07 -0800 (PST)
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
 <20201116143432.15809-3-srinivas.kandagatla@linaro.org>
 <X8WSucFKyROFJ7gF@builder.lan>
 <ec14afaa-8660-03ac-fbf9-79ff37889de3@linaro.org>
 <X8Z9N2Yu8xiyPRmj@builder.lan>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <41c2158a-92a2-69cd-bf14-7375bdc0497c@linaro.org>
Date:   Wed, 2 Dec 2020 15:18:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X8Z9N2Yu8xiyPRmj@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 01/12/2020 17:28, Bjorn Andersson wrote:
> On Tue 01 Dec 04:01 CST 2020, Srinivas Kandagatla wrote:
> 
>> Many thanks for review Bjorn,
>>
>>
>> On 01/12/2020 00:47, Bjorn Andersson wrote:
>>> On Mon 16 Nov 08:34 CST 2020, Srinivas Kandagatla wrote:
>>>
>>>> Add initial pinctrl driver to support pin configuration for
>>>> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
>>>> on SM8250.
>>>>
>>>> This IP is an additional pin control block for Audio Pins on top the
>>>> existing SoC Top level pin-controller.
>>>> Hardware setup looks like:
>>>>
>>>> TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]
>>>>
>>>
>>> Iiuc the LPI TLMM block is just "another pinmux/pinconf block" found in
>>> these SoCs, with the additional magic that the 14 pads are muxed with
>>> some of the TLMM pins - to allow the system integrator to choose how
>>> many pins the LPI should have access to.
>>>
>>> I also believe this is what the "egpio" bit in the TLMM registers are
>>> used for (i.e. egpio = route to LPI, egpio = 1 route to TLMM), so we
>>> should need to add support for toggling this bit in the TLMM as well
>>> (which I think we should do as a pinconf in the pinctrl-msm).
>>
>> Yes, we should add egpio function to these pins in main TLMM pinctrl!
>>
> 
> I was thinking about abusing the pinconf system, but reading you
> sentence makes me feel that expressing it as a "function" and adding a
> special case handling in msm_pinmux_set_mux() would actually make things
> much cleaner to the outside.
> 
> i.e. we would then end up with something in DT like:
> 
> 	pin-is-normal-tlmm-pin {
> 		pins = "gpio146";
> 		function = "gpio";
> 	};
> 
> and
> 
> 	pin-routed-to-lpi-pin {
> 		pins = "gpio146";
> 		function = "egpio";
> 	};

That is what I was thinking of.

> 
> Only "drawback" I can see is that we're inverting the chip's meaning of
> "egpio" (i.e. active means route-to-tlmm in the hardware).
> 
At somepoint we need to start defining what egpio really means w.r.t 
pinctrl setup!

>>>
>>>> This pin controller has some similarities compared to Top level
>>>> msm SoC Pin controller like 'each pin belongs to a single group'
>>>> and so on. However this one is intended to control only audio
>>>> pins in particular, which can not be configured/touched by the
>>>> Top level SoC pin controller except setting them as gpios.
> [..]
>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> [..]
>>>> +	LPI_MUX_qua_mi2s_sclk,
>>>> +	LPI_MUX_swr_tx_data1,
>>>
>>> As there's no single pin that can be both data1 and data2 I think you
>>> should have a single group for swr_tx_data and use this function for
>>> both swr_tx_data pins. Or perhaps even just have one for swr or swr_tx.
>>>
>>> (This is nice when you're writing DT later on)
>>
>> I did think about this, but we have a rx_data2 pin in different function
>> compared to other rx data pins.
>>
>> The reason to keep it as it is :
>> 1> as this will bring in an additional complexity to the code
> 
> For each pin lpi_gpio_set_mux() will be invoked and you'd be searching
> for the index (i) among that pins .funcs. So it doesn't matter that
> looking up a particular function results in different register values
> for different pins, it's already dealt with.
> 
>> 2> we have these represented exactly as what hw data sheet mentions it!
>>
> 
> That is true, but the result is that you have to write 2 states in the
> DT to get your 2 pins to switch to the particular function. By grouping
> them you could do:
> 
> 	data-pins {
> 		pins = "gpio1", "gpio2";
> 		function = "swr_tx_data";
> 	};
> 
> 
> We do this quite extensively for the TLMM (pinctrl-msm) because it
> results in cleaner DT.

These are now changed as requested!

> 
>>>
>>>> +	LPI_MUX_qua_mi2s_ws,
> [..]
>>>> +static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>>>> +	.tlmm_reg_offset = 0x1000,
>>>
>>> Do we have any platform in sight where this is not 0x1000? Could we just
>>> make a define out of it?
>> Am not 100% sure ATM, But I wanted to keep this flexible as these offsets in
>> downstream were part of device tree for some reason, so having offset here
>> for particular compatible made more sense for me!
>>
> 
> Downtream does indeed favor "flexible" code. I tend to prefer a #define
> until we actually need the flexibility...

Done!

--srini
> 
> Regards,
> Bjorn
> 
