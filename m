Return-Path: <linux-gpio+bounces-979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CA803897
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 16:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73D21C20A94
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8162C1A5;
	Mon,  4 Dec 2023 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVn/0SCB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D83102;
	Mon,  4 Dec 2023 07:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701703241; x=1733239241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qEhcxASuizJtM7lcwqFFlnnisGnpfIA8jp4KVzQJVnU=;
  b=BVn/0SCBVc7iyAPES7Xan1ZhgYXKaiR4Np96sv0Tfh7s7ubzLvuc1sv6
   jx0XzaYwn8stG9dFgHBrae56kIv6oJQvyh6KYsHqGNaLFj0+dO1icciIR
   d0rN98qhJA/Gd4SXIXhc6Zz8Q9NEhzN7HoKby84PZIFEtwM+o/kr0kmQF
   aCvup4GjX+IjowYFr664W4O6FKLkx64DdCyx6C5DVcC6g6svK5hkarsQ5
   Bjbb7jGsmvVotntrfPVlWBvCQT/1PQ7sH+dEOvK9BeDThiL9ZFL/AuotO
   JxoX4H8DerJkPiNQpGivEp61hvZxjeykGgDGxMfE2ILULEuOI5JnUdIWO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="15293969"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15293969"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841086629"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="841086629"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:20:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rAAkK-00000001muJ-2OQO;
	Mon, 04 Dec 2023 17:20:32 +0200
Date: Mon, 4 Dec 2023 17:20:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, sean.wang@kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: arm: gcc-8: drivers/pinctrl/mediatek/../core.h:211:21: error:
 initializer element is not constant (struct group_desc)
Message-ID: <ZW3uQFWeogUhwuA9@smile.fi.intel.com>
References: <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
 <ad6afb94-e221-4adb-a942-af59f5d7b92f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad6afb94-e221-4adb-a942-af59f5d7b92f@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 04:11:11PM +0100, Arnd Bergmann wrote:
> On Mon, Dec 4, 2023, at 13:08, Naresh Kamboju wrote:
> > Following build errors noticed on Linux next-20231204 tag with gcc-8 toolchain
> > for arm and arm64.
> >
> > ## Test Regressions (compared to next-20231201)
> > * arm, build
> >   - gcc-8-defconfig
> >
> > * arm64, build
> >   - gcc-8-defconfig
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Build log arm and arm64:
> > ------------
> > In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
> >                  from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
> > drivers/pinctrl/mediatek/../core.h:211:21: error: initializer element
> > is not constant
> >  (struct group_desc) {      \
> 
> This apparently comes from c0c8dd0a7773 ("pinctrl: core: Add a
> convenient define PINCTRL_GROUP_DESC()") and following patches
> from Andy Shevchenko (added to Cc).
> 
> I also checked different compiler versions and found that the
> new code works fine with gcc-13.2.0, but not with gcc-12 or
> older.

Thank you, Linus already dropped problematic changes.

-- 
With Best Regards,
Andy Shevchenko



