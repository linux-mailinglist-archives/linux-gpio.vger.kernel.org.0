Return-Path: <linux-gpio+bounces-37850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7n8hHwdhH2qklQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:02:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B7B632BDA
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:02:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FkS0bSTM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37850-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37850-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16E8F30B59CA
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 22:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB86B3CAE93;
	Tue,  2 Jun 2026 22:56:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F5A3CAE9E;
	Tue,  2 Jun 2026 22:56:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441012; cv=none; b=dPC5dzSJwKDmTyb5nTJzaPaONwQ1tcVgWJ4shOL4oxDDegW/K+6LDSrrX0xR0r6ID5yJGPsP8lmPRSxvO4iNkX+GiNMfDU5FQU5WxXODAEAJ2I8H2/TeqDsOfSl4O4rRUDaZTtzadIV10jyoDRYb3CutkfQIM6rU4yzfcfOhn+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441012; c=relaxed/simple;
	bh=vQlKLSdYoJTHorYdEHY2c83xNms8Taa2ErdwRLC6wJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0yZZM+vEklTSJZoMKu4CTPZ9TtrJd2/Z+ULNKKYqoehEGDlCs6HhZ1I2WgQwV4BI+rB1+PDZhBHxqBEfaac6cxhRPgtgd7U6ZVqkKlWJCHmwx630T+/HCUkmZs8ns2xL6S/ifhyPJTDDFBvwzBmJ6yWyBZeSX9vDHntvXNyl9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkS0bSTM; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780441012; x=1811977012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vQlKLSdYoJTHorYdEHY2c83xNms8Taa2ErdwRLC6wJ8=;
  b=FkS0bSTM89LMzw7MXLorWu10HecnbZFV3JlzaCSeYJElGlAw0xUudmBu
   4Dalh4IjH/SkfRvO7Koti3JZ9K+fBMvdm8k8wJj7SxG1ewFh15ztaF1X6
   XZFo+lw35vH7R9mMxarjvvIRDS838S98jt1fhQAjbXVH7FcI3YtnAwjLJ
   NEnt+SMN6LGqQMSBTsX39vXvthQ7giQGhK09Dg0l+HoLTA6aC1vwdk/ft
   mEtqVjMWKgd9WTV7OhjDxOS24apwt3Sk5Ue8BicCXQKZmglz0UzTpbqR7
   x6dSPO/iWgxLkFLLrwFTRg/obrysh35p9Ikf/h31AMnwY5qU/oKM8Dqwb
   A==;
X-CSE-ConnectionGUID: LM8k+HwtTHObM3wa9qQBdg==
X-CSE-MsgGUID: XAqSGKdPQ0GrpdFXuSZvkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="103898399"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="103898399"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:56:51 -0700
X-CSE-ConnectionGUID: b6952yWRRiKT8vcjzADP3g==
X-CSE-MsgGUID: E2ImGzsJRluo05KjvGfVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="237685391"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:56:48 -0700
Date: Wed, 3 Jun 2026 01:56:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ah9frnHDuIjF_1Su@ashevche-desk.local>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <20260602185339.GA404948@ax162>
 <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37850-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:nathan@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3B7B632BDA

On Wed, Jun 03, 2026 at 01:20:24AM +0530, Hardik Prakash wrote:
> On Wed, Jun 03, 2026 at 00:23, Nathan Chancellor wrote:
> > I bisected boot issues with a few of my test machines to this change
> > in -next as commit ef76a3a28c79. I seem to recall a crash in strcmp()
> > in one log but I cannot be too sure.
> 
> Thank you for bisecting this.
> 
> The strcmp() crash is likely the issue. In
> check_gpioint_resource(), we access agpio->resource_source.string_ptr
> without checking whether it is NULL first:
> 
>     if (!strcmp(tmp->path, agpio->resource_source.string_ptr))
>     ref->path = kstrdup(agpio->resource_source.string_ptr, ...)
> 
> The acpi_resource_source struct has a string_length field -- when it is
> 0, string_ptr will be NULL. On your machines, likely some GPIO resource
> apparently has no resource source string, which we did not account for.
> 
> I am preparing a fix that skips GPIO resources with no resource source
> string (string_length == 0 || string_ptr == NULL). I will test it on
> my hardware first and send a patch shortly.
> 
> Sorry for the regression.

Linus, if you applied this patch, please drop it. There are problems with patch
code wise and functional wise. It needs more love and work.

> On Wed, 3 Jun 2026 at 00:23, Nathan Chancellor <nathan@kernel.org> wrote:
> > On Fri, May 29, 2026 at 03:38:37PM +0530, Hardik Prakash wrote:
> > > I2C controllers may have child devices with GpioInt resources that
> > > depend on GPIO controllers to be fully initialized. If the I2C
> > > controller probes and enumerates children before the referenced GPIO
> > > controller has completed probe, GPIO interrupts may not be properly
> > > configured, leading to device failures.
> > >
> > > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > > occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> > >
> > >   i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> > >
> > > Add a generic dependency check in i2c-designware that walks ACPI child
> > > devices, identifies any GpioInt resources, resolves the referenced GPIO
> > > controllers, and defers probe if those controllers are not yet bound.
> > >
> > > This ensures GPIO controllers complete initialization (including IRQ
> > > setup and quirks) before I2C child enumeration begins, fixing the race
> > > without device-specific quirks or DMI matching.
> > >
> > > The probe ordering race was confirmed via dynamic debug tracing:
> > >
> > >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> > >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> > >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> > >   2.348157  lost arbitration

-- 
With Best Regards,
Andy Shevchenko



