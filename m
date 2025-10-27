Return-Path: <linux-gpio+bounces-27660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0228DC0D4CB
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A577E4F4CFC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 11:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1C22FFF9A;
	Mon, 27 Oct 2025 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFRGb5UG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982372FE066;
	Mon, 27 Oct 2025 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565777; cv=none; b=K/KNkh1QTTR8+Mt68h7tdDRcHmWcdXofIpaj7lv2bA8cLhnImXK0kYbJhUT1xd6axa3FLz6zdqWglAQcHW+rlelkSG0W6/FG1Eo+4xZ2bV+GhfJOYdFqAAeP2SLHE2CU7HzQ+fmOMgpTX9Q5TPYeWdCSGwKbxm2poIVMVWK0H2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565777; c=relaxed/simple;
	bh=dJzQ4gmIw5ewxR3PPzC4hM/BMmNMF6AtZtjJ9M7G94o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXqlpz9HifJy4j6jZE0QfyKPXR1V4JUDCmFZboor8qI135OmJYxW/+iVMFokOTfHW24/WxtaGW+k7LMlF4gRWutRWdBXJ+p/NWr6NnN+fiQGEA/z4mXErmrBqBOq02l+uF7HLRlAB3xRBVoKn27jKiBF1A3gL65FTBN8s8BcKI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFRGb5UG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761565776; x=1793101776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJzQ4gmIw5ewxR3PPzC4hM/BMmNMF6AtZtjJ9M7G94o=;
  b=eFRGb5UGlbMC1lehofsG0httNCBW8TFWDBvsmY2KSIS5YoN1P8G0u5wJ
   okTqX/BHhIX3iAuoosvJfjlPnWku0EnVakfLhqEX/MJBGaUca9O8jMmN6
   wFdqXRzPYXpCCj8mbvPUQfAGDdQcnNp2/f185U8byIJ23mn9+jF/OWswj
   HpuD6qPbrwYvZdv3rY5LxEgU/wRQ9tBcZVPFCcYeov6l1XMZanYB4joVh
   QHc1brcaPdhHnBSQ1sAlX4l9ULn8rYtpPNbxjrIjIoX5+fcPFT7LNz/cG
   hk9xCfYBU2r4im+iUjccwXaFPd5H9pdKmA6Ab5EnpvhQyt80dHB8qw4r6
   A==;
X-CSE-ConnectionGUID: 1fHmkUnfQqSVLxb6sqYWfw==
X-CSE-MsgGUID: JrjZjYuHTKiyQsFVpKdiUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74984846"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="74984846"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:49:35 -0700
X-CSE-ConnectionGUID: 7GQZ85hGTeKTNPePKMc/Sg==
X-CSE-MsgGUID: 7aKTkWkqSBqsxeDAsHgnVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="215915616"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.5])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:49:32 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vDLj7-000000030E3-0dZ8;
	Mon, 27 Oct 2025 13:49:29 +0200
Date: Mon, 27 Oct 2025 13:49:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: bigunclemax@gmail.com
Cc: linux-gpio@vger.kernel.org, akaessens@gmail.com,
	arturas.moskvinas@gmail.com, e.shatokhin@yadro.com,
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
	mastichi@gmail.com, mike.looijmans@topic.nl,
	radim.pavlik@tbs-biometrics.com, u.kleine-koenig@pengutronix.de,
	zou_wei@huawei.com, Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH v3] pinctrl: mcp23s08: init reg_defaults from HW at probe
 and switch cache type
Message-ID: <aP9cSArwCdvPZff3@smile.fi.intel.com>
References: <20251027104746.282351-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027104746.282351-1-bigunclemax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 27, 2025 at 01:46:26PM +0300, bigunclemax@gmail.com wrote:
> 
> The probe function does not guarantee that chip registers are in their
> default state. Thus using reg_defaults for regmap is incorrect.
> 
> For example, the chip may have already been configured by the bootloader
> before the Linux driver loads, or the mcp might not have a reset at all
> and not reset a state between reboots.
> 
> In such cases, using reg_defaults leads to the cache values diverging
> from the actual registers values in the chip.
> 
> Previous attempts to fix consequences of this issue were made in
> 'commit 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at
> probe")', but this is insufficient. The OLAT register reset is also
> required. And there's still potential for new issues arising due to cache
> desynchronization of other registers.
> 
> Therefore, remove reg_defaults and provide num_reg_defaults_raw. In that
> case the cache defaults being initialized from hardware.
> 
> Also switch cache type to REGCACHE_MAPLE, which is aware of (in)valid
> cache entries.
> 
> And remove the force reset all pins to input at probe as it is no longer
> required.

> ---

No changelog? No need to resend, just reply with the missing piece.

>  drivers/pinctrl/pinctrl-mcp23s08.c | 40 +++---------------------------
>  1 file changed, 4 insertions(+), 36 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



