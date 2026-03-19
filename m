Return-Path: <linux-gpio+bounces-33795-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA4THGKfu2kLmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33795-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:01:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D354F2C7094
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D38BE320D85F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0817939B975;
	Thu, 19 Mar 2026 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3yAn5zI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0783815D1;
	Thu, 19 Mar 2026 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773903483; cv=none; b=J2KtncF4hEMdTwwz/PbVActiSFL4UJ/9eSgI8NxgBEy5+an6Zu3wCHSKtXi/qn4gb24T+Tmb1G/C+U/aF6DrLRaTYHEL0RdIMW3excQ45ixJ8JqzQarvT8f08eQ7rzMoq2qMNou52GErYxN1hP5e/nhGM+6grkzS14yl0AWEXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773903483; c=relaxed/simple;
	bh=t8hT6mWpjp3vxM3muTEUoLbjhCO2cMgThzalJCWlfIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuvQFF0fh/ARzzNOUeQtrm340SjUonaLEGTEuvBsVDTfbdNK+fYZGnAMTc8RrvZQd9dLBjf9T9ZykMldpdlUu5ll93CJzXgUypcU3NeADxnhFlbyG4vvvceKwPk0JrQw+/iIg6PEa97IX9kgduGSnc9U9Bvr/rLErP46ZF7jaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3yAn5zI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773903482; x=1805439482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8hT6mWpjp3vxM3muTEUoLbjhCO2cMgThzalJCWlfIE=;
  b=e3yAn5zIaOf0Zc1+ONt6TQInBJCO9uoU4+G8OThSww5bQS1Cl8HE5QQm
   wCTUy87dAYjKJDafQv3LK7J+Yo5TkHPjPGsycqLlKn04dxTgaA//RFgiO
   1NhG61tn729S0PqaSs/+9pnRtm9MrvHfkxnQg2a6Rvi/0fw1kwpSvtK0p
   Jpb4G4lNATO3ZGg9iEbWr9lKuTaEgb4cN3apWmL2K7dB3Wi8T3qKl6EKp
   nAyqhuXlY04p5T9eRunM3EU1S7C/u5GFMVhr9HQdoPetj3CgeZYWMq1vi
   uRWYOD3FgQD6Z6zPu+m+w9Wc+u+uFVNqIDy5ADVnmGUdC7M5iwnED8Eap
   g==;
X-CSE-ConnectionGUID: Z4yx4w4+RteGc3kSzyfxiw==
X-CSE-MsgGUID: q0r3m7c5SyKH9dQKUAufcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85671616"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85671616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:58:02 -0700
X-CSE-ConnectionGUID: o0SYFqfeSlqpnE1pq/27Zw==
X-CSE-MsgGUID: XX51E6SfRoWjAhz53NIXvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="218813473"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:58:00 -0700
Date: Thu, 19 Mar 2026 08:57:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 5/5] pinctrl: intel: define iterator variables inside
 for-loop
Message-ID: <abuedvr8_FauBMJW@ashevche-desk.local>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-6-andriy.shevchenko@linux.intel.com>
 <20260319060221.GP2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319060221.GP2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33795-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: D354F2C7094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 07:02:21AM +0100, Mika Westerberg wrote:
> On Wed, Mar 18, 2026 at 04:10:19PM +0100, Andy Shevchenko wrote:
> > Reduce the scope of the iterator variables by defining them inside
> > the respective for-loops. This makes code more robust against reuse
> > of the same variable in the future, which might lead to some mistakes.

...

> > -	int i;
> 
> If there are multiple loops, I prefer to declare the variable outside of
> them.

Why?! It's exactly where it make even more sense to hide.

> If it is just a single loop then for (int i = 0, ..) is fine.

...

> > -	for (i = 0; i < grp->grp.npins; i++) {
> > +	for (unsigned int i = 0; i < grp->grp.npins; i++) {
> 
> also why you use "unsigned int". int i is fine here.

Because grp.npins is unsigned. This is the common sense to use the same
variable type that's used for the (upper) limit.

> >  	}

-- 
With Best Regards,
Andy Shevchenko



