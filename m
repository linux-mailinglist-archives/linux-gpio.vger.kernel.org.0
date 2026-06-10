Return-Path: <linux-gpio+bounces-38268-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /LZqCvV3KWpAXQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38268-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:43:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BF66A529
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:42:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=LZNFZNF8;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Y frT48h";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38268-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38268-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A277330055F9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 14:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA98381AE0;
	Wed, 10 Jun 2026 14:42:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096015C14F;
	Wed, 10 Jun 2026 14:42:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102569; cv=none; b=SAMcmVK8CbrlWxnV6Jld8VzKsscR7HJgFKpjCnXRcUqLtj7KCHCJAdLvKBX+2eqFuQlf9oRNBnwvTLnoTztCSzS649Q6QEsIug6WN2DFOtYQg57PgGvV1sT/AYZkcaXWyaxZEM0VRymZW6/MGAjjqm4pcspEyWLOfO3I0j5zfhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102569; c=relaxed/simple;
	bh=dlfFJNtVCs80ZEsBPuZGCJvqsvw4r7Fiw9r+mKmtaY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAISX/UgjvsBhhaRfMwXI6t9O8prd+NA7a8LVBq5aOMwRgxjN9p/m1lXDaP9pB6ZA1SE60G8HuEc7MbTOB0FBojKfxry9uvVHurod5PwjHSNQ/qP3oko2VoWMEwSXU27D3nKASr/UxUCGGU7QEv2/1v/k1xbj++3cxogoPB9uek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LZNFZNF8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YfrT48h7; arc=none smtp.client-ip=103.168.172.146
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 900AAEC0169;
	Wed, 10 Jun 2026 10:42:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 10 Jun 2026 10:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781102564;
	 x=1781188964; bh=LAL2ObdjEgRGIWLGnOPaTg4MMgdbKp4hLqOJm8UWQ2M=; b=
	LZNFZNF83YnvKMDu3HYPofrD29ldusvHMXWL7oRfKG7p70v6Maofp085QvFpd9XQ
	nk9MD4aAI3wRnJOCpnN+/lnZNzB1cDMy7rYGkLkSo6eVMe6uT4F09aVqQuVin15N
	Ujijgd+1fN9CDXLl8oiZCT19/Jpp+OqD5sLkFuJxRa/xKxT9JvxKGpcad4jci/fK
	KwfKGVA3YItb9kI1UtBgR1CMBnf/0SQAZ2vOAQXjrk4+NCv0TJhUDs0ZatF1cyep
	lN7q7v39MbYBc8yeGmNuJYNh9n02N6XgzF5tN2FDz3s6ES7205w27fr5KjOXEkKX
	Sxp21vfRhAiAjGG+9OAsLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781102564; x=
	1781188964; bh=LAL2ObdjEgRGIWLGnOPaTg4MMgdbKp4hLqOJm8UWQ2M=; b=Y
	frT48h75HyMa2ygRDemQwHo/yY42JPhIfoygCQZ0GGoOb3Bo7JuuWzFCKUmK182K
	pCwNe1azvWBzvKBjpc4f6ssE/D/Vphf2rM3OmTpW/eQUhY3D8nZtJgF+zDYC5FaP
	oleNV3wAPwuez1ebeSnfWP2B6HP+zx2BWUUNExpUz5ftlHLZh5nTMbAMHdqJpI9A
	ksN1kMbpdhP7SV/sxE49+rq/Ja6fi2Is/B3od+zU9ZS2FFdW9IskGyhPdJNW21IJ
	0lByQMoKJsKAwp5QyInzEI0Rjm/HpkPGl21FZFsDx7vz9AFDimfGbfZfHE9qx6Z6
	LTSRtT2PpiM7EmIZGgcdw==
X-ME-Sender: <xms:5HcparNnDomw445HEFpG-23r9LBpYvJckpMv0oT1t1Ca1th73FiyOQ>
    <xme:5HcpagrS9kECw0iNxGubKH-04QgkwrHXOLFBbdUI3doDSH8fUQbFR-BZXAOwrx90o
    m4WFIUDFJi7HoslP8Ikj6OKrvQAklPGGy5lKXO-9cphZyen-diDQBg>
X-ME-Received: <xmr:5Hcpag4dxDAv8K1jai9ZcH9VCVe_jMs01ONgG-F2BR6vBhFBXTnvxfPXQ3vHQP0R2cr2LzY5Fi7sugx815xb4BcUfN16>
X-ME-Proxy-Cause: dmFkZTGkeoIs14l8j3pozhCvnIqZiE/Avx1WeJ23buCTuD68mJGert9LKogBoXM73IFvPf
    dyOq+CCO23UJAiuAvDwHJfKnSW8/6Hyv2cPQO4Ea0y5RknvDGzihjgx2BtIUmfy/NK50Tf
    hia4usmJ6Fjn229SyYWPh0CRZoP3g/+iV0QQgdEwCKRs1hDNdZYL9fvYxo23iNFs6irxRF
    5JpgjRFiWdVfs+FeK/ptlkF/PO5mPDUmmEMv3smV6u6Y1lVu3C5GJCQ4zdpFxt1Ne7Amm2
    Gpue6fk7eUHFsqlt3V+s8LAF2QQDLLmWWtz9/j9ft+2CBwQYiBQkE07kFUXgMS4xfibNpj
    q7Q3rcqEqNJf4qAaYRAH0PVtVA5QOPXyhVQr5cQ2enkUs9KViZYfEfsx29GJZBG+qtsoAd
    bf3X3ISqjFK50ekeWTeqrbFq1boGS4em+ODt3zy9OWXc9NU7Btc14rvNh41IDQnsDUYLsF
    ObrgNeL6OOgsugH+sXjFqTlDqXaT8S3yzv4RBc7gWVOprE2qFPP5Vd7wDERy3GeD29XgkD
    S4jp80aaY/kgaBSk76OObW/3AmfokFXwDn+xu/OAZfC9hVXr0EUFTjgMYc0gEASLCG0njX
    63Uu3hdzGd6Dxdeq2OGNm+7j1bMBDmmoPXzED9/845SyLJrOrL+ZbvzARtTQ
X-ME-Proxy: <xmx:5HcpaqqOq39iMneKPjvPswRtlJnYeXVE2zQ1V-xAFw-QcLQeOrCcsA>
    <xmx:5HcpauKZj7ltdaSqM1cpOqMMz4UaNQ78UZTVODHjnsbvIZ-UCButHg>
    <xmx:5Hcpango2EAHUSNfMXl6c28bLInCBB3j_e7evdKltxAEtXiJO84HBA>
    <xmx:5Hcpan_Ku8oCuXtBGEhnlMj4PlRTlgHcRs2t8vNlmSvSf_3szc-APg>
    <xmx:5HcpaiNnNRxxiI6Kvp9TmVI7_GqbpPl0L0XKzCECKS31gqcMoBEHKdIQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 10:42:43 -0400 (EDT)
