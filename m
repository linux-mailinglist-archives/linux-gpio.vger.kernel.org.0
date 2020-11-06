Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1882A9500
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 12:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgKFLIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 06:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgKFLID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 06:08:03 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5284C0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 03:08:01 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id a3so860220wrx.13
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 03:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sZovck2VxxzKcuAzLCRnPBq7DAtyakGMsnCJt5X+VBI=;
        b=x2fP3lKjXVJB4lIHLjVbI7ZWO00g1dpxrmCr/YF8VSGSUUZ0ttqcLmrkAIUzyrpY9W
         M3jKIB2UhX/jjV0bnjMdDl2Ghva/cldOvwfAASvlrFaiyq8ueWOzJGdZHH1vI02lDowR
         f/x/IJqBc58lhd8BXa6lI1Fbukbpqq77vFEELQiS/R59hig8tY7dYLIVILelkiG3hjbW
         m3qKyYgoCf3+3J/lACgcSh+E8GjXW73GX4OfMK1TGIrxRfIXzMkhFFWWZN0shFr9o/hy
         hVmYbWq7twAxk/a1yWyVBlkq5RLQVJSx3ww0KUMtWlG39/aM1uN3FpTkrswTPMyoA/ji
         PWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sZovck2VxxzKcuAzLCRnPBq7DAtyakGMsnCJt5X+VBI=;
        b=fFo73MecHdpLZ4c4x/LMfxxaRmpd2itNyueH+p53Cc0C7KM1+qEi1h0yYDfZ4g+ZH+
         ziqc1le74vq3Us3wvyXQ+pbiZK34UXMRqCJj2A6e9hpAtz24QAylVbeC7JQHv4QZDFVm
         WYoHh+pQoVkro8gG0+Vvo0ylZRby2gTwOuvO65XRXzgsZrGn0+KIGsT7/eeFAs2P82h2
         hdO8zRI0H3ps9at/FMxecupO1QDfoRrJH0lQvWTnbpyEzZWby09L/C93t2yk6qZmUk9C
         y62vUAtqmLUh3e1Oy6Rpxk9UUX7eVVR9c8RbdUwMaOQKJ83/RD9AWalYoqjfMzmUZa11
         S5dQ==
X-Gm-Message-State: AOAM532wPfWA20dJOLQ9LRJSnH5M1zPNeuwwZve5pRu3QAkm5vLV+Tsf
        y5rV6Wc8reh9zBCZUglVgC5hKA==
X-Google-Smtp-Source: ABdhPJx1iRcBeFh1BLpkSJmuR8EVMGGBjA8dm9jhpYevRF8IW0ek9v8p0hBlWNjZNszGWVrWjS0iTg==
X-Received: by 2002:adf:e28c:: with SMTP id v12mr2042781wri.230.1604660880373;
        Fri, 06 Nov 2020 03:08:00 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id n23sm1739750wmk.24.2020.11.06.03.07.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 03:07:59 -0800 (PST)
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
 <20201105120410.18305-2-srinivas.kandagatla@linaro.org>
 <CACRpkda91ncAVGj8_qcEyKPnRQdJjXMMCQ4ZJ1t7bVfcCZF=CA@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f6bfa003-b8c7-f0d1-24f1-14f45fa37a23@linaro.org>
Date:   Fri, 6 Nov 2020 11:07:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda91ncAVGj8_qcEyKPnRQdJjXMMCQ4ZJ1t7bVfcCZF=CA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Linus for review!

On 06/11/2020 09:50, Linus Walleij wrote:
> Hi Srinivas,
> 
> thanks for your patch!
> 
> On Thu, Nov 5, 2020 at 1:04 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> Add initial pinctrl driver to support pin configuration for
>> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
>> on SM8250.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> So this is in essence a completely new pin controller that shares
> nothing with the previous Qcom SoC pin control hardware?
> 
> I'd still like Bjorn to review it of course, but if you are going to
> maintain this driver an entry to the MAINTAINERS file would
> be nice.
> 
> I'd like some more talk in the commit message about how this
> driver is engineered so I point those things out below.
> 
>> +config PINCTRL_LPASS_LPI
>> +       tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
>> +       depends on GPIOLIB && OF
> 
> These days you can actually just
> select GPIOLIB
> but no big deal.
Will take care of this!

> 
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/gpio.h>
> 
> Do not use this legacy header for new GPIO drivers.
> #include <linux/gpio/driver.h>
> should work.

Sure!

> 
>> +#define LPI_GPIO_REG_VAL_CTL             0x00
>> +#define LPI_GPIO_REG_DIR_CTL             0x04
>> +#define LPI_SLEW_REG_VAL_CTL             0x00
>> +#define LPI_SLEW_RATE_MAX                0x03
>> +#define LPI_SLEW_BITS_SIZE               0x02
>> +#define LPI_GPIO_REG_PULL_SHIFT                0x0
>> +#define LPI_GPIO_REG_PULL_MASK         GENMASK(1, 0)
>> +#define LPI_GPIO_REG_FUNCTION_SHIFT    0x2
>> +#define LPI_GPIO_REG_FUNCTION_MASK     GENMASK(5, 2)
>> +#define LPI_GPIO_REG_OUT_STRENGTH_SHIFT        0x6
>> +#define LPI_GPIO_REG_OUT_STRENGTH_MASK GENMASK(8, 6)
>> +#define LPI_GPIO_REG_OE_SHIFT          0x9
>> +#define LPI_GPIO_REG_OE_MASK           BIT(9)
>> +#define LPI_GPIO_REG_DIR_SHIFT         0x1
>> +#define LPI_GPIO_REG_DIR_MASK          0x2
>> +#define LPI_GPIO_BIAS_DISABLE          0x0
>> +#define LPI_GPIO_PULL_DOWN             0x1
>> +#define LPI_GPIO_KEEPER                        0x2
>> +#define LPI_GPIO_PULL_UP               0x3
> 
> So the way I understand it, the GPIO lines have one register each and then the
> functionality of each line is handled by different bits in that register, like
> output is driven in bit 9.
> 
Yes exactly!
> This would be nice to have mentioned in the commit message.

