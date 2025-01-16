Return-Path: <linux-gpio+bounces-14870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E464CA13CEC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 15:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D5516B1A1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 14:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990E422B8D5;
	Thu, 16 Jan 2025 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2MON5uU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3CB19ABD1;
	Thu, 16 Jan 2025 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737039054; cv=none; b=U1FxXA/2D3R4K/jnIS0pDsBtYyBME9mEwFLQxWbHb8bPRA+4O9BBxqNAu9SocNtyqyuH3kbuLFmdeRKCGYhCbhS0QKQC7Fr365PGNwDkizi3UmusDSDGlQbPSVVeeSZyqg+yAosSuOGucxydJJ08fCGPdvAyS4ZW/XlHp75XCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737039054; c=relaxed/simple;
	bh=8JZn5ib6GmuPcT9HIQB0SBNRTzsxgg8g2HW5ZtUQoBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0wqOPzaJPHNHzdlaixN0oNMSR+Dpc4w4C+/T3jqXf9GXQVSLgrZj6MEyZIqPtduCwektvySThhKSpVth2IB6W/pGBgvOb6ympkXcI50CQMFutDfG/KGKgC4bRO1yzcJ3qV3AKUGox/dXS6HGvDzZ2xYS0IM6KbNCmXO6WsAZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2MON5uU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737039052; x=1768575052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8JZn5ib6GmuPcT9HIQB0SBNRTzsxgg8g2HW5ZtUQoBA=;
  b=C2MON5uUSc9J4IAsi0SYuT/QVtDSnJ6coJSvx+MZOPZWciWg20R18d01
   /i0KY/Sjhv3AEh07qZCW4ApribGj6U7sWBZuuFpl/Ur3dEaXn//NGPdXw
   rECEfuI5k5hFRDoTfDh5U0PT26Uq28CBhDQmLwX3mvklD+8NebjRr/ea6
   /VT1I59S9bzLIe+RQsAtK97nJgPWtbfzCmqebNXtKAykP+hAIp8pE/af8
   QkphGeQPxHq7l+Zp6LyyIQEuDex2H/ORTMXf1wf2VXBhKgox/9oJ5QPks
   Dt5TituQRw3f3UAg61d/oXKFaqBNFZn2D4cSoqrqYTwwR2/0aFfdIkR+X
   Q==;
X-CSE-ConnectionGUID: R6V1DbXsTN6qcfATF9wVcQ==
X-CSE-MsgGUID: IkGXIoXUQ8yy7kXrTUjMfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="54840715"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="54840715"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 06:50:51 -0800
X-CSE-ConnectionGUID: cG9bn01ASj2UjZarve9YLA==
X-CSE-MsgGUID: 8G2rapFQRJms6MVsyQqhwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106100293"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 06:50:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYRCn-00000001hm9-1mTA;
	Thu, 16 Jan 2025 16:50:45 +0200
Date: Thu, 16 Jan 2025 16:50:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z4kcxQWeL09VARfK@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
 <Z1r0EPC9gumruFKU@smile.fi.intel.com>
 <2024121242-saturday-aqua-9ac6@gregkh>
 <Z1sObNubEnsFwzOD@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1sObNubEnsFwzOD@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 12, 2024 at 06:25:16PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 12, 2024 at 03:39:57PM +0100, Greg KH wrote:
> > On Thu, Dec 12, 2024 at 04:32:48PM +0200, Andy Shevchenko wrote:
> > > On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> > > > On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > > > > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > > > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > > > > 
> > > > > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > > > > helper and uses it across drivers.
> > > > > > 
> > > > > > For the series:
> > > > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > > 
> > > > > > It seems like Andy will push it to me which is excellent.
> > > > > 
> > > > > Yep, that's the plan after we get all necessary ACKs.
> > > > 
> > > > Greg, anything I can do to move this forward?
> > > 
> > > Greg, is it possible to give your Ack or comment or guidance of the preferences
> > > with the first patch?
> > 
> > $ mdfrm -c ~/mail/todo/
> > 2293 messages in /home/gregkh/mail/todo/
> 
> Oh my...
> 
> > Please be patient.
> 
> Sure!

Raaj, care to send a v3 after merge window closes?

-- 
With Best Regards,
Andy Shevchenko



