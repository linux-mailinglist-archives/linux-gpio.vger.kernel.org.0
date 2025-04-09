Return-Path: <linux-gpio+bounces-18601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E356AA82CCC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 18:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFCD9461522
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 16:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121126FD9F;
	Wed,  9 Apr 2025 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEYxxgUq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB926FD99;
	Wed,  9 Apr 2025 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217294; cv=none; b=gEFpGXYHsQpsJAfNlWx1MCH31pteDpEy89FJmp/j/tM2I2zgl4ho43bSR5CcrlAL/Z1QV4g6jR+gQooPvirqPyK8Bo/2bhNNzfC7yWemdzmdvRfqxbkTFKP/35tJXUlHgHtxdOD1MtHzFkB1FBJ8HdbHCo7fMJ8auS4QuTe7Tvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217294; c=relaxed/simple;
	bh=vi1LQCaAJfP94bRltPYH+PzIpGzW6NDA4xBuvlrXDb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONXRLBqGsni+ZvP4vbPjIAt6NGMHfY0wx6FjOnjSa1x7hj+42RXnsQH/XTw+IV0kVVOpHtm+lvEwqNhVizKTfgISbHG0v0pG1cmwH541TR8d+KLYSmf2X93fq0jpHlmO8W7PcNzd1l/z9UeUkFjBkFYDbBsJ0nZVnQwwJr9YWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEYxxgUq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744217292; x=1775753292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vi1LQCaAJfP94bRltPYH+PzIpGzW6NDA4xBuvlrXDb0=;
  b=lEYxxgUqAv1fel/oKGbfDNcHwFS4psQSJn8LQkoL12Evypz5Wl3f6wEx
   csl8pOGj1tyYyNXG4iMw4/NJ/wdiifSyY7GV8VNt858GNqT5cniyBgNjm
   kX3TrQN6YPBYm3xAvrrcMQcj5SXJaImqfM+w+mYjoNm6xPjqkR1v6nc/W
   a6XhqHWu7LQUgPsv38ZG8ZPW6xpGsscfnbVx0s3u0Zrx1D38AWcdQKaUB
   4niF9baWgkpBfyhDkSWS0r8mqJZhsF0NSH6juF9mSGEqPGG7p+OOYxtiA
   Kfb6Tq597fS/Z0Ma/6IOovNdljtOBKianiBrs8Jd5qgBjElLFV8kD1noD
   w==;
X-CSE-ConnectionGUID: NNtBUsPlSNacpryvX/RrpQ==
X-CSE-MsgGUID: APVOB/sWRoK+fdlm4dB6VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="71082562"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="71082562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:47:47 -0700
X-CSE-ConnectionGUID: ck4eHUrLTDehlzYvH06edw==
X-CSE-MsgGUID: 3MYIgIc6S0+ZyxLkwOC/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="159607974"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:47:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u2YaV-0000000Anbu-247i;
	Wed, 09 Apr 2025 19:47:43 +0300
Date: Wed, 9 Apr 2025 19:47:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: don't allow setting values on input lines
Message-ID: <Z_akr_b7wSQJSK3T@smile.fi.intel.com>
References: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
 <CACRpkdYujYhF8VP-_6O4Bt2tWL-NO-GgQPr=DeqE9QwCq12gqg@mail.gmail.com>
 <CAMRc=MdwQZMDaHn15n4zgCujtDRg=UUwz3A9ZUYY9Uv7FFgz2Q@mail.gmail.com>
 <Z_aGZqsUXq2uyQfC@black.fi.intel.com>
 <CAMRc=MdsRWNVT0XC1DvwBdhZFsVZO6DeMrVePKgiF4Mj_Ryykg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdsRWNVT0XC1DvwBdhZFsVZO6DeMrVePKgiF4Mj_Ryykg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 09, 2025 at 06:43:47PM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 9, 2025 at 4:38 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Fri, Mar 14, 2025 at 11:35:21AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 14, 2025 at 11:33 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > On Tue, Mar 11, 2025 at 3:20 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > Some drivers as well as the character device and sysfs code check
> > > > > whether the line actually is in output mode before allowing the user to
> > > > > set a value.
> > > > >
> > > > > However, GPIO value setters now return integer values and can indicate
> > > > > failures. This allows us to move these checks into the core code.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Makes sense, if there are regressions let's smoke them out
> > > > in linux-next.
> > > >
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Thanks. I decided not to queue it for v6.15 for exactly that reason,
> > > I'll pick it up early into the v6.16 cycle and let it sit in next for
> > > several weeks.
> >
> > As far as I can tell from the reading of the code, this will break the open
> > drain emulation. Am I mistaken?
> 
> Could you produce a call trace where this could result in a breakage?

I can't right now, my comment was based on the my (mis)understanding of
the code flow.

> I tested open-drain and open-source emulation but maybe I'm missing
> something.

I;m glad to know that you tested this! So, it means that I misunderstood
something.

-- 
With Best Regards,
Andy Shevchenko



