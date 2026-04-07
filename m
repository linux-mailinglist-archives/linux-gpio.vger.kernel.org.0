Return-Path: <linux-gpio+bounces-34751-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DN8NACt1GnNwQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34751-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:06:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057D3AAA37
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B56B300EF40
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 07:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D4B3921D5;
	Tue,  7 Apr 2026 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PI6nTNkq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF224DD15;
	Tue,  7 Apr 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545466; cv=none; b=ko43HtljLNroCe9TElndplzYY++FYeys9o0+TR6hdbOsNKtF9OnHYmYCdxP7ffxbmq2BCfmiWz099FvLtnfcD5ndr0dregXJdSy0YeZ/FfPXYM21qrEqXxdWGbm7NtC4QO0+mB/tF5cLcHBD+RXHx8cHVDaLw/u+29VGRgdFJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545466; c=relaxed/simple;
	bh=Gjw9pVSfJyk8lGKR3YSdogwRldHB4JrnsplgXcwYkOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Smj2V+3wF6ZkF9xlH7DMGeTBSAECgB7FTjuS5df7EWe8pk+IOTpIW0AvNWNmD+Xxp2IczkTUOXvQjW8iuLYkBTyAMr59rU8ysKgyu8BNApLwfwmKK4MxhzP/t8m1kLtPJHEy+wuvncv1n4qsZhWMJMIAxNYGkD8if7S1vFpAkXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PI6nTNkq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775545465; x=1807081465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gjw9pVSfJyk8lGKR3YSdogwRldHB4JrnsplgXcwYkOg=;
  b=PI6nTNkq3/9bhWRVD9CUTOVPp8FX6dQlxysNiAxcilvqafVy8wCbJxgh
   AN/2LWCh7+FOIaEFeaEwP3BuQEDdRCZ0YbmmnN7vF20HeY1bvcnAhIxTy
   2wuos2w9t7sA7OGZXWannhGCTRUXosEVPHnsD3xynZpOIvUvyt79U04bO
   jYvRqiimpcyqlEPpGUdgHHQh5+HNaXsWD8NkVSp8tMH1iN049IziXJ4+k
   2K+4x0FgcfNd5+60SAGt15R7Q5Svrm5iaoJivc4WmwDaA/Xso12PX9Wx8
   pCgzOCEog/SO5+9MRDU7yGdc2VDoCr3Nt/1KjQxbsFb04tYgRo68n2hVN
   w==;
X-CSE-ConnectionGUID: eJKNYQvTQMy7ZY+eu6mE/A==
X-CSE-MsgGUID: ARfPmcHmR02XoqpUWCOT6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76382599"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76382599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:04:09 -0700
X-CSE-ConnectionGUID: ARjcj5YsSkOuSW/B4EXUQA==
X-CSE-MsgGUID: qBWU+OS7SPqqGskJaINwjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223779891"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.123])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:04:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 19E3E12080D;
	Tue, 07 Apr 2026 10:04:18 +0300 (EEST)
Date: Tue, 7 Apr 2026 10:04:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH v3 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
Message-ID: <adSscliuE_kHopnC@kekkonen.localdomain>
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
 <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34751-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.974];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 3057D3AAA37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

Thanks for the update.

On Fri, Apr 03, 2026 at 03:51:50PM +0200, Bartosz Golaszewski wrote:
> It's possible that at the time of resolving a reference to a remote
> software node, the node we know exists is not yet registered as a full
> firmware node. We currently return -ENOENT in this case but the same
> error code is also returned in some other cases, like the reference
> property with given name not existing in the property list of the local
> software node.
> 
> It makes sense to let users know that we're dealing with an unregistered
> software node so that they can defer probe - the situation is somewhat
> similar to there existing a firmware node to which no device is bound
> yet - which is valid grounds for probe deferral. To that end: use
> -ENOTCONN to indicate the software node is "not connected".
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/swnode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 51320837f3a9f1bf4f65aa161d9b941affc74936..61e73417aee89feb855b0f429e112ca0af78a003 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  		return -EINVAL;
>  
>  	if (!refnode)
> -		return -ENOENT;
> +		return -ENOTCONN;

This needs to be documented for fwnode_property_get_reference_args() as
well.

In V4L2 we do
<URL:https://lore.kernel.org/linux-media/20260313091122.GA333526@killaraus.ideasonboard.com/T/#t>
so the caller just returns the error code but maybe that's not generic
enough.

>  
>  	if (nargs_prop) {
>  		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);
> 

-- 
Kind regards,

Sakari Ailus

