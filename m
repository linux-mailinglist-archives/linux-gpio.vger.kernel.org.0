Return-Path: <linux-gpio+bounces-25811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BEDB4AC2E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 13:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D11453AB57C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E59932254E;
	Tue,  9 Sep 2025 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjZAaN7z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE2532253D;
	Tue,  9 Sep 2025 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417563; cv=none; b=af6pKhfmp9GEhHtLDjg6hGJ3GF7MRkv8KKULX/BzlgzuYtWPb/r81fIYGxdMTyZDzu7VVWshBKtq6Tn/2CECcNhsAUD8JeQ2dwdteCMO/ABKSde38XAHeJxZMRDd5tGsTT5tIr7mKFQ4PodObADQxEv39XvTKgAEm8IRN8CCuZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417563; c=relaxed/simple;
	bh=DskNimhErckgqKJIOEd74jaeB9pesORcOsQFq2LivMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLM6AspXW/EqEWX3/oas5vJXIjOK/OBfHHI2aLAW64cczKdCuJwIDFn5D48/6lHK3C7oMnz8j7s9qZdi58nggkpqCI6W88Lr/JJyRJo3TOfMgPIXrrTtjsWa7wmiT4YH/DNX+XaLdF6hL8R7vbvEiZ0SHK1DsbVPtXy+nBhd+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjZAaN7z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757417562; x=1788953562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DskNimhErckgqKJIOEd74jaeB9pesORcOsQFq2LivMo=;
  b=OjZAaN7z/Rq2G0atAcO+s/RCa8KeogEk+ne3VtHvx4+KuW10Je8rhVRM
   jhVkzvKFA0wVxMJBUnV7c9ArXXTEJuVItbk6nEd134FZlsVDQj/5k41Wh
   6tmLG5Yw2xxobgVqiY1STV2tZik1jlR5hMgUkZqRQuVBZ4gBKyMXfP37D
   BWUFLsoJEvaEW6ja8yebT6n3nLllCb7P+9kNjTxYwdCEUTjYx8zKWJUdQ
   4bDfkBotHzZGQ0SYLFivN6ywrS0UMq+hsLaKk6tKFj6cyeNE48PF0md/Q
   Te2/bfeBULfrJDxm3to69ZKOQ6/YgxzdpNJmViVyuz1nDHMI0GrBWSPlg
   A==;
X-CSE-ConnectionGUID: UbuHgjFPQmauGo/Mo1kMhQ==
X-CSE-MsgGUID: L6wm8rxSSRi0sN4KWyZwNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59769635"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59769635"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:32:41 -0700
X-CSE-ConnectionGUID: 3D8SgYoeQnqGeA79nXWd7w==
X-CSE-MsgGUID: gsOSROqPRsOWaIXTHWJcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172330535"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:32:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvwaQ-00000001QN2-0Lqh;
	Tue, 09 Sep 2025 14:32:34 +0300
Date: Tue, 9 Sep 2025 14:32:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Message-ID: <aMAQUS0wFakYoB0N@smile.fi.intel.com>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
 <aLgl_9X0_2082SkH@black.igk.intel.com>
 <4123c67509c54e78b5a24d2704e4bb2b0a07d585.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4123c67509c54e78b5a24d2704e4bb2b0a07d585.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 09, 2025 at 11:27:09AM +0100, Nuno Sá wrote:
> On Wed, 2025-09-03 at 13:26 +0200, Andy Shevchenko wrote:
> > On Wed, Sep 03, 2025 at 11:05:01AM +0100, Nuno Sá wrote:

...

> > > +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > > +#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > > +#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) &
> > > (_mask))
> 
> Kind of agree and I remember to see some work some time ago regarding this but
> it seems it did not get anywhere. 

Just include a patch in your series. Let's see if CI and build bots blown from this.

-- 
With Best Regards,
Andy Shevchenko



