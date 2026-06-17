Return-Path: <linux-gpio+bounces-38629-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Nt7K7BgMmrnzAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38629-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:54:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0435E697AEB
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:54:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=lSrTmpu7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38629-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38629-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA91C30A38DD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 08:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936913B993A;
	Wed, 17 Jun 2026 08:53:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3449C390C9F;
	Wed, 17 Jun 2026 08:52:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686381; cv=none; b=fUptVY3SlBhSMiO5YFn30tMvSAutKd74D4668PG6E45IN0oD9OJ2wNluGSwxviFXVR3jMOR/u4euNbpxUkQqDfzmMiGlp+5VCSEkpQxKarHk2Hxp+Zq61f6H7sOjOVixpFYlCcCgZB7KURLpmrR/VCaADjbHOXa+ttF3cjMWaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686381; c=relaxed/simple;
	bh=SBhFBik6Q8jsMrDc/brKC2mrnipQabc3lq2zmQMLUtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQUX5+CTVpZ1wDTVIevOsHG1EQYey00Qwt+0RXjatG+rOGAdDmFZ3P/p5e7WciazXMixvFPF2sscXrR1YfS7VDnydA/myaYjq/45PjnAg//L2v3wf6XjHI2nFI3TX6jmleJbHT1oCi9nhmCaokevMWvJ09UVhNHf5DkWhJuk3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lSrTmpu7; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B1B8D2758C;
	Wed, 17 Jun 2026 10:52:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQkLN9fSq7zN; Wed, 17 Jun 2026 10:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781686377; bh=SBhFBik6Q8jsMrDc/brKC2mrnipQabc3lq2zmQMLUtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lSrTmpu7PuxSPHmn9OwmMFrS5dOtRj8mLnAMiVj1rsgaSWOnvFRGDwYxedKXWsOvO
	 Zu3fnY2p1f9s3A3HSQMpRNnkf0mEkfnGOZv0VkM2AVHvSJYmH7BhN1/GD/zhHFJPWh
	 uzAadVO/zlTPlHLgNVG/ZTAnvGaWzCgeeckp+yYGHM5pndUhoZcafAobe6GPjfBHun
	 BvfxGVPB1O7t29agp+6OpFR84hiApkb3C80avWvLo+8iP3nmjadrFgmUlWIOLGnBlU
	 KBS0tjkpZI3x+h28lJTZ/6+rJ04Ibc/V6e/kaesMUQOvkEZ1sofw8afOYGvubxB2au
	 UxErZbVtjUCNw==
From: Marco Scardovi <scardracs@disroot.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mika Westerberg <westeri@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-gpio@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Add quirk for ASUS ROG Strix G614 series
Date: Wed, 17 Jun 2026 10:52:35 +0200
Message-ID: <h3V3bT1sQUiheRF3xSbypg@disroot.org>
In-Reply-To: <ajEtpY101OpZdtaF@ashevche-desk.local>
References:
 <20260616090824.5967-1-scardracs@disroot.org>
 <KW1oy3-UQRW73tAAP5-cWQ@disroot.org> <ajEtpY101OpZdtaF@ashevche-desk.local>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38629-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mika.westerberg@linux.intel.com,m:westeri@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,disroot.org:dkim,disroot.org:mid,disroot.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0435E697AEB

> 
> Okay, perhaps this all needs to be elaborated and summarized in the commit
> message.
> > Sidenote
> > Personally I'd wait for Mario for further info: after all it's him the
> > maintainer for AMD side and surely knows more than me.
> 
> Sure, I am with you on this.
>

What I'm saying below is purely based on my own speculations but it's the
most plausible thing I can think as for now.

When I tested Mario's patch back in April it totally used to work on my 
device: I have an idea that the value probably happened to be equal 1, like 
requested on the patch and making it working as intended.

In the meantime I updated the BIOS (from 310 to 315, released in May),
changing the value from 1 to 0 and breaking the boot time again (as said it's 
my own speculation, I'm not sure if it is actually possible).

I didn't test the patch after the BIOS update 'cause I had the
gpiolib_acpi.run_edge_events_on_boot=0 option enabled and didn't think it 
would stop working again.



