Return-Path: <linux-gpio+bounces-354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA47F4AAB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 16:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25682812A9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 15:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DD04CE0A;
	Wed, 22 Nov 2023 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpSjPO6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112622D57;
	Wed, 22 Nov 2023 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667290; x=1732203290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOjYqo3PT8YGwRzKUAvwr8hmWkL6CCqgBph732SCw5k=;
  b=MpSjPO6Rb1tqOTZ4TdzEi2v4R5QnrKZYpnHK28FowPNg2PF4TLRfq4Fu
   GESPyqF8hGrvQUaMfhbYvbQJv+Bx0JDK6iBc5kB29IIDGL6Wxb0YzkqJ8
   tdjSGFDjfrDrNvCpeRM2s/8quuQ58nJFTRJwMzYvh4s8nv2wfQMWtHb8i
   rB0FEnsENNWaRolbeT5ah+XO5cdWC3wFonlqrnNICxWSTC+bpvzr47r5v
   PtURuvYGxBE9xxolblhru0ILATuBbyLVrP2TVxK6NtJt+1ZVA26rg+MAS
   h8eXrsRrvVlHA6nmKi2/nH0Ixzpgbv1sZnP2bBngskCBBVeREzG1jfEMp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396000879"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="396000879"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884658912"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884658912"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:34:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5pFL-0000000G85G-0H85;
	Wed, 22 Nov 2023 17:34:35 +0200
Date: Wed, 22 Nov 2023 17:34:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [rft, PATCH v1 1/1] pinctrl: qcom: lpass-lpi: Remove unused
 member in struct lpi_pingroup
Message-ID: <ZV4fih9g9isXZRjL@smile.fi.intel.com>
References: <20231120193353.1670732-1-andriy.shevchenko@linux.intel.com>
 <c622c2a5-665f-4ee3-b3dd-fafb3adf6191@linaro.org>
 <ZVzltQByY1Z0pOGI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVzltQByY1Z0pOGI@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 21, 2023 at 07:15:33PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 21, 2023 at 08:14:09AM +0100, Krzysztof Kozlowski wrote:
> > On 20/11/2023 20:26, Andy Shevchenko wrote:
> > > The group is not used anywhere, remove it. And if needed, it should be
> > > struct pingroup anyway.
> > > 
> > > While at it, replace kernel.h with what exactly being used.
> > 
> > Missing Reported-by and Closes by for LKP... Unless you discovered it
> > without its report?
> 
> It's just at hand discovery.
> 
> > Missing sm8550.
> 
> And sm8650, but there LPI_FUNCTION(gpio) and I'm wondering why LKP complains
> about it. It's really a maze to me.

Ah, this is _pins, _groups is still in use. Okay, I will remove that in next
version.

> > >  #define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
> > >  	{						\
> > > -		.group.name = "gpio" #id,			\
> > > -		.group.pins = gpio##id##_pins,		\
> > 
> > Aren't these used by core pinctrl code?
> 
> Only via APIs and pin control registered them also via APIs, so I don't think
> this is being used directly. But if you see how, tell me! I spent already a few
> hours on this and haven't got any clear picture in my mind.

-- 
With Best Regards,
Andy Shevchenko



