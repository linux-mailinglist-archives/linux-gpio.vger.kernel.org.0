Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABBC2EA3F0
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 04:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbhAEDcw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 22:32:52 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:50377 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726163AbhAEDcw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 22:32:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 85093580292;
        Mon,  4 Jan 2021 22:31:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 04 Jan 2021 22:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=C
        itscExJ0arRYiy5q962saA1Ka78ZE8Lz2I4U5LlsgI=; b=AXq4as1R+3K6Dr99p
        OCfwDtee43uQ3wZYHfqv2PXECzSLQyb/rCCszZ5f3VTbc/JWzIVkvZjYzqlFNhP6
        VuiY6XiuFYfZazDHBzIjAsu2A2ecozObVeGaxxmK7mATruLy7Np485K90wF/bJtm
        sCxvbeRiLI91aXa0jkD95GkzbxhBRIJdYzdGgyj0wYAgyq2z7uCJFmIIOmbAlRhn
        oQb/p/K9CkYaEwIvZErqb4uid0et+ra46JkR+nd+P39Z6ZHTlJ4CJMe3g/whjmvQ
        v6S8LshPpGy6adyV0g0SQ6vsLkSCVxTCBkybPjtp4c04anCpEFTCoUUV/di+aKmL
        rW2eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=CitscExJ0arRYiy5q962saA1Ka78ZE8Lz2I4U5Lls
        gI=; b=Bi8FDIxDrHaXZzQuXWPMiKnY78DUuDcgY7mD3WP4bdCd8Karme4E+IC3Q
        xBHCGwFAL/PlVO3O2SomYrHqU/pBjfHV89DIMlyrRGYkqdY3pu7ropp6IubF0XGe
        J7hgO5185huew6J12ZnTrMT2XZzmTnHCcJVs/8VtciP4IQaSLgXPLCx6nXvN0qRz
        XgTyX64+HZg/epnaMxxxzq24Aj1yp2eDa7Wb4FExGPyNpQjDf4TqaV8vt8d32fxc
        pe4RKvl/cfNWatQ5ghcLX6R3txryvkaRB7TTfuG29k6scDhaOkHoVNVTgY3p3VgK
        lHRT5fZ78I/OAUWUO6ZF4WzSaawsg==
X-ME-Sender: <xms:n93zXx7y8N_ExZRTjCvSPP1RNJYfZgU975cjP1P9AddrFgoHJDfwvw>
    <xme:n93zX-4mvFJhjTMXfSrrosTW5bmlw6IRkgI8bddB-XZ5nCfy4J_NsmWTr39X9C9e-
    zaWRVL7vW6Dk9VIbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfelkeduveejtdejhfeiledvhfeggeeiieeklefhfeefffffffeg
    udetteelieejnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:n93zX4e_3oP0nh9uj8a9bmVWbfnadkm4lv-iZ3pjCzBC7pcuHqLalQ>
    <xmx:n93zX6JCQi3jBau4l1EK650mw0wK4lcki2glAEW_z9UnPBsvKedJcA>
    <xmx:n93zX1Kvr_LwO1Bx5gp8q-nngEcxhO6h40ZOgouyHZbFwNIHgNmP-w>
    <xmx:od3zX_BRIC1-WDiDrGTzXeK1bNY-2bEzt_w_Gx6QxKotkZBWrZHs7w>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id D0471108005F;
        Mon,  4 Jan 2021 22:31:42 -0500 (EST)
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC
 connection
To:     =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
References: <20210103100007.32867-1-samuel@sholland.org>
 <20210103100007.32867-5-samuel@sholland.org>
 <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <b8d302da-9268-90ee-35b4-91971ccd460a@sholland.org>
Date:   Mon, 4 Jan 2021 21:31:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/4/21 4:54 AM, André Przywara wrote:
> On 03/01/2021 10:00, Samuel Holland wrote:
>> On boards where the only peripheral connected to PL0/PL1 is an X-Powers
>> PMIC, configure the connection to use the RSB bus rather than the I2C
>> bus. Compared to the I2C controller that shares the pins, the RSB
>> controller allows a higher bus frequency, and it is more CPU-efficient.
> 
> But is it really necessary to change the DTs for those boards in this
> way? It means those newer DTs now become incompatible with older
> kernels, and I don't know if those reasons above really justify this.
> 
> I understand that we officially don't care about "newer DTs on older
> kernels", but do we really need to break this deliberately, for no
> pressing reasons?

