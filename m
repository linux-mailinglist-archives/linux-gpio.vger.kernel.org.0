Return-Path: <linux-gpio+bounces-27396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5148BF7156
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5280918929C3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B352F60CD;
	Tue, 21 Oct 2025 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/HycNGm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB5248F7F
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057037; cv=none; b=ojwcztgFi7pkyL3ax4Sb7wcx8/LZvr54I57kiWyZUTJBVebsY53A7a9WOzHg0nI1KiWGe01VfCCdMSwUea7F1ef2UhAckk18MVfbyiyZ5GOsrVPfIT+M7/MR3VO0QJQ1nqHaloKQ4iXcYCAX7BXCXdCkwrVMwYc3ZE0uy1dhWko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057037; c=relaxed/simple;
	bh=laqZKvY6DcAuH66QuTKteX+XFvj0fHRpIGMYs7CTAAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLMbSXK1poxji4bA42mXkwyWOQOmWzeKU1KhTIzuO6LSb4kJKJU/UPDmjnWciodBzfIPBPBVT91S/GgfFM90AN7UZK7r9J0QjuKZvBzB+M+FS98lzAXp5Nq4MeCiNeO5rZSlKxNYo2w9oP97OIWLU1FkElS6J23QWs6J+6ELas4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/HycNGm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761057036; x=1792593036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=laqZKvY6DcAuH66QuTKteX+XFvj0fHRpIGMYs7CTAAE=;
  b=X/HycNGmITovRimfS/Nx7aJKfCqPKfH6mXJBndLJTvCAAFX5KrRIZO0W
   BgoQ1EOh1xCKfizRehnKhh/0KvJuFRcE/HkUSVYFNyG98ylbwwlp/iuCQ
   O6viS1WKZm3Rve7q5rCPTsBUB8YN6Ax9jK5C7b3QAYfcd8dfxdB02EykT
   ArsWp3JyEhXsvHKldMsmUzldeA38Mh9EeQg8vxATlG9JCr3HgiOAd3W1c
   6MaYS8u4nGBgeoq2ZWsXQKca7/RKQIpUy3efON6Rtfz3BC6835wZI3956
   mNLhVHnKs3CZVqqxgyYRr+GSRh9002WlfLvVOY82YpCFCzuPTR4pgi04c
   w==;
X-CSE-ConnectionGUID: xOKPGK5/Sku3zKpxHT03IA==
X-CSE-MsgGUID: FEXXcz6cTfWrMbLS2l8asA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74302820"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74302820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:30:35 -0700
X-CSE-ConnectionGUID: VR6MvcYQQzWFs/Igsu3P8A==
X-CSE-MsgGUID: +X4O+1d7SjyCTvzUnUXGGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187872647"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:30:34 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBDNf-00000001WED-05Uj;
	Tue, 21 Oct 2025 17:30:31 +0300
Date: Tue, 21 Oct 2025 17:30:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel test robot <lkp@intel.com>,
	William Breathitt Gray <wbg@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [brgl:gpio/for-current 3/3] drivers/gpio/gpio-idio-16.c:170:20:
 error: 'struct gpio_regmap_config' has no member named
 'fixed_direction_output'
Message-ID: <aPeZBrlDrQBkMRGL@smile.fi.intel.com>
References: <202510212126.mVDMC2iC-lkp@intel.com>
 <CAMRc=MdTffE6Oh_n0AYBEdyccN6-5FffxDZp6u037Yz9Khj-bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdTffE6Oh_n0AYBEdyccN6-5FffxDZp6u037Yz9Khj-bg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 21, 2025 at 03:23:12PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 3:17 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
> > head:   0d3f95740ced3acb6171cdec8c5bef336b0cabdb
> > commit: 0d3f95740ced3acb6171cdec8c5bef336b0cabdb [3/3] gpio: idio-16: Define fixed direction of the GPIO lines
> > config: x86_64-buildonly-randconfig-005-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212126.mVDMC2iC-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212126.mVDMC2iC-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202510212126.mVDMC2iC-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/gpio/gpio-idio-16.c: In function 'devm_idio_16_regmap_register':
> > >> drivers/gpio/gpio-idio-16.c:170:20: error: 'struct gpio_regmap_config' has no member named 'fixed_direction_output'
> >      170 |         gpio_config.fixed_direction_output = fixed_direction_output;
> >          |                    ^
> >
> >
> > vim +170 drivers/gpio/gpio-idio-16.c
> >
> 
> I removed the offending commit from my queue.

I dunno if we call it "offending", but I think this should include
a prerequisite as it was mentioned in one of the Cc: stable@ lines.

-- 
With Best Regards,
Andy Shevchenko



