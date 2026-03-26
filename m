Return-Path: <linux-gpio+bounces-34207-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBy8ILMixWmC7AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34207-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:12:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858F335052
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0E45305AF37
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C6638F639;
	Thu, 26 Mar 2026 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5kZbdoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A33BF660;
	Thu, 26 Mar 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527020; cv=none; b=P+3Dii8vwhYcOmp9iuhIHij9c8li2THQe7Quh0yW1DMyYpQdU3Ei3gCgkOACveGpte+2nHyiFWMJUeconhEpQj7hXl85i9bPnQtbHd+2XTyusWZ2LBMDoBihdH1pM+z57jW5oIpfjK+s0hVediKyAuTNaNDW/Qf0eYjdD5NgVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527020; c=relaxed/simple;
	bh=dtdPYOxSruNMTYr7ovgDe+Uvc6axC30hpLRYIuFkgWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5Ek1Hcm/9atOhsdjXT/PYLbHyySqNie95Z3X0QpReWsikjva2cM+5VWMKDpOOYz2PU0NpVgcu1JRWcF4I9v/mJ5YT/0x1Pa/Eoxha/Vsg+RewUxGkHeEVSpj/26AapFWzAag4NgxKcLlp8nAa5ABjguVHzhAeaTbeevLO0I5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5kZbdoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6694C116C6;
	Thu, 26 Mar 2026 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774527019;
	bh=dtdPYOxSruNMTYr7ovgDe+Uvc6axC30hpLRYIuFkgWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5kZbdoVPJdViQFbIY/5CRC1c7nchphQYFhcb7T1/liR7daVygcSF5m9TyRiB+5eF
	 F3u68kr9P7CzybtGbNfE0aP5Ha1I8Qkz9ADEFCOntBNCNFuYk6oiNgHPPZxjLneYDM
	 w9QH5qIF31eEEtlMnz19jP71zUtcw+7c1Bf4ynVhIzLpNjj+k0STMzKeqeCA/UMxCP
	 AgBsYrhc2FOXIbsV1WWLlWOB0Pj8trZ9drWF0t3UUHJLfCvJn21W9jWVIQYmxPX1UX
	 RMti/wsGhFhmDstvUMxcGgV0/W9ULyjJ50M4/VTPPoz5ciJG9DUx/Svj8R3oVNRU1v
	 ZiAb7woNojxYw==
Date: Thu, 26 Mar 2026 12:10:12 +0000
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/9] mfd: mt6397: Add support for MT6392 pmic
Message-ID: <20260326121012.GM1141718@google.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-6-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317184507.523060-6-l.scorcia@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34207-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2858F335052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026, Luca Leonardo Scorcia wrote:

