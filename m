Return-Path: <linux-gpio+bounces-26273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E41FB7D83B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24E8216370B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 06:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DE42475D0;
	Wed, 17 Sep 2025 06:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWtpiPvR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9F10F1
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758090389; cv=none; b=B72QcjmijGbX7qfW40JV/3DSe2W1iLfrZN4cQM+wWqbxOkm/LEE8odVjx3rGiHBtVGIlhmtXrATTQbU9iBcqn5sSr5tn7TDn/wkg8Gz5K3jSnHr9akV5w7+51pdkKniXe1XBa+bRIar7JV7OUW2MhGw/iSwz+0eBK45raPEDDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758090389; c=relaxed/simple;
	bh=hdxgsLYoy3czRf2q+qQTmQiSYygQNoyQx4C3/jfjGSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KU0FY8MKZH7Spnzr2mweAaW9ef/vGHdFHYoVGloH2MzBIhZEeEehq2ENWbJcaHt7HnFwZYlYDlcdkruxWVc8UarC6+yuOARdGAck0ydpP9SXE/S+t8rHx1C2taYgvr7pacZKgIlfwP4o3Pe3u2PnDfaZAi9jpXzSK4oX9JAMG50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWtpiPvR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758090388; x=1789626388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hdxgsLYoy3czRf2q+qQTmQiSYygQNoyQx4C3/jfjGSo=;
  b=XWtpiPvRxd9u1PdzYBgMU4/2R2qgoUjSUEa4bQVENjhPRZY9VbQL7tjq
   NHA6wQi1hTD89jv0/GJUytrVZxymkJVj2WCsagAb5xwC/SpId8Zr55WND
   EbYBjj1pq5H9z5hovUA8eCr6TgiJKojpeElXYU4WWZ5zrODbSBG6IVLWV
   cribJXyuhcQ6UPDR2XD10OXoMiZ3FZrAc+EoT+IDhDwYnFpODsn38QnEs
   PtvHlR2c46eGTrTXzmdKVSQ2j4luvcCwWM78U8Hoat3QluNGlHp9i6MqX
   d0HFODneYm7/9ch1OHuM5QzTxkJ08IrlrGMLKYdvVK5O57Po0CUJCN0Zg
   w==;
X-CSE-ConnectionGUID: YILOJMU6R4CbHCfhZnq8rw==
X-CSE-MsgGUID: 2QhfuEXYSxCWCCobCVwmyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64021375"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="64021375"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 23:26:28 -0700
X-CSE-ConnectionGUID: GY7H27dcS261jts4paUhwQ==
X-CSE-MsgGUID: M3HJfQksQdOv39uhmLLoaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="180423200"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 23:26:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uylcV-00000003jAt-3aSF;
	Wed, 17 Sep 2025 09:26:23 +0300
Date: Wed, 17 Sep 2025 09:26:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Linux GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [GIT PULL] intel-gpio for 6.17-1
Message-ID: <aMpUj-Y4otYtN1RX@smile.fi.intel.com>
References: <aMgy0K-jpmegAp-d@black.igk.intel.com>
 <CAMRc=Mc5eYN3=mWAkjwkS+-qfBpsVM3v1vP9v+eFk+-Fs1oKpw@mail.gmail.com>
 <aMlHLwC-1nuc_JW8@smile.fi.intel.com>
 <CAMRc=MfpK+RCrwKpa48DUpCCOKHbeYRw3xArtFR8PM9dwPvRQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfpK+RCrwKpa48DUpCCOKHbeYRw3xArtFR8PM9dwPvRQA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 16, 2025 at 10:22:45AM -0400, Bartosz Golaszewski wrote:
> On Tue, 16 Sep 2025 13:17:03 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Tue, Sep 16, 2025 at 02:39:45AM -0700, Bartosz Golaszewski wrote:
> >> On Mon, 15 Sep 2025 17:37:52 +0200, Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> said:
> >
> > My takeaway from the discussion between Linus and Darren Hart [1] is that
> > if you do automatic `git log`, mention it clearly. Do you read it differently?
> >
> > Note, PDx86 does this for ages and since than (see [1], it was 2017) Linus has
> > no complains over Hans', Ilpo's and my PRs.
> >
> >> Just a nit for the future: please don't do "automated gitlogs" etc. Linus T
> >> is known to frown upon such things and you're also duplicating the info you
> >> already put into the tag. Just manually summarize the changes this PR brings
> >> in.
> >
> > [1]: https://lore.kernel.org/lkml/20171118180910.qzbuh4donbwrxbyg@smile.fi.intel.com/
> 
> Ok, so let me state it differently: as the receipient of the PRs, I find these
> automated short logs useless, I want to see a short summary of the changes
> written by a human and the rest I can get manually from git history. I'm just
> speaking for myself now.

Okay, I'll go to disable that for now. As you may notice the written part by a
human is at the top of the tag. Then there is a sentence telling that the rest
is automated.

-- 
With Best Regards,
Andy Shevchenko



