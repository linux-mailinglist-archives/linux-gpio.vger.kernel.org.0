Return-Path: <linux-gpio+bounces-27845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1BC1BA76
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A09A645926
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F912F5498;
	Wed, 29 Oct 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juJXgbCr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1ED238171;
	Wed, 29 Oct 2025 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751231; cv=none; b=lbuzP+YUU2tFVYKSQdZzLAmTKY7+pNiw2A1ydKqNwVGAFd/2/Q0ATUTJt4HK2DPmng5XEH2Z9ZC7KLsY4iso9RdQHHyzCXlnN+uAcZCSnloGD42hX6jl/GKlS6V9NvUpjtEPeO8PEVfZNCUb64Hw9XNbPp5E5FT5cfqVo1ucv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751231; c=relaxed/simple;
	bh=7OWp2ScUfhqZU9A50Wt+cYv1ErJkgPklB83W1yD4iF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7UtVP1sbIRJnqO+gZk1QgftfZEKBrLer8KkEKE9q68RIPFr18R6CloOqQAJ1HrYdYdm02efMIYIE575NlFwLbwuj5CrYINLzGWuNqZLxrv7Ugw6wVzrX4+0I6iHhiC1kKxNggkjv0cZkf13bLFJaAiwQ/kxk/uWEDS/c8SiVCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juJXgbCr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761751230; x=1793287230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7OWp2ScUfhqZU9A50Wt+cYv1ErJkgPklB83W1yD4iF8=;
  b=juJXgbCriOtK/ST0MNjcITR6Cp7gpQ0WPmifVaEIZ2FL/r9We8HVDbL1
   8DW4xtfvemFW7CLcwjwHvb7zy8pnbkAt/Tf+MSdDl7TS0KN4iRB6TgpKP
   kN6AuIH1zj3lyrqzAN2RGDu2bW8+wG4/1Gpow5PvgPlYzUc9n4MCtABzc
   wC2nzLKtqvnL1SacDbBCKYXIF2wH9iKIiUK25phkf1GA17m4AfWZBR3k3
   EHw/qVYHAGxvvh7ZEaJwjDOn2kLfH/8KT48KOC6fhRycA4kuBO0a8yeuR
   ZPhWjRYePtllDpBuVmKImxUpfv5MCfrTHSH64Bh6BeY2LLTePMu3jylvq
   Q==;
X-CSE-ConnectionGUID: E4QTq+vnT1mGe8vtNhhlCw==
X-CSE-MsgGUID: hs6zWDhRQuiBiczQnBTy1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64025882"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="64025882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:20:30 -0700
X-CSE-ConnectionGUID: lpbA3I83RZCijO/yTOTvwA==
X-CSE-MsgGUID: eIGWGTVoQSOrBFIKrbjnuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="189759224"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:20:22 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE7yF-00000003eP3-38Lg;
	Wed, 29 Oct 2025 17:20:19 +0200
Date: Wed, 29 Oct 2025 17:20:19 +0200
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
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/10] string: provide strends()
Message-ID: <aQIws1zwi96r4bUQ@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org>
 <aQH9gE_fB119CW3l@smile.fi.intel.com>
 <CAMRc=MdKfXJx-cxNr1uOCkifD6YVE2t5w4hkuYy7jcnidiid2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdKfXJx-cxNr1uOCkifD6YVE2t5w4hkuYy7jcnidiid2Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 01:36:55PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:42 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 29, 2025 at 12:20:37PM +0100, Bartosz Golaszewski wrote:

...

> > Can you rather re-use strcmp_suffix() from drivers/of/property.c?
> 
> I think that strends() and its boolean return value are a bit more
> intuitive to use than strcmp_suffix() and its integer return value,
> the meaning of which you typically have to look-up to figure out. If
> there are no objections, I'd like to keep it and - when it's upstream
> - convert property.c to using it instead. Also: the name
> strcmp_suffix() could use some improvement, seeing how I wasn't able
> to find it, even though I looked hard across the kernel source, while
> I easily stumbled upon a similar implementation of strends() already
> existing in dtc sources.

I fine as long as the replacement (deduplication) change is provided.

-- 
With Best Regards,
Andy Shevchenko



