Return-Path: <linux-gpio+bounces-16301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC0CA3DB1A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADB947A8B49
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CDB1F790B;
	Thu, 20 Feb 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfXvmLIE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B21F5425;
	Thu, 20 Feb 2025 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057526; cv=none; b=GyhtoRp1LlAcw3S90sxsdahQYcsdqQQvrmY+g4EMTx6oiajzZ3X0yAfvYvobea6kF55QVcGjlR1fPs5Q76Z2pzVFuaMJfLUp4OzN/sFYcpCVlWETOmCt3ovbvdw7N7t0D0e3y5aRD6xbIZlI92lvUTHe9ElfGsP93fXwRac344M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057526; c=relaxed/simple;
	bh=QsaF42+LR1K0MKpatG2MAIISA8K6RjPF2e8LnTjn4CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9Ctpau1L9h7YXZF/MXv+3AHagaujdb4D7R4AInBFRDdxEsLByTabUkGu4UY3SAw5QO3G2lyCZbza+Uu0ClvPv8p/PWu2isWJ9RfDDWRoDvo2f0xzdxFgynrOrfQjPXuTPptHpdRL3T9FJa2id2TGngv5aNJDzHoH9x/Bh99+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfXvmLIE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740057524; x=1771593524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QsaF42+LR1K0MKpatG2MAIISA8K6RjPF2e8LnTjn4CA=;
  b=MfXvmLIESa2r6GSduj6rXf9ovLaQrq6dMAmavXD2ggDEuzYBUQ+UJKvh
   EPFqqbWYWgLrj3RXPn6YJMfwa0vU1v2b5C57r8oyH8P86LY+IT/y8Rvzj
   KDryORLlPMUZKn3aXAoLdTdvcMMyWOPX4KXeg8QgBidblxYc8Ljz9WMSB
   rmO4N+VZqFzdgpaglraD8mdNoeFldrwHxR0OefEsb6hHecaBvpP1AUoj/
   IzK3UbAT4D0KoKl9SHXVSTsrDOsN+2zBsm5wz+SP++Kf3h8C+qYEJkzgs
   N2FAlVoycMevQhThpqTzQ3ciGyrqpE/WDArxsGA7JaewquT1MFMln/BH3
   w==;
X-CSE-ConnectionGUID: N5PaKSm9TcK7xZNVWRaU8A==
X-CSE-MsgGUID: qyLc9yJtTJS0nVxhmvz6sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41040812"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41040812"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:18:44 -0800
X-CSE-ConnectionGUID: 11MnNtBGQi+Gm/mnt/vjZQ==
X-CSE-MsgGUID: hvLRVapYTJyRG3yBRVNVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="120021542"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:18:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl6Rr-0000000DLJ8-1J2q;
	Thu, 20 Feb 2025 15:18:39 +0200
Date: Thu, 20 Feb 2025 15:18:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Message-ID: <Z7crrgl2iFn34gck@smile.fi.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:
> On Thu, Feb 13, 2025 at 8:56 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > It appears that regmap GPIO doesn't take into account 'ngpios' property
> > and requires hard coded values or duplication of the parsing the same
> > outside of GPIO library. This miniseries addresses that.
> >
> > For the record, I have checked all bgpio_init() users and haven't seen
> > the suspicious code that this series might break, e.g., an equivalent of
> > something like this:
> >
> > static int foo_probe(struct device *dev)
> > {
> >         struct gpio_chip *gc = devm_kzalloc(...);
> >         struct fwnode_handle *fwnode = ...; // NOT dev_fwnode(dev)!
> >
> >         ...
> >         gc->parent = dev;
> >         gc->fwnode = fwnode;
> >
> >         ret = bgpio_init(gc, dev, ...);
> >         ...
> > }
> >
> > Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> 
> Thanks for fixing this Andy!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you for the review!

Bart, do you think it can be applied?

-- 
With Best Regards,
Andy Shevchenko



