Return-Path: <linux-gpio+bounces-18570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10732A8285D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 16:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B708C749D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 14:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9712C2690F4;
	Wed,  9 Apr 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPI8kC0N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023C25D556;
	Wed,  9 Apr 2025 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209516; cv=none; b=LmL8stEYtSs9J3LgHZJgf5zGgYqY4JRkd+gKQcVTVZVZMY97YZO2SANJKPmlFTZpSolMnghw8z7QDuAdYslWxtDWLyf+Sc9JJcKoA79ejpXhRuF9e+hK6HB24jojuNnKwiamjjaDMgyu+gHiNiZDiccaRa18O+aj0nDct02J484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209516; c=relaxed/simple;
	bh=7K8ST/1Mltv/ThL7no9MCAMhZKndp3tzar+hOPdwHkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSn1zsB8JtbSwnSQV3kgmgXrQFUr2/FcoVRxslsxSeDLqt2Kjb+8eKdysUpVRwBXDT29JMFY9/Ls1fdVq2RDMSJQTDZ4N1vS7Aj8w3oOXMZa5GSzoPBWUTzHC3r9WK7Z7iYvJOONQwv65LY72r8y6OucldIlmLga/5otiHGArY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPI8kC0N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744209514; x=1775745514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7K8ST/1Mltv/ThL7no9MCAMhZKndp3tzar+hOPdwHkE=;
  b=IPI8kC0NsbuMX9ulmM22Pl5S6SykznpIkZEAxSKXxgvsgNm36Mz16YYv
   RNyl8ibhn1qqzzs6etNe2SPdsZ4ofXcXqe/aOBlZnmnRE707YeubZfkmw
   peBN1s04GY75zNaLpFLX2CpwGuEB/oM5gxFh91O5l5qa2JifwBwwMGVxc
   dMbbT/vt7RVYDBjRUS3N4utdtAycUqZy163F87dL/hv1VaM6f5UyfhEhI
   iLkM44vnjdBoftVh6BCM/FehmOXpJ9J1knVsBHJuG7YG8alD+Ck5p+U/q
   yDq6iAXvFT79misVfC/tlGkOtasAwtFGxPHAPl3E7aIwHNVWV2hyKKIKR
   A==;
X-CSE-ConnectionGUID: xa2LedAuTjGARk8iaELeig==
X-CSE-MsgGUID: 6mJPkFUPSu+CKeMBgOHmvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45404665"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45404665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:38:34 -0700
X-CSE-ConnectionGUID: ZxDFOJorST2Djj/M97V34A==
X-CSE-MsgGUID: H/0+JEzaT/KGnCV0AcUHbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="151781756"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2025 07:38:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9A670554; Wed, 09 Apr 2025 17:38:30 +0300 (EEST)
Date: Wed, 9 Apr 2025 17:38:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: don't allow setting values on input lines
Message-ID: <Z_aGZqsUXq2uyQfC@black.fi.intel.com>
References: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
 <CACRpkdYujYhF8VP-_6O4Bt2tWL-NO-GgQPr=DeqE9QwCq12gqg@mail.gmail.com>
 <CAMRc=MdwQZMDaHn15n4zgCujtDRg=UUwz3A9ZUYY9Uv7FFgz2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdwQZMDaHn15n4zgCujtDRg=UUwz3A9ZUYY9Uv7FFgz2Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 14, 2025 at 11:35:21AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 14, 2025 at 11:33 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Mar 11, 2025 at 3:20 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Some drivers as well as the character device and sysfs code check
> > > whether the line actually is in output mode before allowing the user to
> > > set a value.
> > >
> > > However, GPIO value setters now return integer values and can indicate
> > > failures. This allows us to move these checks into the core code.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Makes sense, if there are regressions let's smoke them out
> > in linux-next.
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Thanks. I decided not to queue it for v6.15 for exactly that reason,
> I'll pick it up early into the v6.16 cycle and let it sit in next for
> several weeks.

As far as I can tell from the reading of the code, this will break the open
drain emulation. Am I mistaken?

-- 
With Best Regards,
Andy Shevchenko



