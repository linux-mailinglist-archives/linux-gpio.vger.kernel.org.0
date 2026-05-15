Return-Path: <linux-gpio+bounces-36955-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOtAMEBnB2ps1wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36955-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 20:34:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C215564DE
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 20:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F37163066350
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 18:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEAC3FDC10;
	Fri, 15 May 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GCc20xxU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ULYKcGuu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9ED3FDC12;
	Fri, 15 May 2026 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868588; cv=none; b=aYMp9b/xho9azeAGGYX8Hhk+0LRoQWCWr/6wETyGOcf9qwxlbAfsisDfU9fJZyQWQ5McuKBkW/MHm1KZpSiaRrhTBDYdWXCHX3QQV/ZuGLqy/f5BnKGlA4NblG8XIwmDehBlQkXYiLPLsir8dOUv8CIX+d4LFvDZ6ZC2Vp4iCOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868588; c=relaxed/simple;
	bh=c5DCL/C8iLidN9G2V70jVuTNE5P4vyIxTcmDyiA40n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRSQeE9k8LyOZA+uxKQAsTexZa7txVN3T45oDvcczxZhQgKtG48PJmbVpvpdyUwIt/BflUK6BLRYc8eMfEBuf4RTxiLzFOjazZSIW0J1yOsts6DOBJWz8kI/dceT703zauUCEJAmC8g0771MAYLbY3g3ZI2aiiCuKM3MxhYXd4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GCc20xxU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ULYKcGuu; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id B3B14EC00A7;
	Fri, 15 May 2026 14:09:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 15 May 2026 14:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778868584;
	 x=1778954984; bh=krqp44enzSndnHvhribdC4KBpkMynKCpdBEAhbqrWjQ=; b=
	GCc20xxURXl4Y4wSXrzdQf6VkUfUymkd0WeZcHEYqrorfsSVrlwbqGPUZFcYf1L7
	TvdAi23quSNhN2XNkp81ZkfxhMxBOeRiFvCUyZP7yG4Nh2uRzm+MPKLXLDCtYL0i
	YOZw7yhZ1EPByhR+ZFtd0XpQi3dOjv1ab8ZQW73pZz50E+C6j90VVTO/+ZO71Win
	tx5gxqbYVYjJDDfRsxHvT45jKwwlWR2gnB5O0o5meHsCNTvnX4kDYOL042sMjEBk
	ziLAu8qkimEzzADScXtZ0QT5p/oC1HDUo3EHH2yCxYor6goBzXEtdTz+2sNxLMob
	htbhd2wIvUPezAZX2IRDcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778868584; x=
	1778954984; bh=krqp44enzSndnHvhribdC4KBpkMynKCpdBEAhbqrWjQ=; b=U
	LYKcGuuvFUalPeugcHSaiQhwwXpuieKYi3TFkhWKv4dPvVyDNP9Euv9Nr9u5vl6K
	VmYXbSQWZw5Ipz64wgM/wHT0EhizLLcqlbcod9eZkFYW1SAs462hV0HttFAGT4dL
	g3NDGn4VI9N6UYKXtoxmTKrOV6oVzRFMMUs/FxYXxHoKW4jSyMtjSDFcECG/opx3
	ZlHHWWRc6i37H30ijXMYk9l0Eb3hbrab5aLbcwaavAzhiikEin6l1b+mRsBoi9lv
	EO6DqAhXAPxjTDRoeeFc+LR18fxmAYvqpa2MH6O621Y2nakFbGYRbYRqovRR2p1w
	DyydSHDlZ9Umg03PYiMyA==
X-ME-Sender: <xms:Z2EHakNiTSKEM2KYdWdTreFipLwV9wvjt9096g0mpUsefarX_Vp49w>
    <xme:Z2EHalrhpPOvRJUZo43IDpNC0bExFqFh3v4SzEIL43xGTBwRjAdlFIonqWkitI4pu
    10Z_QS7_9AQBtI7s-8oVgOFXuB0TcIhB74vmIy_UHTuNmdYP-pTjsLv>
