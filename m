Return-Path: <linux-gpio+bounces-38575-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nr7PCPskMWqRcgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38575-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:27:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0668E3EF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:27:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=X02EibKW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38575-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38575-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D62430302CA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 10:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB18429814;
	Tue, 16 Jun 2026 10:24:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3E13B71DD;
	Tue, 16 Jun 2026 10:24:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605497; cv=none; b=eWgY57Lw114oew49QBXi8Z3J9tSRBjt94ak445J2xQ0fdgMLFCrDpGbR0eahDfZnneOGLtebxNUXZ2I1N8TmX+i+Tf5GylbhlB33SJCQUlgdEChfhXBfmBV9ckhuLmZpFo5Z0SstHMzCkLqLbl0nwLSRg52ZMPGPdbDXU4G9lrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605497; c=relaxed/simple;
	bh=YJQAk1iydR3IdznNp3TtXDQyLNp5wXpNsmAQLum5MYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aypIppDd2wPf+ivx/mEquUU547Up08q2jQkrosFa87D14DqxBUS03OjFGjLk//LiRw1vpHOR+I0NfkIOLJqHAkKfm1EgrXOEo4MSPtWtV/Y/Bvj9QDAAThMyzGuV3I/xRwbuR2Q60sLhBhOPaqW9GylNq0rMxxNH8HsXwQWhPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X02EibKW; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781605496; x=1813141496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YJQAk1iydR3IdznNp3TtXDQyLNp5wXpNsmAQLum5MYM=;
  b=X02EibKWRzDDIDmsDqJJi5CnTokFlZiWPRBT12qrhemPZx/eM2hzPJXL
   Xrzr2lqz44Zyk7IJGDRc9Jishz9GqJ4kUgyenwEqjVRg1jWdPNSviGLdE
   9vOBD+KcgFEH4/wVJ5bes8t0lOR0TTcA0D3j5KkTvtT2zXrpPufqOk1ym
   CCqmc5G7pyR1kx9aCTLGkS8XizpeO/JmKbtnCsdQ/cGD07SBQs2SsM79K
   O0gY9iG29mcO6YbUwFAk6VSulpOVAMIJ9EHGNk9scpkdFA+xYe+CW71hO
   h9tCOTWdhOTEtZ9atiHqjgpmoaUAcbqtphOT489lJEjK5OlzRbMDD/Ajq
   w==;
X-CSE-ConnectionGUID: MrZe8tpXTHq8HvPLabzrIA==
X-CSE-MsgGUID: 4xr3+WQQRom7sLz56YkTfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82109830"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82109830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:24:55 -0700
X-CSE-ConnectionGUID: cEIumap9T6KaPAILSLaK3g==
X-CSE-MsgGUID: a9hRPTJFRp+5CNxyIUCFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="243572351"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2026 03:24:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E5AC095; Tue, 16 Jun 2026 12:24:51 +0200 (CEST)
Date: Tue, 16 Jun 2026 12:24:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marco Scardovi <scardracs@disroot.org>,
	Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Add quirk for ASUS ROG Strix G614 series
Message-ID: <20260616102451.GC2990@black.igk.intel.com>
References: <20260616090824.5967-1-scardracs@disroot.org>
 <ajEX8L63vAhhndv7@ashevche-desk.local>
 <RqcbSmnzQWas394Kq-TG7w@disroot.org>
 <ajEeLL5u3hf7lvWD@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajEeLL5u3hf7lvWD@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38575-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:scardracs@disroot.org,m:westeri@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEB0668E3EF

On Tue, Jun 16, 2026 at 12:58:04PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 16, 2026 at 11:43:56AM +0200, Marco Scardovi wrote:
> 
> ...
> 
> > > What is this interrupt for? Touchpad?
> > 
> > It is an ACPI event interrupt on the AMD GPIO controller (AMDI0030).
> > Specifically, it triggers on pin 21, appearing in /proc/interrupts as
> > "amd_gpio 21 ACPI:Event" and as you guessed it is the touchpad.
> > 
> > Previously, using "gpiolib_acpi.ignore_interrupt=AMDI0030:00@21" or
> > "gpiolib_acpi.run_edge_events_on_boot=0" as a boot parameter successfully
> > bypassed the 36-second delay, which confirms this specific pin/handler is the
> > culprit stalling the boot process.
> 
> Mika, do you see any problems with disabled (deferred?) interrupt for this type
> of event? I think it might break the suspend-resume (on touchpad event). Also
> do you remember if we ever had touchpad event to be ActiveBoth?

For starters, why this is ACPI event in the first place? The AML is not
supposed to use the touchpad.

Touchpad should be using just regular GpioInt(). Does it still work after
this patch? If yes then I think this is definitely okay.