I will add more detailed commit message in next version.


> 
>> +static const unsigned int gpio0_pins[] = { 0 };
>> +static const unsigned int gpio1_pins[] = { 1 };
>> +static const unsigned int gpio2_pins[] = { 2 };
>> +static const unsigned int gpio3_pins[] = { 3 };
>> +static const unsigned int gpio4_pins[] = { 4 };
>> +static const unsigned int gpio5_pins[] = { 5 };
>> +static const unsigned int gpio6_pins[] = { 6 };
>> +static const unsigned int gpio7_pins[] = { 7 };
>> +static const unsigned int gpio8_pins[] = { 8 };
>> +static const unsigned int gpio9_pins[] = { 9 };
>> +static const unsigned int gpio10_pins[] = { 10 };
>> +static const unsigned int gpio11_pins[] = { 11 };
>> +static const unsigned int gpio12_pins[] = { 12 };
>> +static const unsigned int gpio13_pins[] = { 13 };
>> +static const char * const swr_tx_clk_groups[] = { "gpio0" };
>> +static const char * const swr_tx_data1_groups[] = { "gpio1" };
>> +static const char * const swr_tx_data2_groups[] = { "gpio2" };
>> +static const char * const swr_rx_clk_groups[] = { "gpio3" };
>> +static const char * const swr_rx_data1_groups[] = { "gpio4" };
>> +static const char * const swr_tx_data3_groups[] = { "gpio5" };
>> +static const char * const dmic1_clk_groups[] = { "gpio6" };
>> +static const char * const dmic1_data_groups[] = { "gpio7" };
>> +static const char * const dmic2_clk_groups[] = { "gpio8" };
>> +static const char * const dmic2_data_groups[] = { "gpio9" };
>> +static const char * const i2s2_clk_groups[] = { "gpio10" };
>> +static const char * const i2s2_ws_groups[] = { "gpio11" };
>> +static const char * const dmic3_clk_groups[] = { "gpio12" };
>> +static const char * const dmic3_data_groups[] = { "gpio13" };
>> +static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
>> +static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
>> +static const char * const qua_mi2s_data0_groups[] = { "gpio2" };
>> +static const char * const qua_mi2s_data1_groups[] = { "gpio3" };
>> +static const char * const qua_mi2s_data2_groups[] = { "gpio4" };
>> +static const char * const swr_rx_data2_groups[] = { "gpio5" };
>> +static const char * const i2s1_clk_groups[] = { "gpio6" };
>> +static const char * const i2s1_ws_groups[] = { "gpio7" };
>> +static const char * const i2s1_data0_groups[] = { "gpio8" };
>> +static const char * const i2s1_data1_groups[] = { "gpio9" };
>> +static const char * const wsa_swr_clk_groups[] = { "gpio10" };
>> +static const char * const wsa_swr_data_groups[] = { "gpio11" };
>> +static const char * const i2s2_data0_groups[] = { "gpio12" };
>> +static const char * const i2s2_data1_groups[] = { "gpio13" };
> 
> The driver appears to follow other qualcomm pin controllers in using
> the "one group is one pin" approach. This is idiomatic and should be
> mentioned in the commit message.

Sure I will do that,

Some more detail of wiring of this additional pin-controller IP:

This IP is an additional pinctrl block on top the existing SoC TLMM 
pin-controller (Audio) pins.

The hw setup looks like:

TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]


However SoC TLMM pin-controller can only be touched for use of those 
pins in GPIO mode and non gpio mode is completely handled by the LPASS 
LPI pinctrl block. Apart from this slew rate is also available in this 
block for certain pins which are connected to SLIMbus or SoundWire Bus.

Normally we would not expect these pins to be touched by SoC TLMM 
pin-controller as these pins are used for audio usecase and the control 
is always with LPASS LPI controller. There are additional bits to 
configure/enforce this in SoC TLMM block!

> 
>> +static int sm8250_slew_reg_offsets[] = {
>> +               0x0, 0x2, 0x4, 0x8, 0xa,
>> +               0xc, 0x0, 0x0, 0x0, 0x0,
>> +               0x10, 0x12, 0x0, 0x0,
>> +};
> 
> Maybe it is obvious to everyone what this array is about, but why so
> many zeroes? I think it warrants a comment in the code if that
> means for example that some pins do not support slew rate setting.

Only pins that are connected to SLIMbus or SoundWire have slew rate 
settings available, rest of the pins which do not have this are marked 
as 0x0. I can add some comment in here to
> 
> Overall this is a nice and self-contained driver that uses the abstractions
> the right way and very straight-forward, so I think we can merge it
> soon.
> 
> (Look into Andy's comments as well.)

Thanks, I will address Andy's comments as well in next version!

--srini

> 
> Yours,
> Linus Walleij
> 
