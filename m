Return-Path: <linux-gpio+bounces-49-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668CD7E9B76
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F3F01C20919
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 11:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EAA1CFB2;
	Mon, 13 Nov 2023 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhC+84qm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5F1CFAD
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 11:53:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751EED6C;
	Mon, 13 Nov 2023 03:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699876398; x=1731412398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L5BaIpp1w6C71nPUGd/W2TImQRoCRT8NntlWKS9HTyc=;
  b=nhC+84qmkTu4VAhA+gdI75ragpe8OUthxB6GwPv3sC8MboptN/h5fYYH
   WKK+s8IF1TAH4RJztctDiSPepGxxA0a2LGKx3nZOKi2/pzOSP1RKHkkL8
   4JeumdLmHlCWFHtlyJimm1FvpU90lp1i3GhFKtbHdC5XGXEkRA40DXdhj
   gslmcmG4/acwS8fYgdmHB9ReRB5ka2STWIxMQoSE8BA0CkqSkzUy51Jo2
   B8mHQ6K2LMab0Iy9/Kr2NSTbH1xL3mJaEijbmmBxNYkqPEqb57KOIRXgh
   fRP7VuS5nheJ7ZcV4zqsFHeUtM04NN4vnm743nnfhtt8lT1+ONFLRCzos
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="3506155"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3506155"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:53:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="757781076"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="757781076"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:53:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2VVA-0000000DY1n-3aSN;
	Mon, 13 Nov 2023 13:53:12 +0200
Date: Mon, 13 Nov 2023 13:53:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Move default strength
 assignment to a switch-case
Message-ID: <ZVIOKMf9fDh6qjC6@smile.fi.intel.com>
References: <20231030155340.3468528-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdb3wLAZfU+_E0r5Rr_HD-bdFpf7K6bMD6dqiK1Ryv7NAQ@mail.gmail.com>
 <ZUOXVSij9497HrBR@smile.fi.intel.com>
 <CACRpkdaYpgg7Umc3=QZ1QxH=jzt-wJh+msu5DuVn1aRUvzkeGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaYpgg7Umc3=QZ1QxH=jzt-wJh+msu5DuVn1aRUvzkeGA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 02, 2023 at 01:56:08PM +0100, Linus Walleij wrote:
> On Thu, Nov 2, 2023 at 1:34 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Nov 02, 2023 at 08:36:11AM +0100, Linus Walleij wrote:
> 
> > > So where does this 1 come from in the end? That's the piece I
> > > am missing in this explanation. Somewhere, someone decided
> > > to pass 1 to indicate "pull to default resistance".
> > >
> > > Is it coming from ACPI firmware?
> >
> > No, it's pure Linux kernel decision.
> > gpio_set_bias() is who made that. That's why it needs to be chosen on global
> > level.
> 
> Aha I see, that makes sense.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



