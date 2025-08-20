Return-Path: <linux-gpio+bounces-24618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2EB2DD85
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5819A169A13
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BDF31CA78;
	Wed, 20 Aug 2025 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYiAiewG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA127EFEF;
	Wed, 20 Aug 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695763; cv=none; b=KoVdUNwH5LRDL7BigK2jh6xQ4Tpc54U3/ziCdzriqPskOEnNZbktYUneQvr7+SXmY8c7SLA/OkTd6hiDZ3mmx2RMUpSPmQ+eMJ912fDCMxaVhaIfTPjde6aDsDFKhMYF9iFwNhFd6bWGxFXR9Jc3aeJGLBijPrJ2it2dvzxr/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695763; c=relaxed/simple;
	bh=pgzucyFJ2qwXfAUzKmlcRJ+TSy5kl0B/JmsPMeXJz7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAFlRL1OFVt+Nert1CyGWC5E/FwnauxdOMfw06FEUCrv4vxCZtzVz5CmpdQHmse4s5DKrWs4CWxPmZ+xSs35pGS1nKVVIT0cIXdLazlGIRwCZ2uHgF/xTOr56JEBCR5ab6PPJeG/4jJQw4Y++0UupkCkqxNtpmRr1wLOnV97xNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYiAiewG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755695762; x=1787231762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pgzucyFJ2qwXfAUzKmlcRJ+TSy5kl0B/JmsPMeXJz7s=;
  b=EYiAiewGkzexA8iXs7VHi1S2FbsfV4VACe3e/Dh2smCQ8Fr4xhKNoN4u
   KIvm1sH6q24ywtQ74xTULX9A7EwwqSA65iyIYKG9etGr+0WCu9/vnzFo3
   zhzpKYh7g76Pom0nDIB+TFpjjcn99sC9bNXtaWEgMBQetOjOLhylB2LiS
   mmYo5hCbggjf7T6/i4nDIXfv0EDwO8kC+d1rIT/eFV2fEWWvSQZjXWAJx
   kYSgpR1KhccxxqqA4AwVWa2LKXlhjb/8zC1N1dOmtPHR7qhVZoMxjCpuN
   yV5yDN6hgwYOdrhj6s5fm+Q5L8y/FTyJyRUi31TnrNxNka+WLVq4cjX8g
   w==;
X-CSE-ConnectionGUID: Vt7O+nmLSoOCloQkTchdEQ==
X-CSE-MsgGUID: hGCNdI3MQA+qj2amFBeGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58033075"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="58033075"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:16:01 -0700
X-CSE-ConnectionGUID: nXos2A7pSY+ZWgL5o2Ycgw==
X-CSE-MsgGUID: zbIaFEhvQgyTqSx/pia1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="198990833"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:15:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uoifS-00000006rTY-3FiQ;
	Wed, 20 Aug 2025 16:15:54 +0300
Date: Wed, 20 Aug 2025 16:15:54 +0300
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
Message-ID: <aKXKihAqhzx2SRZa@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-11-arnd@kernel.org>
 <20250819121907.GA7508@google.com>
 <e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com>
 <20250820071656.GJ7508@google.com>
 <9fb37e55-0c86-4ac6-acd3-b8c1bc722b3f@app.fastmail.com>
 <aKXKWQaUjzWtR5zn@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKXKWQaUjzWtR5zn@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 04:15:05PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 20, 2025 at 02:00:56PM +0200, Arnd Bergmann wrote:
> > On Wed, Aug 20, 2025, at 09:16, Lee Jones wrote:
> > > On Tue, 19 Aug 2025, Arnd Bergmann wrote:
> > >
> > > Sounds like we're between a rock and a hard place with this.
> > 
> > I don't think either variant is that bad to be honest, as it
> > gets us a long way towards removing the legacy interface from
> > default builds without having to update or remove the holdouts
> > immediately. It's mainly led-gpio and gpio-keys that need
> > a change like this.
> 
> And I believe Dmitry is working on gpio-keys this cycle to get rid of legacy
> GPIO APIs.

I just realize that this might be odd, I meant Dmitry Torokhov in this context.

-- 
With Best Regards,
Andy Shevchenko



