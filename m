Return-Path: <linux-gpio+bounces-39935-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aK9jA/zVU2rFfQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39935-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 19:59:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9D745926
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 19:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kwiboo.se header.s=fe-e1b5cab7be header.b=iyszNqAd;
	dmarc=pass (policy=quarantine) header.from=kwiboo.se;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39935-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39935-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80E56304494C
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 17:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EF735DA43;
	Sun, 12 Jul 2026 17:55:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B112C33F5B3
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 17:55:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878919; cv=none; b=IUnUTZJYZrV34Acs7ClKhpSCI5q2mHs5RpctVaD65X4WD0hwteYthZ/HVdC8sk9gr0FPM0RLBVnRAUoNiM5opM142H560Sk5lH1uf2JSnrey8mu9Rjv+N+ClVLoeh2qrif8jsj+0el0sN6o/cY1dC1RNfV466/BIIi9suXzm3sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878919; c=relaxed/simple;
	bh=I45Jwk9+2vfqWVLFvIPP2Gr62VVGBw+PMOyqtfLWmaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQrSepZrSwhTOvEtkLAE+1awxxt3lr/sF2Vtj+RXcvSCI9oCLfI5pisWY6TM1JzHwQo5oUOBrxGKUogQWaVPzjzjpJ26wM0NLfixUfaGkMu2ECJQUPiGjnWo62PVw1cVXqKuoeMgGgNJJRI0yX98CRZWdAFiS6XfEyB9jyPELO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=iyszNqAd; arc=none smtp.client-ip=149.28.215.223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783878910;
 bh=+cz4TC7FYuAA1MNLgolPmcFRysJt6pzD3nfMB9W3q7M=;
 b=iyszNqAdUjP0PeyZO2ujvNtaZ/At6cHutiXA/ooiAYBW3Ey/g7l3mUZVNl0zwPHJEhPF2bcMY
 i/xInQFat2nXKqNiaeC7Mh+JZm8lh4raRBnEQpdGRh7GiLb5HmLTYdApV67xFFRJ+UGAh7yxCue
 FMDSXDO7kJws/DffmWlk3UaYF4iCSv/DLReqQtKmc2+X8565hYLBzWQX0mdVzivWpw/fzpmiBA7
 bLF6nWVyADwUz9nrnM/gyQAiFp9XXNl2cBP4PhJH8bLUO1fk8kR38m/eusDwbmid9fzc8hSTH4r
 M+vT99/K4yrjm02hIHR2tDwciRe3f9Iv7/Wmewn5GsEA==
X-Forward-Email-ID: 6a53d4f81f631853be4f2d47
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e2ed95ee-8044-4a44-9775-9f36b10e727f@kwiboo.se>
Date: Sun, 12 Jul 2026 19:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Jeffy Chen <jeffy.chen@rock-chips.com>, Linus Walleij <linusw@kernel.org>,
 huang lin <hl@rock-chips.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-5-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-5-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39935-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sjg@chromium.org,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:festevam@nabladev.com,m:linux-arm-kernel@lists.infradead.org,m:jeffy.chen@rock-chips.com,m:linusw@kernel.org,m:hl@rock-chips.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,kwiboo.se:from_mime,kwiboo.se:dkim,kwiboo.se:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81A9D745926

Hi Simon,

On 7/6/2026 9:58 PM, Simon Glass wrote:
> Add pinctrl support for the Rockchip RV1106, taken from the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). The IOC registers are spread across several
> blocks, addressed through per-bank offsets, with the GPIO0 block in the
> PMU. The drive strength uses the RK3568-style exponential encoding.
> 
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
> 
> [1] https://github.com/LuckfoxTECH/luckfox-pico
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 208 +++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |   1 +
>  2 files changed, 209 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 7e0fcd45fd26..f9cbcb955853 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1725,6 +1725,166 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
>  	return 0;
>  }
>  
> +#define RV1106_DRV_BITS_PER_PIN		8
> +#define RV1106_DRV_PINS_PER_REG		2
> +#define RV1106_DRV_GPIO0_OFFSET		0x10
> +#define RV1106_DRV_GPIO1_OFFSET		0x80
> +#define RV1106_DRV_GPIO2_OFFSET		0x100C0

This, and remaining offsets, should likely be from the related GPIOx IOC
base and not from GPIO1 IOC base.

The regmap_base should likely only cover GPIO1 IOC, else it would cross
boundary into the GPIOx+1 controller regmap space.

See my review comment on pinctrl dt-bindings, we likely need to define
the IOC reg space for each GPIO controller for this SoC and adjust this
driver accordingly.

Possible something like following:

  gpio2: gpio@ff540000 {
	reg = <0xff540000 0x10c>, <0xff548000 0x8000>;
	reg-names = "base", "ioc";
  };

or

  gpio2: gpio@ff540000 {
	reg = <0xff540000 0x10c>;
	rockchip,grf = <&gpio2_ioc>;
  };

  gpio2_ioc: syscon@ff548000 {
	reg = <0xff548000 0x8000>;
  };

Regards,
Jonas

> +#define RV1106_DRV_GPIO3_OFFSET		0x20100
> +#define RV1106_DRV_GPIO4_OFFSET		0x30020

[snip]

