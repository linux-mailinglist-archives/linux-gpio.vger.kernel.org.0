Return-Path: <linux-gpio+bounces-38662-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xY1WCpaWM2pbDwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38662-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:56:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD869DF0F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:56:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Up974t1x;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38662-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38662-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75DCC3023DE0
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 06:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3353A6EE6;
	Thu, 18 Jun 2026 06:55:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA59140D58F;
	Thu, 18 Jun 2026 06:55:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765726; cv=none; b=p+U76CxS3OWcbJvWZraf76eobIw4yvcu1Keo3zdDRK9hOBaYXG+bgHA/oms/SvIouptyRr9tFywBKhSyIyO90DQgeeCPlP3ySJJQ3ZzAL+drC03F+zlLqR9fqKVZpnmD5s8QN2/cyiODVkMDcHG4AM3OLGM0+0re06pBkxjlwpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765726; c=relaxed/simple;
	bh=VHrvREYb5b0ZT1S56DZVpn++nwi7WQU1bJ1LW894CL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdgLLo/XviHZZ3WF6wAvVGO5yzsBVfSDWmlXvftQY4OOqil30tyHIPmvhoU+Zk/qXf1+lIwGfzJzSl5JwHjD6He8FvttRsdh0pk7DjNVYDuhb8LKNMwjyFF/wavtOTexgJDUob3Bm0Cdhw+r5KPQEF5f6wcJho4u/8w1NpFy4pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Up974t1x; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781765725; x=1813301725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VHrvREYb5b0ZT1S56DZVpn++nwi7WQU1bJ1LW894CL4=;
  b=Up974t1xYvHgXYQFonTEhu6YkH+PXUvcMx/tOAQpDiX27qRHiVBsw3tS
   614yEtvfkIEA6MSEl/8zw+KIZYlS+L3jiZ7GuDxG2WgN64KF9o7k7e61N
   o8xAII/mnqLLg+kazrgxZclWtZQqJIneWZrvK5OB43b05603k3iphDj2r
   8T2DS4xD65MA0/BECUDzSmLDC+QiRUCYUEz2FPe9YJJg8hMY5t6bR/PfD
   q54c6RP0POluNH9DiQuTH8jzmE3KusZoxZyR4BGDxIbzZGIrt3gqMI38Z
   CtNGMJ1MXKLbTHd1sDxpxFKypXKW+9+4oamGSpNKpC3wnHVIF+J1TPD9g
   A==;
X-CSE-ConnectionGUID: 8eL0wQBaTgyW5IEGuoJJYg==
X-CSE-MsgGUID: 8K37qNfpSmaIqoZKSeebpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82788289"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82788289"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:55:25 -0700
X-CSE-ConnectionGUID: a8SBZL37TfmlP/eFT9CuCw==
X-CSE-MsgGUID: nnSZCRVkQLeHzT+KzDoBHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="271978295"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:55:21 -0700
Date: Thu, 18 Jun 2026 09:55:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH v9 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ajOWV3apVXOAHcYT@ashevche-desk.local>
References: <20260617065922.26004-1-hardikprakash.official@gmail.com>
 <20260617065922.26004-3-hardikprakash.official@gmail.com>
 <ajJobvY67HKufaTs@ashevche-desk.local>
 <CANTFpSUSKwTj-z0E2w3C_8ue8wANE+dHtDKboZ1+rqwN98C3cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTFpSUSKwTj-z0E2w3C_8ue8wANE+dHtDKboZ1+rqwN98C3cA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38662-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FFD869DF0F

On Thu, Jun 18, 2026 at 12:52:46AM +0530, Hardik Prakash wrote:
> On Wed, Jun 17, 2026 at 14:57, Andy Shevchenko wrote:

> > > +     if (!agpio->resource_source.string_length ||
> > > +         !agpio->resource_source.string_ptr)
> > > +             return 1;
> >
> > I'm wondering if we simply can move to strncmp() instead of this check
> >
> > > +     list_for_each_entry(ref, gpio_controllers, node) {
> > > +             if (!strcmp(ref->path, agpio->resource_source.string_ptr))
> >
> >                 if (!strncmp(ref->path, agpio->resource_source.string_ptr))
> 
> Could you clarify? strncmp() with n=string_length would protect the
> dedup check against a NULL or unterminated string_ptr, but we still
> need string_ptr to be non-NULL before passing it to kstrdup(). Should
> we keep a NULL/zero-length guard before kstrdup() and only replace the
> strcmp() in the dedup loop with strncmp()?

Ah, okay, you are talking about the first iteration when the list is empty and
we have to add it to the list.

So the question is, do we expect the resource_source not to be set at this point?
In other words is there any valid AML that interpreter decodes to the empty
resource_source? If so, can we ever have the following condition to be true?

	string_length != 0 && string_ptr == NULL

P.S. Do not top-post! Reply under the piece in question. Also remove
the context you are not replying to.

> On Wed, 17 Jun 2026 at 14:57, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Jun 17, 2026 at 12:29:22PM +0530, Hardik Prakash wrote:

...

> > > +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> > > +{
> > > +     struct list_head *gpio_controllers = data;
> > > +     struct acpi_resource_gpio *agpio;
> > > +     struct gpio_controller_ref *ref;
> > > +
> > > +     if (!acpi_gpio_get_irq_resource(ares, &agpio))
> > > +             return 1;
> >
> > > +     if (!agpio->resource_source.string_length ||
> > > +         !agpio->resource_source.string_ptr)
> > > +             return 1;
> >
> > I'm wondering if we simply can move to strncmp() instead of this check
> >
> > > +     /* Skip if we've already tracked this GPIO controller */
> > > +     list_for_each_entry(ref, gpio_controllers, node) {
> > > +             if (!strcmp(ref->path, agpio->resource_source.string_ptr))
> >
> >                 if (!strncmp(ref->path, agpio->resource_source.string_ptr))
> >
> >
> > > +                     return 1;
> > > +     }
> > > +
> > > +     ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> > > +     if (!ref)
> > > +             return -ENOMEM;
> > > +
> > > +     ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> > > +     if (!ref->path) {
> > > +             kfree(ref);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     list_add_tail(&ref->node, gpio_controllers);
> > > +     return 1;
> > > +}

You haven't replied to the rest, I assume you agree with all the suggestions?

-- 
With Best Regards,
Andy Shevchenko



