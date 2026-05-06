Return-Path: <linux-gpio+bounces-36289-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP/iJyo6+2nUXwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36289-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:55:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060304DA931
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4214305EAB8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BD344DB7D;
	Wed,  6 May 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EV/cT3yM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186744E045;
	Wed,  6 May 2026 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071875; cv=none; b=tqpZ1wXkShphUWnQ5fZlzIq7YN5VYlDTuytyov3RdzB6ILxGgiYdrI2fjhbU7b3HNRSMTqrsYcOTY33hdf6TGIZDSb6OhHQ2kheigQ6bSO6+oSuRwczFPh/SXh86Zv0vfQpZ6N+AjQY/qtzxqxyKPOWuXCR1CYYIvsB9rrftNy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071875; c=relaxed/simple;
	bh=NL8vqlia/Db1s/BAwE2DZLUGLxpFhvU1atzwhuPFyh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlYA71lv+tnMj+Rf9allwflOEIR5EmEZQp23mjsXn3vkbnPjuAEfHx4gMjofJwj1iGRSoPT6qnzhqv6+YYYwiAAQqD87geeUBNyq8GRjVau2dZecOCSd5FNL7JSOepMAXU2yHAV0H2L/fe9Ys1fZAlUxKrngMjYorMn4kOTBr/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EV/cT3yM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778071874; x=1809607874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NL8vqlia/Db1s/BAwE2DZLUGLxpFhvU1atzwhuPFyh4=;
  b=EV/cT3yMHvUmMuL+4HjkcXpmXq9UjxkdbTO7mF/vuqVFlASiCJE2etqV
   s1S0EPP8S0MthlAJYi8FaVH2jxfNS09U+mrVpQveJQu9p6aRYVu7VLR5A
   nPfjt1vY9J+1qO1900Vr84Prhn8jX6halOTmU2ZdRy0EN+9935d5/Ti71
   khAa/ci1d9FKch3pl/0vOGwSpffEUramOybYxV4ZqiSkguLh4T0lAdqJs
   D/8R4K7cTJwOLRiWjrDLAi3KU1Vib97MeEOwyF0gYai5fjdb0bAX6BMJ6
   751PV78hoS2soKKvAE/i7Y80PH8yRC0y948K7DIBrl53XqAyEoAuSO2qo
   w==;
X-CSE-ConnectionGUID: iJDDaYKAQiyRNFIYSbktIg==
X-CSE-MsgGUID: m6QOddTjQYClMhgsrOLp3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78848513"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78848513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 05:51:13 -0700
X-CSE-ConnectionGUID: h8g9pckaQ8i8tFx0fMG7tw==
X-CSE-MsgGUID: 9G4w6qJNT6WFpKb9gH4yeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="274267273"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 05:51:11 -0700
Date: Wed, 6 May 2026 15:51:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: mika.westerberg@intel.com, mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] [PATCH 1/3] gpio: acpi: modernize resource
 management using cleanup.h
Message-ID: <afs5PZgTimaZWs1U@ashevche-desk.local>
References: <20260506113215.GK6785@://intel.com>
 <20260506123637.1077421-1-mscardovi95@gmail.com>
 <20260506123637.1077421-3-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506123637.1077421-3-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 060304DA931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36289-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 02:35:34PM +0200, Marco Scardovi wrote:

No, this is wrong and completely missed the guidelines!
Please, spend near hours to study the Submitting Patches and Coding Style
kernel documentation before preparing and sending a v3.

...

> +#include <linux/cleanup.h>
> +#include <linux/slab.h>
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/errno.h>

...

> +DEFINE_FREE(free_gpio_desc, struct gpio_desc *, {
> +	if (_T)
> +		gpiochip_free_own_desc(_T);
> +})
> +
> +DEFINE_FREE(acpi_free, void *, {
> +	if (_T)
> +		ACPI_FREE(_T);
> +})

And yes, these are still subject to comments I gave against v1.

-- 
With Best Regards,
Andy Shevchenko



