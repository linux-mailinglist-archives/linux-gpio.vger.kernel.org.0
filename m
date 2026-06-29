Return-Path: <linux-gpio+bounces-39086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3OYlK9wSQmryzgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:38:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B16D6639
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:38:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=llYEogHQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39086-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39086-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23E2530080A0
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 06:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C81439A05D;
	Mon, 29 Jun 2026 06:38:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5CF38E8C4;
	Mon, 29 Jun 2026 06:38:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715098; cv=none; b=L7nB4C1POHAFOtw+IUJIumpGYA1DfTRdrKnVUVgoTL5YQgQ0rXWJ6ZIzgZiJjhg8RhNbr2umj7wroU7N7akQAIve7RibWOmwrfsmk+h/JkWBLicBOn+KuNGVTbFVfXS5Y/dIhAHE/R4t+NTsLDySP0jrmGPW4TuZP4w/uHQU3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715098; c=relaxed/simple;
	bh=MQ65+xHViPlc4P9FmRdAyfzeyntnzrTzeKeP3cTEDzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZ5oH3XbyxPzYfjRc3pD0s6R7xLaqvDcbCFga/Jy8ev2qU01McZf27aRuwYdFo3Yj5u2VAS80FJbGSZqmMziXJHXNBqv7UYPCG7AHQ+D1Du1wc7svUiTD7WVrq8y9zxUorP3A5mrQ5gQoLh6Lz7xFzmvYMWDAX8s+wunhoZMZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llYEogHQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE731F000E9;
	Mon, 29 Jun 2026 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715096;
	bh=9DG5vw/ziuqvimIbMEocUy0M4eBXI2/0uzMJbjcgw6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=llYEogHQLmtCJcle00yDXQK2aP86/5ead2oMxDvDOoXOyHFCjQvKQWE4XMhq7f1Wh
	 MoYiscAmOCAxE2g6Xrd0eIN87Y6PqEAhVK8gApGDagpzFgh9GFzMtRzd5Q2LjPQd3S
	 NBtW3H0FfVKpohU2pUK+N17n0tztKpXkKMrZuX5W2O1k1aSkxrx2ZnOP5xamKFboQw
	 I/VgqQ9Cf5Z7V6bMmc7ywZKt70lDfZFqzBjonsXMoflcN03im/WkKN8Ay5ww8XdGaY
	 xxKFTlKq51bBh3tyKKNcB+3ulDI1/7DD5/GeejDJnSjDi8gWJFTQz5aZqlippfZi34
	 7sxhPIFEdXRUw==
Date: Mon, 29 Jun 2026 08:38:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 04/17] pinctrl: airoha: an7583: there is no mux to
 enable the second i2c bus
Message-ID: <20260629-prehistoric-unstoppable-galago-c519da@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-5-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-5-mikhail.kshevetskiy@iopsys.eu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39086-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F1B16D6639

On Sun, Jun 28, 2026 at 05:37:20PM +0300, Mikhail Kshevetskiy wrote:
> In the AN7583 case there is no mux bit to enable the second i2c bus,
> so remove it.

But you do not remove second i2c bus, but the i2c bus.

> Also remove i2c pin function from device tree binding schema.

Why?

> 
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
>  drivers/pinctrl/airoha/pinctrl-airoha.c                |  1 -
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> index f52802a3ad79..8d8ec6adb97d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -60,7 +60,7 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the group.
> -            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> +            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>                     pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
>                     phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
>                     phy3_led1, phy4_led1]
> @@ -117,14 +117,6 @@ patternProperties:
>                      enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
>                             uart4, uart5]

Best regards,
Krzysztof


