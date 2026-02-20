Return-Path: <linux-gpio+bounces-31931-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s1tNDFMQmGmL/gIAu9opvQ
	(envelope-from <linux-gpio+bounces-31931-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:42:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D7416558A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B860C3023357
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 07:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B3335979;
	Fri, 20 Feb 2026 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfH/ImPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B431DED49;
	Fri, 20 Feb 2026 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573326; cv=none; b=oge0QHDICYgWBGg0/Xxj0QN8Z78wBIWrIWeQHw3sugZ/oFZ4drBOheXYGMzP8IIEfrBEdk4CcTnJQ5XahpxqEYtLiIWVs7cpCom5pBwRUDZPCKE+C4P9cZ4h/pFYlPg98lEnrcTsx9WVhq9VNPZPWHOAZV70vy5WRyOGKLpU2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573326; c=relaxed/simple;
	bh=9d/ClPWa9fqFfMxzzKN52248saUlN4dnIib8GrzZ14o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZiLX9Qt7lC7MQv1LM5Bv7eJwTl50RyHcwVW0pst+jyhCZEmMC6nj+5IyQNETV4eZ29HKxHP01jcosadM9GseS/F8EfxcteDdJ/38qkC7urxwL2DzFG7E+gsdRkQbqe1szTuwEUH2B6pTbenGEffuXZmwkEZ9CQqoHOQfhGhCRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfH/ImPW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771573326; x=1803109326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9d/ClPWa9fqFfMxzzKN52248saUlN4dnIib8GrzZ14o=;
  b=dfH/ImPWlwiA+rtfAelVR0j07EgtldWpBcHUcqOstWJLfqXbEGb08xZ3
   Upm/yeUDnlSdCGKVtwX321MTSJ1YiBX1eeNrHXVmFvke5puHzc1INZOc7
   p3GWSCNebTevEomTepm7RsNjZyb6ycgT9nP7eqecLtfmNQwveGZAnRVuJ
   51yTtonJQd/b+RJCmQtMFZb/d87FFT4bJnaAM5yE4Z0v2Ev07MQX8a8Sh
   F9eqMlfxi61JC/hHd9+JI194ow01zj/Pv5y4f9ITzgjArkbmD0bo84yzC
   BRm79jQzQp0voHBm7eIDrcz+wGQq9h1Pxe0dfF0dSoOVUQ4cYEMUdQqwe
   A==;
X-CSE-ConnectionGUID: Nb4tajebTsSvFRQy3ohz6A==
X-CSE-MsgGUID: VXlxibsASouDkBpL/qL84g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76281186"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76281186"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:42:06 -0800
X-CSE-ConnectionGUID: +DaGzeM4TgGHKy4J7uvGbg==
X-CSE-MsgGUID: inBFgepiSCCKnWddEakdbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213890279"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:42:03 -0800
Date: Fri, 20 Feb 2026 09:42:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZgQSJULgJTxOVn8@smile.fi.intel.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org>
 <aZdkN2zje5CEaar_@smile.fi.intel.com>
 <CAMRc=MfcrD8NNh+8WaO_3BYG8Eqoi5wz__s7AeCR=rt1NkWrkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfcrD8NNh+8WaO_3BYG8Eqoi5wz__s7AeCR=rt1NkWrkA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,oss.qualcomm.com,kernel.org,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31931-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72D7416558A
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 03:18:24PM -0600, Bartosz Golaszewski wrote:
> On Thu, 19 Feb 2026 20:27:51 +0100, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Thu, Feb 19, 2026 at 05:55:20PM +0100, Danilo Krummrich wrote:
> >> On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:

...

> >> Also, is there a reason why we need both device_match_fwnode() *and*
> >> device_match_fwnode_ext()?
> >
> > Yes. We don't want (at least for now) to dive into bug hunting in a 2+ years
> > horizon if something goes wrong with [currently] working drivers that use
> > device_match_fwnode() against the cases when there are primary and secondary
> > fwnodes present.
> >
> > I won't put my bet that extending device_match_fwnode() won't break anything.
> > And I don't want to invest (waste?) my time to learn each of the existing cases.
> >
> > The proposed way is robust and safest. And for the record, I will be the first
> > person to push back device_match_fwnode() upgrade without a comprehensive testing
> > on real (affected) HW.
> 
> Who's got the final word here? I responded to Danilo's email saying I can fold
> the new code into the existing function but you are against it.

Of course I am not a maintainer, but as I said, I will be not okay without
proven tests on the real HW. It's non-trivial change as it may lead to
a problematic behaviour that one may not observe immediately (it might affect
1 out of 100s platforms). So, it will be hidden till unknown point in time
in the future.

I prefer safest way. And then we can convert case-by-case without hurry, which
is the usual cause of the subtle bugs.

-- 
With Best Regards,
Andy Shevchenko



