Return-Path: <linux-gpio+bounces-10053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3618977C1B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 11:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38E671C24728
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 09:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443061D6C75;
	Fri, 13 Sep 2024 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7YYRGYr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8551D6C6E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2024 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726219343; cv=none; b=QWtLZvXQCHVMKPULRplzTflc1KoFVnfA0NZqYu7RFTys4jx3BUQZmuwDUCPwcdV6rA8mLkmv+UxA0OmvXbcg5Yd2tFtQ1TsRWgLdVqCTwfcCLMYr+PsRZXQ6nTPP312nwdYkC+fsuGaie+xfX3SLrg7XCYbaa1Iv4BcYW67barU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726219343; c=relaxed/simple;
	bh=RBokndMAiIy5R51ivAWdmIfUS6Jn2VomHlXe8X2sFFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoBFlCCaen4wrb2Qgb5v850uN2/m6NTlXFtAyGwNyIc/Vo8TuI4yfdRZfpbyZwLqyErpDAet1M61MjIbjiLyg24zUVKCensw6kZqSJW+QA/Pf33sPXfZnI00r2N3bp+/zXTW7QVERTJLhOLrMb+Ii3f9uQrqRvC9yQc9cRsd8Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7YYRGYr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726219342; x=1757755342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RBokndMAiIy5R51ivAWdmIfUS6Jn2VomHlXe8X2sFFc=;
  b=Z7YYRGYrkoHtca9ERS1wd087nEDJy7fsWeFOjHf44ObSJel+uIsL+H/H
   3peE51sKzb+TplmzxJJnu/5LPuQR+pvI5khZb0DFS9J9hYTAbPE6L/0bW
   +IJGRscmYEz7ykCrkAbR4MKwV2O43omph2hRAd+/kbm0Qsi0JwPoncxZv
   r3keuGF3uah/fEjalvx4ZN14svcdEeJItc1pQVTBtOMlmhCUN7zDqYK/z
   d3lwXD3Yp6jRJIOmwYGhtIm8+q5N5Otg3BCJrYe5/Pg+2v+Bo8cQfqem6
   zj+h2xZyA9Pr0eac2xRjGNcCmsfGKxtyYdsxPG48BEs5X8GcC2xUVIEyU
   A==;
X-CSE-ConnectionGUID: bEo1WL9gSHKjZ1tnyJFOdg==
X-CSE-MsgGUID: PakIWmXESTKEHO2CUCvYZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25238703"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25238703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 02:22:22 -0700
X-CSE-ConnectionGUID: ZnZ5xxSQT/CaQsb367obbA==
X-CSE-MsgGUID: cgBQTe6oRLyEw2ksrnU6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="98683811"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 02:22:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EBA26334; Fri, 13 Sep 2024 12:22:18 +0300 (EEST)
Date: Fri, 13 Sep 2024 12:22:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linux pin control <linux-gpio@vger.kernel.org>
Subject: Re: [GIT PULL] intel-pinctrl for v6.11-1
Message-ID: <ZuQESkcu7UcV-Qj7@black.fi.intel.com>
References: <20240806072032.GZ1532424@black.fi.intel.com>
 <CACRpkdaRhAuqC90Lzj7jwjRF7P9i3J6=1zmqVofREESk54QKeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaRhAuqC90Lzj7jwjRF7P9i3J6=1zmqVofREESk54QKeQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 07, 2024 at 07:57:10PM +0200, Linus Walleij wrote:
> On Tue, Aug 6, 2024 at 9:20 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> >
> >   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.11-1
> >
> > for you to fetch changes up to a366e46da10d7bfa1a52c3bd31f342a3d0e8e7fe:
> >
> >   pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID (2024-07-31 13:38:13 +0300)
> 
> Pulled in, thanks Mika!

To where?
We can't find it in v6.11-rcX nor in your fixes branch...

-- 
With Best Regards,
Andy Shevchenko



