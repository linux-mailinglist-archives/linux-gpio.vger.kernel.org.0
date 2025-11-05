Return-Path: <linux-gpio+bounces-28140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE8C37132
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 18:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 54F944FDB99
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 17:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32B132ED39;
	Wed,  5 Nov 2025 17:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEjC20ZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3B3370E8;
	Wed,  5 Nov 2025 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362723; cv=none; b=QrxtUDwAi7A3CZsvUd88UPjpOP7ff0vcFwbyU9qhhA0bryI1YGRlNRJlsQXxxAlMdPHWxVvhS8VeRPe4sPGOqAmLfKNrteJVCQuC5cpdOiMp+CPw0ywxuwMwyF1S9MAUqoP7mBYzVDxmIdkA6nFgRsCLuVbFdd99i8ATFLTkrXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362723; c=relaxed/simple;
	bh=5UhncEhe+SElroFsCLAJcFgCyjkD+L/rkI4vspaLTC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pU2RQat1H+OIrDsJ2JcPgGBJFrk/skFQQhFGWinXdPitFr7iFhZ3DyO/gOvUl1Ft0zpCbFW6Lz/Ui/NIBu4m1WpUcjVJdoO70/GPBn9Q9A6wcSIPUfrliM2CHoNghiSRG7Fh+h/WiDFSBaneqPesk7uH/q0b+gIDCyJUy8fSS6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEjC20ZU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762362722; x=1793898722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5UhncEhe+SElroFsCLAJcFgCyjkD+L/rkI4vspaLTC8=;
  b=fEjC20ZUDIIQ7sCPabzX9oZQcKG0x7+tvy749srNo3tEERlduBwwjQZ9
   swfCYlgeuz77xymXN1uegOpSD+nwfre0MqFfRQxna4kWBwQG+WZHPylvB
   IN5ihYXMuPeI8vOX0jpiFDE6Z3hPzBwe0mn9ORdaqFYK0/lTBCb6VRZ2T
   +Q9JlJu3hzfFRO0CKF/9GJUcJjPllsmTYyYU4vSuceT/kYTpG7AeX0XLK
   s20kOf8MQXx09oUsWjEtepIpTFASFWpEUW5gznyiJDhuH/iOO4yQVUdC5
   v9+3ZRitB4fwhvngsv7kIPL2d8DNyL6foPjAOYscBspqihjGAwib/IA4Q
   Q==;
X-CSE-ConnectionGUID: ZqNN6CVWSk+YaQtik6Vwmw==
X-CSE-MsgGUID: IEnyydhuR9y3Q7fTlK+nnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64399292"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64399292"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 09:12:00 -0800
X-CSE-ConnectionGUID: nyQeFKReQNOu79JNF6fDVw==
X-CSE-MsgGUID: Jnj1WAMkQ5aEv/JGATjJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="191610143"
Received: from ldmartin-desk2.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.135])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 09:11:58 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGh33-00000005qkR-3ZWl;
	Wed, 05 Nov 2025 19:11:53 +0200
Date: Wed, 5 Nov 2025 19:11:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Message-ID: <aQuFWBiky4mpbIoM@smile.fi.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
 <20251105103122.GL2912318@black.igk.intel.com>
 <aQs3ls1rKgMOufOn@smile.fi.intel.com>
 <20251105115041.GM2912318@black.igk.intel.com>
 <CAHp75VcLNs0EWLED_5Mmr0V3nVoiEdKNpdoqPypy5i5jJCSd1g@mail.gmail.com>
 <20251105115535.GN2912318@black.igk.intel.com>
 <aQts5fqrNaEhHQyp@smile.fi.intel.com>
 <20251105154106.GO2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105154106.GO2912318@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 05, 2025 at 04:41:06PM +0100, Mika Westerberg wrote:
> On Wed, Nov 05, 2025 at 05:27:33PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 05, 2025 at 12:55:35PM +0100, Mika Westerberg wrote:
> > > On Wed, Nov 05, 2025 at 01:51:58PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 5, 2025 at 1:50 PM Mika Westerberg
> > > > <mika.westerberg@linux.intel.com> wrote:
> > > > > On Wed, Nov 05, 2025 at 01:40:06PM +0200, Andy Shevchenko wrote:
> > > > > > On Wed, Nov 05, 2025 at 11:31:22AM +0100, Mika Westerberg wrote:
> > > > > > > On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:

...

> > > > > > > > -#define ADL_GPP(r, s, e, g)                              \
> > > > > > > > - {                                               \
> > > > > > > > -         .reg_num = (r),                         \
> > > > > > > > -         .base = (s),                            \
> > > > > > > > -         .size = ((e) - (s) + 1),                \
> > > > > > > > -         .gpio_base = (g),                       \
> > > > > > > > - }
> > > > > > >
> > > > > > > I wonder if simply doing this:
> > > > > > >
> > > > > > > #define ADL_GPP(r, s, e, g) INTEL_GPP(r, s, e, g)
> > > > > >
> > > > > > We can, but it will give a couple of lines in each driver still be left.
> > > > > > Do you think it's better?
> > > > >
> > > > > I think that's better because it is less changed lines but I'm fine either
> > > > > way.
> > > > 
> > > > Okay, I will try it and see how it looks like and then I'll either
> > > > send a v2 or ask for a tag for this one. Sounds good?
> > > 
> > > Yes.
> > 
> > After more thinking I guess I want it as is (here in v1). In cases
> > when we define some parameters differently it will make sense to have
> > an intermediate definition, but here. Can you give your Ack, please?
> 
> Okay sure,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



