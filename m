Return-Path: <linux-gpio+bounces-5769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3F8AF5BD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 19:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08DF41C23DBD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 17:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D991213DDD0;
	Tue, 23 Apr 2024 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zwl/5Zek"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662613D8BA
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713894067; cv=none; b=UY1QiFT3Hx6s6e2/+QkBBrd9dNa/9orYsMqFZu/X+E3K9fCZ4K/N3nEPrPnsXmRl1xYSFno3XY9fxpGNJHzL6VCxVXE92kE4OF4OdDOmdzPAvhIwCBVPKjLLexY8ARPgFbf+6U2+XQbcpFehbDNDA0BLTvjlimlyZdYOm6PovS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713894067; c=relaxed/simple;
	bh=Q0dSCCnoXMSTf8gtCFWfGUjhsVCrIJ9NwNhl7evNoHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnY+T9bXhpgMtlqHbS7FUmLa9IwHeSqw4VdmsXu5yr8hZAkeOyOP2Cbfhjm5d+1L1VY1nKvPsZeMU6dUFr3r6NpYKxeZkj7lYqkg+0UTpdItZixgyoZfgxQvK3X5OQ5iZC37QiExnBGY98ET7g7crpjovc5TqZB8vY4Yb2SsrTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zwl/5Zek; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713894066; x=1745430066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q0dSCCnoXMSTf8gtCFWfGUjhsVCrIJ9NwNhl7evNoHk=;
  b=Zwl/5ZekC4An8f0uWBhNVX4wkt5H/7SvE/4MCBYMXofS1rZgvy3WxxG1
   SpsCZLHMSO9A/FCn3A4HWRIxnLv56WF1hthVMVaJh2v12Xc/U9lsBSE7y
   bWep/JSoQ0YjFpnUmGMyuWgSrEHbGVoENlLhoaOBbo4DaYnxDPJRiYDnR
   LiPmlhF3Wh1ZtPsZN2R9VGVnOooO2R0jv1nWt+Ipsa/zYgfrf14xSTxbC
   Ak2Qap9Uut+ylQk/j9zPY10RIDhfdYSAwmEDmgwGmj0wzRJgL1HNmyWYi
   0g+LLace9E5rHsEQfy36KYFDFD37llg7qQJRQXJjeilGm7tZgcWhU52/o
   g==;
X-CSE-ConnectionGUID: pTFPC/5GTL+DqhEm5TXDaA==
X-CSE-MsgGUID: pvSfw2FrTu2PeyOvGlKYTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="34896797"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="34896797"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:41:05 -0700
X-CSE-ConnectionGUID: /I7nsArQQoal4M34MvsMaA==
X-CSE-MsgGUID: QbOMtJgzSDSkMtdG7RyFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28926990"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:41:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzK8a-00000000PpV-2qdG;
	Tue, 23 Apr 2024 20:41:00 +0300
Date: Tue, 23 Apr 2024 20:41:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][RFC/RFT 00/18] dbus: add GLib-based DBus daemon and
 command-line client
Message-ID: <ZifyrLNQ9AV0ohBt@smile.fi.intel.com>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 12, 2024 at 02:27:46PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This has been in the works for a long time but I'm finally ready to share it
> with the world. This introduces the DBus API definition and its implementation
> in the form of a GPIO manager daemon and a companion command-line client as
> well as GLib bindings to libgpiod which form the base on which the former are
> built.
> 
> Please note that while the functionality is complete, the dbus part still
> requires some work (bug fixing, corner-cases, general ironing out of all the
> wrinkles, a lot of code could be refactored too). This is why the series is
> marked as RFC/RFT. I want to get it out for reviews and first tests before I
> leave for EOSS and later on vacation. I am aware of some instabilities so don't
> be surprised by an occasional segfault.
> 
> While I split the GLib and DBus code into several commits for easier review,
> I intend to apply all changes to bindings/glib/ and dbus/ as two big commits
> in the end as otherwise the split commits are not buildable until all of them
> are applied.
> 
> The main point of interest is the DBus interface definition XML at
> dbus/lib/io.gpiod1.xml as it is what defines the actual DBus API. Everything
> else can be considered as implementation details as it's easier to change
> later than the API that's supposed to be stable once released.
> 
> The first two patches expose the test infrastructure we use for the core
> library and tools to the GLib bindings and dbus code. Next we add the GLib
> bindings themselves. Not much to discuss here, they cover the entire libgpiod
> API but wrap it in GObject abstractions and plug into the GLib event loop.
> 
> Finally we add the DBus code that's split into the daemon and command-line
> client. I added some examples to the README and documented the behavior in
> the help text of the programs as well as documented the interface file with
> XML comments that gdbus-codegen can parse and use to generate docbook output.
> 
> For DBus, most of the testing happens in the command-line client bash tests.
> It has a very good coverage of the daemon's code and also allows to run the
> daemon through valgrind and verify there are no memory leaks and invalid
> accesses. I still intend to extend the C test-suite for DBus with some corner
> cases but didn't not have enough time for it.

I might have time to briefly look at this code, but I can't test right away as
I have no setup that uses D-Bus, all what I use is a simplest Buildroot +
Busybox.

-- 
With Best Regards,
Andy Shevchenko



