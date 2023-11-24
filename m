Return-Path: <linux-gpio+bounces-481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A978D7F72BD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64405280CDF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C631D68F;
	Fri, 24 Nov 2023 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GghAHzTh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341EB10CA;
	Fri, 24 Nov 2023 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700825428; x=1732361428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JzMZ2vsKB2C1D0HWsCG583RAi3ZzKOvnFMfsXDwCl/M=;
  b=GghAHzThlJeISLfxy2xwi7c11DBT8nDtXVA/ALy7GfgapsuvgVq/u/zm
   MbOVbTdXFYj0OCTghqZri4HF8hRysiAMFIeTWZXYsQN5cWXIAZsk+vH/I
   5wgNok171IaIKiYbkB8JOFucUVMTMtBBiBi95PXbr6HA0zw3tDrdq+rx5
   l1Cc2/io4s2kSldTMfk9rN3FruopKnlOG3Ddcm6RQZhh2e4oM5cL4lyI3
   A509WwhorWwzlzTgikSNSWrAHWxjYtawJw6XdCCnXVvDDyNog7C6XZASL
   zzlZH4fuotuv5Fl/6dXkQHdkCGhoyAhTg878iyAqnrruGRwNs6IXHR0TS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5565367"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="5565367"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="743860674"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="743860674"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:30:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6UNs-0000000GhWa-0xhz;
	Fri, 24 Nov 2023 13:30:08 +0200
Date: Fri, 24 Nov 2023 13:30:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
Message-ID: <ZWCJP48WopQdCp6h@smile.fi.intel.com>
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
 <ZVzy227f3cIiTmtE@smile.fi.intel.com>
 <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 11:09:07AM +0100, Linus Walleij wrote:
> On Tue, Nov 21, 2023 at 7:11 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:
> 
> > > The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
> > > Utilize them instead of open coded variants in the driver.
> >
> > Linus, I dunno if you are going to apply this sooner (assuming Jonathan is okay
> > with the change), but I have a bigger pending series where this will be a
> > prerequisite. So, when I will be ready and if it's not being applied (yet),
> > I'll include it into the bigger series as well.
> 
> No answer from Jonathan but I just applied another Nuvoton patch from
> Tomer, so maybe Tomer can look at/test this patch?

Jonathan acked it  in the reincarnation in the series (see my big one).

-- 
With Best Regards,
Andy Shevchenko



