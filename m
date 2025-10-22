Return-Path: <linux-gpio+bounces-27476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DDBFCD99
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721411A029B3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D932E34CFAE;
	Wed, 22 Oct 2025 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3v7/V21"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD31FE47C;
	Wed, 22 Oct 2025 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146641; cv=none; b=bnBVRtovMBIxBQvv58rw/s3XKD6xPd0B+wZD3RhcbuCaGhf4wUlt5DUQCn2fXz+jYVvBuajvUElfmOD75rdxoR8fU/ZcYX3x8IZDa0UDLRzVi+qda/BRcnbKTL8d7ay60uko/+uBvRA9aPa9QyB54vFS5Uaw+ACyuE9iaktbi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146641; c=relaxed/simple;
	bh=3H2G3e9u/HWbF1bcYxs8o9niOojFUMCOW6N5igyK8zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9HK/dj8ZmjCE2ourUGdyjTuexTUveAyRYqLKhmJvLyAj4lliPgVWyup0aODC+wqO5fbGWtXXDLbtIPLFb1Zal4uzfZTlyPkLQVINo7yzfn1JHWNCK/svL3HOtra3XkDpdQbMjft+2slBOJm3NF0Dybh3IL+jJGEKvJ59+gM+5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3v7/V21; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761146640; x=1792682640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3H2G3e9u/HWbF1bcYxs8o9niOojFUMCOW6N5igyK8zE=;
  b=n3v7/V215f4BRGyXnj0oQ1ITHMGFuNdyPkAuljrhGGsQEOqj28NMbvfS
   3xAYIW1ux6JcYcCLqOwqU+TLXFyk09xfNTdGsE4NU+cIYbBHPdj3NVwBW
   aEAIVp0OaPpOE7TZBDfoqkrYNeAnox5Yln7Luym1viYd8jYjs7yRJ9238
   eUaHkaCt9cu/WdNIrJ8aLhqyVpycpAcRkoH6Gerkb8eCrs4vV0kjpEdGn
   kwyPQGXYyE5yAYQDsaBApEPb1uI2771RCeRQws+2GnIGeyE+BE3zJHIk3
   hGH1lEy2kl7mHpWosdMUfW578X6Rp+8rEYsirLpsvVF7oUY7a7ypkHYvc
   Q==;
X-CSE-ConnectionGUID: Vr00pNxkTMeHPgllQsXDyA==
X-CSE-MsgGUID: xvHiBryyTsurvSkTuWksyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63338941"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63338941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:23:59 -0700
X-CSE-ConnectionGUID: aZfCjIYeSgCfOShAlazg4A==
X-CSE-MsgGUID: ATEEnZdDSyiOXykbwDzTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="189179298"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:23:53 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBago-00000001jCg-2CaW;
	Wed, 22 Oct 2025 18:23:50 +0300
Date: Wed, 22 Oct 2025 18:23:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
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
Message-ID: <aPj3BlmgdnJU9DM4@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
 <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
 <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 22, 2025 at 03:40:00PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 22, 2025 at 3:34 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Oct 22, 2025 at 4:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> > > static inline bool strstarts(const char *str, const char *prefix)

> > >         return strncmp(str, prefix, strlen(prefix)) == 0;
> > >  }
> > >
> > > +bool strends(const char *str, const char *suffix);
> >
> > Why not static inline as strstarts()?
> 
> Because it's not a oneliner.

So, and how does it answer the question? What is the obstacle here that it may
not be a static inline few-liner?

-- 
With Best Regards,
Andy Shevchenko



