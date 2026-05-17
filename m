Return-Path: <linux-gpio+bounces-36982-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB4JHqh4CWqObgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36982-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 10:13:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C355FED5
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 10:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5EEC30097C9
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 08:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F9131715A;
	Sun, 17 May 2026 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBHG8bHV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B57305698;
	Sun, 17 May 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005600; cv=none; b=TBOe5JxA1/WWmhyzvNDBeWV3ioXeXF/LXmYePJe7IQz/09aT7SYpKBnqT++w2DRwDoAfzhqdl1+h6Q0uSE15h/skuZSOKt5Zjr+Pwp5I60y4Oe3gCSkJ4EYTsT9yUXp7RhPiMP6OZEBChahN4Q0w/OlbTkbZQn5h0Fz1NgCutCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005600; c=relaxed/simple;
	bh=woV7LRuuwib4HiCRjc8rygbY/oFkZTFF4Smq9LQtz8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzcC7yGw+jcbuSWaj45eP9LNxG90iqTv/3VlzeaDUiXj0solGmXGe3efjOMZJeMNL/r3Jcu6vK9E518UognY1GXKYZuWy6bu+pFAuD0vNFWaw7+nrFrlHOASJMaLJP8SgSDCtaTUE6mcI7KxQLTcx/ogjLJSnJzgk3DihaRupjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBHG8bHV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779005599; x=1810541599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=woV7LRuuwib4HiCRjc8rygbY/oFkZTFF4Smq9LQtz8c=;
  b=LBHG8bHVFLxl+zceHtieFH69UOchepkxyy8xcGLTQLUXLEwHGEBMratg
   YTvBemgrLcpFYbpaSnqE0kDVRm+2NkrEPbUjDiGrvrhRSObgbpjFq5Vhc
   ErEf00SEXkFckESnWtoJod/+bQt1Dw2dZqgfumxHUX0tVLMI/uRUn1IJa
   Fca2MFvThr59W2hP/BPwETcHs7XVKkTiPsljr5O+6ZARsNv5LNLjKhZbE
   il7RLBA1TufnUnNhYaRmYxuRm1RyFFs6NO1SNYHYhZl61rVL99CYD0BpK
   6InjTHxen8E+UjaBKgH7p3XXFOsulVVchYHOuTEP2Kze7tCoGDmsmPlwJ
   g==;
X-CSE-ConnectionGUID: HeMcygmzQUi8TGU3elQb+g==
X-CSE-MsgGUID: TcMynJhKT1eyJg45aTTiyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79790406"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79790406"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 01:13:19 -0700
X-CSE-ConnectionGUID: kTyLDAcTQ/CFO3YgO12mKg==
X-CSE-MsgGUID: iORp0OTZSb6GHyWjPc4zeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="238996941"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 01:13:13 -0700
Date: Sun, 17 May 2026 11:13:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Lin <thomas_lin@lecomputing.com>
Cc: rafael@kernel.org, lenb@kernel.org, hoan@os.amperecomputing.com,
	linusw@kernel.org, brgl@kernel.org, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, broonie@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com, jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com, lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com, braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com, will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com, ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com
Subject: Re: [PATCH v2 2/3] spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
Message-ID: <agl4lrPIRNuKDzP4@ashevche-desk.local>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-3-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515110322.2883310-3-thomas_lin@lecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 226C355FED5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36982-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 07:03:19PM +0800, Thomas Lin wrote:
> Add ACPI ID "LECA0002" for LECARC SoCs. This ID requires a custom initialization function dw_spi_hssi_no_dma_init() that sets dws->dws.ip to DW_HSSI_ID.

It's way too long line, please wrap around 72 characters.
With that done, you may add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



