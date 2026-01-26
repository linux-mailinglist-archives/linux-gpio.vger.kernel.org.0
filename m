Return-Path: <linux-gpio+bounces-31058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDt4J1c8d2mMdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:05:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1E86664
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ED85303501F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BF932E729;
	Mon, 26 Jan 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nsZiw8pW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE6313547;
	Mon, 26 Jan 2026 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421726; cv=none; b=MYSQLJEZvSPzTuc9fR+Yq2r45e+nsZIu0w6oxAyjEYDa82D0Jwc7DuQhXsJI1sHx5uZWdt5Hm0InWkVlkYzxnObe2WhrjNunu8uEwyE6y59rdadtOH1MgKZj4ZvVPyrOHYRZwL/Egbcn2QaN0Y7flflSP2Vfrdsbf98NInbh6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421726; c=relaxed/simple;
	bh=J+YVfS9Wm2Sk+6m3pp8Ftv4a/hsFTHNzGVuvFwi49Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIwdNU6DygzH6FnVILxPl88qnispvm8JEuGEX7ml8WZBIp8uOGB0LAF9DSpZLLiR4AuPtCJzjRd2qiwSL39/HV/MkOhvswwXZDzx9Etdxsq00WeaSZ8MYDhmZt+l1w0cEZzwUYCmGDHjho9abNFjdDwtiOalWBMPnC7A+INoNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nsZiw8pW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B947422F;
	Mon, 26 Jan 2026 11:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769421679;
	bh=J+YVfS9Wm2Sk+6m3pp8Ftv4a/hsFTHNzGVuvFwi49Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsZiw8pWIXiX76repnBNWmc7mkmlfDr158AG7SuQecURSNj7jSWZGgf70ofeIx3qW
	 vP3p/21YuoH5BQ6m56oDWTfWaxtPUZWZChuAB1fA0rv7Wh3y5KscpaRAuA2UoQuLrI
	 ZRZbNsGNZkwy//pipljatYeRVzTIOT6Q12ufQC1A=
Date: Mon, 26 Jan 2026 12:01:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ceclan Dumitru <mitrutzceclan@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
Message-ID: <20260126100153.GB593812@killaraus>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31058-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,analog.com,ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11B1E86664
X-Rspamd-Action: no action

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

That's still a copy. Why is a copy needed, why can't you write

 	priv->des.ops = &priv->info->ops;

or event replace priv->des.ops with priv->info->ops through the code ?
Is there anything in the ops structure that needs to be modified at
runtime ?

-- 
Regards,

Laurent Pinchart