X-ME-Received: <xmr:Z2EHah6CYrfuL8wWLP_jvhuASNmCJdzgktzIWegfTpBHucxOKJCmJV7_o3Slfqcmpl8h92bWr9V9tB0UQqpCcxn4rT0FSAhrDTef>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufedutdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepughumhhithhruhdrtggvtghlrghnsegrnhgrlhhoghdrtghomhdprhgt
    phhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonh
    gsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsgho
    rghrugdrtghomhdprhgtphhtthhopehjuhhlihgvnhdrmhgrshhsohhtsegtohhllhgrsg
    horhgrrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtth
    hopegtohhsmhhinhdrthgrnhhishhlrghvsegrnhgrlhhoghdrtghomh
X-ME-Proxy: <xmx:Z2EHanr2qCqOcJLn8PuENwtQP83UgwDiWthg1L3pWZrsHHl0MmJf-w>
    <xmx:Z2EHanKteUbsxAUwMPcB4yXaDhTWt47hs-xJuvdgdtCeC1QufnqrCw>
    <xmx:Z2EHasjc1XaJenKhKuayC2eAecQyjkfijQz7PJ3KZfb0P5sBi_in9A>
    <xmx:Z2EHao9wgVGwsfjLlTquuG32-17bDP-zPUDraaUcBSH6pIm08i5EwQ>
    <xmx:aGEHalcsPt-f3Riy4i9Pf39kaQ3rmK6hdom6uXh6p8ejIT9MkrMertal>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 14:09:43 -0400 (EDT)
Date: Fri, 15 May 2026 20:09:41 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v11 13/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
Message-ID: <20260515180941.GO332351@ragnatech.se>
References: <20260511-gmsl2-3_serdes-v11-0-fc163073c16b@analog.com>
 <20260511-gmsl2-3_serdes-v11-13-fc163073c16b@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511-gmsl2-3_serdes-v11-13-fc163073c16b@analog.com>
