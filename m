Return-Path: <linux-gpio+bounces-15894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2967A3396A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 08:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70F543A4C25
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 07:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B61720AF8A;
	Thu, 13 Feb 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiEwq1uV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716C20AF68
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433520; cv=none; b=ptgmmbtKMeEbr1enoWNv5hsolXuN0YezOPj+wgmVMMXmENUMqA0NSKcMRrEUPjNjNZaY2eyJAgncJCdGADw8j6D15qsl8B4cIHhB5ARQtXbh+QefqX+fP3OYb9ntMvra94vcTBJvMr0i/VZEAipkg3FXv65lYYYMGwXMZO5N8WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433520; c=relaxed/simple;
	bh=ROvwcrQAjbOE9MY2wDn88rwxDNJQD0b1OOTtxdK8Jp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqtGZiSpo1aYhJ6G3gFRqowpM9Fd1OkVtPpG62ehEiIaWOPKXSmKb9jbEQEafas7d9VpkNQmbw3N+Bl/XCOLpkANycAd3QONrQDxTjjL4KczFZhKUaV7h9yaRROHIUWVZd0OwXRP+P3ZxZ5qisRPxttVrtYbMpTj0n9fq0xc8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiEwq1uV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739433519; x=1770969519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ROvwcrQAjbOE9MY2wDn88rwxDNJQD0b1OOTtxdK8Jp4=;
  b=ZiEwq1uVeLEqxPmcU4I0WnDzVKmn68t00SLRsyzPePwa5TPLQdjxgtoP
   G5zYcTNQHI74F4O/GOthvob4vTUT9w4onN6ZQFSadcik59E02LlXAl4pO
   +4f4sLMg4riTojUj55L/qRrtUpik36tND42R83f0qSZYozmP3d1lg+tQ5
   1nccY3gj/FkcMMmx6eBjws8liJ60B9b54exag3W/31WtoCbwX9BGtZPfB
   w3PYQ8gaYED95oNx7osDyBYBEOX+nvHAbanJAbRSvet+qow1e/VPP+E+k
   cLINGvh8ry02Pfj6bsizfXNtDznFB4rVzdyuoM0HjPqA7kS/fP08uzmj0
   A==;
X-CSE-ConnectionGUID: BotVOykdQeyetj93gR7UkQ==
X-CSE-MsgGUID: hT2UAuNtSiyAWI/xXOyxWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39823944"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39823944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 23:58:39 -0800
X-CSE-ConnectionGUID: O345OLkDRxmG9fF4lV4yCw==
X-CSE-MsgGUID: jwiwxq6xRSqzD7Zx/nPaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150234226"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 23:58:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiU7H-0000000B682-1dOA;
	Thu, 13 Feb 2025 09:58:35 +0200
Date: Thu, 13 Feb 2025 09:58:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: small brainstorm for the problem I have
Message-ID: <Z62mK8ZUr3IDzewt@smile.fi.intel.com>
References: <Z6nHVEB85AQE-rQE@smile.fi.intel.com>
 <CACRpkdbUCjeJXkc4iBBqJFsQ3sEbiv8HO9eh7ft5dAC88f7XSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbUCjeJXkc4iBBqJFsQ3sEbiv8HO9eh7ft5dAC88f7XSQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 12, 2025 at 11:55:31PM +0100, Linus Walleij wrote:
> On Mon, Feb 10, 2025 at 10:31 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > 2) The firmware for the device uses already some names for the GPIO lines that
> > not compatible with SPI GPIO schema.
> 
> I guess you mean the node names
> like "cs", "mosi", "miso", "sck"?
> 
> > I was thinking about the following:
> > 1) Use GPIO aggregator to fake the chip that will provide necessary names.
> >
> > 2) Hack the GPIO library to add a quirk for this specific device to translate
> > the line names.
> 
> I would honestly do (2) if it was device tree, because we already
> have nicely centralized quirks for it, but for ACPI I don't know :/
> Aggregator feels a bit like overkill for this.

Interestingly, I feel the same. The aggregator approach is something like +100+
LoCs for a little benefit + runtime overhead.

But this sounds like we would need some kind of translation quirks done in gpiolib-acpi.c.
In the similar way as OF does.

-- 
With Best Regards,
Andy Shevchenko



