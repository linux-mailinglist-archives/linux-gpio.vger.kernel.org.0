Return-Path: <linux-gpio+bounces-16313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B97A3DC47
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10EB47A6B73
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91BA1FAC4A;
	Thu, 20 Feb 2025 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPORLJfC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB21B86F7;
	Thu, 20 Feb 2025 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060956; cv=none; b=lEDm7PbUNBwm92sb+L8uZ1M55FaawBCmi/ooBUEjJ6uj+p4YDcFpNXYXGm9wLV8wMI63iz2jTgFy2eBSK0UGZ3EP2TAIF/eN5YW3jfL0VHDQ9gRgVWanNl5REsqKzQfZ1uroqMaiFtwa0AfhcyRinMB0zdUo/ykOKqM3qqKLO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060956; c=relaxed/simple;
	bh=2xYS4XzhNZ5j0FAtMD8RD61LuPl76c6itGSWrcizWCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz6Wr9gBuDszH2ewAlMN2tRescUhGPpuVni4h1akE7wm1gb7SiSGQ8h3hkC/OrZO8KTnbjVM10dn+wxvft6Ei0+g1Pzm3sg7zou13O5oDLkidMA2tJvIgK93H/Wd1FI3F+lhS4to1pBXb2+sxka+H+8B/KlSLf1gsDhisFiWX2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPORLJfC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740060955; x=1771596955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2xYS4XzhNZ5j0FAtMD8RD61LuPl76c6itGSWrcizWCQ=;
  b=iPORLJfCb7Ap0hwTwjGhdjZT3TKO2lQeK84kIPnfw7ZubJ+rDl2n0Jh/
   WPp+mscJfhcEMuSIQJzq2Gj1JuCMM+C3jyrDNz/AFsLDoOq/RSnVGMflY
   PGQ6IAtw6lt/DinzzKh1I8nHhz4AhZisqcJoOsv7nCx0LLrUgtVDKyaAB
   VfsWjFnzTl7tukrt5LqzhxhhqBPp6ZYsVTXa2S3L6qqSMCIeVkJ4HLzSc
   +GuODLvwQ3i8ZIIXETuHz5jiOPIWzz9uJoGLhSZ8wFMsu5pbT0h3lggok
   P2FGGlwAH3aMXffB8IvXrjPweSIvhj071nW2svykwrwkObIKXmxq9UZfY
   w==;
X-CSE-ConnectionGUID: Z0rRB80STwexU2h8gb9oDw==
X-CSE-MsgGUID: ObsB8k0/Spm4R8uNekIU1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40708890"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40708890"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:15:54 -0800
X-CSE-ConnectionGUID: r75ohwirQAipCGg/6lXUCA==
X-CSE-MsgGUID: RZDQpvNlQQeV00ex0qlHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152245691"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:15:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl7LB-0000000DM9W-3g74;
	Thu, 20 Feb 2025 16:15:49 +0200
Date: Thu, 20 Feb 2025 16:15:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Message-ID: <Z7c5FTpbivch15Ij@smile.fi.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
 <Z7crrgl2iFn34gck@smile.fi.intel.com>
 <CAMRc=MfSn6xB4eNkFG7E2gQPiF+AmnaidO5=FbvPtvW0N4iDjQ@mail.gmail.com>
 <Z7cwv0gxRFFGBjR1@smile.fi.intel.com>
 <Z7cxGOmwMIkkTRLs@smile.fi.intel.com>
 <CAMRc=Mc0gaRxOBDFXf2WB2_mNxaQo+UjCc6oTM-azLzV=c3VgA@mail.gmail.com>
 <Z7c3IhC115rPbTMw@smile.fi.intel.com>
 <CAMRc=MeBCQrm14TiH99a-xLo5PMah9W05TO=8mzsxfXFXGjazQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeBCQrm14TiH99a-xLo5PMah9W05TO=8mzsxfXFXGjazQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 03:11:04PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 20, 2025 at 3:07 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Feb 20, 2025 at 02:42:26PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Feb 20, 2025 at 2:41 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Feb 20, 2025 at 03:40:15PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Feb 20, 2025 at 02:22:29PM +0100, Bartosz Golaszewski wrote:
> > > > > > On Thu, Feb 20, 2025 at 2:18 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:

...

> > > > > > > Bart, do you think it can be applied?
> > > > > >
> > > > > > Andy,
> > > > > >
> > > > > > I really rarely lose track of patches. It's been just under a week
> > > > > > since this was posted. Please don't ping me to pick things up unless
> > > > > > I'm not reacting for at least two weeks. I typically leave patches on
> > > > > > the list for some time to give bots some time to react.
> > > > >
> > > > > I see, I thought your cadence is one week, that's why I have pinged you.
> > > > > Will try to keep this in mind for the future and sorry to interrupt!
> > > >
> > > > Btw, if it's easier to you, I can just combine this to my usual PR to you.
> > >
> > > No, that's fine, let's stick to ACPI-only PRs.
> >
> > Hmm... Is the Intel GPIO stuff should go directly to your tree? Seems I missed
> > some changes in the flow...
> 
> Ah, no, sure, intel and ACPI and whatever you did up until this point.

Got it, thanks!

-- 
With Best Regards,
Andy Shevchenko



