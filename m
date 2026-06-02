Return-Path: <linux-gpio+bounces-37847-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fVtHGVJdH2pvlAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37847-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 00:46:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEC6328A5
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 00:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TjRi2IQX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37847-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37847-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 183B230376B8
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 22:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4473C3443;
	Tue,  2 Jun 2026 22:42:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FC73BCD39;
	Tue,  2 Jun 2026 22:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440123; cv=none; b=lXSYnSP0V6/AaSscpXA5g1l/YVRHqcljuGuMy5IA4Pk+MtXkqOrfCAUfNlEZ6SPh31K9v3+fQkYzr3kCloQlI5n557fEK+VKob7sQpjXXvfUNG3QJnE8cqhzY4ED6eqdaMI/KZO+tUh9DGDApk8VyKvmALgOtfrO8bPllT+wd9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440123; c=relaxed/simple;
	bh=2DYMignZYp9XmLJImBkxpRdBQWs+ZVRSTXRKOKBvszs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6iuppb5cl7nV3kIhMB+uIkLZXfaT/c5ze/3DQdk3iKTQGXfBZyJ2qucQUhGSB1h2UOJNlhpLlrbDNOEqeBQDSpPhjRhJcNtVZJn58yBcoSabz1RG/YSLom5CmBAT4kDv1Qv2RpUYs4FuJboLnIXoqO5Bu+F1ZM3mB+ujz8p0I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjRi2IQX; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780440121; x=1811976121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2DYMignZYp9XmLJImBkxpRdBQWs+ZVRSTXRKOKBvszs=;
  b=TjRi2IQX12I4QlDolasgxU8yeWD5GYRuDtFSE7pppDXCYDIP9VKBJ3JF
   nwdPAzuVDWECqWUNFcBT30dk0uvn7s35g8Vv0hiBkQ5S8Kl01VN2n1s0u
   1bxkbBtNyQiMZE2NTmqbr6FGhX9nph4IUvohmPU1rvx7lekQqQ0o0VqrW
   SoZCgVKA40Oa9rZVxMLwuI4iEqmKhaAyedLWJ6z0F1/MZ+BB5ueNmRiFk
   iBcLQ2BTNjRYi61cBK67O1Adk1NtN70MrCn84FltHrmbe7P0IL7iPhCc1
   tnDSOVtCqfNa//XhL2SGnGSru36JUvgeEsu1iyiwL67x6BAQmNSZ8wks8
   A==;
X-CSE-ConnectionGUID: sRVGZ1E4SZGtPNyWcd+giA==
X-CSE-MsgGUID: rjhLBqC+RuKdyuhtabNg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="103897661"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="103897661"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:42:00 -0700
X-CSE-ConnectionGUID: GGyx08JTQhK7BKMuMdJRIA==
X-CSE-MsgGUID: +NGymqfMTAaC7d3/RmPNUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239881535"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:41:58 -0700
Date: Wed, 3 Jun 2026 01:41:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	wsa@kernel.org, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ah9cMwTQXe-ILXDv@ashevche-desk.local>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <4de80fd6-007e-484f-a7c9-17838ee5b1da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4de80fd6-007e-484f-a7c9-17838ee5b1da@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37847-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:superm1@kernel.org,m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:lkp@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,bgdev.pl,amd.com,oss.qualcomm.com,intel.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:from_mime,intel.com:email,vger.kernel.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6AEC6328A5

On Fri, May 29, 2026 at 12:12:31PM +0200, Mario Limonciello wrote:
> On 5/29/26 12:08, Hardik Prakash wrote:
> > I2C controllers may have child devices with GpioInt resources that
> > depend on GPIO controllers to be fully initialized. If the I2C
> > controller probes and enumerates children before the referenced GPIO
> > controller has completed probe, GPIO interrupts may not be properly
> > configured, leading to device failures.
> > 
> > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> > 
> >    i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> > 
> > Add a generic dependency check in i2c-designware that walks ACPI child
> > devices, identifies any GpioInt resources, resolves the referenced GPIO
> > controllers, and defers probe if those controllers are not yet bound.
> > 
> > This ensures GPIO controllers complete initialization (including IRQ
> > setup and quirks) before I2C child enumeration begins, fixing the race
> > without device-specific quirks or DMI matching.
> > 
> > The probe ordering race was confirmed via dynamic debug tracing:
> > 
> >    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >    2.348157  lost arbitration
> > 
> > Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> > Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Assisted-by: Claude:claude-sonnet-4-6
> > Assisted-by: GPT-Codex:gpt-5.2-codex

> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/

This patch definitely wasn't the result of the above report. These two tags are
misused.

> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494

> Fixes: 3812a9e84265a ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on
> Lenovo Yoga 7 14AGP11")

Must be oneline.


-- 
With Best Regards,
Andy Shevchenko



