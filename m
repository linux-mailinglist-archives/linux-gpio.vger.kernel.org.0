Return-Path: <linux-gpio+bounces-36287-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOJ7GIc5+2nUXwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36287-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:52:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B34764DA891
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7F96304997E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021D34418D7;
	Wed,  6 May 2026 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQ98ZRrD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202E844E04A;
	Wed,  6 May 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071597; cv=none; b=drDLNL+9LZ7EW8lLQaFANccKWBpI0BNOuR3yOF5ic9SoJlcN9lsh9WfXvRQgoDiHbQ/skBv0RLYKpKmvy1dDBf5lxeGuI0hky+VgDdMshQsx72E3GUL8o5r6ix6+8tNW+q8nBoXNTx8DRFUmdGMOGXhHuRhLh5vGdkFc/PP1MIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071597; c=relaxed/simple;
	bh=8M1mhUauXKWE6wfQQYzDfLESAaqJoCkxK+U36T05No8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhDASf/xBYpbCCK+KpbVCkIW3KQhU/ILTA60jV/9BE9bfjWjf6g8GiFTJxnXGXnz9MzmfRQOQe9WnRMTzw2XOoXlNOlXOS88MgP8GBXZE5n3YnCigVvEYGo5gxByKg1CbNg0YldbVTuFinLEZLVJfICiCL6Hoi4BzOurfl60uJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQ98ZRrD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778071592; x=1809607592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8M1mhUauXKWE6wfQQYzDfLESAaqJoCkxK+U36T05No8=;
  b=RQ98ZRrDCtvVHZcZ3I8YP2+iNPrL0yo+6eTjHlcMZzOV8fCh6qVJ6384
   BGOOrhmj/A6FkrWvydt39q5BOLaiqP+gU5s8uXTAaQ4yJOFog/BEEYGb5
   P4eWwm+K1hzXaC6GSpYAoXpfr/z6leaUuiWZqS0EYEm8YYC7FKDN//FG7
   HkuBIuFoU1jB8GBif4LraOkDhE0Xr3hSBz74doYBL6Azxyp0cVMaNBwV9
   VrqxM9HS+z01+x86UGMwfgnIrJDKk4o34lnmCfR5rxkdqfZazfmaQp9Qt
   4JkCWukVZLubUAVrQx9dxP+oFP8wqCCYq9bBOkR/cVptXguJ2FQTPBtcv
   w==;
X-CSE-ConnectionGUID: +toVeAVTQ4i47OfE8uiu9Q==
X-CSE-MsgGUID: FABiWPStSKKfNyMn6lq3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66530082"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66530082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 05:46:27 -0700
X-CSE-ConnectionGUID: VSQw5iB8RoWfoSoovQdJEQ==
X-CSE-MsgGUID: 52SOpqCpREOR1NJP0mtEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="231587821"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 05:46:16 -0700
Date: Wed, 6 May 2026 15:46:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marco Scardovi <mscardovi95@gmail.com>, mathias.nyman@linux.intel.com,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: acpi: modernize resource management using cleanup.h
Message-ID: <afs4FUf2ppBWrZ4Z@ashevche-desk.local>
References: <59174ed2-dc3a-4891-929f-bf513deecdc2@gmail.com>
 <20260506113215.GK6785@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506113215.GK6785@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: B34764DA891
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36287-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]

On Wed, May 06, 2026 at 01:32:15PM +0200, Mika Westerberg wrote:

> +Andy

Thanks for Cc'ing me. Marco, you have to follow the MAINTAINERS database when
submitting this. For simplicity you may use my "smart" script [1] that does
almost right (it still uses heuristics but nobody complained so far) the Cc
lists.


> On Wed, May 06, 2026 at 11:29:36AM +0200, Marco Scardovi wrote:
> > 
> > I was looking for ways to switch to modern cleanup guards and auto-freeing
> > pointers to simplify error paths and synchronization in gpiolib-acpi-core.c
> > so I came up with the patch you can find below.
> > 
> > Here you can see the main points I've worked on:
> > - Use DEFINE_FREE() for gpio_desc and ACPI resources.
> > - Use guard(mutex)() within the OpRegion handler loop for automatic locking.
> > - Use __free() for automatic descriptor and memory cleanup.
> > - Fix off-by-one error in GPIO pin bounds check.
> > - Return AE_OK on out-of-range pins to allow processing other resources
> >   even if one is misconfigured in firmware.
> > - Use break instead of goto in OpRegion handler for cleaner control flow
> >   leveraging auto-cleanup.
> 
> That should be several patches not one doing all these.

As Mika said, please, split this to the per-logical change series.

> > I've tested it (both build and functionality) against linux-next-20260430.

This is assumed, but you can put that into the cover letter.

> > Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>

...

> > +#include <linux/cleanup.h>
> > +#include <linux/slab.h>
> > +
> 
> Drop the empty line.

And follow the existing order.

...

> > +DEFINE_FREE(free_gpio_desc, struct gpio_desc *, {
> > +    if (_T)
> > +        gpiochip_free_own_desc(_T);
> > +})
> > +
> > +DEFINE_FREE(acpi_free, void *, {
> > +    if (_T)
> > +        ACPI_FREE(_T);
> > +})

> These are white space damaged. Also I'm not big fan of these but if Andy is
> fine then works for me too. However, please test with KASAN and kmemleak
> enabled that you don't break anything.

They are fine, but:

- they need to be just one liner as it's done elsewhere
- the {} are redundant (see existing examples)
- they need to be added per subsystem to their headers

(so, two more patches on top of whatever this one has to be split to for
 different subsystems).

...

> >      struct acpi_gpio_event *event;
> >      irq_handler_t handler = NULL;
> >      struct gpio_desc *desc;
> > +    struct gpio_desc *desc_guard __free(free_gpio_desc) = NULL;

This way of defining is highly discouraged. See below.

> >      desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");

This one should be used otherwise as

	struct gpio_desc *desc __free(free_gpio_desc) =
		acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");

...

> > -    struct acpi_resource *ares;
> > +    struct acpi_resource *ares __free(acpi_free) = NULL;

As per above.

...

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



