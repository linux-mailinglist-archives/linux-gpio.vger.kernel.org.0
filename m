Return-Path: <linux-gpio+bounces-34597-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPSzAjqVzmkBowYAu9opvQ
	(envelope-from <linux-gpio+bounces-34597-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:11:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D6B38BAB0
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D16BA3068323
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 16:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06BF28642B;
	Thu,  2 Apr 2026 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBfV5Ra0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD82FFF8F;
	Thu,  2 Apr 2026 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775145930; cv=none; b=bTcvTCrC+QcVSLhF66FrJpVLnU1YkhlHsvBKwQ5sl2B27Rr8VeJR/hZSyKwn2WWxuFat9KalebEJG81DrYo/+LSAU16pwGmBWnwunKvsy17NRuChAIAnpsjzO4JzVB+uF5rjqRTVgDNAaUzy2z14fUiOJWjJ6yKnpfAkcTvaNpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775145930; c=relaxed/simple;
	bh=IODCawz8kcexRtKlj/yGaPPXqXPpD1zBkHmNkzRnqCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmaEd38Ci0kI2MZq/2hPENoz2Dmw2/waMT9aDQNNQoQw+6OvKUq+9Xixb8AFqtSTgGn0yrZk1ECUIiRWx1Llu1YqMiSdmmpQ98wLLwdeIG269ak3ttVS+bXFAZaqc90Hr2pM0JUkqkod2yRA/3V7VP7AoAV5Px/KPXDxfW62jWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBfV5Ra0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775145929; x=1806681929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IODCawz8kcexRtKlj/yGaPPXqXPpD1zBkHmNkzRnqCc=;
  b=TBfV5Ra0I+92u9sINodPHjWu1ZqGk5c+EOluiuRjiygXHGYW4BJkJbPA
   XhNT7cQHZqhpol4fqo6dj4Vq5zBhmdp7UVVxB9dp5IvQ6tRy6LJmmzmZo
   gMgKs53wMxavM35HMHTPAgcF5Il3AdZMCfCFvjfagLuIb0CMX69Eert1m
   tUffP/T7qNnrdwUwQ90WL/3/iF5sXBOn0sqXioOaqXwthy+LZTCZTcURQ
   18yJGaJDREVG2ZHSrnwB6A1Pvyr5zXDBk3K4ZL7yBhD/DnjFH+1CRewfo
   4Y73qSF3vzGIBIBD7xxLowDRqu++rFG83QNhoxtVeXRO6CVcNNRINl1uR
   w==;
X-CSE-ConnectionGUID: RWkKSCMvSfyv8ulmt00mww==
X-CSE-MsgGUID: mOCdQftDTDaRjG9gW+/WIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="63759096"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="63759096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:05:28 -0700
X-CSE-ConnectionGUID: nX2n9YhRQIiu0VLycGKtyQ==
X-CSE-MsgGUID: AvO1IF+FSPGsevXXqjehog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="226886785"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:05:23 -0700
Date: Thu, 2 Apr 2026 19:05:20 +0300
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
Message-ID: <ac6TwAL3fQrlpef2@ashevche-desk.local>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <ac5t5XozmzN9oq96@ashevche-desk.local>
 <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
 <ac5zhZAyiwbUwzWo@ashevche-desk.local>
 <CAMRc=McJFNp15jnrehGLHsmFRfBpRQoppmdB_51whzJUQ-5ZLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McJFNp15jnrehGLHsmFRfBpRQoppmdB_51whzJUQ-5ZLw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34597-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 21D6B38BAB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 05:03:10PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 2, 2026 at 3:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Apr 02, 2026 at 03:35:24PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Apr 2, 2026 at 3:23 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > > 3. Export the acpi_bus_type symbol. It's already available in the
> > > > > acpi_bus.h header but it's not available to loadable modules.
> > > >
> > > > Nowadays we don't do that but export the dev_is_acpi() or something similar if
> > > > it's not yet available and to_acpi_dev(). (Names are derived from the existing
> > > > pattern, they might be need to be adjusted, dunno.) See how PNP does that.
> > > > Note, I haven't read the patches yet, just a quick comment.
> > >
> > > Maybe I should have said why I do it. It's to register a notifier call
> > > on ACPI bus events. Is there a better way to do this?
> >
> > AFAIU there shouldn't be pure ACPI devices, they are companions to the real
> > ones. Can we simply attach to the normal device notifier and check if the
> > companion is what we are looking for? Also since it's specific to that driver
> > and you know what the platforms you are looking for, why can't we hook
> > something into drivers/acpi/x86/lpss.c?
> 
> The ACPI companions seem to only ever be added once and never removed
> - unlike platform devices. This is why I prefer to check the ACPI bus.
> 
> As for lpss.c - what do you sugest exactly because at first glance I'm
> not quite sure what's there to hook up?

Can't we create / submit the software node of the given device (GPIO)
when it's get created (as platform device)? That driver uses a notification
when ACPI bus is scanned, that's what may trigger the software node creation
and the other end will eventually see it.

-- 
With Best Regards,
Andy Shevchenko



