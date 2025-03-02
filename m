Return-Path: <linux-gpio+bounces-16885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5EA4B2F3
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 17:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB3863B29D2
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 16:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5191E9B1D;
	Sun,  2 Mar 2025 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jYb+tFVV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152481E9B18;
	Sun,  2 Mar 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740931764; cv=none; b=iIoGkJenBSe1jtU4/oOUoLATbdztNVu9LCyGKu0F4FOz5HD8hkwdNlHjini/abHHeHV6acPLgv6QBLbvY30BtBpQAgeIUJPGTq5/4GAh6fNZ/lt3v0TNjIHvk+0WVK7Hj+TXRCH6rAnDrIcDK8S7jOpDp6KWbED4vByXRHJCcq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740931764; c=relaxed/simple;
	bh=SuCW7erPuPRWso4GqZRpWS+3gl1BI6ZPagbPAaY4PKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dui2A1qjqRiragVJhtZ/l3lxW0WHHBizq64Qj7wYJcps6BtNesRXvGjdwJa2fpyqpEkl8lcyeMmeO7uXjdTxVYcriyIWdnB37VMmj/Zroj2gM8b6peJk4Trz3umbgmhZGA9KWIA5OErDWEPnxlQSn/msN8k8Q6NTzbdwCqECObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jYb+tFVV; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ED48C20746;
	Sun,  2 Mar 2025 17:09:19 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viBQlnlcbeEl; Sun,  2 Mar 2025 17:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740931755; bh=SuCW7erPuPRWso4GqZRpWS+3gl1BI6ZPagbPAaY4PKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jYb+tFVVVYmJwA66Yg/pXiup5NL0cltofMdg5DTZnjV9xaIOWy24o1bTjj2wdVs7a
	 lDQkbqjVfoZ3GIOiETO6LrOmk2D9ssn1q/2SwweEmwTG27FXPnDRNd1scetAqtQe9J
	 fJUwG58qBhgcVgXNJ/p/v7GDDjH6VeQdH9k3VjBu7AGfcr7X0wuI4QJrIfv34jFDsz
	 WFwOak66AoS0NZiR+5pQhOBbNxqKBOJF98sWjc1R1Ch+BSbpxqzz24vicYsNzQ8aj8
	 2ta4xRx2THhrzsg6nKxjgYhSUxlqUbQcw9JPvogdtzkr8EmK4RpYJSn53PUlo0ESUf
	 S5LhLFJBGT15g==
Date: Sun, 2 Mar 2025 16:09:01 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for
 RK3528
Message-ID: <Z8SCnfZxH-H0iGwf@pie.lan>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <Z8GT3rUEyXrTUgtJ@pie.lan>
 <3f0cd767-1fd8-4c65-b8b4-e948288cd02a@kwiboo.se>
 <116104909.nniJfEyVGO@diego>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116104909.nniJfEyVGO@diego>

On Sun, Mar 02, 2025 at 12:52:18PM +0100, Heiko Stübner wrote:
> Am Sonntag, 2. März 2025, 12:14:48 MEZ schrieb Jonas Karlman:
> > Hi Yao Zi,
> > 
> > On 2025-02-28 11:46, Yao Zi wrote:
> > > On Fri, Feb 28, 2025 at 06:40:10AM +0000, Jonas Karlman wrote:
> > >> Add pinctrl and gpio nodes for RK3528 and import rk3528-pinctrl.dtsi
> > >> from vendor linux-6.1-stan-rkr5 kernel with the hdmi-pins-idle node
> > >> removed due to missing label reference to pcfg_output_low_pull_down.
> > >>
> > >> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > >> ---
> > >> This was mostly imported from vendor kernel, however the main commit [1]
> > >> list 28 signed-off-by tags, unclear who I should use as author and what
> > >> signed-off-by tags to include.
> > >>
> > >> [1] https://github.com/rockchip-linux/kernel/commit/c17d6325959f0ec1af901e8a17919163454190a2
> > >> ---
> > >>  .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
> > >>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
> > >>  2 files changed, 1479 insertions(+)
> > >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
> > >>
> > > 
> > >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> index 0fb90f5c291c..d3e2a64ff2d5 100644
> > >> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> @@ -4,8 +4,10 @@
> > >>   * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
> > >>   */
> > >>  
> > >> +#include <dt-bindings/gpio/gpio.h>
> > >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > >>  #include <dt-bindings/interrupt-controller/irq.h>
> > >> +#include <dt-bindings/pinctrl/rockchip.h>
> > >>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
> > >>  #include <dt-bindings/reset/rockchip,rk3528-cru.h>
> > >>  
> > >> @@ -17,6 +19,11 @@ / {
> > >>  	#size-cells = <2>;
> > >>  
> > >>  	aliases {
> > >> +		gpio0 = &gpio0;
> > >> +		gpio1 = &gpio1;
> > >> +		gpio2 = &gpio2;
> > >> +		gpio3 = &gpio3;
> > >> +		gpio4 = &gpio4;
> > >>  		serial0 = &uart0;
> > >>  		serial1 = &uart1;
> > >>  		serial2 = &uart2;
> > >> @@ -166,6 +173,11 @@ cru: clock-controller@ff4a0000 {
> > >>  			#reset-cells = <1>;
> > >>  		};
> > >>  
> > >> +		ioc_grf: syscon@ff540000 {
> > >> +			compatible = "rockchip,rk3528-ioc-grf", "syscon";
> > >> +			reg = <0x0 0xff540000 0x0 0x40000>;
> > >> +		};
> > >> +
> > >>  		uart0: serial@ff9f0000 {
> > >>  			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
> > >>  			reg = <0x0 0xff9f0000 0x0 0x100>;
> > >> @@ -264,5 +276,75 @@ saradc: adc@ffae0000 {
> > >>  			#io-channel-cells = <1>;
> > >>  			status = "disabled";
> > >>  		};
> > >> +
> > >> +		pinctrl: pinctrl {
> > >> +			compatible = "rockchip,rk3528-pinctrl";
> > >> +			rockchip,grf = <&ioc_grf>;
> > >> +			#address-cells = <2>;
> > >> +			#size-cells = <2>;
> > >> +			ranges;
> > > 
> > > I doubt whether the pincontroller should be placed under simple-bus:
> > > without a reg property, it doesn't look like a MMIO device.
> > > 
> > > Actually it is, although all the registers stay in the ioc grf. Maybe
> > > it should be considered as child of the grf.
> > 
> > This follows how pinctrl was added for RK3576 and what is proposed for
> > RK3562 [2]. I have too little knowledge to know if this needs to change
> > or if this should follow similar SoCs.
> > 
> > [2] https://lore.kernel.org/r/20250227111913.2344207-15-kever.yang@rock-chips.com
> 
> The reg address shouldn't matter here I think.
> 
> The "soc"-bus describes the elements contained in the soc (surrounding the
> cpu cores) and the pinctrl controller definitly is part of the soc itself.
> 
> So when looking at the scope, it does belong there and also the
>  gpio-controller elements do have mmio addresses :-)

Thanks for the explanation, it makes sense to me.

> Heiko
> 

Best regards,
Yao Zi


