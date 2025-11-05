Return-Path: <linux-gpio+bounces-28107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FA7C35828
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4CBA4FCC2D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B693112C0;
	Wed,  5 Nov 2025 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eho0c/+S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202962FA0DD;
	Wed,  5 Nov 2025 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762343445; cv=none; b=KNejqtb7IOk3PWb4pwhlf9lFNVT/Vhf7hhwYdoVzpHtIWpTBpVcfNWGBSwXzsfk+Fpmbp5dLs+17kZE8Eau8latSxFjDtYf2fokT//TfF2MsRNr7CVAcgZOvzwIY0ZT1QU3TCRoa6gZnyjfC40MDOK6kWFD5K8zn279oFo9Refw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762343445; c=relaxed/simple;
	bh=Krn7oVAovLIifxkRa0NxkHgV0pkx6MqfPtVIlbxJTdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCiMd3WMurguUqikbn8b0IqptHiMa6MPGPSbOoIiqsdTPAQnBlXREcIAI+PWZ0SS8LzX8a5lY1Mat+DX+9D+lKgFJPdpSn+T2Pexoptrsh1ow+8pD03y44psNDKcjTpxDLmrQCvK5fsJUVPIAbsrLWeyOby62RUt+Fr86odJIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eho0c/+S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762343444; x=1793879444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Krn7oVAovLIifxkRa0NxkHgV0pkx6MqfPtVIlbxJTdU=;
  b=Eho0c/+SQOwmJLs0VczMhVkSX5py6DZ8YNs5ULPa1FdStB9kUYR9CS2N
   h640tSyc6O+ecwsxW8SkDIpEIZ6gQRkI4EWTM8T7ks1U6HRoLgpbUU7Eb
   p3AiSPInKBHOPt3E/Y0ZuSeCnPrVNfXBnKvzzhkfbOerH+wUTaR08Qbo6
   hVfHaP58EWY1YYQCNKxT8X4dEXW/TB0DGE4eDpJhK1C1gphugvSbHSbdA
   nfyGtredlpGlwHb+cXcqQDSZwPYZpNyDyVjLpgjDmjwJoBMEYG0mvQeAE
   Eb7tpwOwlVGQENOmO0PR6RQUg5lez0pYNYic2fLXIMM18TyDnF8Ja6g/t
   g==;
X-CSE-ConnectionGUID: 48Z27+5rQx+jNNkvQrJiPA==
X-CSE-MsgGUID: LB7FxWN3Qgi1KSWYP3FoVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64371244"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64371244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 03:50:43 -0800
X-CSE-ConnectionGUID: 4YOwoevRR2KV/+EldgiC3A==
X-CSE-MsgGUID: uz6Hu3GrQYWtCenBCN0ieg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="186685861"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2025 03:50:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3409196; Wed, 05 Nov 2025 12:50:41 +0100 (CET)
Date: Wed, 5 Nov 2025 12:50:41 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Message-ID: <20251105115041.GM2912318@black.igk.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
 <20251105103122.GL2912318@black.igk.intel.com>
 <aQs3ls1rKgMOufOn@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aQs3ls1rKgMOufOn@smile.fi.intel.com>

On Wed, Nov 05, 2025 at 01:40:06PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 05, 2025 at 11:31:22AM +0100, Mika Westerberg wrote:
> > On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:
> > > Replace custom macro with the recently defined INTEL_GPP().
> 
> ...
> 
> > > -#define ADL_GPP(r, s, e, g)				\
> > > -	{						\
> > > -		.reg_num = (r),				\
> > > -		.base = (s),				\
> > > -		.size = ((e) - (s) + 1),		\
> > > -		.gpio_base = (g),			\
> > > -	}
> > 
> > I wonder if simply doing this:
> > 
> > #define ADL_GPP(r, s, e, g)	INTEL_GPP(r, s, e, g)
> 
> We can, but it will give a couple of lines in each driver still be left.
> Do you think it's better?

I think that's better because it is less changed lines but I'm fine either
way.

