Return-Path: <linux-gpio+bounces-27935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B2C2A599
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 08:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 02537345254
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 07:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D4B2BEC42;
	Mon,  3 Nov 2025 07:34:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E6A28C871
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155281; cv=none; b=o5FV5imVsvSO90+Da5vXgblSl9o1cfdAFgo1ieZGpzAv6ct/Hp5GjBLryxuWLCA8pj27C4DVkgs9Tzf7+gA54C73fy0t2CSUqZc3bspwsP5krrdLKlSNkce9gjcUXwKkEuEsH9KlCD5WdHNWcMI51NDa/mZwgyu+B7Vw68dqLWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155281; c=relaxed/simple;
	bh=IboLZbupkxix2FXICklsyuXcnn9K5vNP0z0XeJ33kCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nxh8cdfTK4OiewzWu8ZmMF3n5mYTTlyCJO+CJgt/OBs+MdF0xGY6j5eBaXcuxon3YFv1sxlGq4ETS4HXgiO0LlE+BnEX2V+LeXrpphBVSLSecUDZRLHcH0SFW21rdeyjDZ6OYKWQRpeqYA2HkmUR/frau0NC4dk1L7YVqlNupdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1vFp4z-0001MA-7R; Mon, 03 Nov 2025 08:34:17 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vFp4x-006ouR-2B;
	Mon, 03 Nov 2025 08:34:15 +0100
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vFp4x-00GZkn-1n;
	Mon, 03 Nov 2025 08:34:15 +0100
Date: Mon, 3 Nov 2025 08:34:15 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Davis <afd@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <aQha9-oNEQd2Ds7Z@pengutronix.de>
References: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
 <20251031-am62lx-v7-2-cb426be9d6ee@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-am62lx-v7-2-cb426be9d6ee@ti.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Fri, Oct 31, 2025 at 09:08:05AM -0500, Bryan Brattlof wrote:
> +	gpio0: gpio@600000 {
> +		compatible = "ti,am64-gpio", "ti,keystone-gpio";
> +		reg = <0x00 0x00600000 0x00 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 267 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		power-domains = <&scmi_pds 34>;
> +		clocks = <&scmi_clk 140>;
> +		clock-names = "gpio";
> +		ti,ngpio = <126>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		status = "disabled";

Virtually all boards use GPIOs and a GPIO controller doesn't have any
external dependencies, so could you enable them by default like done on
many other SoCs?

> +
> +	target-module@2b300050 {
> +		compatible = "ti,sysc-omap2", "ti,sysc";
> +		reg = <0x00 0x2b300050 0x00 0x4>,
> +		      <0x00 0x2b300054 0x00 0x4>,
> +		      <0x00 0x2b300058 0x00 0x4>;
> +		reg-names = "rev", "sysc", "syss";
> +		ranges = <0x00 0x00 0x2b300000 0x100000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		power-domains = <&scmi_pds 83>;
> +		clocks = <&scmi_clk 324>;
> +		clock-names = "fck";
> +		ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> +				 SYSC_OMAP2_SOFTRESET |
> +				 SYSC_OMAP2_AUTOIDLE)>;
> +		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +				<SYSC_IDLE_NO>,
> +				<SYSC_IDLE_SMART>,
> +				<SYSC_IDLE_SMART_WKUP>;
> +		ti,syss-mask = <1>;
> +		ti,no-reset-on-init;
> +		status = "disabled";

This node is present on many other TI SoCs, all I have looked at have
this node enabled by default. I think it makes sense to have this node
enabled given that it has child nodes like this UART:

> +
> +		wkup_uart0: serial@0 {
> +			compatible = "ti,am64-uart", "ti,am654-uart";
> +			reg = <0x00 0x100>;
> +			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk 324>;
> +			assigned-clocks = <&scmi_clk 324>;
> +			clock-names = "fclk";
> +			status = "disabled";
> +		};

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

