Return-Path: <linux-gpio+bounces-35381-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDzODvij6WlogAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35381-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:45:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D8144D06F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C384D3032F54
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 04:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539E13BBA00;
	Thu, 23 Apr 2026 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnEfdhrI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480DE375AB8;
	Thu, 23 Apr 2026 04:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919337; cv=none; b=t9HOZW673JYcm4dLodJQFS8A+VfbxHbgbxDUBc7mhAYcIBZ4m6WtM6i5AxkZ+fbb1ukN8BpOGAPQhbah2+OxD51ab4qspTWXcEdiC0hcYMVsc/iV61hBSB4pktdIB2NeK+cYCg8XBQr2h3aZfMXh5oN284hlr3XvJYzCx6nEllU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919337; c=relaxed/simple;
	bh=PEfoAD0MUctfQntqKzteo2bgJQOA2RN52GfMGimY6y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIXwyOwjHtzspcUhZzxN4NoAsu+BA4502ZtX8B7F2+jTXGb+OfMdBygRrMBCqSUjOVwMcHExHW9744jFe/v87HFSxXCYHAWCHGzl3avx4BG2U2mxaV7MzY8TlUWPLQK1esx6kwsTQ2p1IoaH2kzF4tuVyNv8Rk89GubeA9oMKfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnEfdhrI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776919335; x=1808455335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PEfoAD0MUctfQntqKzteo2bgJQOA2RN52GfMGimY6y8=;
  b=OnEfdhrIfcqPNJJOV5wd8CTHRG8CbxwdAGv6FptMtSK15HVTw3lBO8Ff
   m4ZGT1FMdlD3oDBzB6Q2jwajl4HFFuGMx8gPkx46XZ3j7xlOTqjbk+vJE
   lpjrXHJiterfGld0+D1A5si8SucvLPRL8VFl8keALOA9ITtMmsw9/6D0A
   CCCvmVsxM70tAydJcg3g7zYYCeH+JmXub4f/5p0p1WleHYYjVXd6KREZi
   KbGfVK65zqkfIeyN8gr+/eG/Wfr1zDA1BYy6NGg8NXFcG6JgpJypKr3R/
   e8HaotGT4UrTxQ+PgXPLOgSr/+UflBIQhn5qw3qekFnxOM82dBdRLXaDm
   Q==;
X-CSE-ConnectionGUID: qaQCKkeTTz6lbff9CG0xxQ==
X-CSE-MsgGUID: RdZKGVmPTC+yKOojcTJmEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89346835"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="89346835"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 21:42:15 -0700
X-CSE-ConnectionGUID: BnuklEX+SzW4upnSuxbNtw==
X-CSE-MsgGUID: DdQL4TkRQL+qP8HhGXlY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="270664607"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2026 21:42:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 580C895; Thu, 23 Apr 2026 06:42:11 +0200 (CEST)
Date: Thu, 23 Apr 2026 06:42:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
Message-ID: <20260423044211.GD557136@black.igk.intel.com>
References: <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35381-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,black.igk.intel.com:mid,0.0.1.99:email,0.0.0.24:email,0.0.0.21:email,intel.com:dkim]
X-Rspamd-Queue-Id: 98D8144D06F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
> > > Assuming all the variants suffer the same problem would it be ok to use a
> > > wildcard for it?
> > Yeah, we could expand it to all "ROG Strix G16" I think:
> > 
> > diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
> > index a0116f004975..e3a6111854e8 100644
> > --- a/drivers/gpio/gpiolib-acpi-quirks.c
> > +++ b/drivers/gpio/gpiolib-acpi-quirks.c
> > @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
> >   			.ignore_wake = "VEN_0488:00@355",
> >   		},
> >   	},
> > +	{
> > +		/*
> > +		 * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
> > +		 * causes acpi_gpio_handle_deferred_request_irqs() to
> > +		 * stall for ~36 seconds during boot so ignore the two
> > +		 * interrupts involved.
> > +		 *
> > +		 * Found in BIOS G614PP.307.
> > +		 */
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
> > +		},
> > +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> > +			.ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
> > +		},
> > +	},
> >   	{} /* Terminating entry */
> >   };
> As for now it seems working. I've reverted it on my kernel as I prefer
> remain as much as possible close to the CachyOS' one but hopefully it will
> be implemented on 7.1, if someone propose the patch and it is accepted. It
> would be amazing to see Asus more interested on Linux and more strict with
> their BIOS but in the end I understand it's like asking for the moon.

Okay thanks for checking. I guess this is what we have to live with for now
until someone finds a better way of dealing with these.

@Francesco, would you like to submit a new version of the patch similar to
above or you want me to do that?

