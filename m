Return-Path: <linux-gpio+bounces-14876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1758AA14B51
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 09:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 736203A2A7C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 08:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105011F8EE5;
	Fri, 17 Jan 2025 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3Gr3JTF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94521F76BD;
	Fri, 17 Jan 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737103271; cv=none; b=KOGmAL7iPVUjnLYl/3wi/auncOMk7hU1JZgEcoArHKmO8vsIr7t6bp7CnLuHitmCxF6Nj2Ioa87VkYDSXHhhYUcBrYqq5vEulFzyoj87KHsgEQUae7Z0C7ggQzMRl/WJCnhBES6FvVko85e1VtiUgGlU1Po21Mt65HWm7G02r8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737103271; c=relaxed/simple;
	bh=kGwC5vFFwzp3w+dyxaz6e/ANo3uETs7cf9+OazoI00A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rI4UNq2TDvXcsm/yfIaEoBdYmSZmW5Prhdcake+iXFjvv7wwTv2QNDCvC2VUZAN+YkZYrpxfxFYVmghpNQFOD+aEO8EYY0VzsSDU7XUzrejkERreiYBWPdZ7KEqAjcAAZYW18qp+ptjmTC14CK5Lg03uWhs3HDKb57rNXN6cxwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3Gr3JTF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B44C4CEDD;
	Fri, 17 Jan 2025 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737103270;
	bh=kGwC5vFFwzp3w+dyxaz6e/ANo3uETs7cf9+OazoI00A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3Gr3JTF8hmWPXIiNSO1Avv80+CZsRG+ZZdaKq+av8p12+FcomDCLDZJnEZ6KOSul
	 7S7Y4XKsiK9ATHyhow6VsigSFfS2WIOTRVlbuuoAXRxSmTgPr4XJR1J8XuPkkp5nlL
	 Yiv+1424bVYMLa8qgXrZDlb/ogzSIhEblC4Azmzmh6CohwGAnDRt21jHVHZnMeLqQo
	 QMqpi7MX+uggyXaGmZ3Y3ODNPv0UGPq4Srh3LlO8P/KKGxlvAD/2qmEU37GSixr8lj
	 wiclioW1A1FmJ589KM53EHUR7FK/v3c+KnHS5A3wi51R8J1tqrxNPtywdZd05wKUY9
	 ENIBGMAEE2VeA==
Date: Fri, 17 Jan 2025 09:41:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 4/5] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <20250117-fascinating-ape-of-upgrade-0c298b@krzk-bin>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
 <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>

On Wed, Jan 15, 2025 at 02:42:02PM +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A4 and add uart pinconf.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 133 ++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index de10e7aebf21..8eb95580d64a 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include "amlogic-a4-common.dtsi"
>  #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>  / {
>  	cpus {
>  		#address-cells = <2>;
> @@ -48,3 +49,135 @@ pwrc: power-controller {
>  		};
>  	};
>  };
> +
> +&apb {
> +	periphs_pinctrl: pinctrl {
> +		compatible = "amlogic,pinctrl-a4";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpiox: gpio@4100 {
> +			reg = <0 0x4100 0 0x40>,
> +			      <0 0x400c 0 0xc>;

One line

> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_X>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
> +		};
> +
> +		gpiot: gpio@4140 {
> +			reg = <0 0x4140 0 0x40>,
> +			      <0 0x402c 0 0xc>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_T>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
> +		};
> +
> +		gpiod: gpio@4180 {
> +			reg = <0 0x4180 0 0x40>,
> +			      <0 0x4040 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_D>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
> +		};
> +
> +		gpioe: gpio@41c0 {
> +			reg = <0 0x41c0 0 0x40>,
> +			      <0 0x4048 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_E>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
> +		};
> +
> +		gpiob: gpio@4240 {
> +			reg = <0 0x4240 0 0x40>,
> +			      <0 0x4000 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_B>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
> +		};
> +
> +		gpioao: gpio@8e704 {
> +			reg = <0 0x8e704 0 0x16>,
> +			      <0 0x8e700 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_AO>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +		};
> +
> +		test_n: gpio@8e744 {
> +			reg = <0 0x8e744 0 0x20>;
> +			reg-names = "gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_TEST_N>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +		};
> +
> +		func-uart-a {
> +			uart_a_default: group-uart-a-pins1 {
> +				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,

Missing space before '='. Follow DTS coding style.

Best regards,
Krzysztof


