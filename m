Return-Path: <linux-gpio+bounces-37881-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 58A+LAzgH2pmrgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37881-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:04:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413916357C1
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:04:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MwgxQR53;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37881-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37881-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF4D930B8AA1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A783FE663;
	Wed,  3 Jun 2026 07:45:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1102FDC28;
	Wed,  3 Jun 2026 07:45:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472748; cv=none; b=t3zsMFEYFJJXbEGWwDyIiym0legkg8Y1BPyRvEQ6gDmZslIUNX5Au50UIMEELGjKRcKdfvIKlmaVjZ0OhfAmCymA+Oh+izRKjcFtZMxZJcoUdfEJaP9GvOWxPIMnjrtVTMOenAxrut5KYiFcMoZjsbZNmQpwyqRZP1Nj++FBMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472748; c=relaxed/simple;
	bh=68y4yy76+kdLaqU9XxPyixQhQhrfz1gMszhevsC/LkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwhM014jnHbFs2gh+Mkwe2SQkD9knLa0Ax71hwimSsjIB/HbueDgfn6/aPk4Chszn0ag7wZjqt9lRXPkIyjYfNANGew2hZA8PuClAZcTGFDYn2Cbbua3D0+FLk++fsFLch7yIMPMELoJuvsCzIu2KmqJpQ3eNyazrt9MJxE+vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwgxQR53; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780472747; x=1812008747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=68y4yy76+kdLaqU9XxPyixQhQhrfz1gMszhevsC/LkA=;
  b=MwgxQR53Pq5gKP98nW19qHkLQECF0jctMkRM7ZJVo6n8PPAYvcnzWo2j
   p/ChqOrZ8vi4QsEu3AWLGe9U8K8CtEYh49LlVLeAmgf+cdzdeUXW0lCN6
   UP1p5dWntvOK861iMARJR27GPAHEgUyahBZFT+Tsia+D7h4AeZhN0uJka
   olGThs81JiL7amQhO5wSU+jR+big+C3hhORVo1VqCQfM7JAhT4aXPYo43
   HOEr/kmr2BQkxFxXNMszRUzbqLFfhS481C3xPGDKaDq3aNl7xz0Hg7euy
   xT7DhixwfG0J6W+zzy4PEw0uEcTRKnAPwKf6goc31IKGI/beNv7SbgsLz
   g==;
X-CSE-ConnectionGUID: BufHxw2VQvSQtA3yBLbTGw==
X-CSE-MsgGUID: /QAllTyVSaaeGHcpWZNqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="103932864"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="103932864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:45:46 -0700
X-CSE-ConnectionGUID: /8XpKR+pRQutTJVSnUXWyw==
X-CSE-MsgGUID: b7nkc8z0QXO+wEYUKqWczw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239691093"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:45:42 -0700
Date: Wed, 3 Jun 2026 10:45:40 +0300
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
Message-ID: <ah_bpNVvTkL_2c-f@ashevche-desk.local>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <20260602185339.GA404948@ax162>
 <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com>
 <ah9frnHDuIjF_1Su@ashevche-desk.local>
 <CANTFpSXAXP16TUK7n+pTBgZOYRqCyF4kqkf9X-TK9O_rKWY1VQ@mail.gmail.com>
 <CANTFpSVCjK_JDB-1GhzomnK+c3PqeHGGMPA19-tDRX6_HK=vig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTFpSVCjK_JDB-1GhzomnK+c3PqeHGGMPA19-tDRX6_HK=vig@mail.gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37881-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:from_mime,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 413916357C1

On Wed, Jun 03, 2026 at 12:53:26PM +0530, Hardik Prakash wrote:
> On Wed, Jun 03, 2026 at 04:25, Andy Shevchenko wrote:
> > Useless data type. You can use list_head directly as a context.
> > ...
> > Again, a lot of duplication with gpiolib-acpi-core.c. Please, find a
> > way how to reuse the code.
> 
> 1. Remove gpio_dep_ctx, pass struct list_head * directly as void *data
> 2. const char *path in gpio_controller_ref
> 3. Use acpi_gpio_get_irq_resource() instead of open-coding the type
>    checks -- this removes the duplication with gpiolib-acpi-core.c and
>    also requires changing #ifdef CONFIG_ACPI to
>    #if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
> 4. Add NULL check for resource_source.string_ptr
> 5. Use return value of acpi_dev_get_resources() in check_child_gpioint()
>    instead of ctx->ret
> 6. Ensure cleanup of partially filled list on all error paths
> 7. Remove Reported-by and Closes tags (carried over from a previous patch)
> 8. Fixes: tag on one line
> 9. {} instead of { .ret = 0 } for zero initialisation
> 10. Split adev declaration and assignment
> 11. Remove unneeded blank line after acpi_dev_put()

> 12. For "Redundant parentheses" on scoped_guard -- I believe you mean
>     the bool bound pattern is unnecessary and we should return/goto
>     directly from inside the guard instead?

Nope, the scoped_guard() for a single statement should be written without {}.

	scoped_guard(...)
		do_something(...);

> Please correct me if I've misunderstood any point.

Otherwise the rest sounds like a good plan.

-- 
With Best Regards,
Andy Shevchenko



