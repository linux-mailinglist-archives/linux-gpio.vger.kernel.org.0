Return-Path: <linux-gpio+bounces-39731-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZuVlC4F9T2o7iAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39731-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 12:52:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102272FE5D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 12:52:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=f4xsBE7E;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39731-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39731-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10C7D30433D0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 10:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D1640B6FC;
	Thu,  9 Jul 2026 10:48:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50E3F7A88;
	Thu,  9 Jul 2026 10:48:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594127; cv=none; b=NEuUHt2VLVNc3WP1x7fuRcFWMg5gDIAoxK4pv6GHl+EQVERCxCXF8QpIpXxxU88IMCCbBh16xxankYwgynFe1+BUSgwxgZDQCJyQxFRkPVBhPl6lsGzruljNCwJpEY6AlS+otzNx5xuYFzblebEgGqrMQMWsV4Wf6JSyJrY0Z4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594127; c=relaxed/simple;
	bh=MCJ2tlV7MZiFrR5iu4+hBC5VY95Jd/otmvFfJAj/7+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orR8W9BBbZxbpCNdlJir2Z48nDytw9QLOkOTQa7FfPjxNPEWdYw1vC4Wp1cxpYQAY8cUKc4j7twERlnrUdgpx0A9Cd43F9Uecj9sfzL1dsIWwj+QJiN4dxZ91v13tKJfKlEtqroJO8MVwNwLd9pLYU3BB6CpAEqDSrxeDSnxTJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4xsBE7E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1654B1F000E9;
	Thu,  9 Jul 2026 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783594125;
	bh=Z+B3U76zF9vaVqdzguP5USnJ8fvaogWWhRk6cyG9O7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f4xsBE7ENto5vtfWgRYZ3u6bKckKJtybeGIsKdpBm3FaCd7/MfxK6EQFByNVIAC9o
	 zsWzGxJcY5cZ93xQk03ceiL9JXBNhprOzGxTHq83j3alro54KHbCTPbZxXuNZAhjyQ
	 wmuYyz9VXj+Bcc10ciCCYLphjXFkAalpt3EKMN1ebLq0g58LpRc0ToRTWMrq8rsHym
	 jLUApfTDLJFeQIjWlPgcCrD1HusAjyRsyKfucPMD2+pZHgaBDpEL3SoENWtY9Z8Iy6
	 M9C9vQ8dG9DBu9kr4mUePYDinSIDZuf1736e6C8tmp6Pj3bUqE1j9rC9gLkh9NEMTR
	 lUr1zJNKNYYjA==
Date: Thu, 9 Jul 2026 11:48:39 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/8] mfd: Support for ROHM BD73800 PMIC core
Message-ID: <20260709104839.GG2045740@google.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <043fc930caca4c436651e8fa77a1ae16a26d0a98.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <043fc930caca4c436651e8fa77a1ae16a26d0a98.1782909323.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39731-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,rohmeurope.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6102272FE5D

/* Sashiko Automation: Reviewed (0 Findings) */

On Wed, 01 Jul 2026, Matti Vaittinen wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> The BD73800 integrates regulators, ADC (intended for accumulating current /
> voltage / power values), a real-time clock (RTC), clock gate and GPIOs.
> 
> Add core support for ROHM BD73800 Power Management IC.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
>  drivers/mfd/Kconfig              |  15 +-
>  drivers/mfd/rohm-bd71828.c       | 145 ++++++++++++++-
>  include/linux/mfd/rohm-bd73800.h | 307 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-generic.h |   1 +
>  4 files changed, 461 insertions(+), 7 deletions(-)
>  create mode 100644 include/linux/mfd/rohm-bd73800.h
> 
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index a79f354bf5cb..31637777b627 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2019 ROHM Semiconductors
>   *

You should consider updating this.

