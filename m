Return-Path: <linux-gpio+bounces-33546-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP1mOkEeuGlYZAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33546-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:14:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A66329C14B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4ADC3055D50
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB63A39EF04;
	Mon, 16 Mar 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="La75v7hx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286C39E194;
	Mon, 16 Mar 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673770; cv=none; b=GB8dfrFoZcZ5/FkZ+LmMb5qWhXPTLqb9j3jvBFoLWapBAAiwBi/NU+1O+6qJ6v2awmjonHinfAwiHVE7IVSSuNdVGtCEjSCQxug5xPGrQGNBRWF+cgGCMuMrXd9TbFFH9In1jyHBuA/pc3l8BzcZBR33sLZUbtvUW8OC6y9iN2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673770; c=relaxed/simple;
	bh=yJhLYM4Bkw0hwkX8DWNS2MMddNF+4QuhrkkGcBrGRgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moUp9H9xjVFPiX6rdUOrwSAFcymE5BEbGBOtmDAFTP/YQ9/HVfQj3GGf/9rNfBJPOn3ap9mTeDxqFECHZoYxMtURGyljn6aZvB0s8PHPOJrECA6pqIvkVD8VcCatd1kTNokRfbQ5BtVwfQFE27ioZo2kUs+vgx4gwLbPn0ihUSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=La75v7hx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773673770; x=1805209770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yJhLYM4Bkw0hwkX8DWNS2MMddNF+4QuhrkkGcBrGRgc=;
  b=La75v7hxgY2j1/RlrbNq5fKG6Td3Eph1DgBsFdeflqdXnm55My+Padt7
   bAUCwTGsWoy8GBwZjTlWy046KDcIXSFgtKhuOOXZZrwwM8wBoqqR5sbY1
   eHysGa3tnKAh/Bz4a5yigfK9eaBxBUVc7T3ufk1pdeH2ene46DPzrfGZc
   Ez6GDesEYd346oraImFc82Tr5FpwVDDcNQ+PqrUd2eLZ8GaNpSCUm0vzp
   S6UdcsISawwdbstx84fhcsV2f1grMU47CHdJpZGE4zzzQcyD6CDKHbPrL
   /2LkfrZufWf/GmGlWGpY+Nsv0tda1pmTKl39i32ecT0QtyxhnP5+Sbwan
   Q==;
X-CSE-ConnectionGUID: Y31a0oa2Sk2x9akG0k+2UA==
X-CSE-MsgGUID: cikuWKAnR9eJ8zMFKaXAew==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92074253"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="92074253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 08:09:29 -0700
X-CSE-ConnectionGUID: EyU5VXr5QPu7uWgHJDO1BA==
X-CSE-MsgGUID: xBaHTrL3T2qHLLNhT89M0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226627487"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 08:09:27 -0700
Date: Mon, 16 Mar 2026 17:09:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/3] gpio: timberdale: use device properties
Message-ID: <abgdJa8ETXH8qGpO@ashevche-desk.local>
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
 <20260316-gpio-timberdale-swnode-v2-2-ea0078066871@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-gpio-timberdale-swnode-v2-2-ea0078066871@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33546-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 4A66329C14B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:30:49AM +0100, Bartosz Golaszewski wrote:
> The top-level MFD driver now passes the device properties to the GPIO
> cell via the software node. Use generic device property accessors and
> stop using platform data. We can ignore the "ngpios" property here now
> as it will be retrieved internally by GPIO core.

...

>  	int irq = platform_get_irq(pdev, 0);


>  	gc->to_irq = (irq >= 0 && tgpio->irq_base > 0) ? timbgpio_to_irq : NULL;

>  	if (irq < 0 || tgpio->irq_base <= 0)
>  		return 0;

I believe we also want to have a fix of the above (it will print a message when
it's fine to continue and checks for irq > 0 twice).

-- 
With Best Regards,
Andy Shevchenko



