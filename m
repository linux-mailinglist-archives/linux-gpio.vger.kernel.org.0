Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F4A487034
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 03:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345326AbiAGCOg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jan 2022 21:14:36 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49221 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344442AbiAGCOg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jan 2022 21:14:36 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 976C45C01E3;
        Thu,  6 Jan 2022 21:14:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 06 Jan 2022 21:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=0
        6eURL9b8QeWOTMaAa7Dof41LMk/Y1Gb6IHAND03JRw=; b=HftiO69yZZY4arPMz
        WBF0B4i1Qh7gAp4zVu0X+aI1rhpNIoUcoo7iVR5SHsdLeNvy+okSTpeFz03kzj1+
        pqb74wSy4LI/pp7ZzzSbXpJxx1L33zzEubEEyocvDAWvKg7PA0dKodxPUFHSMBTN
        90sH+ulaaiwT2GHMWTi5OY/B3awiPsEv4Wgqpkoe4hK+0gLiIgktFU/4nSvYp61v
        pCKHjdmR1symGXxxL6I+ZNm+4sOvHdXGkcCioHxu/dDIKx1gEvFwJpqq9dMs+pDy
        UlDAxTJ3ioC4vOnvHEOYmBjdKfRoiIiTUd2UTCI5LrL9ZcHtyWu4C8zRUI3Ylobs
        gUX4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=06eURL9b8QeWOTMaAa7Dof41LMk/Y1Gb6IHAND03J
        Rw=; b=ln0SRtZA4JvvS/vBJX7IpAddxZJ8SpbpviGFPRuEcyIusQQ904a2pE03n
        FHih54D7BPghuQulNd8fCGoD71hbDsmGa785Zj13RqwmQUT4Iv0PqhWCMGFdQBsc
        GIYFpyJDDh1EzX3deQkzPmKl8H0EK5Z9mPpQe2OgSJgF5nIqqHpDHfU5nGJ7haxa
        a5nTkKiq2toHTDCKKjfrdXOysTDc9keIBFwpNW2UfUY2pzUnQe+t7WKi+2EqDeFY
        S5qi5RMRMLOJGCNe4kJTCO76dbKvwXHfDqjIecCpO1DFdhW1Qa/cnzgByhKJVZTY
        EsbEBOG69ZVlGcAl6nmKv6LCn67ww==
X-ME-Sender: <xms:CqLXYUk78mYxHllx4bCCzaUnC6ryv2Jab7_-FNeY2MVLtjGX97UDXA>
    <xme:CqLXYT3wqLO3ywQ0WY3oI5qizr0xxJBBa9uKGR8p9kDawi_LiycanlIhKMnoa1Q_n
    YDb_s5nobO-Vmhtug>
X-ME-Received: <xmr:CqLXYSpwYZz9A1HFexTNng6yZISyUDb-ZphH41iSMPPscnKjojPAmyPIFZEt3kYjpYjeM0iEPUNMYmtrz0YJfijzCQNtTxmFNGmFhkGuJozHKd6yJuwahlMI3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegtddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:CqLXYQnq3Td57DP28zL4ZZdnIbNBqNsgHBYIwdTz36o6W54ANmiK3w>
    <xmx:CqLXYS2AUPQaxVox1MI4-V2X9R0LDL99Gxipc4YuPnEDjMCyQ0BnyA>
    <xmx:CqLXYXud0QkD1xZa7qx0egp0Jip0O3h5GNVN4yJUFEX6L2bA7RHHNw>
    <xmx:C6LXYbkD053WBpwY5cFZs1hn8AFudylX-wbAvDCLNOOqPg74P3BVcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Jan 2022 21:14:34 -0500 (EST)
Subject: Re: [PATCH] pinctrl: sunxi: Fix H616 I2S3 pin data
To:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        SASANO Takayoshi <uaa@mx5.nisiq.net>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
References: <20220105172952.23347-1-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <ccc2aae8-1265-adfa-d749-1a9d54bd8443@sholland.org>
Date:   Thu, 6 Jan 2022 20:14:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220105172952.23347-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/5/22 11:29 AM, Andre Przywara wrote:
> Two bugs have sneaked in the H616 pinctrl data:
> - PH9 uses the mux value of 0x3 twice (one should be 0x5 instead)
> - PH8 and PH9 use the "i2s3" function name twice in each pin
> 
> For the double pin name we use the same trick we pulled for i2s0: append
> the pin function to the group name to designate the special function.
> 
> Fixes: 25adc29407fb ("pinctrl: sunxi: Add support for the Allwinner H616 pin controller")
> Reported-by: SASANO Takayoshi <uaa@mx5.nisiq.net>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

Verified against the manual, which ironically also has the function numbers
wrong: it lists two function 4's (and no function 5) for each pin in port H.

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
> index ce1917e230f4..152b71226a80 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
> @@ -363,16 +363,16 @@ static const struct sunxi_desc_pin h616_pins[] = {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
> -		  SUNXI_FUNCTION(0x3, "i2s3"),	/* DO0 */
> +		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DO0 */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
> -		  SUNXI_FUNCTION(0x5, "i2s3"),	/* DI1 */
> +		  SUNXI_FUNCTION(0x5, "i2s3_din1"),	/* DI1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 8)),	/* PH_EINT8 */
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x3, "i2s3"),	/* DI0 */
> +		  SUNXI_FUNCTION(0x3, "i2s3_din0"),	/* DI0 */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS1 */
> -		  SUNXI_FUNCTION(0x3, "i2s3"),	/* DO1 */
> +		  SUNXI_FUNCTION(0x5, "i2s3_dout1"),	/* DO1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),	/* PH_EINT9 */
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> 

