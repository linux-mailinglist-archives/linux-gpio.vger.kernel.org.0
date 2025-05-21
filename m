Return-Path: <linux-gpio+bounces-20413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03FABEFD2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E954E2D92
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA90241673;
	Wed, 21 May 2025 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RF9GDhLR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742C312E5B
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819923; cv=none; b=DLfW2cyBzgb6tdGUU2J4UXCBj4N/ZE8XoHfzBVWiQODn9E7lRrmKY5BYYaTkB9K/2XtH61bZXuYY9/SN5bvZZ/090Ji7Ez0yPZTSMNbx2fdWaPPeHUNmcrQhGPSjiv5taE3/vYz5EiN7rPJl71WSdH/vTifDRUb1Ibn0Hq2Vux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819923; c=relaxed/simple;
	bh=ZuJ+7SrVd5m134L/QVtLKco0PCEQPtzzVrVGosw1DbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVl8vitqDIclRoGudgiH5kqKc9lb0Oupa5g9gyH5rvR5CSAZ276+w/OS6OPVsxMZpDCTMRTQu/KcY2MO6rwxY4ECD7ZBhO5NLeG0sOusgz5zK20zBJwXDcM50oxIIMjV5zee/WEUzSSy22unNHhrEq417YPIxeLH5CKwe1vXRn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RF9GDhLR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747819922; x=1779355922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZuJ+7SrVd5m134L/QVtLKco0PCEQPtzzVrVGosw1DbI=;
  b=RF9GDhLRCjfe6+u/CUM6cFJEbAiSI/raBoW+G7eNri8R2K2jGMeaTkXi
   xeex+gYXn4XTLZyBvgVh6eRf8+dddsVK3BgAF7mvCAjsaDnRFIGMeE41I
   fpTpxreRwvmkETyqT5X9a2tsunY6R/vpL5lYu4KjZHMPujGHy0QhOQERQ
   nZdxsJF46CbRpsKWD/j9dFfrWgmgFBOEF0wmjn7wpgVoP6jVkDGxc7EYX
   lW4jZpXQVkkMdYCQEN3VlbrKG7qvNtOUrD0iaSJHLrM+onHxzxFyfw+sI
   jU72C6oobOCxpwpLA2ItedQaISGYmw+ylNpYQLUDzwly0Nm3HXI2fWJhS
   Q==;
X-CSE-ConnectionGUID: HfusnarJQBqBdvAov6f5xA==
X-CSE-MsgGUID: kUUEaVXRQA6Q/DYKk0zzjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49714207"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49714207"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:32:01 -0700
X-CSE-ConnectionGUID: mYNlzb9zReGCKMT3jRFAHw==
X-CSE-MsgGUID: pq5ErnIIR52+MARvpLDj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="177131267"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:31:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHfnp-00000003Zby-0QY3;
	Wed, 21 May 2025 12:31:57 +0300
Date: Wed, 21 May 2025 12:31:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
Message-ID: <aC2djJxol61MmuyO@smile.fi.intel.com>
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
 <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com>
 <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
 <CAMRc=McwUF-668OYqctaahRQFPOTpXqnCZKE3R5zKsoWWEyU+w@mail.gmail.com>
 <aC2b2L5h4-0U5qjT@smile.fi.intel.com>
 <CAMRc=MfE=m+_jYKwAU0jcyopUZYFnY6kOdZJmAY29dJEHO+gPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfE=m+_jYKwAU0jcyopUZYFnY6kOdZJmAY29dJEHO+gPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 11:29:41AM +0200, Bartosz Golaszewski wrote:
> On Wed, May 21, 2025 at 11:24 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, May 21, 2025 at 11:18:11AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, May 21, 2025 at 11:12 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Wed, May 21, 2025 at 12:03:47PM +0300, Andy Shevchenko wrote:
> > > > > On Wed, May 21, 2025 at 10:44:16AM +0200, Bartosz Golaszewski wrote:
> > > > > > On Tue, May 20, 2025 at 9:45 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > > > > Bartosz Golaszewski (2):
> > > > > > >       gpio: graniterapids: use new line value setter callbacks
> > > > > > >       gpio: ich: use new line value setter callbacks
> > > > > >
> > > > > > These have been in my gpio/for-next branch for a long time and the
> > > > > > ones in your PR have different commit hashes. Please remove them. I
> > > > > > don't see any notification about you having picked those up neither in
> > > > > > my inbox.
> > > > >
> > > > > Really? I though I commented a few weeks ago that I prefer to take them
> > > > > when Stephen complained on dups. After that there were no dups noticed.
> > > > > Since you haven't answered to that email, I (rightfully) assumed you are
> > > > > okay with the proposed course of actions.
> > > >
> > > > FWIW, check your mailbox:
> > > > https://lore.kernel.org/linux-gpio/Z_OUr5xvoXh-sFne@smile.fi.intel.com/
> > > > https://lore.kernel.org/linux-gpio/Z_OS4nx2E12yjL7_@smile.fi.intel.com/
> > > > https://lore.kernel.org/linux-gpio/Z__xUsSeYNQAvnNp@smile.fi.intel.com/
> > > > https://lore.kernel.org/linux-next/aAEkrx0P5LFj1r6a@smile.fi.intel.com/
> > > >
> > > > Note the last one, you didn't respond. So?
> > >
> > > I really don't have them. Neither of the three. Probably gmail spam
> > > filter borked? Anyway, would you mind removing them from your PR?
> >
> > Okay for this. But let's talk *again* about maintainership of
> > the Intel GPIO drivers.  Last time we discussed that you have
> > agreed that I'm in charge of that. If you think otherwise,
> > let me know.
> 
> Ok, sorry for the misunderstanding but if I were to drop them, then
> I'd have to rebase tens of patches that came later, it just makes more
> sense for you to do it.

I understand that, but it's an exceptional situation. Shouldn't be like
this ideally... I'm about to send an updated PR.

> Maybe we need to think about putting intel GPIO drivers under their
> own directory in v6.16, that would make it very clear which ones are
> your territory?

Okay, let me cook the change.

-- 
With Best Regards,
Andy Shevchenko



