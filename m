Return-Path: <linux-gpio+bounces-16549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C45A43C1C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 11:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E37073A992A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 10:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010B624BC1D;
	Tue, 25 Feb 2025 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqheaWyE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D5256C76;
	Tue, 25 Feb 2025 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480268; cv=none; b=TeuHjr/ZDCV68SUi2YeKN03oo4B4AJWDmg3OZNUXXVyCh/BricNPA5xA2St0IEg4VGZq401iNfGvZvfZtP/u3tDoOy1IQmkkS1ysz6yF0LEYDq3cRIzu1PI+f52+ByKH0sRmjPN0QXaN+Qe8UsjQUPXsVtlDhQrOvvLMUgEzCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480268; c=relaxed/simple;
	bh=ww6sPUfIIGL/VzJ7+DqtotdPzurN+hiu4g05wvRpwgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXa4jBL5xoYrNUsYw+4aOlOeSZBjKCfLXUpRPuZsmSqTvS/42/dir0wZbLSyPGtDTSi9u1yrAw24BUhJCO1RjnunKCg5/FMOnjUi+kBjcj5wHr1hjjbDGOHA7jKXFEL8S61EW+XQw2zGNkbF8X41x9k0RnlB9Hmm0WFVCxjsabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqheaWyE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740480267; x=1772016267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ww6sPUfIIGL/VzJ7+DqtotdPzurN+hiu4g05wvRpwgw=;
  b=eqheaWyE/SZ4OWFhxF7arhaOw6YyCzzsDJhohqdVwOf63ttWhoLBOJbC
   kS/rlY69kNjUA859PZJheBNXMuZRtP3f/mHxF/l2Jsm17O5JSPA6maVRq
   wdsq8vNh93usLz3hnJmD6O0rf+sQ648JHBNMn1RfI1CbHrxgRr1Zg8T09
   uUuCz+LaZmpRgtr/zTZ/40ASQCBX/Jk+/ZhAYv0sPrT+z1E9T1hJg5WDl
   Oxe1FcICthZqLd6czG3iOKmsOW07GoXcTRg+dp21CunljiB40D9RnjEar
   w5BPqMrIH5auAHv5EixeavIqNGfljrqQmSfcTMhEhmwwwKIYFyX5PTXAo
   w==;
X-CSE-ConnectionGUID: fxglxrLtS0qx4R+yj+Im9w==
X-CSE-MsgGUID: Lz9nWrxqSr2yoVQ0krd9XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51494050"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="51494050"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:44:26 -0800
X-CSE-ConnectionGUID: A8A7c+cRT92NiFADd2xUiw==
X-CSE-MsgGUID: ++kiv6lzQ0KfmB78EvBFGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116549645"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:44:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tmsQI-0000000ExgH-0vIX;
	Tue, 25 Feb 2025 12:44:22 +0200
Date: Tue, 25 Feb 2025 12:44:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: use the required minimum set of headers
Message-ID: <Z72fBfM4afo5SL0m@smile.fi.intel.com>
References: <20250225095210.25910-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225095210.25910-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 10:52:10AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Andy suggested we should keep a fine-grained scheme for includes and
> only pull in stuff required within individual ifdef sections. Let's
> revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> gpio/consumer.h") and make the headers situation even more fine-grained
> by only including the first level headers containing requireded symbols
> except for bug.h where checkpatch.pl warns against including asm/bug.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

FWIW, I have checked the current state of affairs of linux/bug.h vs. asm/bug.h
and found no possible issues with the dependencies. While linux/bug.h drags
more than needed into this header it won't prevent cleaning up the rest of
the headers. So for now we can stick with linux/bug.h, but at some point it
would be better to be more pedantic on this.

-- 
With Best Regards,
Andy Shevchenko



