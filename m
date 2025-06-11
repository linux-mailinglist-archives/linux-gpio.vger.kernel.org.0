Return-Path: <linux-gpio+bounces-21298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2BAD4A12
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E7B1797A4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 04:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5031C862C;
	Wed, 11 Jun 2025 04:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtIBH74x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEDB17E;
	Wed, 11 Jun 2025 04:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749616591; cv=none; b=b/lrjzJtGxn92K/b5AEDU2XlW6wo1A/ytGc6LS/T/YbYNXdBcY53lseZUzEQHJD0vU68xRnSIuZuwWk3Fc4aXeTYKnH/HIeaB3O6u91sdikdW9QiAmyat+vbzsIzHtwk/1P9HREI5sQlH4KOfLw87aY67FRi3AC6ZIlW4KiGPBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749616591; c=relaxed/simple;
	bh=tRxMqpkb2IwMUGM66RyACCozzCUvA/2oSPay/sQ/gUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYhRnn+Zq/0bnjQMqXxztxMc5mFyFCy3cwfzA/WtfdmFF5dudyvYS6ybQo1bfg3FGioOEcIO4A9XxulWViBJpjSAcEMHKMIPZu7aNUdscV62CEhWl0zn7XfPDSZxgLzubjZ+lZL8mDXUjL1lBFT1pj3jUsX/s7JvimW9d2PyR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtIBH74x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749616590; x=1781152590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tRxMqpkb2IwMUGM66RyACCozzCUvA/2oSPay/sQ/gUU=;
  b=WtIBH74xHLoE9LWC3Z/zu+h1JCz5+EQm6C7HZ+t9sSgwTlxVpkYqYT34
   MuI+SKN5Zb+gHOhvVl94oIDceTl8VJ77Wlsl1ltNacc7qNxrzwR1vUjlF
   z8G6p9BR1fkWeEgJTm0jfHp+5PjFldE0FG+z/HXo8dZH5lMdYpqNYPzP9
   ntbktzaeGkkHMLlE2F7SfjUUaE4nB4kXTJF6jX1+6/vDI+qP/19M0gP5I
   Qbr1n6n/PVriIRRUQlKXY7xJ32py90ieGUDSIlmgHgY3KoE2ptKiVRFPp
   OsH35YVgejQSnDVRGFOedwrDlY7edu5QBgvaB79Uu2ZolWPZO/IbWYNeP
   w==;
X-CSE-ConnectionGUID: Zio0AEtpSdivxOYtcV+vPw==
X-CSE-MsgGUID: R/o+t8OBQzyRHdmdu0GWbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55408851"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="55408851"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 21:36:29 -0700
X-CSE-ConnectionGUID: 8LDedCyBTg2XwLId0sIpHQ==
X-CSE-MsgGUID: 3f+y0SzxTp+dbaWrXWeVnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147973369"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2025 21:36:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6E9E2192; Wed, 11 Jun 2025 07:36:26 +0300 (EEST)
Date: Wed, 11 Jun 2025 07:36:26 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter
 callbacks
Message-ID: <20250611043626.GD2063270@black.fi.intel.com>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
 <aEiVsrtfzK1rkgUI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aEiVsrtfzK1rkgUI@smile.fi.intel.com>

On Tue, Jun 10, 2025 at 11:29:38PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 10, 2025 at 02:58:46PM +0200, Bartosz Golaszewski wrote:
> > Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> > values") added new line setter callbacks to struct gpio_chip. They allow
> > to indicate failures to callers. We're in the process of converting all
> > GPIO controllers to using them before removing the old ones. This series
> > converts all GPIO chips in intel pin control drivers.
> 
> I'll wait for Mika's Ack and apply, the material LGTM, thanks!

Looks good to me too,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

