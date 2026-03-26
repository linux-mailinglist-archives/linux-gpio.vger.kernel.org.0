Return-Path: <linux-gpio+bounces-34199-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIfsDcQOxWkI6AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34199-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:47:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D1333B92
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 468943168D51
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6F63CEB95;
	Thu, 26 Mar 2026 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9UVa98c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DB3CEB8B;
	Thu, 26 Mar 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521358; cv=none; b=pzdKM4I0pq494P9MJu3RP514K5XszRGkWZgnDkIvHInd6PMHcTICFQJI0QsxNZPRkcKxXrjGeQW+esi41P4XdFULy5pM3MhVw10AO+7nSeDnQMoWv3/CWAysjTLGOafYSFRrNfQ+MZohugmT8DYxQ2O0QanCB2VIWwfqm6jJOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521358; c=relaxed/simple;
	bh=b32qHTKXjpSnZrbtJAv177UQRXvdTsBz2RKIMlOmm4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddvWH76RdNWgg25Rb3kiL49ZXgrWqPB2UVR8/0BZULgqMz6yQTzwRl2/YyR+aMjDwVNSpbPoMKnHVS5NELsc7IaR6VwQjtGx90f5Y/tVssqsAHSsmLYvrUFa+1lSw9eQfZDk2eZYHUDMd0F+AygHIXgXnquTD/vrSDuf4sevVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9UVa98c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774521357; x=1806057357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b32qHTKXjpSnZrbtJAv177UQRXvdTsBz2RKIMlOmm4E=;
  b=k9UVa98cBf27Hu1yRZQFJBEjr2/D3DLJzotVgXLZM+yGzMz+eiV1OTxs
   xdJKScUy0mEzuBDGZWeQs6QkoD9pQFoNg1xx+p4FBhJACkvNxGjyalDvu
   U72ls2It9F+TdkWvqkr3HXbMx6+wOkLb1OVX8Pq2ocfIfmVWbu/UwlfwF
   0z3Ew4k10sRcDLJ/uA0tB8V6aygQB/yCiCWTrxTTr7O9ZLrNkOJhmn/aK
   +b44mjWl2AtlL/fUr5ZsiwmEMFAi2yfkHmu/IMfttke/Bz0zTW8sgYDzc
   D0QqYK19oXInaUjkm6I2b9k4LDAHOALpU3txVQ50bwLV+daCP3GkpmiJM
   A==;
X-CSE-ConnectionGUID: 1y3Fmg6IRKukiNRqSjq/Yw==
X-CSE-MsgGUID: Bmpi6KpwQNOeJuOLAKCc6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75770525"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75770525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:35:56 -0700
X-CSE-ConnectionGUID: D5/fw0X1RlGmgsqNrq2HCA==
X-CSE-MsgGUID: 8g6/ST8XT/CuYyBkutYnNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="262879882"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:35:55 -0700
Date: Thu, 26 Mar 2026 12:35:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: intel: use FAM for communities
Message-ID: <acUMB5OUGCpy73eW@ashevche-desk.local>
References: <20260326023627.54349-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326023627.54349-1-rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34199-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C20D1333B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 07:36:27PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine allocations into one.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignments to after allocation as required by __counted_by.

I don't think it improves readability of the code. Also see below.

...

> -	vg = devm_kzalloc(dev, sizeof(*vg), GFP_KERNEL);
> +	vg = devm_kzalloc(dev, struct_size(vg, communities, soc_data->ncommunities), GFP_KERNEL);
>  	if (!vg)
>  		return -ENOMEM;
>  
> +	vg->ncommunities = soc_data->ncommunities;
> +	memcpy(vg->communities, soc_data->communities, soc_data->ncommunities * sizeof(*vg->communities));

This is a mess. The multiplication is used without overflow check and the parts
of it are from different data structures. If we do a such, we need to use
source data for the all of the information.

What I would like to see is rater special devm_kmalloc_and_dup()-like API
instead of doing this in every driver out of dozens of drivers.

...

> -	ret = byt_set_soc_data(vg, soc_data);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to set soc data\n");
> +	vg->soc = soc_data;
> +
> +	for (i = 0; i < vg->soc->ncommunities; i++) {
> +		struct intel_community *comm = vg->communities + i;
> +
> +		comm->pad_regs = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(comm->pad_regs))
> +			return PTR_ERR(comm->pad_regs);
> +	}

Why is this can't be kept in a separate function as it was originally done?

-- 
With Best Regards,
Andy Shevchenko



