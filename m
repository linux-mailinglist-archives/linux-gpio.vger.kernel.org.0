Return-Path: <linux-gpio+bounces-22970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C793AFE2F7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 10:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6663ABF66
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656A627AC48;
	Wed,  9 Jul 2025 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbHRs5qQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A0D23C4F4;
	Wed,  9 Jul 2025 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752050529; cv=none; b=M/muMeHg9lB+cyf07d40IUTycJ0ML4ypFBOSsdBByhkRyCJr5LJm3N4kJgx51lHHqKwo8ZQIumHCvaG950Fdi3bysq6olqnDIcI/HurtI+FqTf+gywaSFDdttuQGzxrBHm7mweYq7Nmp3JRm4FdFVhyf0P65clJwfvs/BG91rD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752050529; c=relaxed/simple;
	bh=3XPMV1lacpivhZnrO2POSB/TElhb4nz0PFA3nyPNTak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDJ+qbVMyDJgGkGYGcyPXzb58ga7kjyBEUHuAcWd+Vb6mVjaqE0tiO4wzcasdiQAkXRAxS5G8X0B2OF4VJiISZNFj0g0Lm62UCd9TjTraiM2SlKx9OqXxk0YRKnN3C37j8GYc7fMKCJUy4ePW3p0Bhfcd2OQCXNE8okJ+R8beWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbHRs5qQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752050527; x=1783586527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3XPMV1lacpivhZnrO2POSB/TElhb4nz0PFA3nyPNTak=;
  b=SbHRs5qQeDm076gqiiZKO/OY2asxUZInrioYdatb1MihONOK3TGzlAFN
   I4rPntGAcehmQNQPOozr/QQEy3ynsPSyxYqRrcrBDIv90w7Q8wb5Jwq9C
   Vw3zASe0fN9URxx2hi0sn7p+C8mZ9r7gW83ytaYteGqg19hiKlbmShsWQ
   Cf3ijO5Hnqk6Ltg5wCmkX8DV95iquDkgY6+1TYFtsWkuwFLj2qR+Az2NY
   Vw/jPyAfk2lJRploFjtYiJtTJUMvpc6hjVXFnS2hwC7hqsfNY+my6retl
   j3lHimsFjo/UmvXUrCkAbj6q5SJgSL5XyrPmWKL7CLNZ4JB7k2wyvhE8e
   w==;
X-CSE-ConnectionGUID: AjFyBZOqSBavrPXpDs1wSQ==
X-CSE-MsgGUID: 64M59SjcTPmpIjy+llQiBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65365749"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="65365749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:42:05 -0700
X-CSE-ConnectionGUID: Y26OhDB7R8WrLKKzVJ3KEw==
X-CSE-MsgGUID: Q5veKF8tRZCRNUSvKVy+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="192906534"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:42:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uZQNJ-0000000DoM8-2nVm;
	Wed, 09 Jul 2025 11:41:57 +0300
Date: Wed, 9 Jul 2025 11:41:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/19] gpio: wcove: use new GPIO line value setter
 callbacks
Message-ID: <aG4rVW5m6HSnSJnv@smile.fi.intel.com>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
 <CAHp75VckSCyDiAtP+q8nGGiJBuMFi3Nke7Puh0SE9nBX4vUX+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VckSCyDiAtP+q8nGGiJBuMFi3Nke7Puh0SE9nBX4vUX+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 09, 2025 at 11:32:40AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 9, 2025 at 9:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> >         if (value)
> > -               regmap_set_bits(wg->regmap, reg, 1);
> > -       else
> > -               regmap_clear_bits(wg->regmap, reg, 1);
> > +               return regmap_set_bits(wg->regmap, reg, 1);
> > +
> > +       return regmap_clear_bits(wg->regmap, reg, 1);
> 
> return regmap_assign_bits(...);

Btw, since you are doing sometimes two patches, it might worth to have
a prerequisite that changes set/clear to assign and then your patch will
be cleaner.

> Otherwise LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



