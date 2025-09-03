Return-Path: <linux-gpio+bounces-25490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F97B41CFF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5DA548399E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FD02FA0DD;
	Wed,  3 Sep 2025 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lc8XuwPG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF32ED872;
	Wed,  3 Sep 2025 11:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756898822; cv=none; b=isKxVaEqL1wfFTpaQolerl5KtJMUBbk/PXnpckO1ey/kPzYcli0hao7lwdAdbN1ipzb4SmUHMd72M9dQqPvsBKs+r4x2LA2Z/4KqgkaIPOwSgLVGbwqKyfy8x+8Gmm17poS40pV1Tw2OKGRx9zoIxnllno4pgCNnSBtpyJJbIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756898822; c=relaxed/simple;
	bh=a0oJYLiS3x+bRjnHQalvnBa+fT+dirvDW+FIMMKStd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQP3VEWrAOuxGN+4Lm7CTMA9xU6/Axc++KTpEnmV0I/DSJbptdMfuk+3gty2ja1Sen1nPdA4E3e8PJanuu440tnWQD/O2ToSEPkp30UrDad66ELYmQufduj3RUFV9veT6uUt64T/lxGYu5mDSW9EOFN8HF1ixrMIz28E5AXiBpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lc8XuwPG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756898820; x=1788434820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a0oJYLiS3x+bRjnHQalvnBa+fT+dirvDW+FIMMKStd8=;
  b=lc8XuwPG0kNmEYmxCpUqcctc4qCUzfWFkFieRDvYs1Xyqdqeal+suUab
   RS0U3AWIi97ZESHlICQU1LMHON5cYrFu0+zO2CzLXg0UqwYSQvdwxuRIZ
   HYXGLbxc0i3xl/wVUCo1cmjTeDd9YHTD1y3q8KKUR10cpokNn6xm9StYI
   szZOofmLTPm5FKxJ+TRNQ68dCJfe4+cF+/fdaVTqzw7QhMsvqtOzvpmIR
   yYxOkZE5J//leglobLvgP8MOQcxjWGEHWrzXJ4D1FbHiWQ41gXsXltcfN
   z+TP2KaUi3ywdoSYjEKRZMwOGoDWo3s+M1IQVe8G7ifld/jFcuj9Jx5/s
   A==;
X-CSE-ConnectionGUID: FzXJ7VJBSFSwaOhaV2b6sQ==
X-CSE-MsgGUID: 0wPIYxlxSTC3ckcfOoNKtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69821021"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="69821021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:26:59 -0700
X-CSE-ConnectionGUID: AexrctxRQtygUmdH1MS4aQ==
X-CSE-MsgGUID: 6s7NW0XSRF6znkhp1UJ8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="171131057"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2025 04:26:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C97DD94; Wed, 03 Sep 2025 13:26:55 +0200 (CEST)
Date: Wed, 3 Sep 2025 13:26:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
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
Message-ID: <aLgl_9X0_2082SkH@black.igk.intel.com>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 03, 2025 at 11:05:01AM +0100, Nuno Sá wrote:
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> 
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.

...

> +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> +#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))

Can we eventually stop copy'n'paste these and put them to bitfield.h, please?

-- 
With Best Regards,
Andy Shevchenko



