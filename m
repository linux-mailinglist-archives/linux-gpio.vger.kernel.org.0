Return-Path: <linux-gpio+bounces-22607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC241AF14C4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 915E34E02B7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F55267729;
	Wed,  2 Jul 2025 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byQ/yKUk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D42367D3;
	Wed,  2 Jul 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457591; cv=none; b=rwu/17EhVsHqWEqKbLkUCW77eyf4wzdFOFgQUpkbw55yYk0EyE+8A6clJ4ozOy5COlbNLxJDDGrytdSVQ7ZsbU8sSxU5m3cn4mVfkRNl4PhuWUlpg+qIw7bGxMsK3Qy2RYPe6xgoXEaxUvS7wvXG2tm+IXhQ/y17uZ2j29g0Xwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457591; c=relaxed/simple;
	bh=4MyZYABTO9GIFPIi2HBZ/NlYq0GU+q/HlwopHa6h+m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHJQGb6WmrbM743ZvnQby+B291mNYJ/J55b7mSxvadhvAfm/Gmg099e3Xxa4RiEBQXpA6ZFyV2l9iP8Eho4OcvS0sOsZ8V0e3U+HngPReE0PVsWm2XcK76VDN7i0LczK9uxTr/5GLf233hT5NOsP1MWc0ox0ExjAB23eBzar5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byQ/yKUk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751457590; x=1782993590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4MyZYABTO9GIFPIi2HBZ/NlYq0GU+q/HlwopHa6h+m0=;
  b=byQ/yKUkFlwh3rj6NhFA/X8i5WyJq4WxTvB90b44lSiS/u7zBbz9I3c8
   20SQL4fc+1rpQiiuH6Q8I/IbK2DS2/nYI2KSgwZV1f62YTWm6IHiok885
   v0D16OYeI4aGL1Z6iu2S1kHuTQRWwNQlJTJuyupYvPKm4+eLiQTK5mqnJ
   B7dAeFvbUrFzHJ7hjZmUNdWiA3m8cK5VAZplkPNmYK+N+4asG7/9wyqmg
   HdfZ178nXdDMMDYQiUKlgEDuTca8nC9CJaVJZdMqP+f8cWzsuU/AYVPck
   maplKoCJJ8WRtv1ubc2vwaIVBt5SGa6Mo5J98zMQtM/DdgkFat7UvMl2r
   g==;
X-CSE-ConnectionGUID: n80KdqhxRXWRJOG0zMX6qg==
X-CSE-MsgGUID: Rz7b13pURu+5VaF0MZd3yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53841580"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53841580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:59:49 -0700
X-CSE-ConnectionGUID: z8TM5A3oSMCi4Ov2IqbPPw==
X-CSE-MsgGUID: 96DXYeJKTDuhbZsLwFcyCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185001273"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:59:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWw7r-0000000BuSx-2BDi;
	Wed, 02 Jul 2025 14:59:43 +0300
Date: Wed, 2 Jul 2025 14:59:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <aGUfL5DDZrhSG788@smile.fi.intel.com>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>
 <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
 <20250702101212.GA47772@rigel>
 <CAMRc=MeuMpo0=ym+FvDh5sCNXM00+iOSNFgTxMqagO78ZS64_g@mail.gmail.com>
 <20250702110127.GA51968@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702110127.GA51968@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 07:01:27PM +0800, Kent Gibson wrote:
> On Wed, Jul 02, 2025 at 12:28:01PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jul 2, 2025 at 12:12 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > > I tend to not interpret it as adding new features. We really just
> > > > *move* what exists under a slightly different path when you think
> > > > about it.
> > > >
> > > > So what are you suggesting, remove the `edge` attribute and polling
> > > > features from the new `value` attribute?
> > >
> > > Exactly. I'm not suggesting ANY changes to the old sysfs, only your new
> > > non-global numbering version.  The idea being don't port everything over
> > > from the old sysfs - just the core feature set that non-cdev users need.
> >
> > I mean, if someone shows up saying they need this or that from the old
> > sysfs and without they won't switch, we can always add it back I
> > guess... Much easier than removing something that's carved in stone.
> 
> Exactly - expect to be supporting whatever goes in now forever.

+1, this is my biggest worries about the interfaces proposed by this series.

> > Anything else should go away? `active_low`?
> 
> I don't personally see any value in 'active_low' in the sysfs API if you
> drop edges. It is easy enough to flip values as necessary in userspace.
> (From time to time I think it should've been dropped from cdev in v2 but, as
> above, it is carved in stone now so oh well...)

But in cdev case this is different. Active-low state is needed to be
HW independent. For sysfs I agree as it's _already_ HW *dependent*
(due to global number space in use at bare minumum).


-- 
With Best Regards,
Andy Shevchenko



