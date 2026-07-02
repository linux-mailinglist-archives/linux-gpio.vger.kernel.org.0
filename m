Return-Path: <linux-gpio+bounces-39359-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sDIpBoYyRmpqLgsAu9opvQ
	(envelope-from <linux-gpio+bounces-39359-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 11:42:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF16F5672
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 11:42:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=oANJBY7e;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39359-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39359-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F0F93094BB2
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 08:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E47C3D6CC2;
	Thu,  2 Jul 2026 08:53:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837B1FB1;
	Thu,  2 Jul 2026 08:53:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982417; cv=none; b=RDZo/336OHuilzM3mf7H5ZYUoRtlJ5RzeKbEhxnYV11KKOCtLbfj6vyzGysKAfSgdCcbILNvzkUojdG7/P4CLqfPbnbMrZK0WsMLgjFD4KRjR6mnXTQ0ZDP7VEOoqf7gsJ+btJBeRQ5EbLBy0/P/UQ2E2AH063s6/7yv8qLMY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982417; c=relaxed/simple;
	bh=P52D1y8jOGUjZ6I3s57GSNefpnkRnNgy6EEsYJnyQG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsOGRaANQZMitjM63+t/bFKd9BN5z94BkxZ3sYjhxf+nAyemWWZy/75kvFh1+bmC47xbGtxrqWOTj+lm6rZHwwsZTj53SWTJBW9zEwwgsWV0NAgAjwdl67EYQhp9xm5ekV4XYYX6pJ95JDjoBlWr3kib4WIBfv556Plm0gq8CZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oANJBY7e; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782982416; x=1814518416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P52D1y8jOGUjZ6I3s57GSNefpnkRnNgy6EEsYJnyQG4=;
  b=oANJBY7e/7C7qj6EkT1M/aR36gPPgb9zpVrzwzpSjf7Zfnzc/W3iV+z9
   cYX0u+Yacs19iuyNnUJPBfjqrW/aD9breakKSi978dZYKdQ+e9OeWD6+8
   BnOYFsWLcdFkn185tUIVUJwsfW/3T9hM0P8Pj1X3QZdnWryAAdds7GWOv
   SNbskD7E4Zs1FBlYYuGiPPVvQSMS74+9i8eJS6yAxVdeid7o/Bmcpl7BG
   MqdOkMNcX0u67wBVKp9kGo8iB/BGcwMmx5JLVcurD4LOgb/n63hyU4qr9
   OmLbtGJEbUulIbJxrafKWDZHHbVbkT7OIq/PLPpUIXbRtelIr5+Q7n+Bb
   Q==;
X-CSE-ConnectionGUID: nIpoSzqnTaeb1T1JvdzXkQ==
X-CSE-MsgGUID: 9zqy5mlITrCdFdhezDZW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87560989"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87560989"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:53:36 -0700
X-CSE-ConnectionGUID: 5CKMNQHHQHGqeUcG/7hD0w==
X-CSE-MsgGUID: FgoX1yMSTG+LAgRB/EyMgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="252362347"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:53:33 -0700
Date: Thu, 2 Jul 2026 11:53:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <akYnCrs85b3liEu-@ashevche-desk.local>
References: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
 <akYlZCn9LKWGWM9e@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akYlZCn9LKWGWM9e@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39359-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FFF16F5672

On Thu, Jul 02, 2026 at 11:46:53AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 02, 2026 at 03:10:37PM +0800, GaryWang wrote:
> > Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> > Add support "UP Xtreme i12" board.
> > 
> > The pinctrl-upboard is provide additional driving power & pin mux function
> >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
> >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> 
> I don't see neither Linus' nor Mika's tags. Can you explain why you dropped them?

While at it, also fix your Real Name in SoB and From headers. I believe your name
should be "Gary Wang" (mind the space).

-- 
With Best Regards,
Andy Shevchenko



