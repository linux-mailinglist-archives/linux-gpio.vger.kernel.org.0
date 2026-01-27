Return-Path: <linux-gpio+bounces-31106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNIxF+V7eGkFqQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:48:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5DC91421
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E08A301BF5B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 08:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F632C0270;
	Tue, 27 Jan 2026 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDtDEy/i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB03126C02;
	Tue, 27 Jan 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503696; cv=none; b=SRaBITcglpTyd61siqcNB/hGp7rapYahvmsoS6o7q4MSPlhhEz7lHBJtvrt4P9iHRK7/EQJmj1Lc5CfOnR2iG4iyc212IT0/DPyRQy/SJPFyWemK36upeNF+6UdLguOuL2dF6AUyo08xvUqF5EjE7UUJKMnmYgFlnDOqV480h+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503696; c=relaxed/simple;
	bh=QPfOxcDUpuO2/1G3DNexCBmoPtKGK5VPm6mvHYEI3x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXy8hpglI88QAMIsdLL7fyKZWuhnxQq5fz/WnZBPCxRK83nEDgUBqP8RE6ESCO3+kQVjOh4f8raGgzUkl2aELH89kAEDALyFJgsT9axVaJx32+uXVN0xQR5Ez8H5fTE2Pr03EplhnO1EUKJBf3w4oWdfiDdbcfMxxgMrYl/7GaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDtDEy/i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769503695; x=1801039695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QPfOxcDUpuO2/1G3DNexCBmoPtKGK5VPm6mvHYEI3x8=;
  b=hDtDEy/iXNwEy4acZ4I6ZDEpGrr+QkYDwtgFjCcBvLF/gcVklURg+6SO
   VZNRNsu9pcUh3T0YYFktBQ0X4VrkYTBY6PR9R3TA6lDG8MFG9lCMr9W7F
   Wlc2nYS/q6kutUExfFEuKFBQwh7enyOjeTdo9X6Mj900eEYSRLPJFzuJF
   sqhpEB84nMQkXxTFOCP09Sd+JEgmGZXWiDEFxJ+P/TP932xNFvJGpcTbe
   shgCmBA+MgWChHRbAhMqLvuHg/MCrzebVmqAq+ZQRCi33onqU/WcT1cjo
   upE57iuWdjpwRNZVJA2xW1g0mEJq6Mw5DV3q+DobzwidxMBLVf1RENY4b
   g==;
X-CSE-ConnectionGUID: VerAglh6Rne4iO1TmAzpOA==
X-CSE-MsgGUID: pvRT5nDKQJ6iDeo2wjl8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="80997271"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="80997271"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:48:13 -0800
X-CSE-ConnectionGUID: 0r41CJhdTM6YTDt0u9Xa+g==
X-CSE-MsgGUID: 7e7xJETVQeagfglfTziUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207811965"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:48:12 -0800
Date: Tue, 27 Jan 2026 10:48:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Rahul Tanwar <rahul.tanwar@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: equilibrium: Fix device node reference leak in
 pinbank_init()
Message-ID: <aXh7yfEmOJ0zsLb0@smile.fi.intel.com>
References: <20260127-pinctrl-equilibrium-v1-1-6ae094ac3bf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-pinctrl-equilibrium-v1-1-6ae094ac3bf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31106-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 8C5DC91421
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 01:30:07AM +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_fixed_args(), the caller is
> responsible to call of_node_put() to release the reference of device
> node.
> 
> In pinbank_init(), the reference of the node obtained from the
> "gpio-ranges" property is never released, resulting in a reference
> count leak.
> 
> Add the missing of_node_put() call to fix the leak.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



