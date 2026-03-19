Return-Path: <linux-gpio+bounces-33809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF98BSnUu2k4owIAu9opvQ
	(envelope-from <linux-gpio+bounces-33809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 11:47:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A51692C9B6B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 11:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EFFD3213384
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63043C1997;
	Thu, 19 Mar 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJyqzsFT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5CB3AEF2B;
	Thu, 19 Mar 2026 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916895; cv=none; b=JsCFH06Yogg0Kfv8z5Zs3EMhOdGjRE0rm/oZVldHgZJFnm1OdPyy+Vfh6VuxBfKoP3xDLAMJMiuN454GiMovu4Zf1w6ChPkcx1l6l5i4s5C/GngUq4AtmjMVTIVrK2c2YL5Whdf/1gxylHZWtw/S78uCUbNOLC3yUU0oYrF0ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916895; c=relaxed/simple;
	bh=Yh5rXitUzlFimADw7HSOcupMmucskxa3HXNePiJhcso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLN0ipnByRVndRsXRHDifkaBe7HPe2i5gglAQQlG3pLPyUlZ/UUjS+HchifKtkM4yC/tmpEMuBfTA7HJbMgVM6CCdekhwr7UPNH249HTclhofwQiZcfBHVYNKSvWfX0Kz3OXfGWzj48uk0XJjYyPGnkwOTIvInO7qYCSOc11A8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJyqzsFT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773916895; x=1805452895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yh5rXitUzlFimADw7HSOcupMmucskxa3HXNePiJhcso=;
  b=cJyqzsFTuk2TzwsWu61AD+mgjjtnvaQvc/LPLf/MHxq+nzdlAhkubnxp
   MsxVN0C0ULtCg/w9/MrLM9jSnzCQPAHErSOMNOtkl+/vBxI14l+NP6NFz
   nUeZ4XkmROqCI/ldFWbdzBjL7zegXNySfz9+vzuVVkgnnwut19of/U2BY
   WVMgtneynC1C4Tg+KQLDaZDqck5kShE2VnWIrh4h6oFYT0Eohii5SGmas
   i+rmD6vtKhyoDRDu+gh+dPMU1Smj05Q2JKzgTxvAgkQ4vnbgLnKE1pVHu
   e/kuUuGMkQRqhdEDbNVFBXan40ZfXVrS4vfFVYt5D4161LAVCzGBq8hxb
   g==;
X-CSE-ConnectionGUID: PI6zEkHEStiOmQGYfYCb4g==
X-CSE-MsgGUID: hP664elcR9GLt/dhVBwrlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85302688"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="85302688"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 03:41:34 -0700
X-CSE-ConnectionGUID: TbDEzxw1RW2DSe4DKCZLmQ==
X-CSE-MsgGUID: NNc+VqSHQreSbS0VFZtJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="220319671"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 19 Mar 2026 03:41:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 960CF95; Thu, 19 Mar 2026 11:41:30 +0100 (CET)
Date: Thu, 19 Mar 2026 11:41:30 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 5/5] pinctrl: intel: define iterator variables inside
 for-loop
Message-ID: <20260319104130.GT2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-6-andriy.shevchenko@linux.intel.com>
 <20260319060221.GP2275908@black.igk.intel.com>
 <abuedvr8_FauBMJW@ashevche-desk.local>
 <20260319070925.GS2275908@black.igk.intel.com>
 <abuj05EIZcO10wQa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abuj05EIZcO10wQa@ashevche-desk.local>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33809-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A51692C9B6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 09:20:51AM +0200, Andy Shevchenko wrote:
> On Thu, Mar 19, 2026 at 08:09:25AM +0100, Mika Westerberg wrote:
> > On Thu, Mar 19, 2026 at 08:57:58AM +0200, Andy Shevchenko wrote:
> > > On Thu, Mar 19, 2026 at 07:02:21AM +0100, Mika Westerberg wrote:
> > > > On Wed, Mar 18, 2026 at 04:10:19PM +0100, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > -	int i;
> > > > 
> > > > If there are multiple loops, I prefer to declare the variable outside of
> > > > them.
> > > 
> > > Why?! It's exactly where it make even more sense to hide.
> > 
> > I disagree.
> 
> Why? Can you give a constructive feedback, please?

I think I did already.

If you have just a single loop it's okay. If multiple then it makes more
sense to declare the variable in the outer scope. This is at least what I'm
used to do and prefer here as well.