X-Rspamd-Queue-Id: 45C215564DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linux.intel.com,collabora.com,linuxfoundation.org,analog.com,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu];
	TAGGED_FROM(0.00)[bounces-36955-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:mid,ragnatech.se:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Action: no action

Hi Dumitru,

Thanks for your work.

On 2026-05-11 15:26:36 +0300, Dumitru Ceclan via B4 Relay wrote:
> From: Cosmin Tanislav <demonsingur@gmail.com>
> 
> These drivers are meant to be used as a common framework for Maxim
> GMSL2/3 serializers and deserializers.
> 
> This framework enables support for the following new features across
> all the chips:
>  * Full Streams API support
>  * .get_frame_desc()
>  * .get_mbus_config()
>  * I2C ATR
>  * automatic GMSL link version negotiation
>  * automatic stream id selection
>  * automatic VC remapping
>  * automatic pixel mode / tunnel mode selection
>  * automatic double mode selection / data padding
>  * logging of internal state and chip status registers via .log_status()
>  * PHY modes
>  * serializer pinctrl
>  * TPG
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/media/i2c/Kconfig                   |   2 +
>  drivers/media/i2c/Makefile                  |   1 +
>  drivers/media/i2c/maxim-serdes/Kconfig      |  17 ++
>  drivers/media/i2c/maxim-serdes/Makefile     |   3 +
>  drivers/media/i2c/maxim-serdes/max_serdes.c | 413 ++++++++++++++++++++++++++++
>  drivers/media/i2c/maxim-serdes/max_serdes.h | 183 ++++++++++++
>  7 files changed, 620 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ae68688008d..70d3eeef8bfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15257,6 +15257,7 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> +F:	drivers/media/i2c/maxim-serdes/
>  
>  MAXIM MAX11205 DRIVER
>  M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index cdd7ba5da0d5..37f86e6de969 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1718,6 +1718,8 @@ config VIDEO_MAX96717
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called max96717.
>  
> +source "drivers/media/i2c/maxim-serdes/Kconfig"
> +
>  endmenu
>  
>  endif # VIDEO_DEV
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 57cdd8dc96f6..be3200b23819 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
>  obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
>  obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
>  obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
> +obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
>  obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
>  obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
>  obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
> new file mode 100644
> index 000000000000..f5a4ca80a263
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_MAXIM_SERDES
> +	tristate "Maxim GMSL2/3 Serializer and Deserializer support"
> +	depends on VIDEO_DEV
> +	depends on I2C
> +	select I2C_ATR
> +	select I2C_MUX
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This driver supports the Maxim GMSL2/3 common Serializer and
> +	  Deserializer framework.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called max_serdes.
> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/maxim-serdes/Makefile
> new file mode 100644
> index 000000000000..630fbb486bab
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +max-serdes-objs := max_serdes.o
> +obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
> diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/i2c/maxim-serdes/max_serdes.c
> new file mode 100644
> index 000000000000..bed70b8ce99a
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_serdes.c
> @@ -0,0 +1,413 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/stringify.h>
> +
> +#include <media/mipi-csi2.h>
> +
> +#include <video/videomode.h>
> +
> +#include <uapi/linux/media-bus-format.h>
> +
> +#include "max_serdes.h"
> +
> +const char * const max_serdes_tpg_patterns[] = {
> +	[MAX_SERDES_TPG_PATTERN_GRADIENT] = "Gradient",
> +	[MAX_SERDES_TPG_PATTERN_CHECKERBOARD] = "Checkerboard",
> +};
> +
> +static const char * const max_gmsl_versions[] = {
> +	[MAX_SERDES_GMSL_2_3GBPS] = "GMSL2 3Gbps",
> +	[MAX_SERDES_GMSL_2_6GBPS] = "GMSL2 6Gbps",
> +	[MAX_SERDES_GMSL_3_12GBPS] = "GMSL3 12Gbps",
> +};
> +
> +const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version version)
> +{
> +	if (version > MAX_SERDES_GMSL_3_12GBPS)
> +		return NULL;
> +
> +	return max_gmsl_versions[version];
> +}
> +
> +static const char * const max_gmsl_mode[] = {
> +	[MAX_SERDES_GMSL_PIXEL_MODE] = "pixel",
> +	[MAX_SERDES_GMSL_TUNNEL_MODE] = "tunnel",
> +};
> +
> +const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode)
> +{
> +	if (mode > MAX_SERDES_GMSL_TUNNEL_MODE)
> +		return NULL;
> +
> +	return max_gmsl_mode[mode];
> +}
> +
> +static const struct max_serdes_mipi_format max_serdes_mipi_formats[] = {
> +	{ MIPI_CSI2_DT_EMBEDDED_8B, 8 },
> +	{ MIPI_CSI2_DT_YUV422_8B, 16 },
> +	{ MIPI_CSI2_DT_YUV422_10B, 20 },
> +	{ MIPI_CSI2_DT_RGB565, 16 },
> +	{ MIPI_CSI2_DT_RGB666, 18 },
> +	{ MIPI_CSI2_DT_RGB888, 24 },
> +	{ MIPI_CSI2_DT_RAW8, 8 },
> +	{ MIPI_CSI2_DT_RAW10, 10 },
> +	{ MIPI_CSI2_DT_RAW12, 12 },
> +	{ MIPI_CSI2_DT_RAW14, 14 },
> +	{ MIPI_CSI2_DT_RAW16, 16 },
> +};
> +
> +const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(max_serdes_mipi_formats); i++)
> +		if (max_serdes_mipi_formats[i].dt == dt)
> +			return &max_serdes_mipi_formats[i];
> +
> +	return NULL;
> +}
> +
> +int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
> +				   struct v4l2_mbus_frame_desc_entry *entry)
> +{
> +	struct v4l2_mbus_frame_desc fd;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EOPNOTSUPP;
> +
> +	for (i = 0; i < fd.num_entries; i++) {
> +		if (fd.entry[i].stream == stream) {
> +			*entry = fd.entry[i];
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
> +			  unsigned int *bpp)
> +{
> +	const struct max_serdes_mipi_format *format;
> +
> +	format = max_serdes_mipi_format_by_dt(entry->bus.csi2.dt);
> +	if (!format)
> +		return -ENOENT;
> +
> +	*bpp = format->bpp;
> +
> +	return 0;
> +}
> +
> +int max_serdes_process_bpps(struct device *dev, u32 bpps,
> +			    u32 allowed_double_bpps, unsigned int *doubled_bpp)
> +{
> +	unsigned int min_bpp;
> +	unsigned int max_bpp;
> +	bool doubled = false;
> +
> +	if (!bpps)
> +		return 0;
> +
> +	*doubled_bpp = 0;
> +
> +	/*
> +	 * Hardware can double bpps 8, 10, 12, and it can pad bpps < 16
> +	 * to another bpp <= 16:
> +	 * Hardware can only stream a single constant bpp up to 24.
> +	 *
> +	 * From these features and limitations, the following rules
> +	 * can be deduced:
> +	 *
> +	 * A bpp of 8 can always be doubled if present.
> +	 * A bpp of 10 can be doubled only if there are no other bpps or the
> +	 * only other bpp is 20.
> +	 * A bpp of 12 can be doubled only if there are no other bpps or the
> +	 * only other bpp is 24.
> +	 * Bpps <= 16 cannot coexist with bpps > 16.
> +	 * Bpps <= 16 need to be padded to the biggest bpp.
> +	 */
> +
> +	min_bpp = __ffs(bpps);
> +	max_bpp = __fls(bpps);
> +
> +	if (min_bpp == 8) {
> +		doubled = true;
> +	} else if (min_bpp == 10 || min_bpp == 12) {
> +		u32 bpp_or_double = BIT(min_bpp) | BIT(min_bpp * 2);
> +		u32 other_bpps = bpps & ~bpp_or_double;
> +
> +		if (!other_bpps)
> +			doubled = true;
> +	}
> +
> +	if (doubled && (allowed_double_bpps & BIT(min_bpp))) {
> +		*doubled_bpp = min_bpp;
> +		bpps &= ~BIT(min_bpp);
> +		bpps |= BIT(min_bpp * 2);
> +	}
> +
> +	min_bpp = __ffs(bpps);
> +	max_bpp = __fls(bpps);
> +
> +	if (max_bpp > 24) {
> +		dev_err(dev, "Cannot stream bpps > 24\n");
> +		return -EINVAL;
> +	}
> +
> +	if (min_bpp <= 16 && max_bpp > 16) {
> +		dev_err(dev, "Cannot stream bpps <= 16 with bpps > 16\n");
> +		return -EINVAL;
> +	}
> +
> +	if (max_bpp > 16 && min_bpp != max_bpp) {
> +		dev_err(dev, "Cannot stream multiple bpps when one is > 16\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *sources,
> +					    u32 source_sink_pad_offset,
> +					    const struct v4l2_subdev_state *state,
> +					    u32 pad, u64 updated_streams_mask,
> +					    u32 sink_pad_start, u32 num_sink_pads,
> +					    bool enable)
> +{
> +	u32 failed_sink_pad;
> +	int ret;
> +	u32 i;
> +
> +	for (i = sink_pad_start; i < sink_pad_start + num_sink_pads; i++) {
> +		u64 matched_streams_mask = updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +		struct max_serdes_source *source;
> +
> +		updated_sink_streams_mask =
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		source = &sources[i + source_sink_pad_offset];
> +		if (!source)
> +			continue;
> +
> +		if (enable)
> +			ret = v4l2_subdev_enable_streams(source->sd, source->pad,
> +							 updated_sink_streams_mask);
> +		else
> +			ret = v4l2_subdev_disable_streams(source->sd, source->pad,
> +							  updated_sink_streams_mask);
> +		if (ret) {
> +			failed_sink_pad = i;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	for (i = sink_pad_start; i < failed_sink_pad; i++) {
> +		u64 matched_streams_mask = updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +		struct max_serdes_source *source;
> +
> +		updated_sink_streams_mask =
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		source = &sources[i + source_sink_pad_offset];
> +		if (!source)
> +			continue;
> +
> +		if (!enable)
> +			v4l2_subdev_enable_streams(source->sd, source->pad,
> +						   updated_sink_streams_mask);
> +		else
> +			v4l2_subdev_disable_streams(source->sd, source->pad,
> +						    updated_sink_streams_mask);
> +	}
> +
> +	return ret;
> +}
> +
> +int max_serdes_get_streams_masks(struct device *dev,
> +				 const struct v4l2_subdev_state *state,
> +				 u32 pad, u64 updated_streams_mask,
> +				 u32 num_pads, u64 *old_streams_masks,
> +				 u64 **new_streams_masks, bool enable)
> +{
> +	u64 *streams_masks;
> +	unsigned int i;
> +
> +	streams_masks = devm_kcalloc(dev, num_pads, sizeof(*streams_masks), GFP_KERNEL);
> +	if (!streams_masks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_pads; i++) {
> +		u64 matched_streams_mask = updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +
> +		updated_sink_streams_mask =
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		streams_masks[i] = old_streams_masks[i];
> +		if (enable)
> +			streams_masks[i] |= updated_sink_streams_mask;
> +		else
> +			streams_masks[i] &= ~updated_sink_streams_mask;
> +	}
> +
> +	if (enable)
> +		streams_masks[pad] |= updated_streams_mask;
> +	else
> +		streams_masks[pad] &= ~updated_streams_mask;
> +
> +	*new_streams_masks = streams_masks;
> +
> +	return 0;
> +}
> +
> +static const struct videomode max_serdes_tpg_pixel_videomodes[] = {
> +	{
> +		.pixelclock = 25000000,
> +		.hactive = 640,
> +		.hfront_porch = 10,
> +		.hsync_len = 96,
> +		.hback_porch = 40,
> +		.vactive = 480,
> +		.vfront_porch = 2,
> +		.vsync_len = 24,
> +		.vback_porch = 24,
> +	},
> +	{
> +		.pixelclock = 75000000,
> +		.hactive = 1920,
> +		.hfront_porch = 88,
> +		.hsync_len = 44,
> +		.hback_porch = 148,
> +		.vactive = 1080,
> +		.vfront_porch = 4,
> +		.vsync_len = 16,
> +		.vback_porch = 36,
> +	},
> +	{
> +		.pixelclock = 150000000,
> +		.hactive = 1920,
> +		.hfront_porch = 88,
> +		.hsync_len = 44,
> +		.hback_porch = 148,
> +		.vactive = 1080,
> +		.vfront_porch = 4,
> +		.vsync_len = 16,
> +		.vback_porch = 36,
> +	},
> +};
> +
> +static void max_serdes_get_vm_timings(const struct videomode *vm,
> +				      struct max_serdes_tpg_timings *timings)
> +{
> +	u32 hact = vm->hactive;
> +	u32 hfp = vm->hfront_porch;
> +	u32 hsync = vm->hsync_len;
> +	u32 hbp = vm->hback_porch;
> +	u32 htot = hact + hfp + hbp + hsync;
> +
> +	u32 vact = vm->vactive;
> +	u32 vfp = vm->vfront_porch;
> +	u32 vsync = vm->vsync_len;
> +	u32 vbp = vm->vback_porch;
> +	u32 vtot = vact + vfp + vbp + vsync;
> +
> +	*timings = (struct max_serdes_tpg_timings) {
> +		.gen_vs = true,
> +		.gen_hs = true,
> +		.gen_de = true,
> +		.vs_inv = true,
> +		.vs_dly = 0,
> +		.vs_high = vsync * htot,
> +		.vs_low = (vact + vfp + vbp) * htot,
> +		.v2h = 0,
> +		.hs_high = hsync,
> +		.hs_low = hact + hfp + hbp,
> +		.hs_cnt = vact + vfp + vbp + vsync,
> +		.v2d = htot * (vsync + vbp) + (hsync + hbp),
> +		.de_high = hact,
> +		.de_low = hfp + hsync + hbp,
> +		.de_cnt = vact,
> +		.clock = vm->pixelclock,
> +		.fps = DIV_ROUND_CLOSEST(vm->pixelclock, vtot * htot),
> +	};
> +}
> +
> +int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
> +			       struct max_serdes_tpg_timings *timings)
> +{
> +	u32 fps;
> +
> +	if (!entry)
> +		return 0;
> +
> +	fps = DIV_ROUND_CLOSEST(1 * entry->interval.denominator,
> +				entry->interval.numerator);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(max_serdes_tpg_pixel_videomodes); i++) {
> +		struct max_serdes_tpg_timings vm_timings;
> +		const struct videomode *vm;
> +
> +		vm = &max_serdes_tpg_pixel_videomodes[i];
> +
> +		max_serdes_get_vm_timings(vm, &vm_timings);
> +
> +		if (vm->hactive == entry->width &&
> +		    vm->vactive == entry->height &&
> +		    vm_timings.fps == fps) {
> +			*timings = vm_timings;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_NS_GPL(max_serdes_get_tpg_timings, "MAX_SERDES");
> +
> +int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing)
> +{
> +	const struct v4l2_subdev_route *route;
> +
> +	if (routing->num_routes != 1)
> +		return -EINVAL;
> +
> +	route = &routing->routes[0];
> +
> +	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +		return -EINVAL;
> +
> +	if (route->sink_stream != MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +MODULE_DESCRIPTION("Maxim GMSL2 Serializer/Deserializer Driver");
> +MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.h b/drivers/media/i2c/maxim-serdes/max_serdes.h
> new file mode 100644
> index 000000000000..d1d513e464d6
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_serdes.h
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#ifndef MAX_SERDES_H
> +#define MAX_SERDES_H
> +
> +#include <linux/types.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define REG_SEQUENCE_2(reg, val) \
> +	{ (reg),     ((val) >> 8) & 0xff }, \
> +	{ (reg) + 1, ((val) >> 0) & 0xff }
> +
> +#define REG_SEQUENCE_3(reg, val) \
> +	{ (reg),     ((val) >> 16) & 0xff }, \
> +	{ (reg) + 1, ((val) >> 8)  & 0xff }, \
> +	{ (reg) + 2, ((val) >> 0)  & 0xff }
> +
> +#define REG_SEQUENCE_3_LE(reg, val) \
> +	{ (reg),     ((val) >> 0) & 0xff }, \
> +	{ (reg) + 1, ((val) >> 8)  & 0xff }, \
> +	{ (reg) + 2, ((val) >> 16)  & 0xff }
> +
> +#define field_get(mask, val) (((val) & (mask)) >> __ffs(mask))
> +#define field_prep(mask, val) (((val) << __ffs(mask)) & (mask))

These two macros seems to conflict with similar ones from 
include/linux/bitfield.h.

> +
> +#define MAX_SERDES_PHYS_MAX		4
> +#define MAX_SERDES_STREAMS_NUM		4
> +#define MAX_SERDES_VC_ID_NUM		4
> +#define MAX_SERDES_TPG_STREAM		0
> +
> +#define MAX_SERDES_GRAD_INCR		4
> +#define MAX_SERDES_CHECKER_COLOR_A	0x00ccfe
> +#define MAX_SERDES_CHECKER_COLOR_B	0xa76a00
> +#define MAX_SERDES_CHECKER_SIZE		60
> +
> +extern const char * const max_serdes_tpg_patterns[];
> +
> +enum max_serdes_gmsl_version {
> +	MAX_SERDES_GMSL_MIN,
> +	MAX_SERDES_GMSL_2_3GBPS = MAX_SERDES_GMSL_MIN,
> +	MAX_SERDES_GMSL_2_6GBPS,
> +	MAX_SERDES_GMSL_3_12GBPS,
> +	MAX_SERDES_GMSL_MAX = MAX_SERDES_GMSL_3_12GBPS,
> +};
> +
> +enum max_serdes_gmsl_mode {
> +	MAX_SERDES_GMSL_PIXEL_MODE,
> +	MAX_SERDES_GMSL_TUNNEL_MODE,
> +};
> +
> +enum max_serdes_tpg_pattern {
> +	MAX_SERDES_TPG_PATTERN_MIN,
> +	MAX_SERDES_TPG_PATTERN_CHECKERBOARD = MAX_SERDES_TPG_PATTERN_MIN,
> +	MAX_SERDES_TPG_PATTERN_GRADIENT,
> +	MAX_SERDES_TPG_PATTERN_MAX = MAX_SERDES_TPG_PATTERN_GRADIENT,
> +};
> +
> +struct max_serdes_phys_config {
> +	unsigned int lanes[MAX_SERDES_PHYS_MAX];
> +	unsigned int clock_lane[MAX_SERDES_PHYS_MAX];
> +};
> +
> +struct max_serdes_phys_configs {
> +	const struct max_serdes_phys_config *configs;
> +	unsigned int num_configs;
> +};
> +
> +struct max_serdes_i2c_xlate {
> +	u8 src;
> +	u8 dst;
> +	bool en;
> +};
> +
> +struct max_serdes_mipi_format {
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +struct max_serdes_vc_remap {
> +	u8 src;
> +	u8 dst;
> +};
> +
> +struct max_serdes_source {
> +	struct v4l2_subdev *sd;
> +	u16 pad;
> +	struct fwnode_handle *ep_fwnode;
> +
> +	unsigned int index;
> +};
> +
> +struct max_serdes_asc {
> +	struct v4l2_async_connection base;
> +	struct max_serdes_source *source;
> +};
> +
> +struct max_serdes_tpg_entry {
> +	u32 width;
> +	u32 height;
> +	struct v4l2_fract interval;
> +	u32 code;
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +#define MAX_TPG_ENTRY_640X480P60_RGB888 \
> +	{ 640, 480, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
> +
> +#define MAX_TPG_ENTRY_1920X1080P30_RGB888 \
> +	{ 1920, 1080, { 1, 30 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
> +
> +#define MAX_TPG_ENTRY_1920X1080P60_RGB888 \
> +	{ 1920, 1080, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
> +
> +struct max_serdes_tpg_entries {
> +	const struct max_serdes_tpg_entry *entries;
> +	unsigned int num_entries;
> +};
> +
> +struct max_serdes_tpg_timings {
> +	bool gen_vs;
> +	bool gen_hs;
> +	bool gen_de;
> +	bool vs_inv;
> +	bool hs_inv;
> +	bool de_inv;
> +	u32 vs_dly;
> +	u32 vs_high;
> +	u32 vs_low;
> +	u32 v2h;
> +	u32 hs_high;
> +	u32 hs_low;
> +	u32 hs_cnt;
> +	u32 v2d;
> +	u32 de_high;
> +	u32 de_low;
> +	u32 de_cnt;
> +	u32 clock;
> +	u32 fps;
> +};
> +
> +static inline struct max_serdes_asc *asc_to_max(struct v4l2_async_connection *asc)
> +{
> +	return container_of(asc, struct max_serdes_asc, base);
> +}
> +
> +const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version version);
> +const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode);
> +
> +const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt);
> +
> +int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
> +				   struct v4l2_mbus_frame_desc_entry *entry);
> +
> +int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
> +			  unsigned int *bpp);
> +int max_serdes_process_bpps(struct device *dev, u32 bpps,
> +			    u32 allowed_double_bpps, unsigned int *doubled_bpp);
> +
> +int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *sources,
> +					    u32 source_sink_pad_offset,
> +					    const struct v4l2_subdev_state *state,
> +					    u32 pad, u64 updated_streams_mask,
> +					    u32 sink_pad_start, u32 num_sink_pads,
> +					    bool enable);
> +
> +int max_serdes_get_streams_masks(struct device *dev,
> +				 const struct v4l2_subdev_state *state,
> +				 u32 pad, u64 updated_streams_mask,
> +				 u32 num_pads, u64 *old_streams_masks,
> +				 u64 **new_streams_masks, bool enable);
> +
> +int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
> +			       struct max_serdes_tpg_timings *timings);
> +
> +int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing);
> +
> +#endif // MAX_SERDES_H
> 
> -- 
> 2.51.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

