Return-Path: <linux-gpio+bounces-20411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202EABEFA1
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17F23AF619
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C92723C8A2;
	Wed, 21 May 2025 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q548Ccv2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F79B238179
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819486; cv=none; b=M/igNuKdkyuElGo1dEbR4QtdBQ2AEG4dYl+ukmGo8H9Q2wKebC1OH2LFraQ8CACL5/3moPZYCnDTRvdYDBmTjTozT4l28+OH6dfubXfYVxQb0TusR2Ce1/AfBDWgVUdAjhCFvHnN+6JIkHD/OLMo4PuUNlG0pGwYRp3p+9CUPrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819486; c=relaxed/simple;
	bh=c/q6I4KTWDdIpJlbfDM8XDuY/VNhFKzEwdFrwLXggtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVkpUTWuPGEMXNelAYYLP3fcVsY51CaxbWWMQwxARtjxshH7Cr1ycwtZnkn0oruJ8kjjXqz7/+EyekJyFRLnuMJ8pnc3fOwYRz9JPPaeMrFw1gHU0XmBu6Lyc4m4nrd+Oqo3URG6K2/mt6VhR/PrhxKxVEiVll+PQKt8UBhc4JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q548Ccv2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747819484; x=1779355484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c/q6I4KTWDdIpJlbfDM8XDuY/VNhFKzEwdFrwLXggtQ=;
  b=Q548Ccv2fP+cxths+yfpoWlRlE5fDMxoYv1TGRfiLDX6LBJih1ngWtQe
   wmUGXhd3IktdqCHa1TyS8SXkyMmamxc8cSJttC+wMmoCbd8qMSCjVxMVH
   0KPG4HoTbPJE+86dLPvM4HTWBzwNGCJWGiPKEw7dEIyT1JBlzWNHZOYdk
   MupBk2dU9qqAH4+zCnYJBZFptFcIGw0XyaZmgKSFTvPNp/s7XcoNwPNCg
   efpbbUTwyRv9dZYNOmU30LkfAsLhMJTWSOgkO/1xjGb+LRbXU2597CfAf
   esIl19Y30qZqQ7YlIaWfW8TO1/AzoQ1/k+xGoKRMFoFGTXFTjHVS7AkHt
   w==;
X-CSE-ConnectionGUID: S0dKpXAfTXiXbbBq5GXAfQ==
X-CSE-MsgGUID: eVWGfwsFTs2gf/5fmVG5hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67344367"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="67344367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:24:44 -0700
X-CSE-ConnectionGUID: Wek1fhyoTlSwx9TXUvKz2Q==
X-CSE-MsgGUID: nckpopCIR4qo8avP4xXwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170852746"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:24:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHfgm-00000003ZU3-1Dxe;
	Wed, 21 May 2025 12:24:40 +0300
Date: Wed, 21 May 2025 12:24:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
Message-ID: <aC2b2L5h4-0U5qjT@smile.fi.intel.com>
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
 <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com>
 <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
 <CAMRc=McwUF-668OYqctaahRQFPOTpXqnCZKE3R5zKsoWWEyU+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McwUF-668OYqctaahRQFPOTpXqnCZKE3R5zKsoWWEyU+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 11:18:11AM +0200, Bartosz Golaszewski wrote:
> On Wed, May 21, 2025 at 11:12 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, May 21, 2025 at 12:03:47PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 21, 2025 at 10:44:16AM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, May 20, 2025 at 9:45 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > > Bartosz Golaszewski (2):
> > > > >       gpio: graniterapids: use new line value setter callbacks
> > > > >       gpio: ich: use new line value setter callbacks
> > > >
> > > > These have been in my gpio/for-next branch for a long time and the
> > > > ones in your PR have different commit hashes. Please remove them. I
> > > > don't see any notification about you having picked those up neither in
> > > > my inbox.
> > >
> > > Really? I though I commented a few weeks ago that I prefer to take them
> > > when Stephen complained on dups. After that there were no dups noticed.
> > > Since you haven't answered to that email, I (rightfully) assumed you are
> > > okay with the proposed course of actions.
> >
> > FWIW, check your mailbox:
> > https://lore.kernel.org/linux-gpio/Z_OUr5xvoXh-sFne@smile.fi.intel.com/
> > https://lore.kernel.org/linux-gpio/Z_OS4nx2E12yjL7_@smile.fi.intel.com/
> > https://lore.kernel.org/linux-gpio/Z__xUsSeYNQAvnNp@smile.fi.intel.com/
> > https://lore.kernel.org/linux-next/aAEkrx0P5LFj1r6a@smile.fi.intel.com/
> >
> > Note the last one, you didn't respond. So?
> 
> I really don't have them. Neither of the three. Probably gmail spam
> filter borked? Anyway, would you mind removing them from your PR?

Okay for this. But let's talk *again* about maintainership of
the Intel GPIO drivers.  Last time we discussed that you have
agreed that I'm in charge of that. If you think otherwise,
let me know.

-- 
With Best Regards,
Andy Shevchenko



