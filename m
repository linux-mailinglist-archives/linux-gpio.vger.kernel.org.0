Return-Path: <linux-gpio+bounces-15734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9DA30B95
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295391883A86
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42ED11FDA9C;
	Tue, 11 Feb 2025 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWsJhdW/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0241EDA22;
	Tue, 11 Feb 2025 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276276; cv=none; b=H9t7KbSTPTQllpkrZhfBGoIoPgH4yShBM+rf0+FC0/5r+IrpHIHdFjegwaPxAtMKF1pGNA4cVxFTMvzp3uQbSSnIh1bpih16kHXJ29KlnJjBL46xcqdqfl1ipkDJneCrQRKUJ+/eQbhiCETl5FIX5o1X+1POGhQZmysN9WIL/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276276; c=relaxed/simple;
	bh=9RkT9PdNQs5dp3tugQvqKFcTLZgv8DtPvPLncpkJT1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/yai1nZvUOzPFB04Xi/n74d+tYUd4J0qVe6QVjDja6xyclxxPoyaiEIS5v3dmjaK/BP4O0f48qus5IwvOLYCkppMAzh2saIaBxl5InZ9TVHD3ov/UaKYftnYp3ofkCSmCf4rTlYhbOi/NjCEQTag4a+zQnYprY4gxw4yax4BXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWsJhdW/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739276275; x=1770812275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9RkT9PdNQs5dp3tugQvqKFcTLZgv8DtPvPLncpkJT1A=;
  b=TWsJhdW/zbvHce7gpBcbx5JnVTxB+6z/f9/PknOPyxWCcc+VrWtyELra
   CrUdB55MKaO9fglv95jLznMBRnpyjzJYGgEoHCITW6CkDtqSB+bPDPmgS
   y+aK7EvB1fTo3SESwwCU6KqMQuNnG3y0Ey34NVRqI9BnK9tb6D36gx04O
   wJfjQTFYGmzM2ugnUdKxH/3lvd58cnmGAHa2reSN5UwGZAIeBCaYweAk6
   loKXW90Ne6ARP+o/8zLKKfP4vKFJk1s4UjgTn8vHLsrulqjntMTZ2lNFy
   LF0G+yAkYFMaIc8rSSGDE0Rqn83w1BmNydpJdCM7UO/ly9RIbTWgkq+eQ
   w==;
X-CSE-ConnectionGUID: HSx69PBcQu2OHIe6DcFGaQ==
X-CSE-MsgGUID: FOFmv/i1RHKsWQktHwP+kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50526097"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="50526097"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:17:54 -0800
X-CSE-ConnectionGUID: T8U6InUUT9GDAnLvXSS+WA==
X-CSE-MsgGUID: yF37Vw9qRx+T6/C1KQts8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117113920"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:17:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thpD3-0000000AUzi-2Rns;
	Tue, 11 Feb 2025 14:17:49 +0200
Date: Tue, 11 Feb 2025 14:17:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexis GUILLEMET <alexis.guillemet@dunasys.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Fix wrong bypass assignment in
 intel_pinctrl_probe_pwm()
Message-ID: <Z6s_7XTW4-Y1VeSp@smile.fi.intel.com>
References: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>
 <20250210195230.490904-3-andriy.shevchenko@linux.intel.com>
 <ea58e549-a1ba-4508-8a70-59622f8c3ce3@dunasys.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea58e549-a1ba-4508-8a70-59622f8c3ce3@dunasys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 01:11:57PM +0100, Alexis GUILLEMET wrote:
> On Mon, Feb 10, 2025 at 08:44PM +0200, Andy Shevchenko wrote:

> Tested-by: Alexis GUILLEMET<alexis.guillemet@dunasys.com>

Thank you for confirming, I'm going to push this to my review and testing queue soon.
It should appear in the next (v6.15-rc1) Linux kernel.

-- 
With Best Regards,
Andy Shevchenko



