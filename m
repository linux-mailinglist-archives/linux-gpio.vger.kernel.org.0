Return-Path: <linux-gpio+bounces-24616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07400B2DD7E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84074166D76
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8FC31CA69;
	Wed, 20 Aug 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVOptYPw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AC3283CA2;
	Wed, 20 Aug 2025 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695714; cv=none; b=OhyU0PJOFRIQEJRBNqEDowSnXWyJHu3j7tHHN7dJ7pjtEVSpYT6tdUzwrQ2x3sYiFEg1jmheldxXwvLxBjIG0/W5dLYXZq1T4VIeGYvzGAx1e/dEGTW12TqvfkVlw6uIYh4Cu3QyAzC5g1H33m1IrpO6tVegoLj9DLNTbdkptSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695714; c=relaxed/simple;
	bh=1RWj+ZB0btnu0RyL9Q4G1TrvzO4x4FIBdCv/H4Fmj+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfibk4x2Yyjl210hAlbhTW+bFlIMJf9oImeqFu0p64PAq5WPOPwbCwfEjqAf/mmUYKZEXJF10np+q/0EqkP4tELyi6py/Ir5rKo+CXHgA690LJtWYYU36jaJqnOHBfM/uBOuprhpZ/YVyVNpotO47OFlvvX8lO4JolDaoKJd/fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVOptYPw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755695713; x=1787231713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1RWj+ZB0btnu0RyL9Q4G1TrvzO4x4FIBdCv/H4Fmj+E=;
  b=mVOptYPwNM2sd2vNKxGHlIjXNW1grewfTUTI/ccPS5wVyQWncL+Y62EM
   nDlWeRrleg/AtvLRp+T/1/2cCXYm6uPIG4ZeMnrI5BbK56yzKqRbsY8ha
   DU7HDxB83Kzx2D8tEq0yjFfJsrZZ9LG36qf0X32idNeAoNShQDlbMVvDo
   jLI+1M9i3+0UYDwhAT6sERLjDJP9Z5C+fMg0vGs29AQJlkIEWOs234wfa
   UnU90xZQVZT998ZihnguLpIJ1DtmB8dR9xP5RTAPxvFFGXYWgasp490/4
   0mxC9AA6skXLTbtQBUcl+fT2ckEO0X/M/TMzCgxYk2v0B62zmR72A6SmU
   w==;
X-CSE-ConnectionGUID: I1w5e/GqTqS4cVJygkPOGQ==
X-CSE-MsgGUID: Iaw9g7ImRlGy8vMDszSKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69059019"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="69059019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:15:12 -0700
X-CSE-ConnectionGUID: c5O1/1OHSu64EVJz8YaPVQ==
X-CSE-MsgGUID: eWiROerLTEOc7l6M22NBpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172382773"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:15:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uoief-00000006rT6-3OC2;
	Wed, 20 Aug 2025 16:15:05 +0300
Date: Wed, 20 Aug 2025 16:15:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>, Anish Kumar <yesanishhere@gmail.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
Message-ID: <aKXKWQaUjzWtR5zn@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-11-arnd@kernel.org>
 <20250819121907.GA7508@google.com>
 <e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com>
 <20250820071656.GJ7508@google.com>
 <9fb37e55-0c86-4ac6-acd3-b8c1bc722b3f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fb37e55-0c86-4ac6-acd3-b8c1bc722b3f@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 02:00:56PM +0200, Arnd Bergmann wrote:
> On Wed, Aug 20, 2025, at 09:16, Lee Jones wrote:
> > On Tue, 19 Aug 2025, Arnd Bergmann wrote:
> >
> > Sounds like we're between a rock and a hard place with this.
> 
> I don't think either variant is that bad to be honest, as it
> gets us a long way towards removing the legacy interface from
> default builds without having to update or remove the holdouts
> immediately. It's mainly led-gpio and gpio-keys that need
> a change like this.

And I believe Dmitry is working on gpio-keys this cycle to get rid of legacy
GPIO APIs.


-- 
With Best Regards,
Andy Shevchenko



