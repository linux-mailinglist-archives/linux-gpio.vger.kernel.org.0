Return-Path: <linux-gpio+bounces-31241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALwQBnMPemmS2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:30:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530BA22A3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B5603051D39
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0588352FBF;
	Wed, 28 Jan 2026 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0VcBOAx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57895352C52;
	Wed, 28 Jan 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606912; cv=none; b=bpx3uixuthbHDA8jUHS8Z1/ty+S5Cme6LQ0R0GkVAfqNrjRlDhlu6PWebhvFkt43YLqWkh+yJotToMwFHZ6NglVowIwb5SyPN9lcsqqEOj6fvZ4utgGWn3zbmkrSS7dVak2exc53DtgoBgiPxPAJ9KmwGwYKRCPofkZrbfe2d+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606912; c=relaxed/simple;
	bh=dhloGWJMs9KxSZ6SGU8SielmPgkg7h9Rh2rW/qrVcE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjKQQljrZNzGooVtx+IGcHtc38akc/ua8VnNGAfGv47b1YgTQvIDOd9AkvFPHbsPtyCUqzoKMBLDrdi8KvQKxYA6exwBEj6CB53w3gwaQSAOzyCJXgfPeefbh+JY+oNXS0PREIace5y7yCz08/ypa+H7sw7qbfYaSEWHHbzTeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0VcBOAx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606912; x=1801142912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dhloGWJMs9KxSZ6SGU8SielmPgkg7h9Rh2rW/qrVcE8=;
  b=g0VcBOAxGKIS28pxzSybyUlzqXpMKX60GUKv9cjo7p2JqrN0jPcI8fPm
   wVNY5C3DhMs+4ogcprSypRWXotLw0dkjQYeGvV2qUFVL6yMvxL1XQ3iNi
   VezBzmt2uzaaeG+Dows4+8fddgyFiZXWhX5M1+V9qjMH0/OzjawLNVKDC
   EtClHksz6CROziCzvIsbxM6qqcJkyq9E90KRYYb33QkxkZ8ZwkWISakTN
   wnlvFQ/leWgNFjGr9fRTMGk4pBCjTX28wTyVA1VEhTwHiWmWJeowzVhd9
   yVPntA3G/tq8PfO/yPKgW6UoK20jdbIDwkzHBIj23IJFcrAW384eXfW6m
   g==;
X-CSE-ConnectionGUID: bTO2VSv0ScmMJqF4k4uGKQ==
X-CSE-MsgGUID: 21E2l1UnQBGSBV7LebbT/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82184649"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82184649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:28:31 -0800
X-CSE-ConnectionGUID: tUskWTqmSqukESViGT/kAw==
X-CSE-MsgGUID: xK1f5knyRgq0vTN/b0QHiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207400944"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:28:29 -0800
Date: Wed, 28 Jan 2026 15:28:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Remove duplicate error messages
Message-ID: <aXoO-qM0dcf9gLji@smile.fi.intel.com>
References: <20260128125128.44508-1-andriy.shevchenko@linux.intel.com>
 <20260128131940.GP2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128131940.GP2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31241-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6530BA22A3
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:19:40PM +0100, Mika Westerberg wrote:
> On Wed, Jan 28, 2026 at 01:51:28PM +0100, Andy Shevchenko wrote:
> > The pin control core is covered to report any error via message.
> > Since that it's not needed in the callers.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



