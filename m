Return-Path: <linux-gpio+bounces-14958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E602A1772D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 07:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD631886BC4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 06:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388641957FF;
	Tue, 21 Jan 2025 06:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iF/U1ccS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E23D6A;
	Tue, 21 Jan 2025 06:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737439524; cv=none; b=mmxzslcUvfNdVlCVl+vJ6wrhr9u47BgJTdN+HPdpJ3yl/o1+wK2jrhIyBWF7ot+2/7TG9bW4sjJXuSch5KOc86PqhoSX3zcdhku/mTkH6KiAgxoPzWypcQ5v+aGZ8MKRUJrSrOM4WgwNBldt7FEjz1oIa/emYz1xRcCfmTPcI2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737439524; c=relaxed/simple;
	bh=IGRMs8LaDimWXraXVT2EpT0OnRTkqo8orPR5qJssWFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFc5AfiDB/5tpsEzZqrx8I599cIrUO6rIyX7MImZvUHGdnsF1FwciKxby3C58QBqPP5LrUOr2PEQcfDjmp9Ek6hMxYHquSxtstCSN/CGXeqqhvFe5n5V2o2AgUCnZu/NDL8C1k0df6m/EhrTG76o6Ad7tenC1EL/lRKTs62m1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iF/U1ccS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737439523; x=1768975523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IGRMs8LaDimWXraXVT2EpT0OnRTkqo8orPR5qJssWFo=;
  b=iF/U1ccSpziee0Zl4DMJ/6bIwgPNrFmH6HfoAYpV2M54bfuCTKcNPQ0m
   kqi4n2L6qz8mMIRshRxh34ajlguO3lUh2NUhpJHNLjdxSAwQxa9dnFV2S
   XligrhIUSol3450E+P6jnOprkiDY/TljHQOkKOI2pmzR3AFYtADRqiojF
   w5/y6KyPi0yTkYqt5dqMvsAtrHsTNVKw+/VdLg1yqBDvYQw65wlKVamjp
   hunq5pZIAouOtEX3fDpFaOZfQr5YsqD48u46Vg0rS9uyB3rzAvzqax5fD
   gyyG0NNlQmXGZxSg2ETcMMhaAk2vL3SGoVGZM4YfVGoOM9iq01Y4g1qTO
   g==;
X-CSE-ConnectionGUID: SJ4d64ZaRwawnw4oPPPKYQ==
X-CSE-MsgGUID: g9N2yEfQTO+p7mtxAJHzCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37712573"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="37712573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 22:05:22 -0800
X-CSE-ConnectionGUID: 5wYAlv74Sba04aeErSXUMw==
X-CSE-MsgGUID: x9dtj7zBS62Cdr6O+RrHHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111799875"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 22:05:19 -0800
Date: Tue, 21 Jan 2025 08:05:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z485G85QrFUbUaQ9@black.fi.intel.com>
References: <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
 <Z1r0EPC9gumruFKU@smile.fi.intel.com>
 <2024121242-saturday-aqua-9ac6@gregkh>
 <Z1sObNubEnsFwzOD@smile.fi.intel.com>
 <Z4kcxQWeL09VARfK@smile.fi.intel.com>
 <Z4pwksY3Bs4taZd3@black.fi.intel.com>
 <Z46C1bZ4AMLvKTn0@smile.fi.intel.com>
 <Z46DunMGRKQcxtnz@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z46DunMGRKQcxtnz@smile.fi.intel.com>

On Mon, Jan 20, 2025 at 07:11:22PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 20, 2025 at 07:07:33PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 17, 2025 at 05:00:34PM +0200, Raag Jadav wrote:
> > > On Thu, Jan 16, 2025 at 04:50:45PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Dec 12, 2024 at 06:25:16PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Dec 12, 2024 at 03:39:57PM +0100, Greg KH wrote:
> > > > > > On Thu, Dec 12, 2024 at 04:32:48PM +0200, Andy Shevchenko wrote:
> > > > > > > On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> > > > > > > > On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > > > > > > > > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > > > > > > > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > > > > > > > > 
> > > > > > > > > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > > > > > > > > helper and uses it across drivers.
> > > > > > > > > > 
> > > > > > > > > > For the series:
> > > > > > > > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > > > > > > 
> > > > > > > > > > It seems like Andy will push it to me which is excellent.
> > > > > > > > > 
> > > > > > > > > Yep, that's the plan after we get all necessary ACKs.
> > > > > > > > 
> > > > > > > > Greg, anything I can do to move this forward?
> > > > > > > 
> > > > > > > Greg, is it possible to give your Ack or comment or guidance of the preferences
> > > > > > > with the first patch?
> > > > > > 
> > > > > > $ mdfrm -c ~/mail/todo/
> > > > > > 2293 messages in /home/gregkh/mail/todo/
> > > > > 
> > > > > Oh my...
> > > > > 
> > > > > > Please be patient.
> > > > > 
> > > > > Sure!
> > > > 
> > > > Raaj, care to send a v3 after merge window closes?
> > > 
> > > Sure, and perhaps add a few more users which I found with my improved
> > > grepping skills.
> > 
> > Okay, thanks! I will drop myself from this thread then. Waiting for v3...
> 
> One more thing, can you embed the following into your series?
> 
> 20241203195340.855879-1-andriy.shevchenko@linux.intel.com
> 
> It would be easier to handle and avoid conflicts.

Sure.

Raag

