Return-Path: <linux-gpio+bounces-13063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A5E9D0B8F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 10:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D34AD2829EF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 09:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FED1922F9;
	Mon, 18 Nov 2024 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeDZ+RIo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C99191F75;
	Mon, 18 Nov 2024 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731921829; cv=none; b=u5vOprkUwf37R8ADgjXOWAd8boHXxABH8lO6/rY4GCRTI0siobsVxfKP2f4iCqYOo3m3YXQ7veFrgfOkDQNQXjl+vaZ8jN4kdeLSD46taktC9Tan5ybVtj108XxMcd0mG4/d7FZAfxiMhEqH0DMJkwt1y9jmgQjP/uwhxzJXiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731921829; c=relaxed/simple;
	bh=wzXXv+ExMk6PWjkPG6phYiXnlm4JDgDbE810nWQcyio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8+dQY6Hk2vSD6rIQcfZ1Os1qxCGiLwPhFjES5JpxWuCurf1A0RtcMMksBGGQOHt8Zy9xFrdxW+bmq0MfLEOAQXft8l43A5ZiTKE3eyNe1YTz2Yag+FMwJvVmaagqplhL7UkgKDsAp3Q4roEMmPoX7/+IIyVar5QirBHoTT/CoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeDZ+RIo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731921828; x=1763457828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wzXXv+ExMk6PWjkPG6phYiXnlm4JDgDbE810nWQcyio=;
  b=OeDZ+RIo6b0tgEo89hRz1XJq5hbpoDHvxcu1eO7+HmW07eiSnTQLBNdA
   EPHHdAZM47eqvyHfuHBvQroyEmVq05cRUmtIB4yFZn4UxV8xF5p7xLIrW
   +ZZOu2dWjyLK3l2rG8F1caxeH038d2Rl7fT934ghtPBoxPlLlzlbgZbh5
   YO+bZZ4L3aKHqC4eU4vvJHcUVxodg1Roj07hY3Q+ZxUfrc2jFgUiA7oWi
   v7l/QK7KPIK6GZglvdIdrHPNeV3SgyY0+KlIwVo27IsWkSRCiWw96jnes
   O6qbCBGE+R0sRFRcbaEfzBqzaubYExgYNIFxq2dzwWsrJ1Rk/xDGJAq1h
   Q==;
X-CSE-ConnectionGUID: jU4afqBxQ9alsSKXkBm/5Q==
X-CSE-MsgGUID: frIR+SFeSGuSiq2xPu1OyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35537454"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="35537454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:23:47 -0800
X-CSE-ConnectionGUID: 9bCQcwuOR2ymC1oAU70M2w==
X-CSE-MsgGUID: DqsGfHiITDiR359BhqtIeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89580580"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:23:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tCxyw-0000000Fwwm-1Wbv;
	Mon, 18 Nov 2024 11:23:42 +0200
Date: Mon, 18 Nov 2024 11:23:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpio-exar: replace division condition with direct
 comparison
Message-ID: <ZzsHnkT8HGH64TzP@smile.fi.intel.com>
References: <20241112201659.16785-1-surajsonawane0215@gmail.com>
 <ZzcWGJxqMJVYd4Tp@black.fi.intel.com>
 <090f78b1-88c9-44e5-959f-07b4f97cd1bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <090f78b1-88c9-44e5-959f-07b4f97cd1bc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 15, 2024 at 06:55:41PM +0530, Suraj Sonawane wrote:
> On 15/11/24 15:06, Andy Shevchenko wrote:

...

> > P.S. I wouldn't like to see similar patches to other GPIO drivers,
> > especially those that use a / 8; a % 8 type of expressions together.
> 
> I understand your points about the familiarity of line grouping in GPIO
> hardware and the optimization behavior of compilers for power-of-two
> division. I initially thought this could be a good fix as I have seen
> similar changes before.

It really depends on the use case. In some it's good to update like you
proposed, but GPIO drivers (hardware) are special in this sense.

> Thank you for the feedback—I will keep this in mind
> before submitting such patches in the future.

You're welcome! Feel free to Cc me for review, if in doubts.

-- 
With Best Regards,
Andy Shevchenko



