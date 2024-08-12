Return-Path: <linux-gpio+bounces-8723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2E94F5BF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 19:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24DEE1C211C9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 17:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D501D187FEE;
	Mon, 12 Aug 2024 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaIwcCVX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204901804F
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723483383; cv=none; b=BFIvzYh7/RSm8N3k4EDzf+Z/RF4mr6+XdeZ5cZGhOgC3bAw+AC6R210huqvPebtEqghyW1m/EIA+BCN/0VuX59WVWMYaIwWFxvgiYEJJx7rhW1D6Pkz3jMK1f+gt09RTGlcAunmBiYS7iYXiVtRcjgfNbz1R4T+ttfObQtYFtjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723483383; c=relaxed/simple;
	bh=eogV72n4YOMoZ8E/3unaFDzqLtZo7Sct/jk6BuP4Hus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2EFr0FWfyDRxJpx8CXrgMb0+nbX4KFA7YyUi/6iTEmE3RCGHit4Nb/5wOuLkUzjBH98ltFX8M7WNyiB73rH4ZQJrUYQPLLGMECKKseoYWyJE/J5TMa1XOBOsZiQSPSH4kD22TObHugzUUJkTWPFJaTTsrgJTy40UDpDyOw3KiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaIwcCVX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723483383; x=1755019383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eogV72n4YOMoZ8E/3unaFDzqLtZo7Sct/jk6BuP4Hus=;
  b=TaIwcCVXqsaLfObrW6SNwiJ0RIQBG/J41BXuiPN69kGDPZE5karos+QS
   Ypfu/StX0q9fOzKaIQ5eLNB+eRldFf4jBumBZc3HxS1AekhF7FGTPZlBQ
   g6tfmJJDWkmMDzZU4B/zAt2f3BJUo8bDBhlrCAu8+a0+eis7tHsUSfr0P
   GkmsrbGm48o1oq29cKiPV4bBSg9RMY3Tvdlyn6eDGOML70HNUugSAG1p5
   SP3UjqEiqqLa7oi9nVCgj8Qmd3r6TytVYY+4H26loONNT1AstaEGBXXuo
   XPW9MEvZPKj5nY90cs2loB6f1cbxMsj800W8fYE96odA3orYXXZsuAw0H
   A==;
X-CSE-ConnectionGUID: yyyvyz6xQeqEIRxYg8r55w==
X-CSE-MsgGUID: TMfNZqgSTOOR3tQr8gUWFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44128693"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="44128693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:23:02 -0700
X-CSE-ConnectionGUID: CT5pwZrgRCy4FeogCAwo9g==
X-CSE-MsgGUID: v3NKnE3PQP6sO6IwxKSYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63264566"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:23:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdYkz-0000000EQXW-22iw;
	Mon, 12 Aug 2024 20:22:57 +0300
Date: Mon, 12 Aug 2024 20:22:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Kumar Cholleti <skmr537@gmail.com>
Cc: bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
	mmcclain@noprivs.com
Subject: Re: [PATCH] gpio: exar set value handling for hw with gpio pull-up
 or pull-down
Message-ID: <ZrpE8RYLG0141_EB@smile.fi.intel.com>
References: <20240730134610.80986-1-skmr537@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730134610.80986-1-skmr537@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jul 30, 2024 at 07:16:10PM +0530, Sai Kumar Cholleti wrote:

Please, refer to the functions in the text as func(), e.g. exar_set_value().
Use proper acronym, i.e. GPIO (capitalised).

> Setting gpio direction = high, sometimes results in gpio value = 0.
> 
> If a gpio is pulled high, the following construction results in the
> value being 0 when the desired value is 1:
> 
> $ echo "high" > /sys/class/gpio/gpio336/direction
> $ cat /sys/class/gpio/gpio336/value
> 0
> 
> Before the gpio direction is changed from input to output,
> exar_set_value is set to 1, but since direction is input when
> exar_set_value is called, _regmap_update_bits reads a 1 due to an
> external pull-up.  When force_write is not set (regmap_set_bits has
> force_write = false), the value is not written.  When the direction is
> then changed, the gpio becomes an output with the value of 0 (the
> hardware default).
> 
> regmap_write_bits sets force_write = true, so the value is always
> written by exar_set_value and an external pull-up doesn't affect the
> outcome of setting direction = high.
> 
> 
> The same can happen when a gpio is pulled low, but the scenario is a
> little more complicated.
> 
> $ echo high > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 1
> 
> $ echo in > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 0
> 
> $ echo low > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 1

Okay, shouldn't you instead mark the respective registers as volatile or so?
I believe regmap has some settings for this case. But I haven't checked myself.

-- 
With Best Regards,
Andy Shevchenko



