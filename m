Return-Path: <linux-gpio+bounces-31095-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ELhBsHgd2kdmQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31095-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 22:46:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901B8DB5F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 22:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF87A3004CA5
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 21:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DED2F5498;
	Mon, 26 Jan 2026 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd0y7HNH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0162F3C37;
	Mon, 26 Jan 2026 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769463993; cv=none; b=KcTmtBxUwKIisZGMCmtjevVFApQVfFHXhTvHRa16o2hDUBDj/JtzGi0+tWrOy5/ud5cNJYDQ7V4CD7g8WtbUzvkK/YleagiTEsuKzXMiSZdj8yxKJ39vhjNvb1gv8U8ZYwB4TSZmoGrBHJ9RSJAuUqZ1goESAV2nAM6Mn8SDCuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769463993; c=relaxed/simple;
	bh=OV8z+qAYHSTccbY3IeLbbbgQ0ZTAqemONCIq8pnZmRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQXUNPvUrUpzCzUgMX07XiS1dGUFT0Y7ZeV1hskFNPJI7ffBXbBdWWcIs5a4BeqmGSeABdDvYfRDHA9YUB3LWuCifq1k2KRFhEpxXR2p/PopMpxYxbQnR2j0crop3A+lTQmblqe8RVUJE2KBNvPan327RQDOybnebEwzMbE6VTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd0y7HNH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769463992; x=1800999992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OV8z+qAYHSTccbY3IeLbbbgQ0ZTAqemONCIq8pnZmRA=;
  b=Jd0y7HNHEE6AUdVQmLX3Xb/xWZvxAMfgsUj5lY5plWMP6JdCY7J9w7YA
   LAck2QgRJmlt8IvD9GG4n0KOP8K9qSmNV+i47CtDyntmrXLH2g2KQDJUs
   jIam3aMnOM2CSS0eaL5CpWahphIxhjxSZB8xsZnDZpJsd77ZkCBTQtfoK
   QinCr3mghLc59aNrPWl83oocg2/2F4WnxK5g+nDMToPyCuTRMO+nxEcxm
   woFzzfN/jvJM21Aeu88tlfScEOpBCHuvdw+X0+CX3oM6405tltUng49B7
   35om0/OzGRUz2F6etH5ZFLF5/7g1AmcPL/OEx47mEXIn0gbCQQxYdWjq1
   w==;
X-CSE-ConnectionGUID: FYZTn/TdTUmVkqBKCjwPWw==
X-CSE-MsgGUID: ko+XWe48Rd+qAC5vat+C+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81283392"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81283392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:46:31 -0800
X-CSE-ConnectionGUID: 15LPK76wSZ2jmRZCwrzXYw==
X-CSE-MsgGUID: SN0SLK/8S0iqR85YBc7WYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207024316"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:46:27 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 67D9211FCC8;
	Mon, 26 Jan 2026 23:46:30 +0200 (EET)
Date: Mon, 26 Jan 2026 23:46:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ceclan Dumitru <mitrutzceclan@gmail.com>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
Message-ID: <aXfgts9DHfWZt3To@kekkonen.localdomain>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
 <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
 <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31095-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[analog.com,ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 1901B8DB5F
X-Rspamd-Action: no action

Hi Dumitru,

On Mon, Jan 26, 2026 at 11:55:47AM +0200, Ceclan Dumitru wrote:
> 
> 
> On 1/20/26 3:34 PM, Sakari Ailus wrote:
> > Hi Dumitru,
> > 
> > On Mon, Dec 08, 2025 at 04:13:09PM +0200, Dumitru Ceclan via B4 Relay wrote:
> >> +	*ops = max9296a_common_ops;
> >> +
> >> +	ops->versions = priv->info->ops->versions;
> >> +	ops->modes = priv->info->ops->modes;
> >> +	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
> >> +	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
> >> +	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
> >> +	ops->num_phys = priv->info->ops->num_phys;
> >> +	ops->num_pipes = priv->info->ops->num_pipes;
> >> +	ops->num_links = priv->info->ops->num_links;
> >> +	ops->phys_configs = priv->info->ops->phys_configs;
> >> +	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
> >> +	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
> >> +	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
> >> +	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
> >> +	ops->use_atr = priv->info->ops->use_atr;
> >> +	ops->tpg_mode = priv->info->ops->tpg_mode;
> > 
> > What's the reason for doing these assignments and a copy of the memory? Why
> > not to just keep a pointer to the struct memory instead? I think there's
> > another case of the same.
> > 
> Would this be alright:
> #define MAX9296A_COMMON_OPS					\
> 
> 	.num_remaps_per_pipe = 16,				\
> 
> 	.tpg_entries = { ... },					\
> 
> 	.init = max9296a_init,					\
> 
> 	.set_enable = max9296a_set_enable,			\
> 
> 
> static const struct max_des_ops max9296a_ops = {
> 
> 	MAX9296A_COMMON_OPS,
> 
> 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
> 
> 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
> 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
> 	/* ... */
> 
> 	};
> 

Could you use different structs for ops and hardware features?

> 
> 
> static int max9296a_probe(struct i2c_client *client)
> 
> {
> 
> 	/* ... */
> 
> 	priv->des.ops = priv->info->ops;
> 
> 	/* ... */
> 
> }

-- 
Regards,

Sakari Ailus

