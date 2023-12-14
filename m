Return-Path: <linux-gpio+bounces-1464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0FA813271
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF97FB2130F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44090584C2;
	Thu, 14 Dec 2023 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCzXC+pH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57DAD9C;
	Thu, 14 Dec 2023 06:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702562698; x=1734098698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PONu75sM+YBENqHudHU14x0Wg1ISHEzLVA/83cLs8ww=;
  b=cCzXC+pHTg3pyabPIHoBhQBV4SUunYy2Ue6tg041ZktEbeMgq9NtJ2uH
   tdTldQr1FE7llXfnAHRtxBvb2UiEKqmy0sicoNEtOeSOiBCr78+mWoMG/
   g05Rg8GG71D2RqCY7ncEBmAiFsXDeMeLigqJXdxJ103puAje0BL9oAtvm
   5FIig/D0b9217UF8mz8pz1YqZFqCtFo/IazpTCjK8oVfx0dzSxp2P7aXf
   /bzxlDveEtayjXFGZlvjENS5SFzxr7sXFlksVWgRcWw77nCfy3mgk+LSE
   JobYGdtajf2fJf0aYirqAkYcs1yo7yhQ2/bDihkDH7OwPW+pvk5r8i6+n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8518706"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="8518706"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:04:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892479943"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="892479943"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:04:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDmKa-00000005rN7-2Y4X;
	Thu, 14 Dec 2023 16:04:52 +0200
Date: Thu, 14 Dec 2023 16:04:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] gpiolib: use a mutex to protect the list of GPIO
 devices
Message-ID: <ZXsLhDGeNofXp4IC@smile.fi.intel.com>
References: <20231208102020.36390-1-brgl@bgdev.pl>
 <20231208102020.36390-3-brgl@bgdev.pl>
 <ZXMiq3wDOt9zFzuX@smile.fi.intel.com>
 <CAMRc=Me5fzUaxQZ8Ec086papUpOD+chZ3+BM4CzASmB=ksh9kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5fzUaxQZ8Ec086papUpOD+chZ3+BM4CzASmB=ksh9kw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 02:59:28PM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 14, 2023 at 2:53 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Dec 08, 2023 at 11:20:20AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The global list of GPIO devices is never modified or accessed from
> > > atomic context so it's fine to protect it using a mutex. Add a new
> > > global lock dedicated to the gpio_devices list and use it whenever
> > > accessing or modifying it.

...

> > > While at it: fold the sysfs registering of existing devices into
> > > gpiolib.c and make gpio_devices static within its compilation unit.
> >
> > TBH I do not like injecting sysfs (legacy!) code into gpiolib.
> > It makes things at very least confusing.
> >
> > That _ugly_ ifdeffery and sysfs in the function name are not okay.
> >
> > If you want do that, please create a separate change and explain the rationale
> > behind with answering to the Q "Why do we need all that and why is it better
> > than any alternatives?".
> 
> I can move it back to gpiolib-sysfs.c but this way we'll have to keep
> the GPIO device mutex public in gpiolib.h.

And I'm fine with that. Again, we can discuss this in a separate change that
will do that (make that mutex local with the explanation why).

-- 
With Best Regards,
Andy Shevchenko



