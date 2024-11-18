Return-Path: <linux-gpio+bounces-13081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1886E9D1099
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 13:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9AA31F22D7E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 12:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09CF199381;
	Mon, 18 Nov 2024 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXnaAD2Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C918190665;
	Mon, 18 Nov 2024 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731933303; cv=none; b=mCteqHUJto20OOksmr1VhrFAdiIuKjpLywt+00J0RG0GGikJRc/kXwPdHs2gjP338TUTUDIkPdd4btvALeZafWipXM5ul9eYuTZ9eS0PJqPlO5sbFtPqp3KuIZRw2VkcgOTQvqp4WLPHNbwSD/P8b45TE+a0eBYAjiYo2bioMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731933303; c=relaxed/simple;
	bh=1QOLDhyKFCcj1qC0kCMyZR1QMMmfAF6c9IjuK1xpGPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVeHFicxroseKFgvgvkRNa5f/bgmVYEtfdesgooh92DKoYI6Qo8Jig1V7vZQEE9i3Hca5Vol9QRzhvbDxg/s9RPWOP6ya7weTiUNG2CmKmKdXKQ2CbELve7m6eJ1M65KAKMluf4kYKqs1XvguH4OWD2UNh+M87r+LymW+FLhF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXnaAD2Q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731933302; x=1763469302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1QOLDhyKFCcj1qC0kCMyZR1QMMmfAF6c9IjuK1xpGPY=;
  b=OXnaAD2Qq2mvLio5QR1uMJ2bEuFz1zcTtESMpLn/snb2qL1XBCrR3Ss8
   JGEj+NqtZTjQ0ZtszVWkEhS/utsH+7LHqU9wRjLWSjq57F7U+2fNYyWks
   NdBYEzE5tNrrhmD6rDIJQJWyofeneBd0H0W+wuxyQbkPH1XhEoUPpVdCx
   YmiLIeuXSoI8EslLzdK1YIbfTVKETnIajDVYdf4qq/gLFAEuzyAh40sps
   YjjMcxbtJKSARCP6mSLS5itWYYK/fZMuxXrdTI8GLbM2gI5sb3/oHEa13
   dpYxvvsfGdP6jZKPfKP6Di/vZ2g8cJ39gt64INTw/S6zVyWmiV/gzDAHt
   g==;
X-CSE-ConnectionGUID: QzDAqeYXTY6JauaqnLYYsQ==
X-CSE-MsgGUID: fLCVol3oRCGdqnp9YzYgOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32038074"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32038074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:35:01 -0800
X-CSE-ConnectionGUID: B1q4FiRqT6mCukSLw6qJBQ==
X-CSE-MsgGUID: 8rmFiE4bS/KFyiLxISpb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94267318"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:35:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tD0y1-0000000G0EN-1JwC;
	Mon, 18 Nov 2024 14:34:57 +0200
Date: Mon, 18 Nov 2024 14:34:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sai Kumar Cholleti <skmr537@gmail.com>, bgolaszewski@baylibre.com,
	linux-gpio@vger.kernel.org, mmcclain@noprivs.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: exar: set value when external pull-up or
 pull-down is present
Message-ID: <Zzs0cc2F4vkGhqCQ@smile.fi.intel.com>
References: <ZykY251SaLeksh9T@smile.fi.intel.com>
 <20241105071523.2372032-1-skmr537@gmail.com>
 <ZyouKu8_vfFs20CB@smile.fi.intel.com>
 <ZzN0nn6WFw2J8HTF@smile.fi.intel.com>
 <CAMRc=Md=tv6QapMCoiLf6eeK9qOtG1jvENHnKdTk2i6U+=8p5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md=tv6QapMCoiLf6eeK9qOtG1jvENHnKdTk2i6U+=8p5A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 18, 2024 at 12:00:00PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 12, 2024 at 5:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Nov 05, 2024 at 04:39:38PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 05, 2024 at 12:45:23PM +0530, Sai Kumar Cholleti wrote:

...

> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Does this need to be applied, Bart?
> > Seems it is missed in your branches...
> 
> Maybe if the author used get_maintainers.pl as they should, I would
> have noticed this earlier?

Ah good catch!

Sai, FYI, I use my script [1] which does all required stuff for me.
Feel free to use it, patch, comment, etc...

> I have some other fixes to pick up so I'll send this later in the merge window.

Thanks!

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



