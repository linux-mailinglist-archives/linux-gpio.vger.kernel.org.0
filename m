Return-Path: <linux-gpio+bounces-37748-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLmkESk0HWoqWQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37748-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 09:26:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 977A261AD3E
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 09:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F281D301158A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 07:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A803438AA;
	Mon,  1 Jun 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMKOEo4J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA5202997;
	Mon,  1 Jun 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780298229; cv=none; b=JBhbhY5uMkshhT0K9C3hmtY629YgYeU/63qRxag/O9XQ2qNUJNFiRsUSJPV12Y1nukw0mQCqb6QpoTJzZml1pDjcyUim2pnBcAlsZBh8wYlJWlbObbBBJSnD0kzmFMkVic14gNcJ9kSGLYcRWSrSvpuXRm632yBfWRsmP7fP9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780298229; c=relaxed/simple;
	bh=ZAXgC7URBLzuunr1Ywi0rvoumSzWXq3mIWgVvOELUUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVJGL5dztYaBjr7teHYd7sTqwCBxU7Sv2o1WedmkgMiVqvqYrqbwakbjAP8o+lGl+CvdCrtAkeRT2eHNwnZnGBoCsc2WinVvDxmc7XtVzUemHwdBrFl3HJuCMEzHKLM36Vssygu319zkc6FVj4855yVIggSBjVMKh9Gcq01KvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMKOEo4J; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780298228; x=1811834228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZAXgC7URBLzuunr1Ywi0rvoumSzWXq3mIWgVvOELUUY=;
  b=gMKOEo4JiUSe2r8mND5WUNBUVbtVoh1lh2SQB5p5Cpv2YgBFygBsyyfu
   1zdZAWE4/RAbFsUWrTKo7UuCWNT04Bdbkcm2F0PBHzCh6xKbSLGi+7qid
   pJmsDojj21nkc2YeF5jD7Bd16R5foG4N2LbFZPMX7cij+71xas84ogCxT
   oD7xqpTIkASukqKylzXtqTzkz9RTdKJMePcRPbfMileERwgUC2djyoUp7
   j65/kYYKCah9CwUyRGZW/WKavjfGtnqEA8yxrOxEYF3WsNv7XksdI50MC
   9EplslY3AzcjPJPTaQ+hcJfarCqH85/7j3iG5jLPMvsul9kNOpBZ6E+0z
   g==;
X-CSE-ConnectionGUID: A3/PaexrQtKMp8qgjjGfkg==
X-CSE-MsgGUID: yYBxEClOQUWqkgLhcP7p+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92523222"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="92523222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 00:17:08 -0700
X-CSE-ConnectionGUID: rwt1KavhQBWts/f3S6k8yQ==
X-CSE-MsgGUID: 0mhM9AFdQjyhafgN6d0Hsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="239314297"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2026 00:17:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 851F495; Mon, 01 Jun 2026 09:17:03 +0200 (CEST)
Date: Mon, 1 Jun 2026 09:17:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpiolib: acpi: fix out-of-bounds pointer arithmetic
 in acpi_gpio_package_count
Message-ID: <20260601071703.GP3102@black.igk.intel.com>
References: <20260530094012.184276-1-scardracs@disroot.org>
 <20260530094012.184276-3-scardracs@disroot.org>
 <20260601051735.GN3102@black.igk.intel.com>
 <n2_NwWYBRGa8ixTcAQysQw@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n2_NwWYBRGa8ixTcAQysQw@disroot.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37748-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,disroot.org:email]
X-Rspamd-Queue-Id: 977A261AD3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, Jun 01, 2026 at 08:31:16AM +0200, Marco Scardovi wrote:
> In data lunedì 1 giugno 2026 07:17:35 Ora legale dell’Europa centrale, Mika 
> Westerberg ha scritto:
> > On Sat, May 30, 2026 at 11:40:12AM +0200, Marco Scardovi wrote:
> > > When counting GPIOs in an ACPI package, encountering a reference or
> > > string causes the element pointer to be advanced by 3 (element += 3)
> > > and then by 1 (element++).
> > > 
> > > If a malformed ACPI package contains fewer than 4 remaining elements
> > > when a reference or string is processed, this pointer arithmetic
> > > advances the element pointer past the end of the package elements
> > > array. This results in undefined behavior and can cause out-of-bounds
> > > reads.
> > 
> > How can it cause out-of-bounds reads? We increase "element" but the next
> > iteration checks that it is still inside "end" and it's never dereferenced.
> > Maybe I'm missing something?
> >
> Hi Mika,
> 
> I agree that `element` is not dereferenced after the loop exits.
> 
> My main concern is the parser logic rather than the pointer arithmetic
> itself.
> 
> A GPIO connection is defined to consist of 4 package elements
> (a reference/string followed by 3 integers), but the loop condition only
> checks whether at least one element remains:
> 
> ```
> element < end
> ```
> 
> As a result, a malformed package containing fewer than 4 remaining elements
> can still be processed as if it were a complete GPIO entry. This can lead
> to a GPIO connection being accounted for even though the descriptor is
> structurally incomplete.

Does it take into account that GPIOs are optional in some cases so this is
totally valid:

  Package () {
      "cs-gpios",
      Package () {
         ^GPIO, 19, 0, 0,
         ^GPIO, 20, 0, 0,
         0,
         ^GPIO, 21, 0, 0,
      }
  }

I'm worried that this breaks things rather than improves. If your intent is
to "harden" against malicios ACPI tables then there are much worse things
than this that can be done (e.g we run a full bytecode interpreter inside
the kernel with not much restrictions and all that bytecode comes from the
ACPI tables).

Have you verified this change against any system that actually calls this
function?

> Such truncated descriptors should be rejected with `-EPROTO` rather than
> being accepted as valid input.
> 
> Ensuring sufficient remaining elements before entering the loop also
> guarantees that pointer arithmetic stays within the defined bounds of the
> package, but the primary issue is the acceptance of incomplete GPIO entries.
> >
> > > Fix this by ensuring at least 4 elements remain in the package before
> > > advancing the element pointer, returning -EPROTO if the package
> > > structure is invalid.
> > > 
> > > Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> > > ---
> > > 
> > >  drivers/gpio/gpiolib-acpi-core.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpio/gpiolib-acpi-core.c
> > > b/drivers/gpio/gpiolib-acpi-core.c index 049e4cbc14ed..494dcd166aef
> > > 100644
> > > --- a/drivers/gpio/gpiolib-acpi-core.c
> > > +++ b/drivers/gpio/gpiolib-acpi-core.c
> > > @@ -1310,6 +1310,8 @@ static int acpi_gpio_package_count(const union
> > > acpi_object *obj)> 
> > >  		switch (element->type) {
> > >  		case ACPI_TYPE_LOCAL_REFERENCE:
> > > 
> > >  		case ACPI_TYPE_STRING:
> > > +			if (end - element < 4)
> > > +				return -EPROTO;
> > > 
> > >  			element += 3;
> > >  			fallthrough;
> > >  		
> > >  		case ACPI_TYPE_INTEGER:
> 
> 
> 