> - * ROHM BD718[15/28/79] and BD72720 PMIC driver
> + * ROHM BD718[15/28/79], BD72720 and BD73[8/9]00 PMIC driver
>   */
>  
>  #include <linux/gpio_keys.h>
> @@ -249,6 +256,17 @@ static const struct mfd_cell bd72720_mfd_cells[] = {
>  	},
>  };
>  
> +static const struct mfd_cell bd73800_mfd_cells[] = {
> +	{ .name = "bd73800-pmic", },
> +	{ .name = "bd73800-clk", },
> +	{ .name = "bd73800-gpio", },
> +	{
> +		.name = "bd73800-rtc",
> +		.num_resources = ARRAY_SIZE(bd73800_rtc_irqs),
> +		.resources = &bd73800_rtc_irqs[0],
> +	},
> +};

'bd73800_rtc_irqs'?

> +
>  static const struct regmap_range bd71815_volatile_ranges[] = {
>  	regmap_reg_range(BD71815_REG_SEC, BD71815_REG_YEAR),
>  	regmap_reg_range(BD71815_REG_CONF, BD71815_REG_BAT_TEMP),
> @@ -383,6 +412,24 @@ static const struct regmap_access_table bd72720_volatile_regs_4c = {
>  	.n_yes_ranges = ARRAY_SIZE(bd72720_volatile_ranges_4c),
>  };
>  
> +static const struct regmap_access_table bd73800_volatile_regs = {
> +	.yes_ranges = &bd73800_volatile_ranges[0],

'bd73800_volatile_ranges'?

> +	.n_yes_ranges = ARRAY_SIZE(bd73800_volatile_ranges),
> +};
> +
> +static const struct regmap_range bd73800_read_only_ranges[] = {
> +	regmap_reg_range(BD73800_REG_PRODUCT_ID, BD73800_REG_NVMVERSION),
> +	regmap_reg_range(BD73800_REG_POW_STATE, BD73800_REG_POW_STATE),
> +	regmap_reg_range(BD73800_REG_ADC_ACCUM_CNT2, BD73800_REG_ADC_TEMP_VAL0),
> +	regmap_reg_range(BD73800_REG_INT_MAIN_STAT, BD73800_REG_INT_MAIN_STAT),
> +	regmap_reg_range(BD73800_REG_INT_MAIN_SRC, BD73800_REG_INT_5_SRC),
> +};
> +
> +static const struct regmap_access_table bd73800_ro_regs = {
> +	.no_ranges = &bd73800_read_only_ranges[0],

Etc.

> +	.n_no_ranges = ARRAY_SIZE(bd73800_read_only_ranges),
> +};
> +
>  static const struct regmap_config bd71815_regmap = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -852,6 +962,25 @@ static const struct regmap_irq_chip bd72720_irq_chip = {
>  	.irq_reg_stride = 1,
>  };
>  
> +static const struct regmap_irq_chip bd73800_irq_chip = {
> +	.name = "bd73800_irq",
> +	.main_status = BD73800_REG_INT_MAIN_STAT,
> +	.irqs = &bd73800_irqs[0],

Here too.

> +	.num_irqs = ARRAY_SIZE(bd73800_irqs),
> +	.status_base = BD73800_REG_INT_1_STAT,
> +	.unmask_base = BD73800_REG_INT_1_EN,
> +	.ack_base = BD73800_REG_INT_1_STAT,
> +	.init_ack_masked = true,
> +	.num_regs = 5,
> +	.num_main_regs = 1,
> +	/*
> +	 * Ignore mirrored bits [7:5]. They are handled as part of normal INT_4
> +	 * handling.
> +	 */
> +	.num_main_status_bits = 5,
> +	.irq_reg_stride = 1,
> +};
> +
>  static int set_clk_mode(struct device *dev, struct regmap *regmap,
>  			int clkmode_reg)
>  {
> diff --git a/include/linux/mfd/rohm-bd73800.h b/include/linux/mfd/rohm-bd73800.h
> new file mode 100644
> index 000000000000..4bceb20ac6b1
> --- /dev/null
> +++ b/include/linux/mfd/rohm-bd73800.h
> @@ -0,0 +1,307 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright 2024 ROHM Semiconductors.
> + *

This is new to use.  Please update this too.

> + * Author: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> + */
> +
> +#ifndef _MFD_BD73800_H
> +#define _MFD_BD73800_H
> +
> +#include <linux/regmap.h>
> +

