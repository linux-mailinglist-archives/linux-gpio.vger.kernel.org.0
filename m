Return-Path: <linux-gpio+bounces-33802-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D01O9uju2kLmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33802-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:20:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAA2C7340
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AC7530185E4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E4839D6CF;
	Thu, 19 Mar 2026 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1tZvNos"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0F530FF08;
	Thu, 19 Mar 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773904857; cv=none; b=ddvvPm9Sf+w/b8PxA6Tz1GfrN4i8j7oWap02fY3sHFaxHY/GxUW27+A12C7oeA4bFYASkrY9ijoL5NSU0fiLhXZJnRjRToHbhCcUSjVPShkAg6bYsP0VzVn4tFM4f3ieXj3R15kDj8R+QTzesEPRRnKAge1BadO3ddpEbmhgBFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773904857; c=relaxed/simple;
	bh=GvmoTY3f5BeOV2CwjNKsWtylJwqFZctjHmIXVlZ5TfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIbjCHIFJSLGAVZSstb3rqlMdCfRwNG0/Tmfp+cQHhntvOkgBbkzp+Z98fRb+np8qOpRzxkmtSA+50s5Jch4N9YFcbHCxzd431uNpoHkh9uPr34stWJoGjRjtEVBjqFJphjLvkkuF481EOdsFSwsZrx3DyBvHB+1wKFbd25fYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1tZvNos; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773904856; x=1805440856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GvmoTY3f5BeOV2CwjNKsWtylJwqFZctjHmIXVlZ5TfM=;
  b=n1tZvNosNx0iMVTUtUPjrIR9D2DO6uh8VzUkHpycS+YzO3NPjTXHiBHV
   T6zWYum0twUCeflZNpkAwYxHzIW7dyoQQchzeR6pSwCDFMDG/Lkq2JVh2
   7fR8YLmHjYu2RtCaeAZ1lilJkFEVWm961jU6L8FkYpFhvBqsItHSvzXem
   6u6h3WUaYbro64xfdMsM2eSfyFRfws0/d4KZ0mOuC6wqSm9sGyb8bD+4m
   YVkfcokBaSb7kmGemtAU0eZpRScYT16e59g7yDYd+zAlKU7FBl/OI1bpO
   Azbf/KUs/N16KNPbqlq4HXsK0RUcMOXwA9Rhn3uzQXqcG85pUnxBe6o7Q
   w==;
X-CSE-ConnectionGUID: fj2G7ULJTGqecfJolE2jxA==
X-CSE-MsgGUID: IkT3HrthS5yMCxpXX7ai3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85674057"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85674057"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:20:55 -0700
X-CSE-ConnectionGUID: IxMUohoxTNiDJNV+xfi9xA==
X-CSE-MsgGUID: qy5sxI2sRA6Zc6jZiwCTwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="222860451"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:20:54 -0700
Date: Thu, 19 Mar 2026 09:20:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 5/5] pinctrl: intel: define iterator variables inside
 for-loop
Message-ID: <abuj05EIZcO10wQa@ashevche-desk.local>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-6-andriy.shevchenko@linux.intel.com>
 <20260319060221.GP2275908@black.igk.intel.com>
 <abuedvr8_FauBMJW@ashevche-desk.local>
 <20260319070925.GS2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319070925.GS2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33802-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 94DAA2C7340
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 08:09:25AM +0100, Mika Westerberg wrote:
> On Thu, Mar 19, 2026 at 08:57:58AM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 19, 2026 at 07:02:21AM +0100, Mika Westerberg wrote:
> > > On Wed, Mar 18, 2026 at 04:10:19PM +0100, Andy Shevchenko wrote:

...

> > > > -	int i;
> > > 
> > > If there are multiple loops, I prefer to declare the variable outside of
> > > them.
> > 
> > Why?! It's exactly where it make even more sense to hide.
> 
> I disagree.

Why? Can you give a constructive feedback, please?

> > > If it is just a single loop then for (int i = 0, ..) is fine.

...

> > > > -	for (i = 0; i < grp->grp.npins; i++) {
> > > > +	for (unsigned int i = 0; i < grp->grp.npins; i++) {
> > > 
> > > also why you use "unsigned int". int i is fine here.
> > 
> > Because grp.npins is unsigned. This is the common sense to use the same
> > variable type that's used for the (upper) limit.
> 
> No, just use "int i" there. Compiler is fine and this is more idiomatic C
> anyways.

I can agree on this, but it (in this case theoretically) might lead to subtle
signdness issues if compiler is not capable to see the upper limit and predict
no overflow or wrap-around.

-- 
With Best Regards,
Andy Shevchenko



