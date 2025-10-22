Return-Path: <linux-gpio+bounces-27487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA26BFD7E2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 19:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD48534D1EC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F13280A20;
	Wed, 22 Oct 2025 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B41w7bEg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EDC1B7F4;
	Wed, 22 Oct 2025 17:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153176; cv=none; b=s4UbSTRXdPqj2RJ6k7wOCD+wTorqNCo3486uHpfwTLS1WbWLmbps6EtgZeQdYKZ9OKGaSRTUXWM6k/wCjMm0px+zuISDkSDCHmvK2ZQbRfSYs6vCqBlOmLxaFJ7qsudYU5S8Swc3aP/LhgXMJZ7ZTxgzmT6F1iwCtNk4ce057h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153176; c=relaxed/simple;
	bh=CA2iL+o+DO6b320JfGgya3sZsmpPjkeP4srUuVWXJQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGzv6ScLdzlQ82Y5jCh1MWrP2Ixe4fAXSKgj5Or2+l9bfiMCd69AFhvOKwFjhfX0NHbe8z8wNqZokvMIWq8GqxQt073WckWreVgl0p2YydmVsfdRogWH6nlb3nb7lURxVuDrvgeeY2ulSp+l2P/p2ZI07luUYuoMXEha5egP9wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B41w7bEg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761153174; x=1792689174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CA2iL+o+DO6b320JfGgya3sZsmpPjkeP4srUuVWXJQY=;
  b=B41w7bEgqD5s3e35MhqURGJTvf3ssBWOwn9wRqeXuo+44HKrBz0cEdOa
   XvqX3TqzNvxlfykRg6CH5rdfwcX/byiCILiMzdOFzwg18b7hwSg7edGSX
   IWHXO8SSUXb80aAXF3QXZXNx4aBzfrzP+AF2bGKfclnvDxvGP38fovoTC
   7S0/d0ku5E0JS+FWRqqpXMISyP5CdjJ/HeRA4DCKxCLS5BGX0JiAL0Abj
   27Wj6Mg4UGxgglMFS6poDNWCpCqS137o1HLvuvqZVzbdZ9PwrcufJx7fV
   NQSwjmcmmBjW0PsuLO2a1+Tfk6ZARf+dqkZwnhkiSBjqQSVm9x6KfCyaS
   w==;
X-CSE-ConnectionGUID: qaIzlhR6QJieEW9efHjqIA==
X-CSE-MsgGUID: 2gcVVxGUTUCol42SV1wEUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63014009"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63014009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:12:53 -0700
X-CSE-ConnectionGUID: u2ERStFSS/aim79IAjV65A==
X-CSE-MsgGUID: 3dwWDioCRDGoZpxlH9UaHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183146706"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:12:46 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBcOB-00000001km0-2Hse;
	Wed, 22 Oct 2025 20:12:43 +0300
Date: Wed, 22 Oct 2025 20:12:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] string: provide strends()
Message-ID: <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
 <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
 <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 22, 2025 at 05:36:33PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 22, 2025 at 5:25 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:

...

> > > +static void string_test_strends(struct kunit *test)
> > > +{
> > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > > +}
> >
> > Have you checked the binary file? If you want this to be properly implemented,
> > generate the suffix. (Actually making the function static inline makes my point
> > really visible)
> 
> Andy, this is bikeshedding. This is literally the least important
> piece of this series. It doesn't matter for the big picture whether
> this is inlined or not.

It's definitely not a bikeshedding. I try to keep a bit consistency here and
I don't see the point of bloating a kernel (binary as well) for the function
that just a couple of lines with simple basic calls.

Also note that with inlined version strlen() for string literals will be
calculated at _compile-time_! This is clear benefit.

Really, library code is not as simple as dropping something to somewhere...

-- 
With Best Regards,
Andy Shevchenko



