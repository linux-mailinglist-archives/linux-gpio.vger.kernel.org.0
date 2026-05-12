Return-Path: <linux-gpio+bounces-36664-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIKIJM0FA2owzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36664-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 12:49:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21451ED94
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 12:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA0DE301F1BF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D7F349CE4;
	Tue, 12 May 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGpYCruI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B88395ADF;
	Tue, 12 May 2026 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582807; cv=none; b=SfMDrr97m13zw5/zhY1PxAL1tKL9TvBs3gPOSAsWl+Vfj+f4LYqfwp4my2pZfHTKnBR07lYS8Bdn9RH1g5+jF9ERGk+vqRN0JMz5XJ8MfDlgI3KRXGJ5QCkYqmO8AVkQrGuPd/O87viWKa88vEMHfqszzpshnqg1Od43nq2DzK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582807; c=relaxed/simple;
	bh=H9XSHXhq4GIMgp5MFuz1d355CE4/dyY6Pg07HZklfe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZtpaTOBeqNS3X0y7vJFSsXXRnepFetjHbDB7QwiIeC0SXBzf8zVrsFatBkLds68UKyWpgXYKLAs/rylwF5X3ePnizQQdLHF+XuY4T8iZ9inqe3s603Mn5YT0wPtnRM2l8eUz+KRrFRYBay65IjhTHd+y5RYAsewqS4vFjWsPYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGpYCruI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778582806; x=1810118806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H9XSHXhq4GIMgp5MFuz1d355CE4/dyY6Pg07HZklfe4=;
  b=WGpYCruImV/u/2YF+PkKAB5oqRuWGQMavyRThfZV0KK2FYi82T7n5/vi
   jkRxxr0Q0ei1Tkh0B42eEXtX0gBN3TFrjC/LL9kSxuz/xHCl5NfseYdRy
   0pJVKqKoEG6GAcUxXPDoQyAa1RrrtMOQWLsoEX6Taa63Frulmtbq1dpFn
   tYfwmyMXN1Boskv5IJPnY3mAlgtN3VZSP7gYtYq9nNUr1ghwETJ7ZUTH3
   mqZZqW7QHvTRqyuGHFnIVzu56IjKnrEdMKxFfLO071jsn0PSJKJIhmA7F
   dZKIzzKrfe2U6H9Igk0ewcq+MJ1AnVKpY7wUSx13rt346MBx3EFKD3w/T
   Q==;
X-CSE-ConnectionGUID: hlcAfhvsTKu+JFIG4r8+rg==
X-CSE-MsgGUID: 2Mw4cU4ST4GmPDgt7hmzVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83341907"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83341907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 03:46:45 -0700
X-CSE-ConnectionGUID: +5xFiu4gTVWnzFVUCCJSrQ==
X-CSE-MsgGUID: HJI8pr10Qlyg1MFjJKs7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233257185"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 03:46:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B84CF99; Tue, 12 May 2026 12:46:42 +0200 (CEST)
Date: Tue, 12 May 2026 12:46:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linus.walleij@linaro.org, wsa@kernel.org
Subject: Re: [PATCH 1/2] pinctrl-amd: enable IRQ for WACF2200 touchscreen on
 Lenovo Yoga 7 14AGP11
Message-ID: <agMFEkXd4raagQ08@black.igk.intel.com>
References: <20260512073139.16343-1-hardikprakash.official@gmail.com>
 <20260512073139.16343-2-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512073139.16343-2-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Queue-Id: EA21451ED94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36664-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,black.igk.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 01:01:38PM +0530, Hardik Prakash wrote:
> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen controller
> is wired via I2C2 (AMDI0010:02) with its interrupt on GPIO pin 157
> (confirmed via ACPI _CRS GpioInt decode). After amd_gpio_irq_init()
> clears all GPIO interrupts at boot, pin 157 is never re-enabled,
> preventing the touchscreen from signalling the driver.
> 
> Windows keeps GPIO 157 INTERRUPT_ENABLE (bit 11) and INTERRUPT_MASK
> (bit 12) set after initialisation. Add a DMI quirk to restore these
> bits after amd_gpio_irq_init() on this hardware.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

>  	/* Disable and mask interrupts */
>  	amd_gpio_irq_init(gpio_dev);

Ideally this should be done as a GPIO driver callback (we have something
like .init_hw() IIRC). But since it's an original code, it may be an exercise
for another day.

> +	amd_gpio_apply_quirks(gpio_dev);


-- 
With Best Regards,
Andy Shevchenko



