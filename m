Return-Path: <linux-gpio+bounces-27846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E104C1BC24
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 546075A4603
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995FA2F7465;
	Wed, 29 Oct 2025 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IW+X0DpF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB36F1C5D44;
	Wed, 29 Oct 2025 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751298; cv=none; b=qEITy7ZzH9Bc835QDfJeuFGDGUKeNQn+AI9iUBrk9ydY2JK3OzjHD+qWf+9MAvTY5qKzJkqd5s0cNSO7IVJTYHPyyDOlYgByfEyaFnMoC8GijJQ4BTSHFKTC2XVZIv4h0Q5NpKdhvXNbpPePGaoY5W96Pq9eFRcs2uGXjPe7X6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751298; c=relaxed/simple;
	bh=i8zZ/Az2AU7gAws4QhPWy+UIC3UsU5SjQYR63Fz7QG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppiybPDcKDWjNlWyr1XV1S7PRy4OEdFdtRbSs+wayPslqe80hKRpnSlQT2FSqbKT728mlviXf70Dwt6e4GY5GzyO9yLUTkgErXlDlp+ZYbsyA6tz5xpUwIxyP5+lqhuQksWfFUZ/i1cooSfomf0WlhxCHyQaaSkJrFycMPlLjdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IW+X0DpF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761751297; x=1793287297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i8zZ/Az2AU7gAws4QhPWy+UIC3UsU5SjQYR63Fz7QG4=;
  b=IW+X0DpFZBYVBDDuMggBGs+UQJY8+49YM7BPmzlgf3R4Du80+CnZHA1V
   /MknELQZeXcg0A7pJjrYWsf33zg96IzmzA5tTnj6B5BQXkzIEXTI0OHLz
   9ctjy5F74DYukZl9+Y/5B3OiaUM/D8Sw2NNKKQWPXQXb2pRFKxuxGU5/w
   MBxL6Vq0FNCDiHX0KzUzri20e5qvy5eqSmeD6Q5ADTsuMb/q1mNifC0c/
   9cCBNkN/QayLXabx53NiVJZleUBwpOPab5jtoTqGSax8bFy5r5nkuUA0j
   1OilmOPameQstHHA6+dXmZvwg3kyy3VBl2tXLSKGXT5uGqXqv872PHmLL
   g==;
X-CSE-ConnectionGUID: Ldf6sa7ORr2OfFo5apCJMA==
X-CSE-MsgGUID: YxtL4VCvQ96h3fnF66X2dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63785032"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63785032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:21:36 -0700
X-CSE-ConnectionGUID: VsQXzBaVQf6rqhBeifR3xg==
X-CSE-MsgGUID: tGWyFCvWRma3haaaGIshVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="216557885"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:21:30 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE7zL-00000003ePq-2SlB;
	Wed, 29 Oct 2025 17:21:27 +0200
Date: Wed, 29 Oct 2025 17:21:27 +0200
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
Subject: Re: [PATCH v3 10/10] regulator: make the subsystem aware of shared
 GPIOs
Message-ID: <aQIw97qdO43NXHWi@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
 <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
 <CAMRc=McT+HinKvajHmBYPcQKoboapAf2E3ErJSP=2jXW9B0omA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McT+HinKvajHmBYPcQKoboapAf2E3ErJSP=2jXW9B0omA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 01:41:10PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:54 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 29, 2025 at 12:20:46PM +0100, Bartosz Golaszewski wrote:
> > >
> > > GPIOLIB is now aware of shared GPIOs and - for platforms where access to
> > > such pins is managed internally - we don't need to keep track of the
> > > enable count.
> > >
> > > Once all users in the kernel switch to using the new mechanism, we'll be
> > > able to drop the internal counting of users from the regulator code.
> >
> > I am wondering if you took into account the layering violation (or others
> > put it as "transferring of ownership") in the regulator core for the platform
> > based GPIO regulators? This popped up during the discussion of
> > https://lore.kernel.org/platform-driver-x86/20251024050537.92440-1-qiuwenbo@gnome.org/
> 
> I am aware of this weird ownership transfer in regulator but these
> changes don't affect it. The layering is still being violated though.
> 
> This should be fixed and I've looked into it but it's not trivial so
> it's another big rework for the future.

OK, thanks for clarifications!

-- 
With Best Regards,
Andy Shevchenko



