Return-Path: <linux-gpio+bounces-15640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5355A2E76F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E61A168145
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8C719341F;
	Mon, 10 Feb 2025 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2puJpvj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D80822097;
	Mon, 10 Feb 2025 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179002; cv=none; b=BEGz1EWJpNpeL/df0uHyy9nTlQqARzLvzT4we6vSYg7yYD2k0+8ut5/Go2x+tLwcmufUL0VsGP2rnMLwQVReSFwQZqvN7EkEZQRbtn3isdmxGj5Ecpx95QmXQ/Qb48kJsi05HNgH7hXgtTC6eE6WYdUGHXR1tWGwBLcKMSgGoOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179002; c=relaxed/simple;
	bh=mSEEosM0nfrOPHWjV1IhNBf/rc25uwW5FfI7Fs95bZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okTO9Nm/6wi7g7bEr9XTV4jzXr6epUa15h0RJUW1kOwAvmpblIbsv7lJ3r0MLX0IHki8f8+uF0a5mYBeczM6UyJHVaR7IWcaH2L2Fuc+kiRtsuWFwXOhZ508984hpOyNgwzikXLX4SC3aFjghi/mM+79srlUW6nnNOZIpT4OexA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2puJpvj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739179001; x=1770715001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mSEEosM0nfrOPHWjV1IhNBf/rc25uwW5FfI7Fs95bZ8=;
  b=M2puJpvjnWx0NdNWmFdPWOnGnv374Ui/gf5k7Uu6SgcejcELiv4esFis
   iA0RDedYqL58iZ9wo+pV3OekpvITjHJ1XLwp+gYMQYkMXbAZB+wz9c2l0
   MfiqgCQwync1JHMBcs+UnS38TeAGify7Mrsz4Cy2n/k3FlgAkOfqjmjfR
   I7I7NQvRzqSAaQN2bCTVcx13EB/9TzG9xWTaGlSj+gjuxgQpVj0mCGc1r
   jzmn7WuB2Mfd+AA2anvdu5S2lqzYvNupcVK/9QAX45fq9zIYWwxFyKxwu
   xND9DAv5BX3mN97kG/yTrpeeTyor9PIVTABFK2kQavbGHWZvWLPl3bO3X
   Q==;
X-CSE-ConnectionGUID: p7qKUiRTS4qY7DjYDTqsFw==
X-CSE-MsgGUID: aXAN4QqiQqivkCNoRIeXFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39614370"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39614370"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:16:40 -0800
X-CSE-ConnectionGUID: WZnYjrChSQGPtWYUblx6Jg==
X-CSE-MsgGUID: luUpuecVQgmemD9COr1WMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="111971168"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:16:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thPu6-0000000A4kH-3xxl;
	Mon, 10 Feb 2025 11:16:34 +0200
Date: Mon, 10 Feb 2025 11:16:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v1 4/7] gpio: 74x164: Make use of the macros from bits.h
Message-ID: <Z6nD8qtlEcpTXHV4@smile.fi.intel.com>
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
 <20250203121843.3183991-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdb7f6YH3PvZiK=GXx=Jbr-xGUdeZnCOEDsozVociS3F-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb7f6YH3PvZiK=GXx=Jbr-xGUdeZnCOEDsozVociS3F-w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 10:12:52AM +0100, Linus Walleij wrote:
> On Mon, Feb 3, 2025 at 1:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Make use of BIT() and GENMASK() where it makes sense.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, there is a v2 available.

-- 
With Best Regards,
Andy Shevchenko



