Return-Path: <linux-gpio+bounces-15736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1062A30BA4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E951886DF2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891D31FBEAB;
	Tue, 11 Feb 2025 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhOV/fn6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AAB1F9F7A
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276504; cv=none; b=GYKUwfF+GXQ1jnXQlDSuMf7kMwKO+6051ciHlHso6RPr0xUuSi96u/Slqy97bN/RYVngrvjKM5IQXKM5z+n76FmTetESH81xTpGBVbpTkYIEf+iAMt6Zh3E+tmjXn8PM2Q8/DMdoj+yRj73izEBLuNA0+8yDgKucNJ/HhxmfE/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276504; c=relaxed/simple;
	bh=FFT7dxLEi4qoCkgl6hCpkDpfJvVeonijxTnyKn7xuzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2WX2e0jLh/4J1j8K4yX/8bqP4wMXVacJpYC40U34RTpxof1NkyQjaqeRnQRRYCuF6eUBKUUbqXL4fONA0QkuT2+RuF4wZGyECkKCNVMqbLFOaoBEshPbqzKd2YrQiZcHZrpfSnd0XBvl5TDQEb1C78xKjNk4N7YgrK9VTPswdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhOV/fn6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739276503; x=1770812503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FFT7dxLEi4qoCkgl6hCpkDpfJvVeonijxTnyKn7xuzU=;
  b=WhOV/fn6aW3fRbVGzOykw4fMTIf+s0/pwBP+QNPJKAZrr5RvYtq8cONx
   F2aRyBKDWkkqE7AnMoNOMRf+kHR6EKgoMJ3rpptwfZxqgj7RpGbYwXxcK
   2q+yEmEQ3KQiV4Dg5daJT5AJfAp/RA9QyCJzzKhaWxw2cM8cTVnYRHZSs
   A1FcrbMUe2J4oXEPezy6dNzOro3Y3r+Y++fkRvNSmGzuks/aQw4oAY/Uj
   speLm7d0ccKFwbTve49xiU73tcrtedB0d9YdyAYieYs+hh6AyYhmAAbjW
   /fpClZPSOoJscWRWDzEBStAgol8D9gdzXMDBHwOAY2GF5LktQpO6cdZpo
   g==;
X-CSE-ConnectionGUID: vG3t5U0CSKG4Iu3beilmPw==
X-CSE-MsgGUID: pgTOqwdiQ/GuTWnoeueIWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="51282695"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="51282695"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:21:36 -0800
X-CSE-ConnectionGUID: ntVvCsBCSBu31nMpTnZ2mg==
X-CSE-MsgGUID: BGeLGWB2SQmtpYONgmd/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112463872"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:21:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thpGd-0000000AV3I-1rFK;
	Tue, 11 Feb 2025 14:21:31 +0200
Date: Tue, 11 Feb 2025 14:21:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Koichiro Den <koichiro.den@canonical.com>
Subject: Re: small brainstorm for the problem I have
Message-ID: <Z6tAy1orm9UzZ9OS@smile.fi.intel.com>
References: <Z6nHVEB85AQE-rQE@smile.fi.intel.com>
 <CAMRc=MdT9A1ctGy747dwJ0TEbr3bfApu0xM=6iSnAdSe5CrZvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdT9A1ctGy747dwJ0TEbr3bfApu0xM=6iSnAdSe5CrZvw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Mika, Hans (if you have any input on this, I will appreciate)

On Tue, Feb 11, 2025 at 01:14:44PM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 10, 2025 at 10:31 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > I have a device that uses SPI bitbang (which is physically represented by bunch
> > of GPIOs). I want to have a driver of that device to use SPI GPIO driver, but...
> >
> > 1) SPI GPIO has an established DT schema and hardcoded GPIO line names in the
> > driver.
> >
> > 2) The firmware for the device uses already some names for the GPIO lines that
> > not compatible with SPI GPIO schema.
> >
> > So, what would be the best approach here?
> >
> > I was thinking about the following:
> > 1) Use GPIO aggregator to fake the chip that will provide necessary names.
> >
> > 2) Hack the GPIO library to add a quirk for this specific device to translate
> > the line names.
> >
> > 3) ...your variant...
> >
> 
> I would go with #1 of course - as it has the least impact on the
> kernel - but setting the names is not yet available upstream. I'm
> Cc'ing Koichiro Den who's working on adding support for it.

I now realized that under "names" I actually meant "connection IDs"
(con_id in the code).

-- 
With Best Regards,
Andy Shevchenko



