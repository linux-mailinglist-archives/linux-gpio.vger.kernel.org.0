Return-Path: <linux-gpio+bounces-18369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13764A7E003
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1DE13AA509
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348E51ADC86;
	Mon,  7 Apr 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbfZcg0t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C1335962;
	Mon,  7 Apr 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033557; cv=none; b=a41qzlijqt37Hpj9uRfuvU8+5bmYuptPvwQeXZA3jiRD96Fi6Ul7STS/Yw15SL+XJqwjqa7Wz0QQz24GYMhGvGJUFTvZNl/KbzYV8p1m+H95kYTPOs7OC+EiftfbY7tIwdCvIbXhQpNczzt0VU0JI4BXrkHfj1FVSlda715w+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033557; c=relaxed/simple;
	bh=4e8rINJPc9nYc17RzIR3NQ5mwf2OOPgh0OmUqhEbytg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgOSwCE0ID/8SGuAMFBdE5BncaWTxSPOAYsAbxQx/xpan6xiKtd0lm9tvJtMK+CdA7fyMm+9H/vu6BAK4Bna6nahj6BTjqkiOLJtD0jpZh+JzaJaklskgc7Ts4wei/A7J1psfItJ7DQMAbhmGxxH7RojR28Jn9BSfE2DkHwBBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbfZcg0t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033556; x=1775569556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4e8rINJPc9nYc17RzIR3NQ5mwf2OOPgh0OmUqhEbytg=;
  b=RbfZcg0t3cOdOcQ5wf7fuJRiXeGycaM80rkLUfhMS0/IGJOlTVGJoZs4
   a9OGkwpUrn0ws3AGpqofNJUr9M4XY91FEOXO+7CXRMIvG4mCAxbXjH3/W
   NMDIn2+2xxHz5dUUiwfOqGvW4v/AT6xdO2mXwtDb0MvQIcThfS8vlAVDc
   RTeinrMs7ojVTk2KtmsZZGyXcv/fQ/F8qFj0cK8Jt+raskIs25eTXb1V9
   9bWbgzZwBsIz2dqjpUxWqC6OgdmG18pfF3KruiID3S4aL+HzChekKNtD3
   4hv18uXpURx4p3/LyQcnpIFite378VxZUJgG+ZQXfcU/49A1W2tfA8/OR
   g==;
X-CSE-ConnectionGUID: PP4Wa6SwQd2f46zQjU0EHQ==
X-CSE-MsgGUID: nQ4WnHhHTwKvksvTIlWZxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49271122"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49271122"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:45:55 -0700
X-CSE-ConnectionGUID: E69X+6zOSeWWIlI7Pw1kig==
X-CSE-MsgGUID: 2n2yj9wKQH2IJGDOX1Fsxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128489483"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:45:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1mnO-0000000A5H2-1pv9;
	Mon, 07 Apr 2025 16:45:50 +0300
Date: Mon, 7 Apr 2025 16:45:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
Message-ID: <Z_PXDjfVBBvZKf5i@smile.fi.intel.com>
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
 <Z-5BHzTEed607Afz@smile.fi.intel.com>
 <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
 <Z-5uJxij4jmhint3@smile.fi.intel.com>
 <CAMRc=MdPiz_YD451Arrm4mT-SwU_OdK1U-WozPxsvt11mHsLZQ@mail.gmail.com>
 <Z-6Lm_Aqe3-LS4lj@smile.fi.intel.com>
 <CAMRc=Md0gD=XPEkb=C6JJcRvDpBbcJb5Xv8fE-v94iT=COHw7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md0gD=XPEkb=C6JJcRvDpBbcJb5Xv8fE-v94iT=COHw7A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 02:49:27PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 3, 2025 at 3:22 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> I explained why I believe this change is wrong and I will allow myself
> to not accept it unless Linus is very positively in favor.

I am on the opposite site. With all burden on the users' shoulders...

And your _any deinit_ function example is wrong. This is not a deinit case,
this is resource allocation / reservation / etc and freeing it. Freeing
invalid resource is bad, freeing an optional resource, or resource which
has never been allocated — is okay. It makes device driver developer's life
easier. And many kernel APIs are written in that form. Since you again
pointed out that gpiod_get() is annotated, there is very unlikely somebody
deliberately will ignore those errors.

P.S.
I will continue insisting that this is an inconvenience (or bug) in gpiod_put().

-- 
With Best Regards,
Andy Shevchenko



