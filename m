Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5CB39EA19
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 01:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFGXa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 19:30:59 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:58783 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230233AbhFGXa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 19:30:58 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8BA23580533;
        Mon,  7 Jun 2021 19:29:06 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Mon, 07 Jun 2021 19:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=JeacI608ztlENt+g/Kfe0iOKdJjNDia
        HCrhjdIxMGDE=; b=HgSEJu9c/q8HnpLV3yCHbHIKtSQuICOrEk2tT4mVGEHDpBe
        Rt5XHfJmxBZSRao6WXuT6jslFlHOIWAhe9TtXjprc0a2T8YrhwAIoMrlj70r1PHG
        4zPsukok5dP9eUN9ewQvnhqQkEajUbYXIA7/QdDhl3YPSHBnt+f4ZPhzFz1ibS96
        xYcDHZVCyawm0m+ANkLraLmHyv0X1DCM+Gl7mQTZ7b+9heI3jx/h9BfLYnY8sxLu
        kTYZK6iy3bgcaySWE0BoCHYiul6yAAwKv1js1Sn/5UHq5l/UJ1taS70HI9sPjs6G
        le1l56VB1UHUiPsKScXW46cciKa1yHxfDU4888w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JeacI6
        08ztlENt+g/Kfe0iOKdJjNDiaHCrhjdIxMGDE=; b=B7NFnr6Z9CaPmmwhvz4tZA
        WTDlxEjHuE9/hKP5XB+UgGuKHCJkd+Eau5yvc/IMD/BaTtbgbEUamyrnB//WVaDP
        RmlgfRb6BpomRG+QL5ZRi0mucx1NBhYNCvPL+jUWngVGhm1iRKshBtIIAFr1qbss
        Bnp6HHBmfq05oGRKLPynHs4BWeQhQs8/AxR4+KiEm+9j8zgDPwh0l+Q8YidR5jdd
        dklqR5McUEGpBHl4qUthcujFsHo+7GWZU6CDwIqyTCZI+zYitAFDvV5Lw1g7LYXT
        +4+DnWrpDW8vealbFSm/CMSDv28GDb6/K/jZYfApE+2YNNUih29/8oJDLS0D9aGA
        ==
X-ME-Sender: <xms:v6u-YPSeiImkXurjzOJpXHSPUgjk8IjbJXlNCLMCombKb85hRg_3ug>
    <xme:v6u-YAwC4bazm7e1Gjquvj0TBYETi2hWPH57tu7Nx77V1BwPcSRLQo-2ITg30Vt1d
    BHqtZ_1Zse_Z5v4jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:v6u-YE3_FEjyQ7xSdMbwrrMst0vlwckPfnsAxofLuy1W6dwODYJwOQ>
    <xmx:v6u-YPBNL_SWodZo2vhfGpwijcuR5qxyHuTEwQEhdRSVozjz7u5psw>
    <xmx:v6u-YIiTra2l-0jXkk9UYftWEa8xWEx7kHVwU5Iaooj5lp_5ZXtQWQ>
    <xmx:wqu-YNYXQN4LeH-s0U-doqGLYC-FVKzOfnb6n5Ng9QJAJ5kaj9DxZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A3E24AC0062; Mon,  7 Jun 2021 19:29:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <5277db96-4eb8-4794-a1fa-6a5bc40bffb7@www.fastmail.com>
In-Reply-To: <20210607071514.11727-4-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-4-steven_lee@aspeedtech.com>
Date:   Tue, 08 Jun 2021 08:58:42 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Steven Lee" <steven_lee@aspeedtech.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "open list" <linux-kernel@vger.kernel.org>
Cc:     "Hongwei Zhang" <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v4 3/7] ARM: dts: aspeed-g6: Add SGPIO node.
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index f96607b7b4e2..c09b24824b6d 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -377,6 +377,36 @@
>  				#interrupt-cells = <2>;
>  			};
>  
> +			sgpiom0: sgpiom@1e780500 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom-128";
> +				reg = <0x1e780500 0x100>;
> +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +				ngpios = <128>;

Doesn't this affect the way the data is presented on the bus?

My understanding is this should be defined by each platform, not in the dtsi. Having said that, it appears it is specified in aspeed-g5.dtsi (as the value 8?).

> +				clocks = <&syscon ASPEED_CLK_APB2>;
> +				interrupt-controller;
> +				bus-frequency = <12000000>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_sgpm1_default>;
> +				status = "disabled";
> +			};
> +
> +			sgpiom1: sgpiom@1e780600 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom-80";
> +				reg = <0x1e780600 0x100>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +				ngpios = <80>;

As above.

Andrew
