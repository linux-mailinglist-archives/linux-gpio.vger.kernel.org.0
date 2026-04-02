Return-Path: <linux-gpio+bounces-34599-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBaOJqqXzmkBowYAu9opvQ
	(envelope-from <linux-gpio+bounces-34599-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:22:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE8038BC92
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 637BD3017381
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 16:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E93E3EF65A;
	Thu,  2 Apr 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlAb2Vtl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6CF3C277E;
	Thu,  2 Apr 2026 16:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146697; cv=none; b=jS2iU8HEfv3fgMYodsqjNl9DSU7SKRNZMnfxq/vxtlrYoyoQimLAQVIbAV3ZsXLRJN6M0Q5bPMqwHX4b0D0S/xt+8kFP0OFnYk8QpFV760NtUVdEoNVRvavnZLRtODolfGySxkW/L0fwtNjz5oDqb1816N/XLxXKA1qeZO0J9Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146697; c=relaxed/simple;
	bh=cHA6HJwqPPWrU3IiFd6EZm2GFueXb6661Msyf/6n34o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvzqUcFuOsANDpJCWOdx0CDuhjA6TbSyEwqcMA/CsvoOgkT0L1+kXh1QuPyINzmt/vnmrdS6B8bjadyulpUKsmLBFBfFAB2cBkMa5NVEVJdHoQ1D30er2y1iYynQr5nP6GJchR8msYlbjO3bpze36NMakfAfF7g/2svgSRHHayQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlAb2Vtl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775146696; x=1806682696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cHA6HJwqPPWrU3IiFd6EZm2GFueXb6661Msyf/6n34o=;
  b=LlAb2VtlBq0egANIUEEh73QbIOLKdGI4o04NhVW0gSFjSQ6npjeNsmnj
   Z/Oa9Eoncwf5VkL1RMkGU45izGZAz/29gJs8eBCGatoBkPgdmQn4hTbxq
   y8rywrc97z4jaIc6Vdt06rafYAIMtpkuBJhfN3RfRXOd7L42mWr93qnN4
   mo2eIjNk6WghIDSvllVTOJqmnMmGjwEhJeP+yHUEJPjIU96iajoj6kQOx
   07a6q+T5N50b00uhYCqIRguyoH1r86eZubuusH9OvyGm8OVa8Z/vbR0N3
   6U7CxMgytitIE1DXblKMBrnPMXr8PximwtOj4FGeMBxI/BOWeJOwHIuep
   Q==;
X-CSE-ConnectionGUID: Ua+6qOEpQ4GAEI2EVd1WoQ==
X-CSE-MsgGUID: k7w9/1usTP+QaPVMaQYD6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76103034"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="76103034"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:18:16 -0700
X-CSE-ConnectionGUID: zIYpWhvPTOuar/VRNfLBrA==
X-CSE-MsgGUID: uj/mKnd3TkO9W9LABkoADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="257500449"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:18:10 -0700
Date: Thu, 2 Apr 2026 19:18:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 0/4] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
Message-ID: <ac6Wv_l7UQ7e_Xu5@ashevche-desk.local>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <ac5t5XozmzN9oq96@ashevche-desk.local>
 <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
 <ac5zhZAyiwbUwzWo@ashevche-desk.local>
 <CAMRc=McJFNp15jnrehGLHsmFRfBpRQoppmdB_51whzJUQ-5ZLw@mail.gmail.com>
 <ac6TwAL3fQrlpef2@ashevche-desk.local>
 <CAMRc=MdPfOB+xbHxP5rRfLmQ7Ue++Kb8iWaMU5hMZ6OvFqa01w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdPfOB+xbHxP5rRfLmQ7Ue++Kb8iWaMU5hMZ6OvFqa01w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34599-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0DE8038BC92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 06:13:38PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 2, 2026 at 6:05 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Apr 02, 2026 at 05:03:10PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Apr 2, 2026 at 3:47 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Apr 02, 2026 at 03:35:24PM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, Apr 2, 2026 at 3:23 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > > > > 3. Export the acpi_bus_type symbol. It's already available in the
> > > > > > > acpi_bus.h header but it's not available to loadable modules.
> > > > > >
> > > > > > Nowadays we don't do that but export the dev_is_acpi() or something similar if
> > > > > > it's not yet available and to_acpi_dev(). (Names are derived from the existing
> > > > > > pattern, they might be need to be adjusted, dunno.) See how PNP does that.
> > > > > > Note, I haven't read the patches yet, just a quick comment.
> > > > >
> > > > > Maybe I should have said why I do it. It's to register a notifier call
> > > > > on ACPI bus events. Is there a better way to do this?
> > > >
> > > > AFAIU there shouldn't be pure ACPI devices, they are companions to the real
> > > > ones. Can we simply attach to the normal device notifier and check if the
> > > > companion is what we are looking for? Also since it's specific to that driver
> > > > and you know what the platforms you are looking for, why can't we hook
> > > > something into drivers/acpi/x86/lpss.c?
> > >
> > > The ACPI companions seem to only ever be added once and never removed
> > > - unlike platform devices. This is why I prefer to check the ACPI bus.
> > >
> > > As for lpss.c - what do you sugest exactly because at first glance I'm
> > > not quite sure what's there to hook up?
> >
> > Can't we create / submit the software node of the given device (GPIO)
> > when it's get created (as platform device)? That driver uses a notification
> > when ACPI bus is scanned, that's what may trigger the software node creation
> > and the other end will eventually see it.
> 
> Yeah that would be awesome but you still need to export these software
> nodes to the x86-android-tablets driver. I think it's better to keep
> them in the driver as it's the only user and it's unlikely there'll be
> more similar cases.

As I mentioned, the mentioned driver is a specific enumeration for the given
platform(s), it's the best place to keep things there related to LPSS island on
those platforms (SoCs). Exporting is fine as that driver makes the whole SoC
somewhat useful, otherwise it's just piece of x86 core which makes a little
sense to have without the crucial peripheral drivers be enabled.

-- 
With Best Regards,
Andy Shevchenko



