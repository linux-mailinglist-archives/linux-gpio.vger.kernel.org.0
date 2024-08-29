Return-Path: <linux-gpio+bounces-9360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8D964230
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 12:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5071F242D8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 10:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BAB18E049;
	Thu, 29 Aug 2024 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN3m8Yon"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB514B950;
	Thu, 29 Aug 2024 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724928583; cv=none; b=i44gqeGFvzpPSrBOcphy2GWsOvYVt00pm4XNPuxwVK2hil5kWqj2LTBKUoVw9TaNYiltsfYKgEKnheKEX6b8Lf+DNt5OtJJZP2PjchGXSvRX/rdrwUHsEGjoegXtkSndVjq0IHzjowxe5bd3npA6QFi7srHBflSaIypH8+6Hc5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724928583; c=relaxed/simple;
	bh=GTRmsPELJPr7AI1Vw5MhAiqbv/180MFy8xeS9Nh0dzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BE6oEbWLexqc58v1m9jc4638p0O7vn5u2hrNZdBBhVzxtS8nGG6NQ+mNGJuYusjy2QPKnkR8dlfRn0rYtUrUQgnBR/TICoSyqClRGWele291IKeQjn006FbP9ajaOLYPIZzhXPSMX7hlwB1C96XNX7qmYJJ9aEfP02em0/m8gu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN3m8Yon; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724928583; x=1756464583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GTRmsPELJPr7AI1Vw5MhAiqbv/180MFy8xeS9Nh0dzo=;
  b=FN3m8Yon6sxSPOILZqkQeM6aeil8o2HH7xKZnJUnlxAARHemPZojugPV
   1qOiplqmX1u/DAos2KyMZRCvZhdjwo69Tky655kH6okxv6kgsUI37Tli1
   gk85UyC8XdLsgg2mDzv9XME6FoADrqQ6Rywo1p/vzhb1rkm/9KK44q/oK
   G8iySolZWCFjjc3Uj+pHV2Ip8tToIVr0DFKdXqT3Ulv0N44THsLzQQyQF
   imwd55RbwHhiynyJGlU0subgddLfBz+RyHcdrsyZegMkCPkHSKrZJ/AJs
   Xjr03TDutiNShCXd9DoID4ce4WPbMFFy1zBM94AFM0uQCyphIFXoxwv3c
   g==;
X-CSE-ConnectionGUID: iwrtJqFnS7+JGrWbVWogCA==
X-CSE-MsgGUID: sJWSgQomTZub4rHMGv5dQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34167779"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34167779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:49:42 -0700
X-CSE-ConnectionGUID: dz2o599hTu+9t/Mr7CSLOA==
X-CSE-MsgGUID: zb2jitz5Ryi3MSAIgvqHbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="68436922"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:49:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjcig-00000002y57-0GbG;
	Thu, 29 Aug 2024 13:49:38 +0300
Date: Thu, 29 Aug 2024 13:49:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/5] pinctrl: intel: Add __intel_gpio_get_direction()
 helper
Message-ID: <ZtBSQVlEPgKtfkij@smile.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-4-andriy.shevchenko@linux.intel.com>
 <20240829044653.GR1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829044653.GR1532424@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 29, 2024 at 07:46:53AM +0300, Mika Westerberg wrote:
> On Wed, Aug 28, 2024 at 09:38:36PM +0300, Andy Shevchenko wrote:

...

> > + * enum - possible pad physical configurations
> > + *
> 
> Start with capital letter as others:
> 
> enum - Possible..

Fixed!

> Also I think we should follow the structs and drop the empty line here
> (well and for other enums, I don't know how they got there ;-) but it
> looks better without.

We have the other enum with a blank line. Perhaps removing them in a separate
patch?

-- 
With Best Regards,
Andy Shevchenko