Date: Wed, 10 Jun 2026 16:42:42 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <20260610144242.GF2948@ragnatech.se>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
 <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linux.intel.com,collabora.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amazon.com];
	TAGGED_FROM(0.00)[bounces-38268-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dumitru.ceclan@analog.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:julien.massot@collabora.com,m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:mitrutzceclan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:Martin.Hecht@avnet.eu,m:demonsingur@gmail.com,m:ckeitz@amazon.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,messagingengine.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B76BF66A529

Hi,

Thanks for your work.

This patch gives me new compiler warnings, can they be avoided?

  .../max96724.c:402 max96724_log_phy_status() warn: subtract is higher precedence than shift
  .../max96724.c:409 max96724_log_phy_status() warn: subtract is higher precedence than shift
  .../max96724.c:588 max96724_init_phy() warn: subtract is higher precedence than shift
  .../max96724.c:756 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
  .../max96724.c:796 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
  .../max96724.c:818 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
  .../max96724.c:830 max96724_set_pipe_link() warn: subtract is higher precedence than shift
  .../max96724.c:942 max96724_set_link_version() warn: subtract is higher precedence than shift

On 2026-06-04 17:14:04 +0300, Dumitru Ceclan via B4 Relay wrote:
> From: Cosmin Tanislav <demonsingur@gmail.com>
> 
> Add a new MAX96724 driver that also supports MAX96712, MAX96724F
> and MAX96724R.
> 
> Integrate it with the common deserializer framework, while keeping
> compatibility with existing usecases, avoiding code duplication, and
> also enabling more features across all chips.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Cory Keitz <ckeitz@amazon.com>
> ---
>  drivers/media/i2c/maxim-serdes/Kconfig    |   13 +
>  drivers/media/i2c/maxim-serdes/Makefile   |    1 +
>  drivers/media/i2c/maxim-serdes/max96724.c | 1279 +++++++++++++++++++++++++++++
>  3 files changed, 1293 insertions(+)
> 
> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
> index c811790c09b9..9d3621ae8d90 100644
> --- a/drivers/media/i2c/maxim-serdes/Kconfig
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> @@ -34,3 +34,16 @@ config VIDEO_MAX96717
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called max96717.
> +
> +config VIDEO_MAX96724
> +	tristate "Maxim MAX96724 Quad Deserializer support"
> +	depends on I2C
> +	depends on VIDEO_DEV
> +	select VIDEO_MAXIM_SERDES
> +	help
> +	  This driver supports the Maxim MAX96712, MAX96724, MAX96724F,
> +	  MAX96724R Quad Deserializers, which convert from four GMSL2
> +	  links to up to four MIPI D-PHY or C-PHY outputs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called max96724.
> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/maxim-serdes/Makefile
> index 04abda6a5437..b6d5aebfaee1 100644
> --- a/drivers/media/i2c/maxim-serdes/Makefile
> +++ b/drivers/media/i2c/maxim-serdes/Makefile
> @@ -2,3 +2,4 @@
>  max-serdes-objs := max_serdes.o max_ser.o max_des.o
>  obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
>  obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
> +obj-$(CONFIG_VIDEO_MAX96724) += max96724.o
> diff --git a/drivers/media/i2c/maxim-serdes/max96724.c b/drivers/media/i2c/maxim-serdes/max96724.c
> new file mode 100644
> index 000000000000..7fc51254e1ef
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96724.c
> @@ -0,0 +1,1279 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Maxim MAX96724 Quad GMSL2 Deserializer Driver
> + *
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#include "max_des.h"
> +
> +#define MAX96724_REG0				0x0
> +
> +#define MAX96724_REG3				0x3
> +#define MAX96724_REG3_CC_PORT_SEL(n)		GENMASK((n) * 2 + 1, (n) * 2)
> +#define MAX96724_REG3_CC_PORT_SEL_MASK		(MAX96724_REG3_CC_PORT_SEL(0) | \
> +						 MAX96724_REG3_CC_PORT_SEL(1) | \
> +						 MAX96724_REG3_CC_PORT_SEL(2) | \
> +						 MAX96724_REG3_CC_PORT_SEL(3))
> +#define MAX96724_REG3_CC_PORT_SEL_PORT0		0x2
> +#define MAX96724_REG3_CC_PORT_SEL_PORT1		0x1
> +#define MAX96724_REG3_CC_PORT_CFG(sel) \
> +	(FIELD_PREP(MAX96724_REG3_CC_PORT_SEL(0), (sel)) | \
> +	 FIELD_PREP(MAX96724_REG3_CC_PORT_SEL(1), (sel)) | \
> +	 FIELD_PREP(MAX96724_REG3_CC_PORT_SEL(2), (sel)) | \
> +	 FIELD_PREP(MAX96724_REG3_CC_PORT_SEL(3), (sel)))
> +#define MAX96724_REG3_CC_PORT_CFG_PORT0 \
> +	MAX96724_REG3_CC_PORT_CFG(MAX96724_REG3_CC_PORT_SEL_PORT0)
> +#define MAX96724_REG3_CC_PORT_CFG_PORT1 \
> +	MAX96724_REG3_CC_PORT_CFG(MAX96724_REG3_CC_PORT_SEL_PORT1)
> +
> +#define MAX96724_REG6				0x6
> +#define MAX96724_REG6_LINK_EN			GENMASK(3, 0)
> +
> +#define MAX96724_REG7				0x7
> +#define MAX96724_REG7_CC_CROSSOVER_SEL		GENMASK(7, 4)
> +
> +#define MAX96724_DEBUG_EXTRA			0x9
> +#define MAX96724_DEBUG_EXTRA_PCLK_SRC		GENMASK(1, 0)
> +#define MAX96724_DEBUG_EXTRA_PCLK_SRC_25MHZ	0b00
> +#define MAX96724_DEBUG_EXTRA_PCLK_SRC_75MHZ	0b01
> +#define MAX96724_DEBUG_EXTRA_PCLK_SRC_USE_PIPE	0b10
> +
> +#define MAX96724_REG26(x)			(0x10 + (x) / 2)
> +#define MAX96724_REG26_RX_RATE_PHY(x)		(GENMASK(1, 0) << (4 * ((x) % 2)))
> +#define MAX96724_REG26_RX_RATE_3GBPS		0b01
> +#define MAX96724_REG26_RX_RATE_6GBPS		0b10
> +
> +#define MAX96724_PWR1				0x13
> +#define MAX96724_PWR1_RESET_ALL			BIT(6)
> +
> +#define MAX96724_CTRL1				0x18
> +#define MAX96724_CTRL1_RESET_ONESHOT		GENMASK(3, 0)
> +
> +#define MAX96724_VIDEO_PIPE_SEL(p)		(0xf0 + (p) / 2)
> +#define MAX96724_VIDEO_PIPE_SEL_STREAM(p)	(GENMASK(1, 0) << (4 * ((p) % 2)))
> +#define MAX96724_VIDEO_PIPE_SEL_LINK(p)		(GENMASK(3, 2) << (4 * ((p) % 2)))
> +
> +#define MAX96724_VIDEO_PIPE_EN			0xf4
> +#define MAX96724_VIDEO_PIPE_EN_MASK(p)		BIT(p)
> +#define MAX96724_VIDEO_PIPE_EN_STREAM_SEL_ALL	BIT(4)
> +
> +#define MAX96724_VPRBS(p)			(0x1dc + (p) * 0x20)
> +#define MAX96724_VPRBS_VIDEO_LOCK		BIT(0)
> +#define MAX96724_VPRBS_PATGEN_CLK_SRC		BIT(7)
> +#define MAX96724_VPRBS_PATGEN_CLK_SRC_150MHZ	0b0
> +#define MAX96724_VPRBS_PATGEN_CLK_SRC_375MHZ	0b1
> +
> +#define MAX96724_BACKTOP12			0x40b
> +#define MAX96724_BACKTOP12_CSI_OUT_EN		BIT(1)
> +
> +#define MAX96724_BACKTOP21(p)			(0x414 + (p) / 4 * 0x20)
> +#define MAX96724_BACKTOP21_BPP8DBL(p)		BIT(4 + (p) % 4)
> +
> +#define MAX96724_BACKTOP22(x)			(0x415 + (x) * 0x3)
> +#define MAX96724_BACKTOP22_PHY_CSI_TX_DPLL	GENMASK(4, 0)
> +#define MAX96724_BACKTOP22_PHY_CSI_TX_DPLL_EN	BIT(5)
> +
> +#define MAX96724_BACKTOP24(p)			(0x417 + (p) / 4 * 0x20)
> +#define MAX96724_BACKTOP24_BPP8DBL_MODE(p)	BIT(4 + (p) % 4)
> +
> +#define MAX96724_BACKTOP30(p)			(0x41d + (p) / 4 * 0x20)
> +#define MAX96724_BACKTOP30_BPP10DBL3		BIT(4)
> +#define MAX96724_BACKTOP30_BPP10DBL3_MODE	BIT(5)
> +
> +#define MAX96724_BACKTOP31(p)			(0x41e + (p) / 4 * 0x20)
> +#define MAX96724_BACKTOP31_BPP10DBL2		BIT(6)
> +#define MAX96724_BACKTOP31_BPP10DBL2_MODE	BIT(7)
> +
> +#define MAX96724_BACKTOP32(p)			(0x41f + (p) / 4 * 0x20)
> +#define MAX96724_BACKTOP32_BPP12(p)		BIT((p) % 4)
> +#define MAX96724_BACKTOP32_BPP10DBL0		BIT(4)
> +#define MAX96724_BACKTOP32_BPP10DBL0_MODE	BIT(5)
> +#define MAX96724_BACKTOP32_BPP10DBL1		BIT(6)
> +#define MAX96724_BACKTOP32_BPP10DBL1_MODE	BIT(7)
> +
> +#define MAX96724_MIPI_PHY0			0x8a0
> +#define MAX96724_MIPI_PHY0_PHY_CONFIG		GENMASK(4, 0)
> +#define MAX96724_MIPI_PHY0_PHY_4X2		BIT(0)
> +#define MAX96724_MIPI_PHY0_PHY_2X4		BIT(2)
> +#define MAX96724_MIPI_PHY0_PHY_1X4A_2X2		BIT(3)
> +#define MAX96724_MIPI_PHY0_PHY_1X4B_2X2		BIT(4)
> +#define MAX96724_MIPI_PHY0_FORCE_CSI_OUT_EN	BIT(7)
> +
> +#define MAX96724_MIPI_PHY2			0x8a2
> +#define MAX96724_MIPI_PHY2_PHY_STDB_N_4(x)	(GENMASK(5, 4) << ((x) / 2 * 2))
> +#define MAX96724_MIPI_PHY2_PHY_STDB_N_2(x)	(BIT(4 + (x)))
> +
> +#define MAX96724_MIPI_PHY3(x)			(0x8a3 + (x) / 2)
> +#define MAX96724_MIPI_PHY3_PHY_LANE_MAP_4	GENMASK(7, 0)
> +#define MAX96724_MIPI_PHY3_PHY_LANE_MAP_2(x)	(GENMASK(3, 0) << (4 * ((x) % 2)))
> +
> +#define MAX96724_MIPI_PHY5(x)			(0x8a5 + (x) / 2)
> +#define MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1	GENMASK(1, 0)
> +#define MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3	GENMASK(4, 3)
> +#define MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK	BIT(5)
> +#define MAX96724_MIPI_PHY5_PHY_POL_MAP_2(x)	(GENMASK(1, 0) << (3 * ((x) % 2)))
> +#define MAX96724_MIPI_PHY5_PHY_POL_MAP_2_CLK(x)	BIT(2 + 3 * ((x) % 2))
> +
> +#define MAX96724_MIPI_PHY13			0x8ad
> +#define MAX96724_MIPI_PHY13_T_T3_PREBEGIN	GENMASK(5, 0)
> +#define MAX96724_MIPI_PHY13_T_T3_PREBEGIN_64X7	FIELD_PREP(MAX96724_MIPI_PHY13_T_T3_PREBEGIN, 63)
> +
> +#define MAX96724_MIPI_PHY14			0x8ae
> +#define MAX96724_MIPI_PHY14_T_T3_PREP		GENMASK(1, 0)
> +#define MAX96724_MIPI_PHY14_T_T3_PREP_55NS	FIELD_PREP(MAX96724_MIPI_PHY14_T_T3_PREP, 0b01)
> +#define MAX96724_MIPI_PHY14_T_T3_POST		GENMASK(6, 2)
> +#define MAX96724_MIPI_PHY14_T_T3_POST_32X7	FIELD_PREP(MAX96724_MIPI_PHY14_T_T3_POST, 31)
> +
> +#define MAX96724_MIPI_CTRL_SEL			0x8ca
> +#define MAX96724_MIPI_CTRL_SEL_MASK(p)		(GENMASK(1, 0) << ((p) * 2))
> +
> +#define MAX96724_MIPI_PHY25(x)			(0x8d0 + (x) / 2)
> +#define MAX96724_MIPI_PHY25_CSI2_TX_PKT_CNT(x)	(GENMASK(3, 0) << (4 * ((x) % 2)))
> +
> +#define MAX96724_MIPI_PHY27(x)			(0x8d2 + (x) / 2)
> +#define MAX96724_MIPI_PHY27_PHY_PKT_CNT(x)	(GENMASK(3, 0) << (4 * ((x) % 2)))
> +
> +#define MAX96724_MIPI_TX3(x)			(0x903 + (x) * 0x40)
> +#define MAX96724_MIPI_TX3_DESKEW_INIT_8X32K	FIELD_PREP(GENMASK(2, 0), 0b001)
> +#define MAX96724_MIPI_TX3_DESKEW_INIT_AUTO	BIT(7)
> +
> +#define MAX96724_MIPI_TX4(x)			(0x904 + (x) * 0x40)
> +#define MAX96724_MIPI_TX4_DESKEW_PER_2K		FIELD_PREP(GENMASK(2, 0), 0b001)
> +#define MAX96724_MIPI_TX4_DESKEW_PER_AUTO	BIT(7)
> +
> +#define MAX96724_MIPI_TX10(x)			(0x90a + (x) * 0x40)
> +#define MAX96724_MIPI_TX10_CSI2_CPHY_EN		BIT(5)
> +#define MAX96724_MIPI_TX10_CSI2_LANE_CNT	GENMASK(7, 6)
> +
> +#define MAX96724_MIPI_TX11(p)			(0x90b + (p) * 0x40)
> +#define MAX96724_MIPI_TX12(p)			(0x90c + (p) * 0x40)
> +
> +#define MAX96724_MIPI_TX13(p, x)		(0x90d + (p) * 0x40 + (x) * 0x2)
> +#define MAX96724_MIPI_TX13_MAP_SRC_DT		GENMASK(5, 0)
> +#define MAX96724_MIPI_TX13_MAP_SRC_VC		GENMASK(7, 6)
> +
> +#define MAX96724_MIPI_TX14(p, x)		(0x90e + (p) * 0x40 + (x) * 0x2)
> +#define MAX96724_MIPI_TX14_MAP_DST_DT		GENMASK(5, 0)
> +#define MAX96724_MIPI_TX14_MAP_DST_VC		GENMASK(7, 6)
> +
> +#define MAX96724_MIPI_TX45(p, x)		(0x92d + (p) * 0x40 + (x) / 4)
> +#define MAX96724_MIPI_TX45_MAP_DPHY_DEST(x)	(GENMASK(1, 0) << (2 * ((x) % 4)))
> +
> +#define MAX96724_MIPI_TX51(x)			(0x933 + (x) * 0x40)
> +#define MAX96724_MIPI_TX51_ALT_MEM_MAP_12	BIT(0)
> +#define MAX96724_MIPI_TX51_ALT_MEM_MAP_8	BIT(1)
> +#define MAX96724_MIPI_TX51_ALT_MEM_MAP_10	BIT(2)
> +#define MAX96724_MIPI_TX51_ALT2_MEM_MAP_8	BIT(4)
> +
> +#define MAX96724_MIPI_TX54(x)			(0x936 + (x) * 0x40)
> +#define MAX96724_MIPI_TX54_TUN_EN		BIT(0)
> +
> +#define MAX96724_MIPI_TX57(x)			(0x939 + (x) * 0x40)
> +#define MAX96724_MIPI_TX57_TUN_DEST		GENMASK(5, 4)
> +#define MAX96724_MIPI_TX57_DIS_AUTO_TUN_DET	BIT(6)
> +#define MAX96724_DET(p)				BIT(p)
> +
> +#define MAX96724_PATGEN_0			0x1050
> +#define MAX96724_PATGEN_0_VTG_MODE		GENMASK(1, 0)
> +#define MAX96724_PATGEN_0_VTG_MODE_FREE_RUNNING	0b11
> +#define MAX96724_PATGEN_0_DE_INV		BIT(2)
> +#define MAX96724_PATGEN_0_HS_INV		BIT(3)
> +#define MAX96724_PATGEN_0_VS_INV		BIT(4)
> +#define MAX96724_PATGEN_0_GEN_DE		BIT(5)
> +#define MAX96724_PATGEN_0_GEN_HS		BIT(6)
> +#define MAX96724_PATGEN_0_GEN_VS		BIT(7)
> +
> +#define MAX96724_PATGEN_1			0x1051
> +#define MAX96724_PATGEN_1_PATGEN_MODE		GENMASK(5, 4)
> +#define MAX96724_PATGEN_1_PATGEN_MODE_DISABLED	0b00
> +#define MAX96724_PATGEN_1_PATGEN_MODE_CHECKER	0b01
> +#define MAX96724_PATGEN_1_PATGEN_MODE_GRADIENT	0b10
> +
> +#define MAX96724_VS_DLY_2			0x1052
> +#define MAX96724_VS_HIGH_2			0x1055
> +#define MAX96724_VS_LOW_2			0x1058
> +#define MAX96724_V2H_2				0x105b
> +#define MAX96724_HS_HIGH_1			0x105e
> +#define MAX96724_HS_LOW_1			0x1060
> +#define MAX96724_HS_CNT_1			0x1062
> +#define MAX96724_V2D_2				0x1064
> +#define MAX96724_DE_HIGH_1			0x1067
> +#define MAX96724_DE_LOW_1			0x1069
> +#define MAX96724_DE_CNT_1			0x106b
> +#define MAX96724_GRAD_INCR			0x106d
> +#define MAX96724_CHKR_COLOR_A_L			0x106e
> +#define MAX96724_CHKR_COLOR_B_L			0x1071
> +#define MAX96724_CHKR_RPT_A			0x1074
> +#define MAX96724_CHKR_RPT_B			0x1075
> +#define MAX96724_CHKR_ALT			0x1076
> +
> +#define MAX96724_DE_DET				0x11f0
> +#define MAX96724_HS_DET				0x11f1
> +#define MAX96724_VS_DET				0x11f2
> +#define MAX96724_HS_POL				0x11f3
> +#define MAX96724_VS_POL				0x11f4
> +#define MAX96724_DET(p)				BIT(p)
> +
> +#define MAX96724_DPLL_0(x)			(0x1c00 + (x) * 0x100)
> +#define MAX96724_DPLL_0_CONFIG_SOFT_RST_N	BIT(0)
> +
> +#define MAX96724_PHY1_ALT_CLOCK			5
> +
> +static const struct regmap_config max96724_i2c_regmap = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.max_register = 0x1f00,
> +};
> +
> +struct max96724_priv {
> +	struct max_des des;
> +	const struct max96724_chip_info *info;
> +
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +
> +	struct gpio_desc *gpiod_enable;
> +	unsigned int cc_port_cfg;
> +};
> +
> +struct max96724_chip_info {
> +	unsigned int versions;
> +	unsigned int modes;
> +	bool supports_pipe_stream_autoselect;
> +	unsigned int num_pipes;
> +
> +	int (*set_pipe_phy)(struct max_des *des, struct max_des_pipe *pipe,
> +			    struct max_des_phy *phy);
> +	int (*set_pipe_tunnel_phy)(struct max_des *des, struct max_des_pipe *pipe,
> +				   struct max_des_phy *phy);
> +	int (*set_pipe_tunnel_enable)(struct max_des *des, struct max_des_pipe *pipe,
> +				      bool enable);
> +};
> +
> +#define des_to_priv(_des) \
> +	container_of(_des, struct max96724_priv, des)
> +
> +static int max96724_wait_for_device(struct max96724_priv *priv)
> +{
> +	unsigned int val;
> +	int ret, err;
> +
> +	err = read_poll_timeout(regmap_read, ret,
> +				!ret && val,
> +				100 * USEC_PER_MSEC,
> +				1 * USEC_PER_SEC, false,
> +				priv->regmap, MAX96724_REG0, &val);
> +	if (err)
> +		dev_err(priv->dev, "Timeout waiting for deserializer: %d\n", ret);
> +
> +	return err;
> +}
> +
> +static int max96724_reset(struct max96724_priv *priv)
> +{
> +	int ret;
> +
> +	ret = max96724_wait_for_device(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(priv->regmap, MAX96724_PWR1,
> +				 MAX96724_PWR1_RESET_ALL,
> +				 FIELD_PREP(MAX96724_PWR1_RESET_ALL, 1));
> +	if (ret)
> +		return ret;
> +
> +	fsleep(10000);
> +
> +	ret = max96724_wait_for_device(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* Restore I2C control-channel access after a reset. */
> +	return regmap_update_bits(priv->regmap, MAX96724_REG3,
> +				  MAX96724_REG3_CC_PORT_SEL_MASK,
> +				  priv->cc_port_cfg);
> +}
> +
> +static int __maybe_unused max96724_reg_read(struct max_des *des, unsigned int reg,
> +					    unsigned int *val)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +
> +	return regmap_read(priv->regmap, reg, val);
> +}
> +
> +static int __maybe_unused max96724_reg_write(struct max_des *des, unsigned int reg,
> +					     unsigned int val)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +
> +	return regmap_write(priv->regmap, reg, val);
> +}
> +
> +static unsigned int max96724_phy_id(struct max_des *des, struct max_des_phy *phy)
> +{
> +	unsigned int num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
> +
> +	/* PHY 1 is the master PHY when combining PHY 0 and PHY 1. */
> +	if (phy->index == 0 && num_hw_data_lanes == 4)
> +		return 1;
> +
> +	if (phy->index == 1 && !des->phys[1].enabled)
> +		return 0;
> +
> +	return phy->index;
> +}
> +
> +static int max96724_log_pipe_status(struct max_des *des,
> +				    struct max_des_pipe *pipe)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = pipe->index;
> +	unsigned int val, mask;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MAX96724_VPRBS(index), &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tvideo_lock: %u\n",
> +		 !!(val & MAX96724_VPRBS_VIDEO_LOCK));
> +
> +	mask = MAX96724_DET(index);
> +
> +	ret = regmap_read(priv->regmap, MAX96724_DE_DET, &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tde_det: %u\n", !!(val & mask));
> +
> +	ret = regmap_read(priv->regmap, MAX96724_HS_DET, &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\ths_det: %u\n", !!(val & mask));
> +
> +	ret = regmap_read(priv->regmap, MAX96724_VS_DET, &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tvs_det: %u\n", !!(val & mask));
> +
> +	ret = regmap_read(priv->regmap, MAX96724_HS_POL, &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\ths_pol: %u\n", !!(val & mask));
> +
> +	ret = regmap_read(priv->regmap, MAX96724_VS_POL, &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tvs_pol: %u\n", !!(val & mask));
> +
> +	return 0;
> +}
> +
> +static int max96724_log_phy_status(struct max_des *des,
> +				   struct max_des_phy *phy)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = max96724_phy_id(des, phy);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MAX96724_MIPI_PHY25(index), &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tcsi2_pkt_cnt: %lu\n",
> +		 field_get(MAX96724_MIPI_PHY25_CSI2_TX_PKT_CNT(index), val));
> +
> +	ret = regmap_read(priv->regmap, MAX96724_MIPI_PHY27(index), &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tphy_pkt_cnt: %lu\n",
> +		 field_get(MAX96724_MIPI_PHY27_PHY_PKT_CNT(index), val));
> +
> +	return 0;
> +}
> +
> +static int max96724_set_enable(struct max_des *des, bool enable)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +
> +	return regmap_assign_bits(priv->regmap, MAX96724_BACKTOP12,
> +				  MAX96724_BACKTOP12_CSI_OUT_EN, enable);
> +}
> +
> +static const unsigned int max96724_phys_configs_reg_val[] = {
> +	MAX96724_MIPI_PHY0_PHY_1X4A_2X2,
> +	MAX96724_MIPI_PHY0_PHY_2X4,
> +
> +	MAX96724_MIPI_PHY0_PHY_4X2,
> +	MAX96724_MIPI_PHY0_PHY_1X4A_2X2,
> +	MAX96724_MIPI_PHY0_PHY_1X4B_2X2,
> +	MAX96724_MIPI_PHY0_PHY_2X4,
> +};
> +
> +static const struct max_serdes_phys_config max96724_phys_configs[] = {
> +	/*
> +	 * PHY 1 can be in 4-lane mode (combining lanes of PHY 0 and PHY 1)
> +	 * but only use the data lanes of PHY0, while continuing to use the
> +	 * clock lane of PHY 1.
> +	 * Specifying clock-lanes as 5 turns on alternate clocking mode.
> +	 */
> +	{ { 2, 0, 2, 2 }, { MAX96724_PHY1_ALT_CLOCK, 0, 0, 0 } },
> +	{ { 2, 0, 4, 0 }, { MAX96724_PHY1_ALT_CLOCK, 0, 0, 0 } },
> +
> +	/*
> +	 * When combining PHY 0 and PHY 1 to make them function in 4-lane mode,
> +	 * PHY 1 is the master PHY, but we use PHY 0 here to maintain
> +	 * compatibility.
> +	 */
> +	{ { 2, 2, 2, 2 } },
> +	{ { 4, 0, 2, 2 } },
> +	{ { 2, 2, 4, 0 } },
> +	{ { 4, 0, 4, 0 } },
> +};
> +
> +static int max96724_init_tpg(struct max_des *des)
> +{
> +	const struct reg_sequence regs[] = {
> +		{ MAX96724_GRAD_INCR, MAX_SERDES_GRAD_INCR },
> +		REG_SEQUENCE_3_LE(MAX96724_CHKR_COLOR_A_L,
> +				  MAX_SERDES_CHECKER_COLOR_A),
> +		REG_SEQUENCE_3_LE(MAX96724_CHKR_COLOR_B_L,
> +				  MAX_SERDES_CHECKER_COLOR_B),
> +		{ MAX96724_CHKR_RPT_A, MAX_SERDES_CHECKER_SIZE },
> +		{ MAX96724_CHKR_RPT_B, MAX_SERDES_CHECKER_SIZE },
> +		{ MAX96724_CHKR_ALT, MAX_SERDES_CHECKER_SIZE },
> +	};
> +	struct max96724_priv *priv = des_to_priv(des);
> +
> +	return regmap_multi_reg_write(priv->regmap, regs, ARRAY_SIZE(regs));
> +}
> +
> +static int max96724_init(struct max_des *des)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int i;
> +	int ret;
> +
> +	if (priv->info->set_pipe_tunnel_enable) {
> +		for (i = 0; i < des->info->num_pipes; i++) {
> +			ret = regmap_set_bits(priv->regmap, MAX96724_MIPI_TX57(i),
> +					      MAX96724_MIPI_TX57_DIS_AUTO_TUN_DET);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	if (priv->info->supports_pipe_stream_autoselect) {
> +		/* Enable stream autoselect. */
> +		ret = regmap_set_bits(priv->regmap, MAX96724_VIDEO_PIPE_EN,
> +				      MAX96724_VIDEO_PIPE_EN_STREAM_SEL_ALL);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Enable I2C control ports crossover. */
> +	ret = regmap_set_bits(priv->regmap, MAX96724_REG7,
> +			      MAX96724_REG7_CC_CROSSOVER_SEL);
> +	if (ret)
> +		return ret;
> +
> +	/* Set PHY mode. */
> +	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY0,
> +				 MAX96724_MIPI_PHY0_PHY_CONFIG,
> +				 max96724_phys_configs_reg_val[des->phys_config]);
> +	if (ret)
> +		return ret;
> +
> +	return max96724_init_tpg(des);
> +}
> +
> +static int max96724_init_phy(struct max_des *des, struct max_des_phy *phy)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
> +	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
> +	unsigned int num_hw_data_lanes;
> +	unsigned int index;
> +	unsigned int used_data_lanes = 0;
> +	unsigned int val, mask;
> +	unsigned int i;
> +	u64 dpll_freq;
> +	int ret;
> +
> +	index = max96724_phy_id(des, phy);
> +	num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
> +	dpll_freq = is_cphy ? phy->link_frequency
> +			    : phy->link_frequency * 2;
> +
> +	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_TX10(index),
> +				 MAX96724_MIPI_TX10_CSI2_LANE_CNT,
> +				 FIELD_PREP(MAX96724_MIPI_TX10_CSI2_LANE_CNT,
> +					    num_data_lanes - 1));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX10(index),
> +				 MAX96724_MIPI_TX10_CSI2_CPHY_EN, is_cphy);
> +	if (ret)
> +		return ret;
> +
> +	/* Configure lane mapping. */
> +	val = 0;
> +	for (i = 0; i < num_hw_data_lanes ; i++) {
> +		unsigned int map;
> +
> +		if (i < num_data_lanes)
> +			map = phy->mipi.data_lanes[i] - 1;
> +		else
> +			map = ffz(used_data_lanes);
> +
> +		val |= map << (i * 2);
> +		used_data_lanes |= BIT(map);
> +	}
> +
> +	if (num_hw_data_lanes == 4)
> +		mask = MAX96724_MIPI_PHY3_PHY_LANE_MAP_4;
> +	else
> +		mask = MAX96724_MIPI_PHY3_PHY_LANE_MAP_2(index);
> +
> +	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY3(index),
> +				 mask, field_prep(mask, val));
> +	if (ret)
> +		return ret;
> +
> +	/* Configure lane polarity. */
> +	for (i = 0, val = 0; i < num_data_lanes; i++)
> +		if (phy->mipi.lane_polarities[i + 1])
> +			val |= BIT(i);
> +
> +	if (num_hw_data_lanes == 4) {
> +		ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1 |
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
> +					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1,
> +						    val) |
> +					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
> +						    val >> 2));
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK,
> +					 phy->mipi.lane_polarities[0]);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_2(index),
> +					 field_prep(MAX96724_MIPI_PHY5_PHY_POL_MAP_2(index), val));
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_2_CLK(index),
> +					 phy->mipi.lane_polarities[0]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!is_cphy && dpll_freq > 1500000000ull) {
> +		/* Enable initial deskew with 2 x 32k UI. */
> +		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX3(index),
> +				   MAX96724_MIPI_TX3_DESKEW_INIT_AUTO |
> +				   MAX96724_MIPI_TX3_DESKEW_INIT_8X32K);
> +		if (ret)
> +			return ret;
> +
> +		/* Enable periodic deskew with 2 x 1k UI.. */
> +		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX4(index),
> +				   MAX96724_MIPI_TX4_DESKEW_PER_AUTO |
> +				   MAX96724_MIPI_TX4_DESKEW_PER_2K);
> +		if (ret)
> +			return ret;
> +	} else {
> +		/* Disable initial deskew. */
> +		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX3(index), 0x0);
> +		if (ret)
> +			return ret;
> +
> +		/* Disable periodic deskew. */
> +		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX4(index), 0x0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_cphy) {
> +		/* Configure C-PHY timings. */
> +		ret = regmap_write(priv->regmap, MAX96724_MIPI_PHY13,
> +				   MAX96724_MIPI_PHY13_T_T3_PREBEGIN_64X7);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(priv->regmap, MAX96724_MIPI_PHY14,
> +				   MAX96724_MIPI_PHY14_T_T3_PREP_55NS |
> +				   MAX96724_MIPI_PHY14_T_T3_POST_32X7);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Put DPLL block into reset. */
> +	ret = regmap_clear_bits(priv->regmap, MAX96724_DPLL_0(index),
> +				MAX96724_DPLL_0_CONFIG_SOFT_RST_N);
> +	if (ret)
> +		return ret;
> +
> +	/* Set DPLL frequency. */
> +	ret = regmap_update_bits(priv->regmap, MAX96724_BACKTOP22(index),
> +				 MAX96724_BACKTOP22_PHY_CSI_TX_DPLL,
> +				 FIELD_PREP(MAX96724_BACKTOP22_PHY_CSI_TX_DPLL,
> +					    div_u64(dpll_freq, 100000000)));
> +	if (ret)
> +		return ret;
> +
> +	/* Enable DPLL frequency. */
> +	ret = regmap_set_bits(priv->regmap, MAX96724_BACKTOP22(index),
> +			      MAX96724_BACKTOP22_PHY_CSI_TX_DPLL_EN);
> +	if (ret)
> +		return ret;
> +
> +	/* Pull DPLL block out of reset. */
> +	return regmap_set_bits(priv->regmap, MAX96724_DPLL_0(index),
> +			       MAX96724_DPLL_0_CONFIG_SOFT_RST_N);
> +}
> +
> +static int max96724_set_phy_mode(struct max_des *des, struct max_des_phy *phy,
> +				 struct max_des_phy_mode *mode)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = max96724_phy_id(des, phy);
> +	int ret;
> +
> +	/* Set alternate memory map modes. */
> +	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
> +				 MAX96724_MIPI_TX51_ALT_MEM_MAP_12,
> +				 mode->alt_mem_map12);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
> +				 MAX96724_MIPI_TX51_ALT_MEM_MAP_8,
> +				 mode->alt_mem_map8);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
> +				 MAX96724_MIPI_TX51_ALT_MEM_MAP_10,
> +				 mode->alt_mem_map10);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
> +				  MAX96724_MIPI_TX51_ALT2_MEM_MAP_8,
> +				  mode->alt2_mem_map8);
> +}
> +
> +static int max96724_set_phy_enable(struct max_des *des, struct max_des_phy *phy,
> +				   bool enable)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = max96724_phy_id(des, phy);
> +	unsigned int num_hw_data_lanes;
> +	unsigned int mask;
> +
> +	num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
> +
> +	/*
> +	 * Some configurations merge two logical PHYs into one hardware PHY.
> +	 * Skip writes for absorbed PHYs to avoid clobbering the master's bits.
> +	 */
> +	if (!num_hw_data_lanes)
> +		return 0;
> +
> +	if (num_hw_data_lanes == 4)
> +		/* PHY 1 -> bits [5:4] */
> +		/* PHY 2 -> bits [7:6] */
> +		mask = MAX96724_MIPI_PHY2_PHY_STDB_N_4(index);
> +	else
> +		mask = MAX96724_MIPI_PHY2_PHY_STDB_N_2(index);
> +
> +	return regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY2, mask, enable);
> +}
> +
> +static int max96724_set_pipe_remap(struct max_des *des,
> +				   struct max_des_pipe *pipe,
> +				   unsigned int i,
> +				   struct max_des_remap *remap)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	struct max_des_phy *phy = &des->phys[remap->phy];
> +	unsigned int phy_id = max96724_phy_id(des, phy);
> +	unsigned int index = pipe->index;
> +	int ret;
> +
> +	/* Set source Data Type and Virtual Channel. */
> +	/* TODO: implement extended Virtual Channel. */
> +	ret = regmap_write(priv->regmap, MAX96724_MIPI_TX13(index, i),
> +			   FIELD_PREP(MAX96724_MIPI_TX13_MAP_SRC_DT,
> +				      remap->from_dt) |
> +			   FIELD_PREP(MAX96724_MIPI_TX13_MAP_SRC_VC,
> +				      remap->from_vc));
> +	if (ret)
> +		return ret;
> +
> +	/* Set destination Data Type and Virtual Channel. */
> +	/* TODO: implement extended Virtual Channel. */
> +	ret = regmap_write(priv->regmap, MAX96724_MIPI_TX14(index, i),
> +			   FIELD_PREP(MAX96724_MIPI_TX14_MAP_DST_DT,
> +				      remap->to_dt) |
> +			   FIELD_PREP(MAX96724_MIPI_TX14_MAP_DST_VC,
> +				      remap->to_vc));
> +	if (ret)
> +		return ret;
> +
> +	/* Set destination PHY. */
> +	return regmap_update_bits(priv->regmap, MAX96724_MIPI_TX45(index, i),
> +				  MAX96724_MIPI_TX45_MAP_DPHY_DEST(i),
> +				  field_prep(MAX96724_MIPI_TX45_MAP_DPHY_DEST(i),
> +					     phy_id));
> +}
> +
> +static int max96724_set_pipe_remaps_enable(struct max_des *des,
> +					   struct max_des_pipe *pipe,
> +					   unsigned int mask)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = pipe->index;
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, MAX96724_MIPI_TX11(index), mask);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, MAX96724_MIPI_TX12(index), mask >> 8);
> +}
> +
> +static int max96724_set_pipe_tunnel_phy(struct max_des *des,
> +					struct max_des_pipe *pipe,
> +					struct max_des_phy *phy)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int phy_index = max96724_phy_id(des, phy);
> +
> +	return regmap_update_bits(priv->regmap, MAX96724_MIPI_TX57(pipe->index),
> +				  MAX96724_MIPI_TX57_TUN_DEST,
> +				  FIELD_PREP(MAX96724_MIPI_TX57_TUN_DEST,
> +					     phy_index));
> +}
> +
> +static int max96724_set_pipe_phy(struct max_des *des, struct max_des_pipe *pipe,
> +				 struct max_des_phy *phy)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int phy_index = max96724_phy_id(des, phy);
> +
> +	return regmap_update_bits(priv->regmap, MAX96724_MIPI_CTRL_SEL,
> +				  MAX96724_MIPI_CTRL_SEL_MASK(pipe->index),
> +				  field_prep(MAX96724_MIPI_CTRL_SEL_MASK(pipe->index),
> +					     phy_index));
> +}
> +
> +static int max96724_set_pipe_enable(struct max_des *des, struct max_des_pipe *pipe,
> +				    bool enable)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = pipe->index;
> +
> +	return regmap_assign_bits(priv->regmap, MAX96724_VIDEO_PIPE_EN,
> +				  MAX96724_VIDEO_PIPE_EN_MASK(index), enable);
> +}
> +
> +static int max96724_set_pipe_stream_id(struct max_des *des, struct max_des_pipe *pipe,
> +				       unsigned int stream_id)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = pipe->index;
> +
> +	return regmap_update_bits(priv->regmap, MAX96724_VIDEO_PIPE_SEL(index),
> +				  MAX96724_VIDEO_PIPE_SEL_STREAM(index),
> +				  field_prep(MAX96724_VIDEO_PIPE_SEL_STREAM(index),
> +					     stream_id));
> +}
> +
> +static int max96724_set_pipe_link(struct max_des *des, struct max_des_pipe *pipe,
> +				  struct max_des_link *link)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = pipe->index;
> +
> +	return regmap_update_bits(priv->regmap, MAX96724_VIDEO_PIPE_SEL(index),
> +				  MAX96724_VIDEO_PIPE_SEL_LINK(index),
> +				  field_prep(MAX96724_VIDEO_PIPE_SEL_LINK(index),
> +					     link->index));
> +}
> +
> +static int max96724_set_pipe_mode(struct max_des *des,
> +				  struct max_des_pipe *pipe,
> +				  struct max_des_pipe_mode *mode)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = pipe->index;
> +	unsigned int reg, mask, mode_mask;
> +	int ret;
> +
> +	/* Set 8bit double mode. */
> +	ret = regmap_assign_bits(priv->regmap, MAX96724_BACKTOP21(index),
> +				 MAX96724_BACKTOP21_BPP8DBL(index), mode->dbl8);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_assign_bits(priv->regmap, MAX96724_BACKTOP24(index),
> +				 MAX96724_BACKTOP24_BPP8DBL_MODE(index),
> +				 mode->dbl8mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Set 10bit double mode. */
> +	if (index % 4 == 3) {
> +		reg = MAX96724_BACKTOP30(index);
> +		mask = MAX96724_BACKTOP30_BPP10DBL3;
> +		mode_mask = MAX96724_BACKTOP30_BPP10DBL3_MODE;
> +	} else if (index % 4 == 2) {
> +		reg = MAX96724_BACKTOP31(index);
> +		mask = MAX96724_BACKTOP31_BPP10DBL2;
> +		mode_mask = MAX96724_BACKTOP31_BPP10DBL2_MODE;
> +	} else if (index % 4 == 1) {
> +		reg = MAX96724_BACKTOP32(index);
> +		mask = MAX96724_BACKTOP32_BPP10DBL1;
> +		mode_mask = MAX96724_BACKTOP32_BPP10DBL1_MODE;
> +	} else {
> +		reg = MAX96724_BACKTOP32(index);
> +		mask = MAX96724_BACKTOP32_BPP10DBL0;
> +		mode_mask = MAX96724_BACKTOP32_BPP10DBL0_MODE;
> +	}
> +
> +	ret = regmap_assign_bits(priv->regmap, reg, mask, mode->dbl10);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_assign_bits(priv->regmap, reg, mode_mask, mode->dbl10mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Set 12bit double mode. */
> +	return regmap_assign_bits(priv->regmap, MAX96724_BACKTOP32(index),
> +				  MAX96724_BACKTOP32_BPP12(index), mode->dbl12);
> +}
> +
> +static int max96724_set_pipe_tunnel_enable(struct max_des *des,
> +					   struct max_des_pipe *pipe, bool enable)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +
> +	return regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX54(pipe->index),
> +				  MAX96724_MIPI_TX54_TUN_EN, enable);
> +}
> +
> +static int max96724_select_links(struct max_des *des, unsigned int mask)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int val = priv->cc_port_cfg;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < des->info->num_links; i++) {
> +		if (!(mask & BIT(i)))
> +			val |= MAX96724_REG3_CC_PORT_SEL(i);
> +	}
> +
> +	ret = regmap_write(priv->regmap, MAX96724_REG3, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(priv->regmap, MAX96724_REG6, MAX96724_REG6_LINK_EN,
> +				 field_prep(MAX96724_REG6_LINK_EN, mask));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(priv->regmap, MAX96724_CTRL1,
> +			      MAX96724_CTRL1_RESET_ONESHOT);
> +	if (ret)
> +		return ret;
> +
> +	msleep(60);
> +
> +	return 0;
> +}
> +
> +static int max96724_set_link_version(struct max_des *des,
> +				     struct max_des_link *link,
> +				     enum max_serdes_gmsl_version version)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	unsigned int index = link->index;
> +	unsigned int val;
> +
> +	if (version == MAX_SERDES_GMSL_2_6GBPS)
> +		val = MAX96724_REG26_RX_RATE_6GBPS;
> +	else
> +		val = MAX96724_REG26_RX_RATE_3GBPS;
> +
> +	return regmap_update_bits(priv->regmap, MAX96724_REG26(index),
> +				  MAX96724_REG26_RX_RATE_PHY(index),
> +				  field_prep(MAX96724_REG26_RX_RATE_PHY(index), val));
> +}
> +
> +static int max96724_set_tpg_timings(struct max96724_priv *priv,
> +				    const struct max_serdes_tpg_timings *tm)
> +{
> +	const struct reg_sequence regs[] = {
> +		REG_SEQUENCE_3(MAX96724_VS_DLY_2, tm->vs_dly),
> +		REG_SEQUENCE_3(MAX96724_VS_HIGH_2, tm->vs_high),
> +		REG_SEQUENCE_3(MAX96724_VS_LOW_2, tm->vs_low),
> +		REG_SEQUENCE_3(MAX96724_V2H_2, tm->v2h),
> +		REG_SEQUENCE_2(MAX96724_HS_HIGH_1, tm->hs_high),
> +		REG_SEQUENCE_2(MAX96724_HS_LOW_1, tm->hs_low),
> +		REG_SEQUENCE_2(MAX96724_HS_CNT_1, tm->hs_cnt),
> +		REG_SEQUENCE_3(MAX96724_V2D_2, tm->v2d),
> +		REG_SEQUENCE_2(MAX96724_DE_HIGH_1, tm->de_high),
> +		REG_SEQUENCE_2(MAX96724_DE_LOW_1, tm->de_low),
> +		REG_SEQUENCE_2(MAX96724_DE_CNT_1, tm->de_cnt),
> +	};
> +	int ret;
> +
> +	ret = regmap_multi_reg_write(priv->regmap, regs, ARRAY_SIZE(regs));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, MAX96724_PATGEN_0,
> +			    FIELD_PREP(MAX96724_PATGEN_0_VTG_MODE,
> +				       MAX96724_PATGEN_0_VTG_MODE_FREE_RUNNING) |
> +			    FIELD_PREP(MAX96724_PATGEN_0_DE_INV, tm->de_inv) |
> +			    FIELD_PREP(MAX96724_PATGEN_0_HS_INV, tm->hs_inv) |
> +			    FIELD_PREP(MAX96724_PATGEN_0_VS_INV, tm->vs_inv) |
> +			    FIELD_PREP(MAX96724_PATGEN_0_GEN_DE, tm->gen_de) |
> +			    FIELD_PREP(MAX96724_PATGEN_0_GEN_HS, tm->gen_hs) |
> +			    FIELD_PREP(MAX96724_PATGEN_0_GEN_VS, tm->gen_vs));
> +}
> +
> +static int max96724_set_tpg_clk(struct max96724_priv *priv, u32 clock)
> +{
> +	bool patgen_clk_src = 0;
> +	u8 pclk_src;
> +	int ret;
> +
> +	switch (clock) {
> +	case 25000000:
> +		pclk_src = MAX96724_DEBUG_EXTRA_PCLK_SRC_25MHZ;
> +		break;
> +	case 75000000:
> +		pclk_src = MAX96724_DEBUG_EXTRA_PCLK_SRC_75MHZ;
> +		break;
> +	case 150000000:
> +		pclk_src = MAX96724_DEBUG_EXTRA_PCLK_SRC_USE_PIPE;
> +		patgen_clk_src = MAX96724_VPRBS_PATGEN_CLK_SRC_150MHZ;
> +		break;
> +	case 375000000:
> +		pclk_src = MAX96724_DEBUG_EXTRA_PCLK_SRC_USE_PIPE;
> +		patgen_clk_src = MAX96724_VPRBS_PATGEN_CLK_SRC_375MHZ;
> +		break;
> +	case 0:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * TPG data is always injected on link 0, which is always routed to
> +	 * pipe 0.
> +	 */
> +	ret = regmap_update_bits(priv->regmap, MAX96724_VPRBS(0),
> +				 MAX96724_VPRBS_PATGEN_CLK_SRC,
> +				 FIELD_PREP(MAX96724_VPRBS_PATGEN_CLK_SRC,
> +					    patgen_clk_src));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(priv->regmap, MAX96724_DEBUG_EXTRA,
> +				  MAX96724_DEBUG_EXTRA_PCLK_SRC,
> +				  FIELD_PREP(MAX96724_DEBUG_EXTRA_PCLK_SRC,
> +					     pclk_src));
> +}
> +
> +static int max96724_set_tpg_mode(struct max96724_priv *priv, bool enable)
> +{
> +	unsigned int patgen_mode;
> +
> +	switch (priv->des.tpg_pattern) {
> +	case MAX_SERDES_TPG_PATTERN_GRADIENT:
> +		patgen_mode = MAX96724_PATGEN_1_PATGEN_MODE_GRADIENT;
> +		break;
> +	case MAX_SERDES_TPG_PATTERN_CHECKERBOARD:
> +		patgen_mode = MAX96724_PATGEN_1_PATGEN_MODE_CHECKER;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(priv->regmap, MAX96724_PATGEN_1,
> +				  MAX96724_PATGEN_1_PATGEN_MODE,
> +				  FIELD_PREP(MAX96724_PATGEN_1_PATGEN_MODE,
> +					     enable ? patgen_mode
> +						    : MAX96724_PATGEN_1_PATGEN_MODE_DISABLED));
> +}
> +
> +static int max96724_set_tpg(struct max_des *des,
> +			    const struct max_serdes_tpg_entry *entry)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	struct max_serdes_tpg_timings timings = { 0 };
> +	int ret;
> +
> +	ret = max_serdes_get_tpg_timings(entry, &timings);
> +	if (ret)
> +		return ret;
> +
> +	ret = max96724_set_tpg_timings(priv, &timings);
> +	if (ret)
> +		return ret;
> +
> +	ret = max96724_set_tpg_clk(priv, timings.clock);
> +	if (ret)
> +		return ret;
> +
> +	ret = max96724_set_tpg_mode(priv, entry);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY0,
> +				  MAX96724_MIPI_PHY0_FORCE_CSI_OUT_EN, !!entry);
> +}
> +
> +static const struct max_serdes_tpg_entry max96724_tpg_entries[] = {
> +	MAX_TPG_ENTRY_640X480P60_RGB888,
> +	MAX_TPG_ENTRY_1920X1080P30_RGB888,
> +	MAX_TPG_ENTRY_1920X1080P60_RGB888,
> +};
> +
> +static const struct max_des_info max96724_des_info = {
> +	.num_phys = 4,
> +	.num_links = 4,
> +	.num_remaps_per_pipe = 16,
> +	.phys_configs = {
> +		.num_configs = ARRAY_SIZE(max96724_phys_configs),
> +		.configs = max96724_phys_configs,
> +	},
> +	.tpg_entries = {
> +		.num_entries = ARRAY_SIZE(max96724_tpg_entries),
> +		.entries = max96724_tpg_entries,
> +	},
> +	.tpg_mode = MAX_SERDES_GMSL_PIXEL_MODE,
> +	.tpg_patterns = BIT(MAX_SERDES_TPG_PATTERN_CHECKERBOARD) |
> +			BIT(MAX_SERDES_TPG_PATTERN_GRADIENT),
> +	.use_atr = true,
> +};
> +
> +static const struct max_des_ops max96724_des_ops = {
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +	.reg_read = max96724_reg_read,
> +	.reg_write = max96724_reg_write,
> +#endif
> +	.log_pipe_status = max96724_log_pipe_status,
> +	.log_phy_status = max96724_log_phy_status,
> +	.set_enable = max96724_set_enable,
> +	.init = max96724_init,
> +	.init_phy = max96724_init_phy,
> +	.set_phy_mode = max96724_set_phy_mode,
> +	.set_phy_enable = max96724_set_phy_enable,
> +	.set_pipe_stream_id = max96724_set_pipe_stream_id,
> +	.set_pipe_link = max96724_set_pipe_link,
> +	.set_pipe_enable = max96724_set_pipe_enable,
> +	.set_pipe_remap = max96724_set_pipe_remap,
> +	.set_pipe_remaps_enable = max96724_set_pipe_remaps_enable,
> +	.set_pipe_mode = max96724_set_pipe_mode,
> +	.set_tpg = max96724_set_tpg,
> +	.select_links = max96724_select_links,
> +	.set_link_version = max96724_set_link_version,
> +};
> +
> +static const struct max96724_chip_info max96724_info = {
> +	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
> +		    BIT(MAX_SERDES_GMSL_2_6GBPS),
> +	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
> +		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
> +	.set_pipe_tunnel_enable = max96724_set_pipe_tunnel_enable,
> +	.set_pipe_phy = max96724_set_pipe_phy,
> +	.set_pipe_tunnel_phy = max96724_set_pipe_tunnel_phy,
> +	.supports_pipe_stream_autoselect = true,
> +	.num_pipes = 4,
> +};
> +
> +static const struct max96724_chip_info max96724f_info = {
> +	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS),
> +	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
> +		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
> +	.set_pipe_tunnel_enable = max96724_set_pipe_tunnel_enable,
> +	.set_pipe_phy = max96724_set_pipe_phy,
> +	.set_pipe_tunnel_phy = max96724_set_pipe_tunnel_phy,
> +	.supports_pipe_stream_autoselect = true,
> +	.num_pipes = 4,
> +};
> +
> +static const struct max96724_chip_info max96712_info = {
> +	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
> +		    BIT(MAX_SERDES_GMSL_2_6GBPS),
> +	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
> +	.num_pipes = 8,
> +};
> +
> +static void max96724_power_off(void *data)
> +{
> +	struct max96724_priv *priv = data;
> +
> +	gpiod_set_value_cansleep(priv->gpiod_enable, 0);
> +}
> +
> +static int max96724_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct max96724_priv *priv;
> +	struct max_des_info *info;
> +	struct max_des_ops *ops;
> +	u32 cc_port;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
> +	if (!ops)
> +		return -ENOMEM;
> +
> +	priv->info = device_get_match_data(dev);
> +	if (!priv->info) {
> +		dev_err(dev, "Failed to get match data\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->dev = dev;
> +	priv->client = client;
> +	i2c_set_clientdata(client, priv);
> +
> +	priv->regmap = devm_regmap_init_i2c(client, &max96724_i2c_regmap);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	priv->gpiod_enable = devm_gpiod_get_optional(&client->dev, "enable",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->gpiod_enable))
> +		return PTR_ERR(priv->gpiod_enable);
> +
> +	if (priv->gpiod_enable) {
> +		/* PWDN must be held for 1us for reset */
> +		udelay(1);
> +
> +		gpiod_set_value_cansleep(priv->gpiod_enable, 1);
> +
> +		/* Maximum power-up time (tLOCK) 4ms */
> +		usleep_range(4000, 5000);
> +
> +		ret = devm_add_action_or_reset(dev, max96724_power_off,
> +					       priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	priv->cc_port_cfg = MAX96724_REG3_CC_PORT_CFG_PORT0;
> +
> +	ret = device_property_read_u32(dev, "maxim,control-channel-port",
> +				       &cc_port);
> +	if (!ret) {
> +		switch (cc_port) {
> +		case 0:
> +			priv->cc_port_cfg = MAX96724_REG3_CC_PORT_CFG_PORT0;
> +			break;
> +		case 1:
> +			priv->cc_port_cfg = MAX96724_REG3_CC_PORT_CFG_PORT1;
> +			break;
> +		default:
> +			dev_err(dev, "Invalid control-channel port %u\n", cc_port);
> +			return -EINVAL;
> +		}
> +	} else if (ret != -ENODATA && ret != -ENOENT && ret != -EINVAL) {
> +		return ret;
> +	}
> +
> +	*info = max96724_des_info;
> +	info->versions = priv->info->versions;
> +	info->modes = priv->info->modes;
> +	info->num_pipes = priv->info->num_pipes;
> +	priv->des.info = info;
> +
> +	*ops = max96724_des_ops;
> +	ops->set_pipe_tunnel_enable = priv->info->set_pipe_tunnel_enable;
> +	ops->set_pipe_phy = priv->info->set_pipe_phy;
> +	ops->set_pipe_tunnel_phy = priv->info->set_pipe_tunnel_phy;
> +	priv->des.ops = ops;
> +
> +	ret = max96724_reset(priv);
> +	if (ret)
> +		return ret;
> +
> +	return max_des_probe(client, &priv->des);
> +}
> +
> +static void max96724_remove(struct i2c_client *client)
> +{
> +	struct max96724_priv *priv = i2c_get_clientdata(client);
> +
> +	max_des_remove(&priv->des);
> +}
> +
> +static const struct of_device_id max96724_of_table[] = {
> +	{ .compatible = "maxim,max96712", .data = &max96712_info },
> +	{ .compatible = "maxim,max96724", .data = &max96724_info },
> +	{ .compatible = "maxim,max96724f", .data = &max96724f_info },
> +	{ .compatible = "maxim,max96724r", .data = &max96724f_info },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, max96724_of_table);
> +
> +static struct i2c_driver max96724_i2c_driver = {
> +	.driver	= {
> +		.name = "max96724",
> +		.of_match_table	= max96724_of_table,
> +	},
> +	.probe = max96724_probe,
> +	.remove = max96724_remove,
> +};
> +
> +module_i2c_driver(max96724_i2c_driver);
> +
> +MODULE_IMPORT_NS("MAX_SERDES");
> +MODULE_DESCRIPTION("Maxim MAX96724 Quad GMSL2 Deserializer Driver");
> +MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.53.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

