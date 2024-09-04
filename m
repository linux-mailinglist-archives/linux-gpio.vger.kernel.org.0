Return-Path: <linux-gpio+bounces-9775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0E96B891
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 12:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EA671F22810
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 10:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569491CF5F6;
	Wed,  4 Sep 2024 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtjztZ5H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D7F1AD247;
	Wed,  4 Sep 2024 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725445867; cv=none; b=Otfbjkkl7+sxmRyO7ck3MfV5kKERO95r8KQuOGXbyxzZAw6WfQ5Q5MUsdHA5hr2t9TTMMUAZJ+yugndSTMxY1DNHkDZz2TQaMUZjMdGImZ74dE+SoRBJ4Y3BMQqUBX2P6Vn5fpwPSxLDbi8b/u/z+rbDgGeq5Af7N/v+tCk71AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725445867; c=relaxed/simple;
	bh=8tXNh0t7TVzHKJyAwT1nVI5nBnA3UJgkf3DPTDFmfRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=op/TCg0WKoolKMR23eEKjQ4fUe6R1WXx4e8hIQnAzkzN61JjbdFJTbdLqm+UyG5Xdj5gPKkZTiLYThYIDRs9EgwS+CZU0K+jd4U5iVILo1MM/Rm3lUk7QqSpoZMDKfLgTJ6vqFKBvN5P521yUarH7w/TvQeagVFh/HvGepzJPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtjztZ5H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725445864; x=1756981864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8tXNh0t7TVzHKJyAwT1nVI5nBnA3UJgkf3DPTDFmfRo=;
  b=FtjztZ5HZOPnxT73IxvHRZfM2fORSUJV3PLhOfsE38Udc2IEupm5+Xc1
   nLs6SdS1npIvZWtGKgYz6HR8l7D6EM8/pw2cHJT8xTk1XjRDnb6mrjpJF
   KUXc14OCMFX+gj1xNCLa/D1N3YknD6j34dO5oTfxP2Y+HE3oSzK/PPSad
   QU6zwM00xMylLly9kVVkcHJv7rER0VKEFdZjNzV2zUy1LJUStWeF+OKan
   75V9mtzamy44TPuOoscVyPoOsWFoTVulNNt5fZm5or97BrF/j6F6zxIUR
   ucc2eErJGuzkrZCXsOp4D9tmEoavVCdrzewD6jvmz+rtoEgIAPOeXCRyl
   A==;
X-CSE-ConnectionGUID: t/pO/n9iQNGoEUcO2/hbnA==
X-CSE-MsgGUID: DnprWF0BT3yq0TJ5B3d5iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41595955"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="41595955"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 03:31:04 -0700
X-CSE-ConnectionGUID: sOi1fLRhRduP7cbWqsKgzw==
X-CSE-MsgGUID: p3V+eycoTaGrZVF6qoTVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65465892"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 03:31:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slnHw-0000000522Z-0Wno;
	Wed, 04 Sep 2024 13:31:00 +0300
Date: Wed, 4 Sep 2024 13:30:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Drop duplicate return statement
Message-ID: <Ztg246OvckgHcuFA@smile.fi.intel.com>
References: <20240903154755.3460442-1-andriy.shevchenko@linux.intel.com>
 <20240904050208.GA1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904050208.GA1532424@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 08:02:08AM +0300, Mika Westerberg wrote:
> On Tue, Sep 03, 2024 at 06:47:55PM +0300, Andy Shevchenko wrote:
> > No need to repeat 'return ret;' inside and outside conditional.
> > Just use one outside conditional for both cases.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



