Return-Path: <linux-gpio+bounces-33522-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G6mKIQKuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33522-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:49:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11F29ABC3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40E43099E93
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F9439A070;
	Mon, 16 Mar 2026 13:45:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7931F39A804
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668710; cv=none; b=SqYCgzSGrbUnzKTFkaPqSWnOc7Vn40ZVBs0lf+NhgkI6le8AhR81iEgsJunGzaLBVyEjgrRRFK+5PmwYdo/yWx53PXNSF28WRLm/lUUnKDcz0Am1+TUWhVOpNMctrA1DqdhntsNaiyg+/jEy7/OI4dTSqfmiJTA9LJNCT0CAIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668710; c=relaxed/simple;
	bh=CJsJ4OND96u3gKlcyJ1wDnGCTfTeeaQ6qt2SAE5Q5f4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GstzaQX1FSvQAPt8LPFRJqb8oXRyuANX2nILX8wK9mm99/T5RJEOP2aq9BRhgK5UhmHBzt6Bx1sOyUQwRt53H+S1dHWmmi/TlQBh0JrBvwAzvKCXwrZiD46rOIyLoku4YiSLYpOYfcZ7f7G1br/Z6yYvuBHQtar4Tw4AMXoZ0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1w28FR-0007l4-6I; Mon, 16 Mar 2026 14:44:45 +0100
Message-ID: <ea59ff34-73f2-491c-88cf-51d1ac3db424@pengutronix.de>
Date: Mon, 16 Mar 2026 14:44:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: imx8mp-evk: add board-level mux for
 CAN2 and MICFIL
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-6-236b1c17bf9b@nxp.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260311-pinctrl-mux-v3-6-236b1c17bf9b@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nxp.com,axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33522-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.fatoum@pengutronix.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,2.98.90.0:email,pengutronix.de:email,pengutronix.de:mid,pengutronix.de:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F11F29ABC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 8:08 PM, Frank Li wrote:
> The board integrates an on-board mux to route shared signals to either
> CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.
> 
> Add a pinctrl-based multiplexer node to describe this routing and ensure
> proper probe ordering of the dependent devices.
> 
> Previously, MICFIL operation implicitly depended on the default level of
> PCA6416 GPIO3. After adding the pinctrl-multiplexer, make the dependency
> explicit.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

I really like this new abstraction.

> +	can_mux_pinctrl: pinctrl-gpiomux {
> +		compatible = "pinctrl-multiplexer";
> +
> +		can_fun: can-grp {
> +			mux-states = <&can_mux 1>;
> +		};
> +
> +		pdm_fun: pdm-grp {
> +			mux-states = <&can_mux 0>;
> +		};
> +	};

Just to make sure: If both &flexcan2 and &micfil were enabled at the
same time, the existing pinctrl clash detection will also work for this
new pinctrl-multiplexer and point that out, right?

Thanks,
Ahmad

> +
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0 0xc0000000>,
> @@ -446,7 +465,7 @@ &flexcan1 {
>  
>  &flexcan2 {
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
>  	phys = <&flexcan_phy 1>;
>  	status = "disabled";/* can2 pin conflict with pdm */
>  };
> @@ -712,7 +731,7 @@ &lcdif3 {
>  &micfil {
>  	#sound-dai-cells = <0>;
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_pdm>;
> +	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
>  	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
>  	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
>  	assigned-clock-rates = <196608000>;
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


