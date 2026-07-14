Return-Path: <linux-gpio+bounces-40047-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i4dKEhz2VWr0wwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40047-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:41:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D2752838
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:40:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=hG5qDB4R;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40047-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40047-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD963305755F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EEC3D9DB4;
	Tue, 14 Jul 2026 08:36:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1A3D9DD6;
	Tue, 14 Jul 2026 08:36:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018188; cv=none; b=TYwBpZBwasYD1UkLJf13Nho9t1rsBcfyeiDlYbHpJ5D5FHHM/0VjovgWPGROWDDZ9NFnlj0Z/opkPFbVh+McWbKNBSSIq1xpn8So6LiuTbcjbcvalmPJxTcuqn10xsdUZXbzE9CCwXPO9xU3xOr1opG9YAFOl6e6DJumGJaDWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018188; c=relaxed/simple;
	bh=qo28EFWZxrsMXY4+G3XAbNJfDxU2gJLVu2KlDJ/n3Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lbs0hAUCG2ltwTwAF5swIherhf4o8QoX5qtPh4Ad82PydZ7lcKlPvsGrZiZcgtCegZyiPHNk8XRr2+yGbC/310kt3SCvOqha9qRZIaJSMDMNN4EFgxUM8wLg0gpTdlXFSN6YzWk2OeT3m/ioGaglvToRd1XiH5Rt6/BUgnW3NhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hG5qDB4R; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784018181; x=1815554181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qo28EFWZxrsMXY4+G3XAbNJfDxU2gJLVu2KlDJ/n3Wg=;
  b=hG5qDB4RvuZrixVIPygZKXM3lW/4GaS0DmR7mF9jeMSOMWYjfshL8p9O
   5jbrfRmisQj4IQwZinpgws0UpMyNIMtfJzyF1uu7DJkcUDRTg3IybGYmz
   tmtYFEueJhnOI2KsS4xbFEDh5i1zEPRGDXhfh+FYZiftxIJWWOa7J7xOY
   h/obR8GJFbnm/sgMekrS+z/huzkdBcuOsocCh8GoVDBHuSsPRk20CdHi9
   cCPwf4xg6Wrrn7/3guS3OzHEXzEHeTFVGhWSViujhdBpduqPE5dd652MQ
   WY1tFFSH6cIyuBkqYBi02xOH16NtLPAichT0PKUHazU4EGlx1Ojnwscjd
   w==;
X-CSE-ConnectionGUID: gVHh/HxlT0+pBekF2f9gUQ==
X-CSE-MsgGUID: WeRe4+JcQF2qeT8XlJmXOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102061324"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="102061324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:36:11 -0700
X-CSE-ConnectionGUID: itx4fwgVR4uM93ncyrEO9A==
X-CSE-MsgGUID: LLDD+2CUScqpzW7EtThIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="251847743"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:36:08 -0700
Date: Tue, 14 Jul 2026 11:36:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1 09/20] gpio: Add missing dmi module annotations
Message-ID: <alX09v_juWEZs7TC@ashevche-desk.local>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <eb1fdcce0f07e274e5590b8821d9dd7835f1ce0a.1784013063.git.u.kleine-koenig@baylibre.com>
 <alXyEPWUS5cJg6Jb@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alXyEPWUS5cJg6Jb@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40047-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linusw@kernel.org,m:brgl@kernel.org,m:westeri@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA0D2752838

On Tue, Jul 14, 2026 at 11:23:48AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 14, 2026 at 09:24:10AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > A driver module matching devices using an dmi device id table is
> > supposed to declare that in the module's metadata. Add this information
> > for two drivers that failed to declare these.
> 
> No, it is not supposed. Why?

...

> These are quirks and enumerating by quirks sounds weird.

Saying that I recall that we have also PCI ID tables and ACPI for the other
purposes than enumeration. Please, revisit all your patches with the same idea
and remove those MODULE_DEVICE_TABLE():s which are not required or actually
must not be there. Some drivers have comments regarding to the absence of the
macro, but some may not. Feel free to add a comment there.

-- 
With Best Regards,
Andy Shevchenko



