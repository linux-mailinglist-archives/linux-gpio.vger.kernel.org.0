Return-Path: <linux-gpio+bounces-31148-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JP0IreQeGmkrAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31148-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:17:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F5929C3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C79793055E50
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5881633065D;
	Tue, 27 Jan 2026 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj13Gbjk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF82E7621
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508757; cv=none; b=keYE413DtY4WYCjWYB4zMZNi0yLX5jle83tmM6YsRm2rvuCxu8L56eaRIq1ngT+6bktDbo1ElwgQU9sB0lghN7MZlnkxE2ts90vt/G0lCvEwisiveppOeVC1mgjjVpPVYCjMtyLsWZgUcjmVOzCIkdUg2pJVIlR7dS0hNj6EkHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508757; c=relaxed/simple;
	bh=CNKg+pRbxdUrxyMflI5IVVyoRMjWnEusXY2D9nCjkag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOJsuOHNteu4JqGCVWjhTfAeXmySoR28n4ZLMudtdCzE1oOWZcXLlQC1IpCEsjbGfZmuS4x7ZrR+Aleni/sox42tcbQ8qCUagVsxsyG7dJxPhR5w/1LO9y88b8Nzg9+1EUKZwEj5hQObkhwdp5ZoL/KvgGULvt+2SUtovBMDH6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj13Gbjk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769508756; x=1801044756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CNKg+pRbxdUrxyMflI5IVVyoRMjWnEusXY2D9nCjkag=;
  b=aj13GbjkK2fya8NUEoR2PS0IVsxSq05n152BIK+gxIBkQxxLIoqavw5/
   nv5yx3maf9PKYiBgbFGnsgsO+UrN86+cSnrMyGRXMzuoS2t6JdbhuRm3v
   +H6mieZmIVhhJkw7SHm/6CBt/sSZVcObYkemANdQk/VvVstkTLA8+axZr
   3rFZLnNd63jGzfz+Palrl8K0JKixj55U5KuINLDE5IsWliWg4+8kpc6iA
   17WqVzwovLbEXqllYexMGacRnh8uXnw6La2H5sa3ChJ4bDwmnZTH2dF4q
   AGMjtENSWA13/DxIOitDY+00Z6/uSp+qyqpEJN2VO48CktA0nTIO0qs++
   g==;
X-CSE-ConnectionGUID: OGMgsXAFSEe04ojrPz56cg==
X-CSE-MsgGUID: jQ1fTrR0QWSWhM+2KJ2koA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81333595"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81333595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:12:35 -0800
X-CSE-ConnectionGUID: sruxut+FSFGIkicNH53G7g==
X-CSE-MsgGUID: wgjiFrvXTvGRFGPw6Bkdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212915702"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:12:34 -0800
Date: Tue, 27 Jan 2026 12:12:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.20-1
Message-ID: <aXiPj65Bh-Juzi5I@smile.fi.intel.com>
References: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
 <CAD++jLn5AQP-+OcYqw+05eprJDMv8u21UOdEos4=P4GRdOBaLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn5AQP-+OcYqw+05eprJDMv8u21UOdEos4=P4GRdOBaLw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31148-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA5F5929C3
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:54:09AM +0100, Linus Walleij wrote:
> On Mon, Jan 26, 2026 at 4:04 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > A small but important update to Intel pin control drivers. The main thing is
> > documentation fix by Raag to make users less confused about list of supported
> > HW. Everything was floating in Linux Next for at least a few days.
> 
> Pulled in!

Thank you!

-- 
With Best Regards,
Andy Shevchenko



