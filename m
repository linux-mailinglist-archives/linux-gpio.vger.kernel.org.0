Return-Path: <linux-gpio+bounces-11316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A999DDDC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B932128560D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5500417A58C;
	Tue, 15 Oct 2024 06:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI1KDBJU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB5DEC5;
	Tue, 15 Oct 2024 06:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728972056; cv=none; b=MpU11bg0l6ygjrabwXfzla9zpW6hdqYDWoq6oswc4S3/XIyiEC0g5u+BCzv9aW9QjYxrlLqReMUq/ve90UjaJqgdLAmoJUdVPwd356u5jVCOnDvhHr1RkhV23KMF/wIcoMAKlpfH8pPiWoXgNHhdUnLppVrO4OC3Sn9c54QgHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728972056; c=relaxed/simple;
	bh=I65itk5tddOgMYfVz3UQOHCfBTUHhlq7vfZDyL3fcQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7Ne5t/2Vs4ByMbdbrnhPy+kTk4E1VvsZLEtPFFzWM2MPelFB6e+8EZ12hqOeDIe1puYlYKswNr7lXjA9p6sRfTtZVqIMGLePHQUnoqUqLY8M5Gg/wIPwmjRM3L0Lz0oTz5PaA4lwtp7NNDTKTaMDzCwFLoTucZk2Z0hOQIOlPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI1KDBJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A05C4CEC7;
	Tue, 15 Oct 2024 06:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728972055;
	bh=I65itk5tddOgMYfVz3UQOHCfBTUHhlq7vfZDyL3fcQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DI1KDBJUcaBr9CSyMBck5GpJD9TG5a0+PQwOyTESsMavt6Uczjun7LyGw7ScerhqA
	 tE4bMfU0RS77haf3CSePYATpvA6HFbOcUJRxp/HUYQJSLnlCV3oCjDl5CV8+mIpi/X
	 tJWEyiDTGdPxE5RPh3AGZOkp8igNstcGhjUxrr016trcYNwyXtxxtdW6z8/Oi2MgGo
	 C70dABJN0Y+nsIkXXUc9sntWnr3Emm8HsANhmR6rRsd9XgW/JYoaTJ/0KHygJWQMGB
	 NrvLHffFSE5kRds+J8e6BLND0Hr+ZaAe/h+IcU8mpQ2XCL1DRL/nsyN7acv0D/Z8Zc
	 1W0+DacygJgQQ==
Date: Tue, 15 Oct 2024 08:00:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <nudqyugprp757romcrpkydvqbucqrww4olclsns5zgf6j2w5xi@y4vdst76qkqr>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com>

On Mon, Oct 14, 2024 at 05:05:53PM +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index de10e7aebf21..a748351e8b1b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include "amlogic-a4-common.dtsi"
>  #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>
>  / {
>  	cpus {
>  		#address-cells = <2>;
> @@ -48,3 +49,38 @@ pwrc: power-controller {
>  		};
>  	};
>  };
> +
> +&apb {
> +	periphs_pinctrl: pinctrl@4000 {
> +		compatible = "amlogic,a4-periphs-pinctrl";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
> +
> +		gpio: bank@0 {
> +			reg = <0x0 0x0 0x0 0x0050>,
> +			      <0x0 0xc0 0x0 0x0220>;
> +			reg-names = "mux", "gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 0 PERIPHS_PIN_NUM>;

Really? Number of pins is coming from the binding?

Best regards,
Krzysztof


