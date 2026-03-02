Return-Path: <linux-gpio+bounces-32407-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H0WACFvpml2PwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32407-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 06:18:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B12B91E9281
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 06:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8F153043AC4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 05:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B92B30B53E;
	Tue,  3 Mar 2026 05:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Cl4Vuwna"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F118EB0
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772515099; cv=none; b=mOGzm35gOxO70fVbaZ6UZJhjOxxkfId+SqEo4U+cnHwgDsPoeImOBfRjGy3AYDbrwjMlAB5cQUcEtmvE4nZ0PKBlrGcC3Fzb5HtfWU1jLcQt4WzimZVDZK89httR0Pmxljc2uYqzHX3BeSXB+ZqfTVk8FqMtC+0UwMIJsY4QbCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772515099; c=relaxed/simple;
	bh=6IhGO9NuDFgVigx9/UqAOGVhRR3YeAtsrKcYCrRl7Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBBr/EyKBvWEfG8ni4Glqdy2GAnDOxMa3HC170LQWX38zvAW5Ap2d9Wn6KFGqFEfDge9MKOd7eHCIiqYnd5csBx2oZ19MCAKr45e+c3WANnYNApRpFJSF/dBK82WuVDfceMa/G/lrfgyVWPt2nrPJH9GWuddDrV8/zNb0twQ1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Cl4Vuwna; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1772515095;
 bh=OP9ybk+orz8SA4kEyEh+9E7911j3DQb5yf+d6l5ndHI=;
 b=Cl4VuwnarFmSKcQ6PZmgioBaBQUIBxjDD2ttDWCrnrK4kFPHnNYKzHhna33kV7IWzBJSh21UQ
 hSU2TqCCZ25QH7PaVtvcPtNPhxyRUE/fZS2B4clic+Bd818txXssbwfsALyrpylQQ+y2sH8ykeX
 4q7xbBOPhDIhdRnIbuGc3XJ6x1HyLSqcBeV6UU3iMUwAIX/uV3scFtXZdckftW4hdN2x1C+47Mo
 kPV9Z/MDVMIiK6neCpPJG8oeL2VMLumCXP2ysbLF9CoGh1ORvh3LLfoL+8Ev0R1r/xGdIBJ1q/D
 3wy8C0gJWtIXH8B4h8sIMuburWg6XCr2/GDPQglSUbtA==
X-Forward-Email-ID: 69a607a900eccc184c5c9cd8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e439f2f7-0b25-41a5-951a-d8d3bc9f2bf2@kwiboo.se>
Date: Mon, 2 Mar 2026 22:56:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] arm64: dts: rockchip: rk3308: Add gpio-ranges
 properties
To: Matthijs Kooijman <matthijs@stdin.nl>
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
References: <20260302202121.197288-1-matthijs@stdin.nl>
 <20260302202121.197288-3-matthijs@stdin.nl>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260302202121.197288-3-matthijs@stdin.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B12B91E9281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32407-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ff220000:email,ff230000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ff260000:email]
X-Rspamd-Action: no action

Hi Matthijs,

On 3/2/2026 9:17 PM, Matthijs Kooijman wrote:
> This makes the mapping between gpio and pinctrl explicit.
> 
> This does not immediately change functionality, because the
> gpio-rockchip.c driver has a workaround that defines ranges when they
> are not present in DT, but that relies on global gpio numbering (so
> AFAICS only works when the rockchip gpio banks are initialized first and
> in-order).

This is strictly not correct, the driver use the gpioX alias id as
defined in the device tree and does not depend on the initialization
order.

This file explicitly define the aliases matching the hardware:

	aliases {
		gpio0 = &gpio0;
		gpio1 = &gpio1;
		gpio2 = &gpio2;
		gpio3 = &gpio3;
		gpio4 = &gpio4;
		[...]
	};

> 
> Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
> ---
>  arch/arm64/boot/dts/rockchip/rk3308.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> index 31c25de2d689c..681d2429d541d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> @@ -889,6 +889,7 @@ gpio0: gpio@ff220000 {
>  			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cru PCLK_GPIO0>;
>  			gpio-controller;
> +			gpio-ranges = <&pinctrl 0 0 32>;

This matches the driver, but not the hardware according to datasheet, it
only lists gpio0 A0-C5 used, and not all 32 pins supported by the gpio0
controller.

>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> @@ -900,6 +901,7 @@ gpio1: gpio@ff230000 {
>  			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cru PCLK_GPIO1>;
>  			gpio-controller;
> +			gpio-ranges = <&pinctrl 0 32 32>;

Same here, the datasheet only lists gpio1 A0-D1 used, and not all 32
pins supported by the gpio1 controller.

>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> @@ -911,6 +913,7 @@ gpio2: gpio@ff240000 {
>  			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cru PCLK_GPIO2>;
>  			gpio-controller;
> +			gpio-ranges = <&pinctrl 0 64 32>;

Same here, the datasheet only lists gpio1 A0-C0 used, and not all 32
pins supported by the gpio2 controller.

>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> @@ -922,6 +925,7 @@ gpio3: gpio@ff250000 {
>  			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cru PCLK_GPIO3>;
>  			gpio-controller;
> +			gpio-ranges = <&pinctrl 0 96 32>;

Same here, the datasheet only lists gpio1 A0-B5 used, and not all 32
pins supported by the gpio3 controller.

>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> @@ -933,6 +937,7 @@ gpio4: gpio@ff260000 {
>  			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cru PCLK_GPIO4>;
>  			gpio-controller;
> +			gpio-ranges = <&pinctrl 0 128 32>;

Same here, the datasheet only lists gpio1 A0-C1 and D0-D7 used, and not
all 32 pins supported by the gpio4 controller.

Regards,
Jonas

>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;


