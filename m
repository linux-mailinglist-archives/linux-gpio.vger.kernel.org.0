Return-Path: <linux-gpio+bounces-38728-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QMsOHbg4Nmqn8gYAu9opvQ
	(envelope-from <linux-gpio+bounces-38728-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 08:52:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE16A8741
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 08:52:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=eIY8XxC5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38728-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38728-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 170553018C36
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 06:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37510374A14;
	Sat, 20 Jun 2026 06:52:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B39374A00;
	Sat, 20 Jun 2026 06:52:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781938355; cv=none; b=tZkcoLBMYr44Zryoct5TtDWlHA7GCoxblA4asyOkeJPHZ/NUKQ4GUuluCJHwGTsjd/Fa3ESzYYFhl6T/URW0qfY5sXVb1w44PigssJ6/deInl/0MdC/hwgkW3f7gdJ39OOgJY/pceWoXtDT4Qdkr/REIJ4lqpuhP4JG/5AZflKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781938355; c=relaxed/simple;
	bh=rw+LPnWaKArLuvicHtNdXrulX5vE0qdcS856Yxu/JEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=end2yitofYKUBPygrZbFgs8SWtW+rjBlTD+K1r7hFUsXM5rL2TYX+nPXiLJ4NdXj1YOwbkHm/MjmEjmD6KWTosHFccyV0tJHBmB2Hc2BTYNRYbZBuQ0BKybB7jBeA8nO43uRL6acb9oz87t9uZh40BCRUETnABvg8NTpFkw09/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIY8XxC5; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781938353; x=1813474353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rw+LPnWaKArLuvicHtNdXrulX5vE0qdcS856Yxu/JEQ=;
  b=eIY8XxC5x/s8inTTpKhKtVmDdQNyKtASXxLBZ2mspD1Xsw5oKfhs7JTF
   AqvqPvqec3tjMV2+iZh7BRF5VT5wcdhOQxTvi6HV79Z8t5yo4GanHXC1c
   a7z+DHgwP0hieXMChrcDkaM6q17VUtOUlaYl3p5Om+PDcYVUIVLPekwRM
   lI3El+QojDmCTSc8mKq3Qda+yLBuFKbIs5vcGFH/sSasqNtChBLBOqz71
   Z5u+IpP/mwkRnub7F6rMXgPiUIuqJgFGVkqFVAZpOCyUuxThWHQZqkund
   ZF+fPgLLPXpBklBU7JsHQh1uhKkeb0baYfxD1A0DuXUj1ITr6Vdu4gbk3
   w==;
X-CSE-ConnectionGUID: ZKiDiFH7R5+3pL2zzPjZTw==
X-CSE-MsgGUID: 774AQQeERlqq2OflSXITOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="93873288"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="93873288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 23:52:33 -0700
X-CSE-ConnectionGUID: xlOlVF2+QOyxcAyyzRRPng==
X-CSE-MsgGUID: Qo+nH3ZmSp++z000wUK41A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="272847588"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.0])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 23:52:30 -0700
Date: Sat, 20 Jun 2026 09:52:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Basavaraj Natikar <bnatikar@amd.com>, w_armin@gmx.de, brgl@kernel.org,
	linusw@kernel.org, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com, westeri@kernel.org
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
Message-ID: <ajY4q8o4wXvGMSZj@ashevche-desk.local>
References: <0e6ea9d5-68ac-4d18-b40a-25e70216b288@gmx.de>
 <_tDfR2zvSRyshOH99j8NCA@disroot.org>
 <9643455e-f4ce-4496-bcdf-1122420c18eb@amd.com>
 <P9sY7IKaQumFwq7UGDqIPA@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <P9sY7IKaQumFwq7UGDqIPA@disroot.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38728-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:bnatikar@amd.com,m:w_armin@gmx.de,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,gmx.de,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDFE16A8741

On Fri, Jun 19, 2026 at 12:28:49PM +0200, Marco Scardovi wrote:
> In data venerdì 19 giugno 2026 12:17:17 Ora legale dell’Europa centrale, Basavaraj Natikar ha scritto:
> > On 6/18/2026 11:37 PM, Marco Scardovi wrote:
> > > In data giovedì 18 giugno 2026 20:01:40 Ora legale dell’Europa centrale, Andy Shevchenko ha scritto:
> > >> On Thu, Jun 18, 2026 at 06:59:15PM +0200, Marco Scardovi wrote:
> > >>> On Thu, Jun 18, 2026 at 16:35:37 CEST, Andy Shevchenko wrote:
> > >>>> On Thu, Jun 18, 2026 at 06:46:28PM +0530, Basavaraj Natikar wrote:
> > >>>>> On 6/18/2026 4:44 AM, Marco Scardovi wrote:
> > >>>>>> On Wed, Jun 17, 2026 at 10:33 PM, Armin Wolf wrote:

...

> > I also checked the BIOS 316 ACPI dump — the stalling path is byte‑for‑byte identical
> > to 315, so the AML is unchanged and it'll still stall if pin 21 boots low.
> > 
> > On the OEM side, I'm connecting internally with our AMD contact for ASUS to report
> > this behavior and follow up on a firmware fix.
> 
> Thank you. Does that mean that my patch will not be required anymore?
> If that's the case you can consider it as null. I don't mind having the boot
> flag added until it's completely fixed on ASUS' side. BTW I have the suspect
> that my model is not the only one with the long boot bug on ASUS [1] [2]
> but actually the only one who came up with an actual patch on the kernel.

I believe your patch is still needed. Not every model might get a BIOS update,
and no guarantee that everybody who possesses the problematic platforms
actually *will* update the BIOS. But it's AMD's call. I will happily accept
the changes acknowledged by AMD.

> [1] https://bbs.archlinux.org/viewtopic.php?id=307251
> [2] https://rog-forum.asus.com/t5/rog-strix-series/linux-boot-is-very-slow-at-this-moment/td-p/1138746

-- 
With Best Regards,
Andy Shevchenko



