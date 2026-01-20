Return-Path: <linux-gpio+bounces-30803-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJAyBhH6b2mUUgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30803-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 22:56:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B84C9EA
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 22:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4CF266A958
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 13:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8412142E00E;
	Tue, 20 Jan 2026 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwxmAxpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1D42E01A;
	Tue, 20 Jan 2026 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916067; cv=none; b=Tzwh0g3mu6aIkXfJO2gFT4iC8lOilkw0NO4s3dSoruP3009417Tl2we7tZHMsO26FgJzmA8aIB1GHdoLyGYRyxvH1C6MRSJL8veDFu8yif1pYxyoIkCRkRbbvbUN0eumWiIfCdlCQ5Q5bDDz1STyvgkjDTcxVUDGVG6d3i+zBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916067; c=relaxed/simple;
	bh=rMm4UHaLXFoH4cVAkzgLPS5cSIcGJqOv+NSAE8Ow6qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPYZm62O6hhPurNUZnYdPus1W5cJFmIG100DbdSpoEB8oL/3lRkJv5+QfEm4/gmzHQnicMkyIVvzSzpe46kpprkbuExLkxSN2ehyJhlqtjszV5vnJZ/NX0YzYwjs4INyvbNShDsyivxaODjSsYnlPe8K1MV8vXZyRDHO31ivxxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwxmAxpa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916066; x=1800452066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rMm4UHaLXFoH4cVAkzgLPS5cSIcGJqOv+NSAE8Ow6qg=;
  b=kwxmAxpaAHxkdoV3cXqgSnjV6hSwpMYg+CW5H1VkXusdJiEelCB/MEH4
   PR2l6Pxk6zZsMq3IYZIJfgTWqkebXJOTwXA7R5R3mQ/9itnYqOtUFkU6d
   CD1kz3o7N3OdVf1LoegGVijmTNMvickWUf7NEtywynTVSg3E2b2bVIyRY
   SkBn6QdP3tvSeUjYLqDWt245RT/CYnutfzcPLc+7I17CvZxxKWIJb32/7
   hlHmgSZ1rKci2fDvijYicSy6bXs+c6GBUJH6vYVu0yc7kKrFR4XJAovxF
   vVGSa/HH/oE1FucupzyQm5J/hG6x8Hg1QFS3sawAU7PyD9K7hPGSOvueD
   g==;
X-CSE-ConnectionGUID: MTJFQ97pQxyb6hLLT5Gwqw==
X-CSE-MsgGUID: vtUUu6w3QoqOjWQNHncabQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70095074"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70095074"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:34:24 -0800
X-CSE-ConnectionGUID: 6GIDVvhdQSSEjq2lvh9rxQ==
X-CSE-MsgGUID: xUWG6DKgSIWvPTLzQKWmgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="236806666"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.188])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:34:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E421011F82F;
	Tue, 20 Jan 2026 15:34:22 +0200 (EET)
Date: Tue, 20 Jan 2026 15:34:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev, mitrutzceclan@gmail.com,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
Message-ID: <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-30803-lists,linux-gpio=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: D22B84C9EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dumitru,

On Mon, Dec 08, 2025 at 04:13:09PM +0200, Dumitru Ceclan via B4 Relay wrote:
> +	*ops = max9296a_common_ops;
> +
> +	ops->versions = priv->info->ops->versions;
> +	ops->modes = priv->info->ops->modes;
> +	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
> +	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
> +	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
> +	ops->num_phys = priv->info->ops->num_phys;
> +	ops->num_pipes = priv->info->ops->num_pipes;
> +	ops->num_links = priv->info->ops->num_links;
> +	ops->phys_configs = priv->info->ops->phys_configs;
> +	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
> +	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
> +	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
> +	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
> +	ops->use_atr = priv->info->ops->use_atr;
> +	ops->tpg_mode = priv->info->ops->tpg_mode;

What's the reason for doing these assignments and a copy of the memory? Why
not to just keep a pointer to the struct memory instead? I think there's
another case of the same.

-- 
Kind regards,

Sakari Ailus