> From: Fabien Parent <parent.f@gmail.com>
> 
> Update the MT6397 MFD driver to support the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/mfd/mt6397-core.c            |  46 +++
>  drivers/mfd/mt6397-irq.c             |   8 +
>  include/linux/mfd/mt6392/core.h      |  42 +++
>  include/linux/mfd/mt6392/registers.h | 487 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   1 +
>  5 files changed, 584 insertions(+)
>  create mode 100644 include/linux/mfd/mt6392/core.h
>  create mode 100644 include/linux/mfd/mt6392/registers.h
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 3e58d0764c7e..c4b86a44c68b 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -18,6 +18,7 @@
>  #include <linux/mfd/mt6357/core.h>
>  #include <linux/mfd/mt6358/core.h>
>  #include <linux/mfd/mt6359/core.h>
> +#include <linux/mfd/mt6392/core.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/registers.h>
>  #include <linux/mfd/mt6328/registers.h>
> @@ -25,6 +26,7 @@
>  #include <linux/mfd/mt6357/registers.h>
>  #include <linux/mfd/mt6358/registers.h>
>  #include <linux/mfd/mt6359/registers.h>
> +#include <linux/mfd/mt6392/registers.h>
>  #include <linux/mfd/mt6397/registers.h>
>  
>  #define MT6323_RTC_BASE		0x8000
> @@ -39,6 +41,9 @@
>  #define MT6358_RTC_BASE		0x0588
>  #define MT6358_RTC_SIZE		0x3c
>  
> +#define MT6392_RTC_BASE		0x8000
> +#define MT6392_RTC_SIZE		0x3e
> +
>  #define MT6397_RTC_BASE		0xe000
>  #define MT6397_RTC_SIZE		0x3e
>  
> @@ -65,6 +70,11 @@ static const struct resource mt6358_rtc_resources[] = {
>  	DEFINE_RES_IRQ(MT6358_IRQ_RTC),
>  };
>  
> +static const struct resource mt6392_rtc_resources[] = {
> +	DEFINE_RES_MEM(MT6392_RTC_BASE, MT6392_RTC_SIZE),
> +	DEFINE_RES_IRQ(MT6392_IRQ_RTC),
> +};
> +
>  static const struct resource mt6397_rtc_resources[] = {
>  	DEFINE_RES_MEM(MT6397_RTC_BASE, MT6397_RTC_SIZE),
>  	DEFINE_RES_IRQ(MT6397_IRQ_RTC),
> @@ -114,6 +124,11 @@ static const struct resource mt6331_keys_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6331_IRQ_STATUS_HOMEKEY, "homekey"),
>  };
>  
> +static const struct resource mt6392_keys_resources[] = {
> +	DEFINE_RES_IRQ_NAMED(MT6392_IRQ_PWRKEY, "powerkey"),
> +	DEFINE_RES_IRQ_NAMED(MT6392_IRQ_FCHRKEY, "homekey"),
> +};
> +
>  static const struct resource mt6397_keys_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_PWRKEY, "powerkey"),
>  	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_HOMEKEY, "homekey"),
> @@ -253,6 +268,26 @@ static const struct mfd_cell mt6359_devs[] = {
>  	},
>  };
>  
> +static const struct mfd_cell mt6392_devs[] = {
> +	{
> +		.name = "mt6392-rtc",
> +		.num_resources = ARRAY_SIZE(mt6392_rtc_resources),
> +		.resources = mt6392_rtc_resources,
> +		.of_compatible = "mediatek,mt6392-rtc",
> +	}, {
> +		.name = "mt6392-regulator",
> +		.of_compatible = "mediatek,mt6392-regulator",
> +	}, {
> +		.name = "mt6392-pinctrl",
> +		.of_compatible = "mediatek,mt6392-pinctrl",
> +	}, {
> +		.name = "mt6392-keys",
> +		.num_resources = ARRAY_SIZE(mt6392_keys_resources),
> +		.resources = mt6392_keys_resources,
> +		.of_compatible = "mediatek,mt6392-keys"
> +	},
> +};
> +
>  static const struct mfd_cell mt6397_devs[] = {
>  	{
>  		.name = "mt6397-rtc",
> @@ -335,6 +370,14 @@ static const struct chip_data mt6359_core = {
>  	.irq_init = mt6358_irq_init,
>  };
>  
> +static const struct chip_data mt6392_core = {
> +	.cid_addr = MT6392_CID,
> +	.cid_shift = 0,
> +	.cells = mt6392_devs,

I'm not really sure what came over me when I accepted this 6 years ago,
but I have a _strong_ aversion to MFD data being passed through the OF APIs.

Before this patch lands, please could you refactor this driver to only
pass through an identifier through mt6397_of_match[*].data.  Then, you
can match on that via a switch statement where you can allocate each
device's data structures.

This is how the vast majority of MFD drivers work so there should be
lots of examples to work through to make this trivial.

> +	.cell_size = ARRAY_SIZE(mt6392_devs),
> +	.irq_init = mt6397_irq_init,
> +};

-- 
Lee Jones [李琼斯]

