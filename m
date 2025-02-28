Return-Path: <linux-gpio+bounces-16798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF0BA497AD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D6F1894645
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBE925D55A;
	Fri, 28 Feb 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cmspyZjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CEB17BA3;
	Fri, 28 Feb 2025 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739614; cv=none; b=tSSv7j6dY+obbjKV9HNdbj3mNpwacyeNGskEnLno1aukaM1hizIw72lmcOqIqShhxZgTVB+6ioNNgHwH5A9V+HW6gQ1GZEN0LZLKKCNAj/wWixLBVw+coPiaQgyWb8XKm4d9NGAiX+8rCkx0tAg1NCdtr7NDUIJIbfjLhpn6Rwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739614; c=relaxed/simple;
	bh=U4f39K22AT2uLhlBihafrDKiaAl4zq7R+BWNHeeQvIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poEKBh4xK/gzQe1dqKUEN6aFvq//d7U7G1T9Zj8D5u7YCw8N+PT8HEJ5UZUMu6ymiF3PSG2SY6L0J9IWFyENF1KGfjWfAK2C18YfB9K1ZRzFLePKGbctj6z6Zh661wySVfFmYk6mojaP7Fh5BFr6C2tMomClmO/86/V2QMDOAEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cmspyZjB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1F27725B10;
	Fri, 28 Feb 2025 11:46:49 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzMnRzDWYUA6; Fri, 28 Feb 2025 11:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740739608; bh=U4f39K22AT2uLhlBihafrDKiaAl4zq7R+BWNHeeQvIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmspyZjBlr/nK/v9Lg8q2qjjEHQAXily7IiaveTLICIjaKnmm1F4qjVgw2KggkmKz
	 WYEB/5j4AoNEtMr3KPKadNm9ZCjGIywSv5Tc+xDUJDMq3wkYB6qJjjApAZXuuLxqCz
	 z3r79UNmdr3r9rsKt27LgDD5EqS5PB9TIbuUcW3Jr8xe4JvCOBks9Ll3BhpO4D4C22
	 rhvCzjCOnX7eGbPgKsz0nJszJtkVXjJHqK2TvxbA4vZhXARy7W+Bz/oRz/KBu6jkY0
	 qEkhOh9AlSpdIGCmqrQr3yTdfFd7TxpqpP9Z9vhGT7K5LbH/jbmkxVcykZxTvKpwV7
	 sGAzXFRt5Mj5w==
Date: Fri, 28 Feb 2025 10:46:29 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for
 RK3528
Message-ID: <Z8GT3rUEyXrTUgtJ@pie.lan>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-5-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228064024.3200000-5-jonas@kwiboo.se>

On Fri, Feb 28, 2025 at 06:40:10AM +0000, Jonas Karlman wrote:
> Add pinctrl and gpio nodes for RK3528 and import rk3528-pinctrl.dtsi
> from vendor linux-6.1-stan-rkr5 kernel with the hdmi-pins-idle node
> removed due to missing label reference to pcfg_output_low_pull_down.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> This was mostly imported from vendor kernel, however the main commit [1]
> list 28 signed-off-by tags, unclear who I should use as author and what
> signed-off-by tags to include.
> 
> [1] https://github.com/rockchip-linux/kernel/commit/c17d6325959f0ec1af901e8a17919163454190a2
> ---
>  .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
>  2 files changed, 1479 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
> 

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 0fb90f5c291c..d3e2a64ff2d5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -4,8 +4,10 @@
>   * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
>   */
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
>  #include <dt-bindings/reset/rockchip,rk3528-cru.h>
>  
> @@ -17,6 +19,11 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		gpio4 = &gpio4;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> @@ -166,6 +173,11 @@ cru: clock-controller@ff4a0000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		ioc_grf: syscon@ff540000 {
> +			compatible = "rockchip,rk3528-ioc-grf", "syscon";
> +			reg = <0x0 0xff540000 0x0 0x40000>;
> +		};
> +
>  		uart0: serial@ff9f0000 {
>  			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
>  			reg = <0x0 0xff9f0000 0x0 0x100>;
> @@ -264,5 +276,75 @@ saradc: adc@ffae0000 {
>  			#io-channel-cells = <1>;
>  			status = "disabled";
>  		};
> +
> +		pinctrl: pinctrl {
> +			compatible = "rockchip,rk3528-pinctrl";
> +			rockchip,grf = <&ioc_grf>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

I doubt whether the pincontroller should be placed under simple-bus:
without a reg property, it doesn't look like a MMIO device.

Actually it is, although all the registers stay in the ioc grf. Maybe
it should be considered as child of the grf.

Best regards,
Yao Zi

