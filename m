Return-Path: <linux-gpio+bounces-33632-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL5hNEFPuWnj/wEAu9opvQ
	(envelope-from <linux-gpio+bounces-33632-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:55:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1B2AA380
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5AC430CA942
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156843C65E0;
	Tue, 17 Mar 2026 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5uvSCLr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077613AE19B;
	Tue, 17 Mar 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751964; cv=none; b=h1BbL2PWDygSaNUyApejJp4saxmHS5LgtiFxcGW2K6U8XMZvrLHdPG/odOEM4Q2i9bCBZjp1D/OIQKvr+xr0LKdYErysF05Ae5G0e07G4kf/B6WsOQ79vmGN+/DdT7oB3OUR47HYQl1lNMOotQNZRVHizp4MjSZbIgpkxOGTBBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751964; c=relaxed/simple;
	bh=ifGlbOWEiHVVWqSZK9fbyIZmBv3Ldj/nY4Z62g+0Pyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkVT1bSLehTsXX5V3WHDg82O3O2D7V93CmCwt9lCbgtDcYk8eGgFfzDHtea5lFoJFWR16x3ixLfi28d4fyjhlJ1df3Zz+g1qvLy0frTeo8jBlJLrOjBbyvHD0cMVkzUVw2L4nPmI95G/rztnCQLpdsvbqO8GGb8VaX+p7jQH430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5uvSCLr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773751962; x=1805287962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ifGlbOWEiHVVWqSZK9fbyIZmBv3Ldj/nY4Z62g+0Pyw=;
  b=b5uvSCLruBCLYVH07LbdZiXF0dglm8nvcgFsfi0FnYh48GpTSqZGH4z2
   6yOxQ28pAZfAsVviAjEGnlwsvdgzHhbkoBW/8YsMuiMgv4D/pYE4IMx1Z
   /d8AsNuzo0163SFD9GHPfvZPy6TXWmnqmy3g2lPQNEBH/DE8i6NWbr+EH
   /jdAjNhdpPCAsct30nZr1Ti6ZJrhP/wbqfpV03I4FXBg+kIaiM066eEfz
   jOfxqJ3r2whgrhVYOoq8fbAY/WXf+UeRtnSvxBGxRPDWmzr34k+TKvRY0
   n0152s1RMtevanZ8nkt2at8F6NMKxfRym8+UGsQOKWnN9+vyD1OiInZRW
   Q==;
X-CSE-ConnectionGUID: lqRx/DfxTl6n4Nf7/jE20g==
X-CSE-MsgGUID: //Kpas/FQ2uDL0WMjUVD2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100238707"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100238707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:52:41 -0700
X-CSE-ConnectionGUID: RP07OwlsQGORO2vQsgC7OA==
X-CSE-MsgGUID: qLW88q5iQM6PJX/w0k3QHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217961247"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:52:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0C79111F870;
	Tue, 17 Mar 2026 14:52:36 +0200 (EET)
Date: Tue, 17 Mar 2026 14:52:35 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linusw@kernel.org,
	brgl@kernel.org, mchehab@kernel.org, dan.scally@ideasonboard.com,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
	jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
	ribalda@chromium.org
Subject: Re: [PATCH v2 2/5] media: ipu-bridge: Add ov5675 sensor
Message-ID: <ablOk92UVRibBgSF@kekkonen.localdomain>
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
 <20260311131910.835513-3-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311131910.835513-3-antti.laakso@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33632-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 7DC1B2AA380
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Mar 11, 2026 at 03:19:07PM +0200, Antti Laakso wrote:
> The Omnivision ov5675 is found from MSI prestige
> 14 AI EVO laptop, for example.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index c895584e25a0..ee070d44d5f1 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -91,6 +91,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>  	/* Omnivision OV2680 */
>  	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
> +	/* Omnivision OV5675 */
> +	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),

These exact lines have been already added by commit
d6576b85d3fe75238e67d3e311222e7f69730b09 as Thinkpad X1 Fold 16 has the
same sensor. I've taken the rest to my tree (int3472 branch).

Thanks!

>  	/* Omnivision OV8856 */
>  	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
>  	/* Sony IMX471 */

-- 
Kind regards,

Sakari Ailus

