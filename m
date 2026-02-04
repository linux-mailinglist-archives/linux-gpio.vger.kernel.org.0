Return-Path: <linux-gpio+bounces-31436-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N1gO+NHg2mMkwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31436-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:21:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E3E656C
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61CE0301FFB6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 13:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D4027AC54;
	Wed,  4 Feb 2026 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlHJMn3T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953BA1917F1;
	Wed,  4 Feb 2026 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211260; cv=none; b=fionq3FvwbCOE6Rs4VxLPW9oq2QOUsgLZp8yDiv8ZpR95oikTmAEo58WNLSC7AxpocwQxofDshLSJ+Jcq9Lv/R+zHRKwuqlpttCu0CpWGv47ReqX5kkzfKU394sQXdcnkQX8BbX6ERxcNh4n5XTKVfXXjIZP3uma/CeRTPILJ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211260; c=relaxed/simple;
	bh=NmU7gd8Ov3n/Mis8uX0V/ASb17cElZb1SGA1o+x/4C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qydzAJyJb9w0zTFtqaW3beSG83GL8++TN9PHFkpqKysOcQiauzQ3jFBCvh5EoJSUH7jucw0pFNh9ndsGI5kQZ7IR6ZN+hJPt/5Fxj5RCw+GVGXX1/89lkMGArDZuY8hvaw8nkdWNpAFnDJWXSA2r7bPIbBiaEP+dCzB9P4zhn1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlHJMn3T; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770211260; x=1801747260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NmU7gd8Ov3n/Mis8uX0V/ASb17cElZb1SGA1o+x/4C0=;
  b=NlHJMn3Te41T7FGjWyS0RdLW4qkP7ksz6vcSjmi3FLFjiWw/67fKp2Px
   JdLZOXMdHwdI/lw+ED6/NtijpV7jCqPakuyynYvSgkBksxg8KjwQWvH3Z
   t0240kG2+4wyRsKpYSClqWa0+Lkps8gOzD0/nBJ2ZyNTLsY18I/0fcyqH
   9Wdlkcxg9j8Z30gMG6ighFn8TQOIBYthXm7Z3j2kVmySaRcXBLlUtcrqp
   3t+VkLBsU9b6Y4IAAtqiiWC4VQ58kAJqWYb528uIrWiV5SL9t+DpeFW3S
   BAjNYwGrwwXIM8a6+Slk9XM9JGhUC1IfYwX044N3sZN9Et6yLJ3yS2wCi
   g==;
X-CSE-ConnectionGUID: Ak+TBAk/QIu3AbvwtNvN6Q==
X-CSE-MsgGUID: dAyMd7ZtRqelpyx/tMSaoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75251269"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75251269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:20:59 -0800
X-CSE-ConnectionGUID: 22HD8Ba5Qom4QKs+F0Imbg==
X-CSE-MsgGUID: vER8M9SVQyuD74lRo76Kqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214650233"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:20:57 -0800
Date: Wed, 4 Feb 2026 15:20:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Align Copyright note with
 corporate guidelines
Message-ID: <aYNHtw7QumfvgeX8@smile.fi.intel.com>
References: <20260204080122.2300224-1-andriy.shevchenko@linux.intel.com>
 <20260204123727.GP2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204123727.GP2275908@black.igk.intel.com>
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
	TAGGED_FROM(0.00)[bounces-31436-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 4D9E3E656C
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 01:37:27PM +0100, Mika Westerberg wrote:
> On Wed, Feb 04, 2026 at 09:01:22AM +0100, Andy Shevchenko wrote:
> > The Copyright note must follow the
> > 
> > 	Copyright (C) <year(s)> Intel Corporation
> > 
> > template, where (C) is always capitalised and <year(s)> either
> > a single year or a range. Update the Intel pin control drivers
> > to follow.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thank you!
Lunus, can you apply this directly into your tree, please?

-- 
With Best Regards,
Andy Shevchenko



