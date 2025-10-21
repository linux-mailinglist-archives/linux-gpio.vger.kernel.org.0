Return-Path: <linux-gpio+bounces-27397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F0BF71EF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3EF188B069
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1933333C521;
	Tue, 21 Oct 2025 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzvt7HQG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EE1332EA5;
	Tue, 21 Oct 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057676; cv=none; b=ZK+abSjT3fheK6b10unKT4mwrYTxOqKSCkExLJZdhMRFCQrmXQKW7jzp+lMd4tFj35pyF7KJTdbv0OcFqY6zId1ut9VC6VoGEJ8FdLsYTLUfVsNLPj0JHk90eu6z58FJh9773wgQIRNXogP6XkKCNR5YTjRFFzt6LtuDiHiJmLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057676; c=relaxed/simple;
	bh=TLAonmS28l2Atrks9dB3gf5XsFrnkrzaVmxa1ByY8Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT68Fj3dszLzeX2rreE4lppEYTOpco4WmxAo/EKzNAr1/3xLPwcM7duBo/oUx0VqjPgEYvUgsb6aGGz1TcZ9dCyjOdxVoxTmXgFcCthU+exQ7yJDdHbQZLy7pnNKyQ9ke1NNV1LAckQ17whG9YFaJqC9XEVlKT/hqqe/uRpWPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzvt7HQG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761057675; x=1792593675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TLAonmS28l2Atrks9dB3gf5XsFrnkrzaVmxa1ByY8Vc=;
  b=jzvt7HQGp23/zHkWR3nKJPVPNRbKcScTKYy8qiGExNC84Wc/bHd6Aj4h
   IZEkxN30Pk5olUYAaAMEbkITu+2eH4gBYCqcReOuctSw8RT3aWkYCbuKB
   E7SAMP74pEa/SPHPQT4Dt3+jOk8oxjv+etwoaDwNszXob1rnyCr6Hx26o
   coslEOeQgKAtEUJaf9w8feP6a2luJ1nWMbxJ93T4A2khd116wjtC3WhcH
   rxA50pA+1lMFAXXpSYkGJXixm5xkVkUy8OPdWRCWdEcj1RiUsvNKJ2OtB
   ZiZlpP3Dyml+yeoyeTnsg2woOWHDP5FZjZekFLJ7x6+szVyFv4n+D6e6F
   A==;
X-CSE-ConnectionGUID: VS339jUhQ2O7U4qYLLBKIw==
X-CSE-MsgGUID: gRz2t9VqT3qi+SgFTv9FLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62215412"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="62215412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:41:14 -0700
X-CSE-ConnectionGUID: 0H82ZSkkQD+aXRtbHN36FA==
X-CSE-MsgGUID: uttA66GNQIegkA2Q52rXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187874725"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:41:12 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBDXw-00000001WJe-3qP2;
	Tue, 21 Oct 2025 17:41:08 +0300
Date: Tue, 21 Oct 2025 17:41:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] gpio: idio-16: Define fixed direction of the GPIO
 lines
Message-ID: <aPebhGETy_3MIwkf@smile.fi.intel.com>
References: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
 <20251020-fix-gpio-idio-16-regmap-v2-3-ebeb50e93c33@kernel.org>
 <CAMRc=MeFZTDk4cgzEJNnkrJOEneFUBLwtKjkpV3-cLSm=xsxNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeFZTDk4cgzEJNnkrJOEneFUBLwtKjkpV3-cLSm=xsxNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 21, 2025 at 09:21:38AM -0400, Bartosz Golaszewski wrote:
> On Mon, 20 Oct 2025 10:51:46 +0200, William Breathitt Gray
> <wbg@kernel.org> said:

...

> > Cc: stable@vger.kernel.org # ae495810cffe: gpio: regmap: add the .fixed_direction_output configuration parameter

> Turns out, this requires commit ae495810cffe ("gpio: regmap: add the
> .fixed_direction_output configuration parameter") so I cannot queue it for
> v6.18. What do you want me to do? Send the first two ones upstream and apply
> this for v6.19?

Why can't this be pulled from some IB/IT as part of the fix?

-- 
With Best Regards,
Andy Shevchenko



