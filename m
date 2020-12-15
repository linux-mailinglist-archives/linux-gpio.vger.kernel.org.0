Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A742DA6C5
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 04:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgLOD0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 22:26:44 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40889 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726763AbgLOD0e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 22:26:34 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id A2A2B5802DF;
        Mon, 14 Dec 2020 22:25:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 14 Dec 2020 22:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=O
        poyrMA4zzWiGVw4tBShJdXeoCCLGa06Rcef+QPxYI0=; b=VguYu0HA6agSgVHrD
        kjbr/VlUuHVAtMvscYSs/eUs1vWzmG8p3MyLT5B8QbaPojVPy7HzLkW6xECKiHUw
        v/V7UcxhvNgVUh+Azn7Ei7VwnBVrNalixDWOxcRQGJadjBMEgH2Lzx1lKNQzWAhO
        aV04LQZ7rfVkbsZNOmBYJw7+jOGkG/0TSZbD/wzDSNJvjsLluN/hUNf22L5qnVqW
        o5L/NVLbmmQS+gClya5Fw8w5x77hEM9bYxoYaZAhTKT0Ous9JYWGHHt5o6ocvSYu
        dls0ptU+TpDqiqLzknwLqaZ4oTuPEwtBYdvdGIebGhWr9mc9okNZSjUpslIhxFL2
        VFc1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=OpoyrMA4zzWiGVw4tBShJdXeoCCLGa06Rcef+QPxY
        I0=; b=Qr8PzC8J4l2KkMYmwJSjP0L/4KSSl2QY/ClAYD1LBAoMcaYJcZx0ZGml9
        hBnapeNDpXrwCqDhv3GZvA7Y7u7O5QV6jpoqekWA8/Qoa15vLPG1vcYmJAdB0KYC
        IOWoH672Ch05pFWUJHBBPPseGBnb+HiqotXlVNJW1P95W66YvT5B90Y4vo2FC2EU
        9RkWZ+ZrBywGK1G2G3KzgWam2mBytGUir4uVIaRVCpS3xIfqJ7Xb+hP53kDGMRTJ
        +1Eh0l/r2yh1grEUc/7g9HRWdU++GLPBG+FdE+Wheu/jVRxU4s/AzHNQstHtxYCQ
        kwoaLCQJ1ri+DvvBVNmbwZU3LHeqA==
X-ME-Sender: <xms:tizYX6wBs1N4Odm9rjkPQOHvxXAtUEFA-nqTZC1tkvrtXm647qFkOg>
    <xme:tizYX2RaPnHRsxL-gvJkf0kKOk6V1rD66qK02pnGflPVETyKNnh0lbYX_g3tekaVe
    dWdZXoKOhNE_8n2fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekledgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefheenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepheejgefhudeffeetleeigefgheetveeiteeuffehhfffkeeuvdff
    veffveetudefnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:tizYX8WsUkAX7TdatK5IZqvJMytwpttdrQkEE_HpXMWgXgCpKD4wBQ>
    <xmx:tizYXwj66wp8-NQAv9E6vxnRxP-ibn5pata7rIqBYtMHjrvFH8Odww>
    <xmx:tizYX8BpwFSIf7UZNiIClho1beloNiofPNvv8alk4oFGd-Rvql35eQ>
    <xmx:uCzYX44Y1BqTOe3gh43joKQomdlGQ6sFr07GY_S3xc1ONQST69VXBA>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id E205324005A;
        Mon, 14 Dec 2020 22:25:41 -0500 (EST)
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
References: <20201213235506.25201-1-samuel@sholland.org>
 <20201213235506.25201-2-samuel@sholland.org>
 <20201214145730.iz3tc4nasqwq6tym@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/4] clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
