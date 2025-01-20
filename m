Return-Path: <linux-gpio+bounces-14948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFABA17108
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 18:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFA3016A7DE
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 17:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2415B1EC012;
	Mon, 20 Jan 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrFdY0Gy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9DA1EBFFA;
	Mon, 20 Jan 2025 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393090; cv=none; b=hoBimdxDabY1wOb+tGLehx925NGnM0UrKmbCTWRC3up6awbVBEoxzmeGtotcg2Mmtc8DtkoV08nDlQ3Ft0IsdceA9xBQFLv88xXsrDAbjyyfw4DACAW0IDpIgw2fGy8AVnpc9D3Pz3JS3MsWiCUPZ3FtW2ktEmml939pXdm6Y8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393090; c=relaxed/simple;
	bh=O74p5TZpWyGoKGNkzS03E5QcgM+cZnZkS2SpM4WXris=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lvk9vD/dbMlYaefTNr/cLvW7+4xQp9FPUYYS2wbrGCGIRmY8fiXlYqnam5Gwz4PsZ7BMhQETPAGEc5sZdV4o6VHbCPYTdTelvApK87/uo2GrZK0/VMuqDujsN3WhTknnVTDHSPiV81O0+xkE0Ka4HZPL7H7jOfTexQ9mLQIV748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrFdY0Gy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737393089; x=1768929089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O74p5TZpWyGoKGNkzS03E5QcgM+cZnZkS2SpM4WXris=;
  b=HrFdY0GyglP4zCfGYyqzMplz8SfaMGUTwd4OAQsU5I8EgCyluxuWACPz
   qiMP5OZ7QeADE3tPTC7E/tk0ZOZO/CA/PB1rIo/2HYxbmbZqoWxg2q8Qw
   vsIDuVQRbw6CaVY0hJr9ubTvAyeK9ERPdYUHtwrBJ9dDnBzBytkmDB7eU
   njRbVPU8NpnSC1TZd1YpFzPcPIiKZ5QHK8vdmbVpxwXU07ByYccvYPpZ/
   KaWEG+n6FSN/39KjH74W2/M0QIgpwsP0B1gKHfaDwhfSP6YtAFK+q4cD4
   jV7+JziM8oQ3aHSMOdULexwsyh1oVcvzPmJdFJcmN4wQAut8zr9II/UWj
   Q==;
X-CSE-ConnectionGUID: QvyORyiuT+2uZ1qoyIBT6A==
X-CSE-MsgGUID: PrJrSq/aRBC8p8SzS5InBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37709850"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37709850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:11:28 -0800
X-CSE-ConnectionGUID: hb2/Ca7pSQuieqy9JrnIow==
X-CSE-MsgGUID: Nk+orQD7T5yUQuqtdlh16g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106596640"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:11:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tZvJ4-00000003VDC-2vrY;
	Mon, 20 Jan 2025 19:11:22 +0200
Date: Mon, 20 Jan 2025 19:11:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z46DunMGRKQcxtnz@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
 <Z1r0EPC9gumruFKU@smile.fi.intel.com>
 <2024121242-saturday-aqua-9ac6@gregkh>
 <Z1sObNubEnsFwzOD@smile.fi.intel.com>
 <Z4kcxQWeL09VARfK@smile.fi.intel.com>
 <Z4pwksY3Bs4taZd3@black.fi.intel.com>
 <Z46C1bZ4AMLvKTn0@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z46C1bZ4AMLvKTn0@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 20, 2025 at 07:07:33PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 05:00:34PM +0200, Raag Jadav wrote:
> > On Thu, Jan 16, 2025 at 04:50:45PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 12, 2024 at 06:25:16PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Dec 12, 2024 at 03:39:57PM +0100, Greg KH wrote:
> > > > > On Thu, Dec 12, 2024 at 04:32:48PM +0200, Andy Shevchenko wrote:
> > > > > > On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> > > > > > > On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > > > > > > > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > > > > > > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > > > > > > > 
> > > > > > > > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > > > > > > > helper and uses it across drivers.
> > > > > > > > > 
> > > > > > > > > For the series:
> > > > > > > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > > > > > 
> > > > > > > > > It seems like Andy will push it to me which is excellent.
> > > > > > > > 
> > > > > > > > Yep, that's the plan after we get all necessary ACKs.
> > > > > > > 
> > > > > > > Greg, anything I can do to move this forward?
> > > > > > 
> > > > > > Greg, is it possible to give your Ack or comment or guidance of the preferences
> > > > > > with the first patch?
> > > > > 
> > > > > $ mdfrm -c ~/mail/todo/
> > > > > 2293 messages in /home/gregkh/mail/todo/
> > > > 
> > > > Oh my...
> > > > 
> > > > > Please be patient.
> > > > 
> > > > Sure!
> > > 
> > > Raaj, care to send a v3 after merge window closes?
> > 
> > Sure, and perhaps add a few more users which I found with my improved
> > grepping skills.
> 
> Okay, thanks! I will drop myself from this thread then. Waiting for v3...

One more thing, can you embed the following into your series?

20241203195340.855879-1-andriy.shevchenko@linux.intel.com

It would be easier to handle and avoid conflicts.

-- 
With Best Regards,
Andy Shevchenko



