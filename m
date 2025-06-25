Return-Path: <linux-gpio+bounces-22183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F99AE830A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 14:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00F7817B1DA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20732609CD;
	Wed, 25 Jun 2025 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLiJkEIR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5825BEE2;
	Wed, 25 Jun 2025 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855543; cv=none; b=rRMeORPWE+tpUhCwgIwCfwx18r1otVqyvuU4EwWCg5q1ow/MioI+SYjYFgfu3gS1svpj3MU3DGx+zZ8WyowLMPCiONcWOq8fPAt9Y4cwiDIsRFDNdW+plEUn8aElToUxfEIxb+r7wE7EamTljanQK38XxsgT04VIxe+KvQVes88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855543; c=relaxed/simple;
	bh=u7KhYtYFfF8hIrEkFmomLpCGUnnfCnEiIwSY+/XufMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SutvdbPecCZjuzBRgLad77bvq1yquHDW3lALNR20qQ33auzmNDh0q2b1zDqr0PYCEex4+GyDBBsNVxs3mP0y+5ECI3sle9A9qeG/gvIltaHhPeiSEjvqLO3djRQ8C3OXQSKK6MLtqocYOi/n2SZAml6i5AswYvVqyOobM2zGbP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLiJkEIR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750855542; x=1782391542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u7KhYtYFfF8hIrEkFmomLpCGUnnfCnEiIwSY+/XufMM=;
  b=PLiJkEIR2xhh+o/Gibdv+vayqEjIe3p82q3FQtOkA6f7cUEQh7yHEs05
   OnqefTqXBD5gZIChGkaeAMXIhifZ/FC7zIdTXzoXMZAVdICpT8y9JMHyC
   ESjMtVIPfRGzH8GabMFi6ldg0q2I+y+o1HmWIN4X/SQB/5Tq6INACnj/Y
   jHUhI3is0UEW6qoL0aNt8qRxBWKA+C5HP9B5RhqSgTc9pxTbClB7SGGTn
   7SFNX+vWxUa6hbhoRnZGeibMkRXdaGwxnhlN7L6A/0KOix+mxIByAnZQz
   B1Ao4bjgpW1cfOOhI/b3pp+/gr9CwAGFPClsLIJdr5CqpEAxFxqbf4vbS
   w==;
X-CSE-ConnectionGUID: q2uEl87vQoScWBj9Hiv+5g==
X-CSE-MsgGUID: dl4AACFqSZ2KrCFcNQmXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70556312"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="70556312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:45:41 -0700
X-CSE-ConnectionGUID: NMZhsQVgQSaZDfVpbvOZBA==
X-CSE-MsgGUID: H2UvHpQ4SsKlNtvwARVPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="189380904"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:45:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUPVN-00000009lll-1PDb;
	Wed, 25 Jun 2025 15:45:33 +0300
Date: Wed, 25 Jun 2025 15:45:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 03/12] gpio: sch: use new GPIO line value setter callbacks
Message-ID: <aFvvbH9nJkgWqj_t@smile.fi.intel.com>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 25, 2025 at 12:33:26PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



