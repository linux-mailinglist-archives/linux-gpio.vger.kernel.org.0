Return-Path: <linux-gpio+bounces-12374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FF39B7BE5
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 14:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C1D71F21D5D
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A5C19DFA7;
	Thu, 31 Oct 2024 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gui+Z2wr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59913D886;
	Thu, 31 Oct 2024 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382104; cv=none; b=nOCCkqNYoKjoWF769PFzh65fXeO9W/G4CTmji0lLigr27d0/35FQIIuZybbCXCYWa1SkyP7M7tqGV4/+CNXV/awZvdsmmIUx9UyLxlppKu+7kLBtAmjhRRmH8e+j3D3/aZFnI/Z+WUs2cKXjkdhNBpWnDBFuhG9kk/BFYhb5WBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382104; c=relaxed/simple;
	bh=IYiMGXa/2aCFsI+WTnL2IWIGtncE8MUDNQypusWI5cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP8xhXWWO9n5c0LNqSkCu9DTfeDh9yIxK+JXx2tkj4jkikOzYCMUlEiEW030vNB822Pui8ync74+smPZ4Ci5k8ykeZxd/i6FMLrrUps5xf5RFO3hy4g7SQkwiyx86qAPdcpxRqyMhyzivOlibpSQdJIB14EBnXo0yJ0/JTqMMj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gui+Z2wr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730382102; x=1761918102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IYiMGXa/2aCFsI+WTnL2IWIGtncE8MUDNQypusWI5cE=;
  b=gui+Z2wr25Kn80GBoANxHX4dG1D80pLE+nU9LZFmh3yRknVQaHloxPgq
   Omv0G9yCRhiHIHDiaVmsYQGvXBI/1S7T6Saxg/d+Xu3ZksQ05XXr3Rxw/
   kJwGqqKnv5JkxKIJCTC5pySe3ThUBJ0LB8KKSJ6513ZGJ/EfOayDyN1nK
   tMnXO8k3cyYoTUbkUc+7fdvk0hN4f3Mb0+/GoziPTH9fCV6zIbq/z5GFf
   W0IHhIY9DJ4sosaRFE60nsbtN2vfgc2XrYpW9W8XOeyAk7HWpO3qwruWE
   ukihb9rvVX9x7XpKkE9sVsjBWkvuLJ71l6+wviZkjNuiGBMukroDo5HuB
   Q==;
X-CSE-ConnectionGUID: ts/6tKyyTf2qV7NB0SWfqQ==
X-CSE-MsgGUID: eC6QFK65RDaVBxOKnCvqtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52672904"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52672904"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 06:41:41 -0700
X-CSE-ConnectionGUID: uSalgK3OSNCsBQLWphpfKA==
X-CSE-MsgGUID: LeG7h8kITZ+eqWfgWDpm9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113477991"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 06:41:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6VQf-00000009enI-2Va6;
	Thu, 31 Oct 2024 15:41:37 +0200
Date: Thu, 31 Oct 2024 15:41:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mun Yew Tham <mun.yew.tham@intel.com>
Subject: Re: [PATCH v2 1/1] gpio: altera: Drop legacy-of-mm-gpiochip.h header
Message-ID: <ZyOJEYU16YsvIh2N@smile.fi.intel.com>
References: <20241031101836.2434308-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbOy1Gj+MrAAAtQGQT=jZ+Zb-NV+Tc5nTrJ7OWT35sfwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbOy1Gj+MrAAAtQGQT=jZ+Zb-NV+Tc5nTrJ7OWT35sfwg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 31, 2024 at 02:16:07PM +0100, Linus Walleij wrote:
> On Thu, Oct 31, 2024 at 11:18 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Remove legacy-of-mm-gpiochip.h header file, replace of_* functions
> > and structs with appropriate alternatives.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks for cleaning out this!
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for reviewing!

It seems we have only 6 (six) drivers left, anybody to clean that in this /
next cycle?

-- 
With Best Regards,
Andy Shevchenko



