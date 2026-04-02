Return-Path: <linux-gpio+bounces-34593-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNyWLxF0zmkpnwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34593-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 15:50:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135838A065
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 15:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC2DD308300E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 13:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2393DFC73;
	Thu,  2 Apr 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKglh+tN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD33CBE7D;
	Thu,  2 Apr 2026 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137679; cv=none; b=nXkeHx49rJFmdYSJRKkn9G903p+SOVDxZfJgp00os3zWh88AEudJHVk9+VJjRfsdsFLDq/g41Hs8KIOlm7wSxUvWc24FwjBKcWg2OFHBiTDoCkd3P31zYj6a/BogTkCAAkSKy10oXoAd9Hq2NdWQPyYKgBbO6dJ1gCsJ8yL+24E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137679; c=relaxed/simple;
	bh=GRKjzT+ZDuM23HB0D2ydJq5Mdn2LGg+Wk5/aTsc+gcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPVcOxLjK6+HFNw7p4XqAGPpaoUbkwTZ78V2Vw8w3cI0WCHiJCFo7td/Ra4Q6UHJxyE8FJfxdsN4q6R72BYij3PVTNPfsgPj+vqT02ikgv7ZdBDivENa6sYZjEWIdHb42KLZVOpnrbZoiXgoqB69F0d7OR7RK9EDWDEe8/A5gkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKglh+tN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775137677; x=1806673677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GRKjzT+ZDuM23HB0D2ydJq5Mdn2LGg+Wk5/aTsc+gcM=;
  b=ZKglh+tNafyoIRQxRwA8h7Rg113DcpNcQTCLAR3rMlM/IcpuYNWtk8+v
   CzZtGl1ErTdoOa4hE1JPO83cWHVQ7szBOO0TBK59fRiicxti9J8o7QD3x
   JeBJKkQsHDI74FQaEY6jrlrZpxDvEkOvkOg4LUwbtvpIYogDQRlH0EQlP
   Ri69wyEQP8gjr0r6A2upug5nGr76vPxzJTcGlSAbfL5r9NFO68boFRcDk
   44oKiJQPnsDyC9iaOnp4CAIKN4e4Zj7Mjqijw1893r863mpd7QqBxaOVP
   TQ+OEqJlGqk46fCVeK6K6RZ0XPI1w3eihubazgf9Ii0os/GgCnf8pZrRl
   A==;
X-CSE-ConnectionGUID: 1spP+flwQ3mJz3Y0RZZgaw==
X-CSE-MsgGUID: Egh7DFLERNWNBaXfT2S9kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93779317"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93779317"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:47:55 -0700
X-CSE-ConnectionGUID: bkj4Upz4QEyqCYqU7DL7Og==
X-CSE-MsgGUID: kBEvkSL+TgmqbbxElzaL1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="223707397"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:47:51 -0700
Date: Thu, 2 Apr 2026 16:47:49 +0300
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
Message-ID: <ac5zhZAyiwbUwzWo@ashevche-desk.local>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <ac5t5XozmzN9oq96@ashevche-desk.local>
 <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34593-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 6135838A065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 03:35:24PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 2, 2026 at 3:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > 3. Export the acpi_bus_type symbol. It's already available in the
> > > acpi_bus.h header but it's not available to loadable modules.
> >
> > Nowadays we don't do that but export the dev_is_acpi() or something similar if
> > it's not yet available and to_acpi_dev(). (Names are derived from the existing
> > pattern, they might be need to be adjusted, dunno.) See how PNP does that.
> > Note, I haven't read the patches yet, just a quick comment.
> 
> Maybe I should have said why I do it. It's to register a notifier call
> on ACPI bus events. Is there a better way to do this?

AFAIU there shouldn't be pure ACPI devices, they are companions to the real
ones. Can we simply attach to the normal device notifier and check if the
companion is what we are looking for? Also since it's specific to that driver
and you know what the platforms you are looking for, why can't we hook
something into drivers/acpi/x86/lpss.c?

-- 
With Best Regards,
Andy Shevchenko



