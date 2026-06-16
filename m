Return-Path: <linux-gpio+bounces-38571-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vcbjKfAaMWq6bgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38571-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:44:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E268DA64
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:44:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=AYFSXRX1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38571-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38571-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DDDE300DEDE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9305D4219EE;
	Tue, 16 Jun 2026 09:44:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3498421A05;
	Tue, 16 Jun 2026 09:44:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603053; cv=none; b=sdyAbezpIJkiDLTmkaBaQ0h84vCOWFeqW6hlot1lPfm/OAaWMxnK4+9kYVBigowGVJaQhmjJdlr5BFr6W2Pgrc3b6+uMHkYYKsmI8HCXh0KBlWOpFtLrFce2FgVW/rTnXuDV9Ec5xbcxSOFNbvQmUn7mcY3kQPLAazGYrbMFToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603053; c=relaxed/simple;
	bh=mWWaJuOm2MSxr7vAoqriZoUvC9+aAaZ6/3TJS9Nvy+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nM3E3KpvbxMxoV5ztggIIsl26whZtRyN0Lxfp2mkEYc7XFJEQuaC02qhVSbwqoYFe2XtTM94Ho7iDuOkD/p6wt8dhZVvHVtmJMI3cKMq40goAxA3gcMM5n1QKhJalCuAa6ogbC3rSm9fyCcONOtGS8gZ7QXNhYrLuqST5b7bkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AYFSXRX1; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 410C3277CE;
	Tue, 16 Jun 2026 11:44:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htInjrjOE_y1; Tue, 16 Jun 2026 11:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781603049; bh=mWWaJuOm2MSxr7vAoqriZoUvC9+aAaZ6/3TJS9Nvy+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AYFSXRX1OU1syY4HtWLAgayQSVJ+ScjbizFZwDPoSoY7p4wNtHY/3RzmqkDAitHMA
	 tF9COnQXnKIEh53H7KnproEY1n5+tDocQvCVUZo8387VGu53jGBJki3w/Rs7z6xk5N
	 ER3h+tiniwkipKTjxXKKVDdlSTY5dbjQvG37KkEs6j8S1YXCBZD3XJcMTNax7oGXz3
	 U6SkLwUV2Qe3O8qJWBGCdfil4XH/Ai/bSplQpRnKoLdqEw+K/CW7p30UA2bURULPQB
	 wYtNshXcv7WVm2hbPje1Cb2IUqw34vdpZ9GfyOFWvG1inDECDlnm59VeeHJGFd/JHt
	 oh90zzGou938w==
From: Marco Scardovi <scardracs@disroot.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-gpio@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Add quirk for ASUS ROG Strix G614 series
Date: Tue, 16 Jun 2026 11:43:56 +0200
Message-ID: <RqcbSmnzQWas394Kq-TG7w@disroot.org>
In-Reply-To: <ajEX8L63vAhhndv7@ashevche-desk.local>
References:
 <20260616090824.5967-1-scardracs@disroot.org>
 <ajEX8L63vAhhndv7@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	CTE_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38571-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:westeri@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,disroot.org:dkim,disroot.org:mid,disroot.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A8E268DA64

Hi Andy,

> 'slow'? Did you mean 'low'?

Yes, sorry, that was a typo. I meant 'low'.

> What is this interrupt for? Touchpad?

It is an ACPI event interrupt on the AMD GPIO controller (AMDI0030).
Specifically, it triggers on pin 21, appearing in /proc/interrupts as
"amd_gpio 21 ACPI:Event" and as you guessed it is the touchpad.

Previously, using "gpiolib_acpi.ignore_interrupt=AMDI0030:00@21" or
"gpiolib_acpi.run_edge_events_on_boot=0" as a boot parameter successfully
bypassed the 36-second delay, which confirms this specific pin/handler is the
culprit stalling the boot process.

Thanks for the review!

Marco




