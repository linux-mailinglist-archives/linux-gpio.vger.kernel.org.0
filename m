Return-Path: <linux-gpio+bounces-20152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF3AB6C3E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 15:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3C5F1B63401
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 13:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6393627A918;
	Wed, 14 May 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQY79gmH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1986A27A907;
	Wed, 14 May 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228225; cv=none; b=Q1dq4s2PpdEV2XJk6piN3jU7beGQOmSD4Ic1p+VsnX9UTBqV4d8ElcvTn6Baab3KbxL8d7O96n/MoDUxuuSKlgie3JovruAyWpnHdDD3P3uW3xtLnlltLzqB4ACOyTHfcPyJBMLKBWFMlL3OF3mAuYsBD17BfHKK+A+3KA21sOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228225; c=relaxed/simple;
	bh=YSHixMfBQIo2tsjE+RpfvwcFjHExWTXe3JSwBkN0y4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzM3A6YU1uVECgdC1YgHMSKHGiB0sXgdapTYUqm2u59DBeR20CAYpRhLkGKP9zxY9RV8KawBLUVRKp4ZjDKwr0PTTllzAhUTXx/IF37AV93sUX/VzXbG71CVuZKoTJFiRJWeCz+RdAC6vX5Jmh49rmuvwBaaSqtKCmpm/cVCfeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQY79gmH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4698CC4CEED;
	Wed, 14 May 2025 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747228224;
	bh=YSHixMfBQIo2tsjE+RpfvwcFjHExWTXe3JSwBkN0y4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQY79gmHrxHRzHRhbVSBxQuv2MeZQvOdiwhA8wR0F3LXhBMnynNTPK2FM+JI4V3hr
	 hHpdlDw8v/KzzwpiRPwKoLyRSPLNi1pBkS1S3ZSxgkbuJOHym2N4xp/LWsCwRKgbO1
	 kRVlDYQXUj3wXNUsIvEceZfuTb78sbFxuypS8LB3h1o6DgB9VvxOBcREbSQZtO/5E3
	 zKfQSybkNvfLgjedVEOI3qdP8XEZfNgFEvZYiMaWufJgQ6ORK4WuXbyoV0yf0ehQlR
	 7EjHltYo4aem46Q+6rz3FUXpE4fEWbZrNu6S1TGtJZfHWdMrNSHDNbS7TI4MeXL++L
	 rlBxpyhdR7aig==
Date: Wed, 14 May 2025 08:10:22 -0500
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] dts: arm64: amlogic: add S7 pinctrl node
Message-ID: <20250514131022.GA1833633-robh@kernel.org>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
 <20250514-s6-s7-pinctrl-v1-6-39d368cad250@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-s6-s7-pinctrl-v1-6-39d368cad250@amlogic.com>

On Wed, May 14, 2025 at 03:01:33PM +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic S7.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 81 +++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> index f0c172681bd1..924f10aff269 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>  
>  / {
>  	cpus {
> @@ -94,6 +95,86 @@ uart_b: serial@7a000 {
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> +
> +			periphs_pinctrl: pinctrl {

If you have non-boolean ranges, then this should have a unit address 
(@4000).

> +				compatible = "amlogic,pinctrl-s7";
> +				#address-cells = <2>;
> +				#size-cells = <2>;

Doesn't look like you need 64-bits of address and size. 1 cell is 
enough.

> +				ranges = <0x0 0x0 0x0 0x4000 0x0 0x340>;


