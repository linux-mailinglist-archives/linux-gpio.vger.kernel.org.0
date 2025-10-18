Return-Path: <linux-gpio+bounces-27270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66178BED821
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 21:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C933AB9D3
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 19:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E1226F478;
	Sat, 18 Oct 2025 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPAaxwnY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C9B1F584C;
	Sat, 18 Oct 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760814208; cv=none; b=bNVa/wFZ155KazA7pb1NYIz0d6nRgk+8ypwTZ/kkQeDyefPxyZgRVEU0iSutvcbvJjm1uF6/ASqi+yFbI3BehllAAa7a+25NYb6MoSRT2GisfWGDcmfQj+izSEREhwIG6Col88N6jStYhE34r7ST5CBovHEM7Sp/FO2G8FcElzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760814208; c=relaxed/simple;
	bh=NC3dTROvnxyo+JZe670NbOUB1WkJiUu502tayp2ov0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRURzA50E+7UWvE8K7fQf2Eg7LdJjwN11+IU12GPhY7BT9b1iACkNW18gso8XWKJ53s53cmkCRW0NvNkmfD7H2r2kkLjEa2N1MOTmEnAo62uOu+X69Wama+VQOQ0hTceN2V27R3kwvcn2P5v/5KaRj8Iq/OtyZDvmR7SLJ9xfh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPAaxwnY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760814207; x=1792350207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NC3dTROvnxyo+JZe670NbOUB1WkJiUu502tayp2ov0I=;
  b=KPAaxwnYShVVUbhl+YIPQjxazPY6ppwWFJugMV2+OOTcEQZ4/9RKU30u
   KCyeJRg1w9jjgur1rNrz+b5AqOaOPJVq7LKr5/Uyo1/cVwmIixu7FdQ87
   PQV4RPTtWs4uMO1lBAOiyYtrjLDE5HJqENRd+8qWk2SHaaLUKQs0qEz+z
   VgqbGR9GP973G8eaz/JbsgMYJEVRY/xJJQrHRq3DVicr6metodyYJ/V6P
   QHiBH0LgTKA3ozAwEUMHTEq/qT7HIHnByo0UrDBOWo5Va1+voY8QGqsDb
   7f/RKSoz9vkTXn6cvURhWDShZCjW4lT2VfDDmW6JI5MXwIymQA/7DfmDO
   g==;
X-CSE-ConnectionGUID: fRq1cGvQTTyRXAk+eII5DQ==
X-CSE-MsgGUID: CI/GBwAxT+CqhMZLe2bTPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66865926"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="66865926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:03:27 -0700
X-CSE-ConnectionGUID: wR9iSZ6oTiWN+DXF1hiDkA==
X-CSE-MsgGUID: /0E50z1sSvmbR5SC3mdIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="206710597"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:03:24 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vACD3-00000000xCD-3HhT;
	Sat, 18 Oct 2025 22:03:21 +0300
Date: Sat, 18 Oct 2025 22:03:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: idio-16: Fix regmap initialization errors
Message-ID: <aPPkeRLgxobzoNlb@ashevche-desk.local>
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 17, 2025 at 09:58:00AM +0900, William Breathitt Gray wrote:
> The migration of IDIO-16 GPIO drivers to the regmap API resulted in some
> regressions to the gpio-104-idio-16, gpio-pci-idio-16, and gpio-idio-16
> modules. Specifically, the 104-idio-16 and pci-idio-16 GPIO drivers
> utilize regmap caching and thus must set max_register for their
> regmap_config, while gpio-idio-16 requires fixed_direction_output to
> represent the fixed direction of the IDIO-16 GPIO lines. Fixes for these
> regressions are provided by this series.

With commit message amendment and Cc list (as per Bart's message),
feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