Message-ID: <8de2e0dc-465f-b4a8-bec9-763f1dee06f1@sholland.org>
Date:   Mon, 14 Dec 2020 21:25:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201214145730.iz3tc4nasqwq6tym@gilmour>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/14/20 8:57 AM, Maxime Ripard wrote:
> Hi Samuel,
> 
> On Sun, Dec 13, 2020 at 05:55:03PM -0600, Samuel Holland wrote:
>> While no information about the H6 RSB controller is included in the
>> datasheet or manual, the vendor BSP and power management blob both
>> reference the RSB clock parent and register address. These values were
>> verified by experimentation.
>>
>> Since this clock/reset are added late, the specifier is added at the end
>> to maintain the existing DT binding. The code is kept in register order.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c      | 5 +++++
>>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h      | 2 +-
>>  include/dt-bindings/clock/sun50i-h6-r-ccu.h | 1 +
>>  include/dt-bindings/reset/sun50i-h6-r-ccu.h | 1 +
>>  4 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
>> index 50f8d1bc7046..56e351b513f3 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
>> @@ -91,6 +91,8 @@ static SUNXI_CCU_GATE(r_apb2_uart_clk,	"r-apb2-uart",	"r-apb2",
>>  		      0x18c, BIT(0), 0);
>>  static SUNXI_CCU_GATE(r_apb2_i2c_clk,	"r-apb2-i2c",	"r-apb2",
>>  		      0x19c, BIT(0), 0);
>> +static SUNXI_CCU_GATE(r_apb2_rsb_clk,	"r-apb2-rsb",	"r-apb2",
>> +		      0x1bc, BIT(0), 0);
>>  static SUNXI_CCU_GATE(r_apb1_ir_clk,	"r-apb1-ir",	"r-apb1",
>>  		      0x1cc, BIT(0), 0);
>>  static SUNXI_CCU_GATE(r_apb1_w1_clk,	"r-apb1-w1",	"r-apb1",
>> @@ -130,6 +132,7 @@ static struct ccu_common *sun50i_h6_r_ccu_clks[] = {
>>  	&r_apb1_pwm_clk.common,
>>  	&r_apb2_uart_clk.common,
>>  	&r_apb2_i2c_clk.common,
>> +	&r_apb2_rsb_clk.common,
>>  	&r_apb1_ir_clk.common,
>>  	&r_apb1_w1_clk.common,
>>  	&ir_clk.common,
>> @@ -147,6 +150,7 @@ static struct clk_hw_onecell_data sun50i_h6_r_hw_clks = {
>>  		[CLK_R_APB1_PWM]	= &r_apb1_pwm_clk.common.hw,
>>  		[CLK_R_APB2_UART]	= &r_apb2_uart_clk.common.hw,
>>  		[CLK_R_APB2_I2C]	= &r_apb2_i2c_clk.common.hw,
>> +		[CLK_R_APB2_RSB]	= &r_apb2_rsb_clk.common.hw,
>>  		[CLK_R_APB1_IR]		= &r_apb1_ir_clk.common.hw,
>>  		[CLK_R_APB1_W1]		= &r_apb1_w1_clk.common.hw,
>>  		[CLK_IR]		= &ir_clk.common.hw,
>> @@ -161,6 +165,7 @@ static struct ccu_reset_map sun50i_h6_r_ccu_resets[] = {
>>  	[RST_R_APB1_PWM]	=  { 0x13c, BIT(16) },
>>  	[RST_R_APB2_UART]	=  { 0x18c, BIT(16) },
>>  	[RST_R_APB2_I2C]	=  { 0x19c, BIT(16) },
>> +	[RST_R_APB2_RSB]	=  { 0x1bc, BIT(16) },
>>  	[RST_R_APB1_IR]		=  { 0x1cc, BIT(16) },
>>  	[RST_R_APB1_W1]		=  { 0x1ec, BIT(16) },
>>  };
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
>> index 782117dc0b28..7e290b840803 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
>> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
>> @@ -14,6 +14,6 @@
>>  
>>  #define CLK_R_APB2	3
>>  
>> -#define CLK_NUMBER	(CLK_W1 + 1)
>> +#define CLK_NUMBER	(CLK_R_APB2_RSB + 1)
>>  
>>  #endif /* _CCU_SUN50I_H6_R_H */
>> diff --git a/include/dt-bindings/clock/sun50i-h6-r-ccu.h b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
>> index 76136132a13e..f46ec03848ca 100644
>> --- a/include/dt-bindings/clock/sun50i-h6-r-ccu.h
>> +++ b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
>> @@ -15,6 +15,7 @@
>>  #define CLK_R_APB1_PWM		6
>>  #define CLK_R_APB2_UART		7
>>  #define CLK_R_APB2_I2C		8
>> +#define CLK_R_APB2_RSB		13
>>  #define CLK_R_APB1_IR		9
>>  #define CLK_R_APB1_W1		10
>>  
>> diff --git a/include/dt-bindings/reset/sun50i-h6-r-ccu.h b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
>> index 01c84dba49a4..6fe199a7969d 100644
>> --- a/include/dt-bindings/reset/sun50i-h6-r-ccu.h
>> +++ b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
>> @@ -11,6 +11,7 @@
>>  #define RST_R_APB1_PWM		2
>>  #define RST_R_APB2_UART		3
>>  #define RST_R_APB2_I2C		4
>> +#define RST_R_APB2_RSB		7
>>  #define RST_R_APB1_IR		5
>>  #define RST_R_APB1_W1		6
> 
> I think for the clock and reset binding, we'll want to sort by number.
> It's fairly easy to miss otherwise and if we end up adding another one
> it wouldn't be far fetched to assume the same indices would be used

I think GCC would complain about the duplicate array initialization in
the driver, but I can move them for v2.

Cheers,
Samuel
