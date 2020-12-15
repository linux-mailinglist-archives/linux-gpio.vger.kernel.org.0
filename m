Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59AB2DAC17
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 12:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgLOLaf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 06:30:35 -0500
Received: from foss.arm.com ([217.140.110.172]:35164 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728444AbgLOLa0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Dec 2020 06:30:26 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2BC1FB;
        Tue, 15 Dec 2020 03:29:40 -0800 (PST)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70BE13F66E;
        Tue, 15 Dec 2020 03:29:38 -0800 (PST)
Subject: Re: [PATCH 1/4] clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
To:     Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
References: <20201213235506.25201-1-samuel@sholland.org>
 <20201213235506.25201-2-samuel@sholland.org>
 <20201214145730.iz3tc4nasqwq6tym@gilmour>
 <8de2e0dc-465f-b4a8-bec9-763f1dee06f1@sholland.org>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <675f08e3-f43a-c28a-9d42-3a5aa0ebe4cc@arm.com>
Date:   Tue, 15 Dec 2020 11:29:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8de2e0dc-465f-b4a8-bec9-763f1dee06f1@sholland.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/12/2020 03:25, Samuel Holland wrote:
> On 12/14/20 8:57 AM, Maxime Ripard wrote:
>> Hi Samuel,
>>
>> On Sun, Dec 13, 2020 at 05:55:03PM -0600, Samuel Holland wrote:
>>> While no information about the H6 RSB controller is included in the
>>> datasheet or manual, the vendor BSP and power management blob both
>>> reference the RSB clock parent and register address. These values were
>>> verified by experimentation.
>>>
>>> Since this clock/reset are added late, the specifier is added at the end
>>> to maintain the existing DT binding. The code is kept in register order.
>>>
>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>> ---
>>>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c      | 5 +++++
>>>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h      | 2 +-
>>>  include/dt-bindings/clock/sun50i-h6-r-ccu.h | 1 +
>>>  include/dt-bindings/reset/sun50i-h6-r-ccu.h | 1 +
>>>  4 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
>>> index 50f8d1bc7046..56e351b513f3 100644
>>> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
>>> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
>>> @@ -91,6 +91,8 @@ static SUNXI_CCU_GATE(r_apb2_uart_clk,	"r-apb2-uart",	"r-apb2",
>>>  		      0x18c, BIT(0), 0);
>>>  static SUNXI_CCU_GATE(r_apb2_i2c_clk,	"r-apb2-i2c",	"r-apb2",
>>>  		      0x19c, BIT(0), 0);
>>> +static SUNXI_CCU_GATE(r_apb2_rsb_clk,	"r-apb2-rsb",	"r-apb2",
>>> +		      0x1bc, BIT(0), 0);
>>>  static SUNXI_CCU_GATE(r_apb1_ir_clk,	"r-apb1-ir",	"r-apb1",
>>>  		      0x1cc, BIT(0), 0);
>>>  static SUNXI_CCU_GATE(r_apb1_w1_clk,	"r-apb1-w1",	"r-apb1",
>>> @@ -130,6 +132,7 @@ static struct ccu_common *sun50i_h6_r_ccu_clks[] = {
>>>  	&r_apb1_pwm_clk.common,
>>>  	&r_apb2_uart_clk.common,
>>>  	&r_apb2_i2c_clk.common,
>>> +	&r_apb2_rsb_clk.common,
>>>  	&r_apb1_ir_clk.common,
>>>  	&r_apb1_w1_clk.common,
>>>  	&ir_clk.common,
>>> @@ -147,6 +150,7 @@ static struct clk_hw_onecell_data sun50i_h6_r_hw_clks = {
>>>  		[CLK_R_APB1_PWM]	= &r_apb1_pwm_clk.common.hw,
>>>  		[CLK_R_APB2_UART]	= &r_apb2_uart_clk.common.hw,
>>>  		[CLK_R_APB2_I2C]	= &r_apb2_i2c_clk.common.hw,
>>> +		[CLK_R_APB2_RSB]	= &r_apb2_rsb_clk.common.hw,
>>>  		[CLK_R_APB1_IR]		= &r_apb1_ir_clk.common.hw,
>>>  		[CLK_R_APB1_W1]		= &r_apb1_w1_clk.common.hw,
>>>  		[CLK_IR]		= &ir_clk.common.hw,
>>> @@ -161,6 +165,7 @@ static struct ccu_reset_map sun50i_h6_r_ccu_resets[] = {
>>>  	[RST_R_APB1_PWM]	=  { 0x13c, BIT(16) },
>>>  	[RST_R_APB2_UART]	=  { 0x18c, BIT(16) },
>>>  	[RST_R_APB2_I2C]	=  { 0x19c, BIT(16) },
>>> +	[RST_R_APB2_RSB]	=  { 0x1bc, BIT(16) },
>>>  	[RST_R_APB1_IR]		=  { 0x1cc, BIT(16) },
>>>  	[RST_R_APB1_W1]		=  { 0x1ec, BIT(16) },
>>>  };
>>> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
>>> index 782117dc0b28..7e290b840803 100644
>>> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
>>> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
>>> @@ -14,6 +14,6 @@
>>>  
>>>  #define CLK_R_APB2	3
>>>  
>>> -#define CLK_NUMBER	(CLK_W1 + 1)
>>> +#define CLK_NUMBER	(CLK_R_APB2_RSB + 1)
>>>  
>>>  #endif /* _CCU_SUN50I_H6_R_H */
>>> diff --git a/include/dt-bindings/clock/sun50i-h6-r-ccu.h b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
>>> index 76136132a13e..f46ec03848ca 100644
>>> --- a/include/dt-bindings/clock/sun50i-h6-r-ccu.h
>>> +++ b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
>>> @@ -15,6 +15,7 @@
>>>  #define CLK_R_APB1_PWM		6
>>>  #define CLK_R_APB2_UART		7
>>>  #define CLK_R_APB2_I2C		8
>>> +#define CLK_R_APB2_RSB		13
>>>  #define CLK_R_APB1_IR		9
>>>  #define CLK_R_APB1_W1		10
>>>  
>>> diff --git a/include/dt-bindings/reset/sun50i-h6-r-ccu.h b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
>>> index 01c84dba49a4..6fe199a7969d 100644
>>> --- a/include/dt-bindings/reset/sun50i-h6-r-ccu.h
>>> +++ b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
>>> @@ -11,6 +11,7 @@
>>>  #define RST_R_APB1_PWM		2
>>>  #define RST_R_APB2_UART		3
>>>  #define RST_R_APB2_I2C		4
>>> +#define RST_R_APB2_RSB		7
>>>  #define RST_R_APB1_IR		5
>>>  #define RST_R_APB1_W1		6
>>
>> I think for the clock and reset binding, we'll want to sort by number.
>> It's fairly easy to miss otherwise and if we end up adding another one
>> it wouldn't be far fetched to assume the same indices would be used

I agree here. Admittedly this whole approach is really fragile. I ended
up with some tiny tool to check for consecutive numbers, reporting any
outliers (some gaps are legit). Of course the "-r" versions of the CCU
are not really a big issue, but with the 100+ clocks in the main CCU
this is a problem. Also it becomes ABI, so is hard to fix.

I guess there is no nice kernel CPP hack to re-use enums as preprocessor
symbols?

> I think GCC would complain about the duplicate array initialization in
> the driver, but I can move them for v2.

It doesn't with -Wall, you need -Wextra for that. I actually had a
subtle bug in my H616 CCU patch due to a double numbering.

Cheers,
Andre