That's a reasonable concern. I am fine if you want to delay or drop patch 4.

Cheers,
Samuel

> Cheers,
> Andre
> 
> P.S. I am fine with supporting RSB on H6, and even using it on new DTs,
> just want to avoid breaking existing ones.
> 
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
>>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
>>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
>>  3 files changed, 37 insertions(+), 37 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
>> index 7c9dbde645b5..3452add30cc4 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
>> @@ -150,12 +150,28 @@ &pio {
>>  	vcc-pg-supply = <&reg_aldo1>;
>>  };
>>  
>> -&r_i2c {
>> +&r_ir {
>> +	linux,rc-map-name = "rc-beelink-gs1";
>> +	status = "okay";
>> +};
>> +
>> +&r_pio {
>> +	/*
>> +	 * FIXME: We can't add that supply for now since it would
>> +	 * create a circular dependency between pinctrl, the regulator
>> +	 * and the RSB Bus.
>> +	 *
>> +	 * vcc-pl-supply = <&reg_aldo1>;
>> +	 */
>> +	vcc-pm-supply = <&reg_aldo1>;
>> +};
>> +
>> +&r_rsb {
>>  	status = "okay";
>>  
>> -	axp805: pmic@36 {
>> +	axp805: pmic@745 {
>>  		compatible = "x-powers,axp805", "x-powers,axp806";
>> -		reg = <0x36>;
>> +		reg = <0x745>;
>>  		interrupt-parent = <&r_intc>;
>>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>>  		interrupt-controller;
>> @@ -273,22 +289,6 @@ sw {
>>  	};
>>  };
>>  
>> -&r_ir {
>> -	linux,rc-map-name = "rc-beelink-gs1";
>> -	status = "okay";
>> -};
>> -
>> -&r_pio {
>> -	/*
>> -	 * PL0 and PL1 are used for PMIC I2C
>> -	 * don't enable the pl-supply else
>> -	 * it will fail at boot
>> -	 *
>> -	 * vcc-pl-supply = <&reg_aldo1>;
>> -	 */
>> -	vcc-pm-supply = <&reg_aldo1>;
>> -};
>> -
>>  &rtc {
>>  	clocks = <&ext_osc32k>;
>>  };
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
>> index 15c9dd8c4479..16702293ac0b 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
>> @@ -175,12 +175,16 @@ &pio {
>>  	vcc-pg-supply = <&reg_vcc_wifi_io>;
>>  };
>>  
>> -&r_i2c {
>> +&r_ir {
>> +	status = "okay";
>> +};
>> +
>> +&r_rsb {
>>  	status = "okay";
>>  
>> -	axp805: pmic@36 {
>> +	axp805: pmic@745 {
>>  		compatible = "x-powers,axp805", "x-powers,axp806";
>> -		reg = <0x36>;
>> +		reg = <0x745>;
>>  		interrupt-parent = <&r_intc>;
>>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>>  		interrupt-controller;
>> @@ -291,10 +295,6 @@ sw {
>>  	};
>>  };
>>  
>> -&r_ir {
>> -	status = "okay";
>> -};
>> -
>>  &rtc {
>>  	clocks = <&ext_osc32k>;
>>  };
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
>> index ebc120a9232f..23e3cb2ffd8d 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
>> @@ -112,12 +112,20 @@ &pio {
>>  	vcc-pg-supply = <&reg_aldo1>;
>>  };
>>  
>> -&r_i2c {
>> +&r_ir {
>> +	status = "okay";
>> +};
>> +
>> +&r_pio {
>> +	vcc-pm-supply = <&reg_bldo3>;
>> +};
>> +
>> +&r_rsb {
>>  	status = "okay";
>>  
>> -	axp805: pmic@36 {
>> +	axp805: pmic@745 {
>>  		compatible = "x-powers,axp805", "x-powers,axp806";
>> -		reg = <0x36>;
>> +		reg = <0x745>;
>>  		interrupt-parent = <&r_intc>;
>>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>>  		interrupt-controller;
>> @@ -232,14 +240,6 @@ sw {
>>  	};
>>  };
>>  
>> -&r_ir {
>> -	status = "okay";
>> -};
>> -
>> -&r_pio {
>> -	vcc-pm-supply = <&reg_bldo3>;
>> -};
>> -
>>  &rtc {
>>  	clocks = <&ext_osc32k>;
>>  };
>>
> 

