Return-Path: <linux-gpio+bounces-6685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D48D0865
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 18:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 604731F21865
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 16:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC5A7344D;
	Mon, 27 May 2024 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIRsJyZl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73961FF8
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 16:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716826593; cv=none; b=DzBFlYzQcb4vo/NZw4g+CypBjRenKzLK/nwmUdujREjqo76qPyBUd605Xj2Kn5yaCeap506VJccKM7XKVTFJ4LnQIwl0F3KqvLujTMhf7nDmdgpX3VejZ0BbxZ7cbbPtYRIUzzjfCBnzdqYD9orJEcLEOCXro6YdEkYoOFIZeJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716826593; c=relaxed/simple;
	bh=AjOjA95r75jdcneZg4OoMBgJCKp5oyHwb128EpzzCrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NX8KGbzrtGeYOIE+aPBaraZdaGvI8W5XadcMQ2zvHVZ/QFrzpdSN5O0izfIzWKr6ihYPrA7WI/w2iVQokAUIxRZRaOus7Nq4VwXIpKPu1vRm7uI4eGvy4JBCBWqRNNwfV7kYlJ0NvFCEcjcdonsI1oF3IeFXwi/cwv/1libq+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIRsJyZl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716826592; x=1748362592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AjOjA95r75jdcneZg4OoMBgJCKp5oyHwb128EpzzCrU=;
  b=PIRsJyZlbADk11R8mqQoncuCD4fT+u0PTcMlBuoQOSyhhbxmqJoJRMew
   33RYM7KJLicCI6yHVZAdfMNJn7mPrSuWqEDkS8lNuwoia/L5Aa9lQdeGZ
   KBzTEHY9Af/pEA+pqdlFswoXPhU8Utgm5AYMZfd04IFH7c88iFMVoCW4o
   7VUzo2fVa3xKNjuLj2OdZUe3T8Vw/uvffg3YGucCmbe40mLVeiR4ur09g
   esae1OJdw/IulL5m//uxeBYKt2hZETSCxQbqEb707LpP9gP+thRz5sjS7
   kwxkjhVCU6JmVGMwzlML5LQPOg5dgUK4sLIwFfLlgPi8ScBwAtSwS8pW3
   Q==;
X-CSE-ConnectionGUID: rX6lB8+2S5azKd90ZIjPHw==
X-CSE-MsgGUID: aBxludB+STCQgs3AKtTPrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13342216"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13342216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 09:16:31 -0700
X-CSE-ConnectionGUID: yaktFJFfT06sbvXe03TADg==
X-CSE-MsgGUID: Wy67BITmQdSEgvaqUO9xfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34718370"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 09:16:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sBd1P-0000000BJoS-0rcR;
	Mon, 27 May 2024 19:16:27 +0300
Date: Mon, 27 May 2024 19:16:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 4/4] tools: tests: remove dependency on grep
Message-ID: <ZlSx2np0daV4-R4q@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-4-05d90cea24cd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-fix-bash-tests-v2-4-05d90cea24cd@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 27, 2024 at 02:02:36PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We only use grep in one place where we can use the -regex option of find
> instead. Switch to using find --regex and drop grep entirely from the

-regex

> tools test-suite.

-- 
With Best Regards,
Andy Shevchenko



