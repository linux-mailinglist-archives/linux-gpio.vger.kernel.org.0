Return-Path: <linux-gpio+bounces-38709-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SaYuBhQaNWoZnAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38709-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 12:29:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9996A539E
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 12:29:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=JfA52Yhq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38709-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38709-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96E6D3029272
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 10:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930F7372B31;
	Fri, 19 Jun 2026 10:29:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7162136AB6B;
	Fri, 19 Jun 2026 10:29:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864950; cv=none; b=I7bfKF2XRfsnF/QxHhjYxswyb5YXih4NjrBzpjhbUnLXowKoZnZi8S/Tm12tzQLe4zPsh20Pe+/lAzRTO75zY8ruNUYBHI7rSG+NPh/49DsyUrJnAh13TwHU7bYTRwjvDvsnG+HUiozsRJ1g3O4eeewX6/vko/bJzfRpFWwlsHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864950; c=relaxed/simple;
	bh=CFDmWz892+RRuXtn1rIXr2e3YTyzaRMAi8rs7X9Ivbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fk4AOeBxO2kbaUsg3XjSpXqV6Z/p8iq+CgJ9KsA1usAP4kAO8f/D6qNZSHegd7uQF7DS65qPCT+/63NblhNMZsWt8s5J8wma5alcflXA3dzOA2gaMbIW3pSvvxyRX2fSoEEcHMhe+lVeoH24Rbz/4te+VdNEV+LrIprs57YPypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JfA52Yhq; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5B60B26E3D;
	Fri, 19 Jun 2026 12:29:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vY771eyNqugE; Fri, 19 Jun 2026 12:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781864942; bh=CFDmWz892+RRuXtn1rIXr2e3YTyzaRMAi8rs7X9Ivbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JfA52Yhq5T+8wrwPRLbYF1U/aGXa739tH7s5X4Wcb+YKcWcW78AmxmWfVw7bwsjpb
	 zGiwt8HZj/ri6aHOj+YFalCyRJPjXHY35Ro+yrb+WsdVBED0lEbI4CTD3z1qyDfATV
	 FwAgui9bsD4KbboohtHdL7/t8J+HQwR3daW9C7aJoVYyYOffpPyq6Pzd3FynAFPK0h
	 JUsFSKyGZBd5Hvi75VXtnEZo7n5HKM8oYzsNCf12xHgLWs/9J/BaDzHF/wUb2ROP2b
	 RnX/qDlGsJL3Zajz5paq/XTmYr37O0avSMcgo0TgRTlzhTUKDbzK7vWgmUw7GfEY1l
	 SXX5LivNqhQRw==
From: Marco Scardovi <scardracs@disroot.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Basavaraj Natikar <bnatikar@amd.com>
Cc: w_armin@gmx.de, brgl@kernel.org, linusw@kernel.org,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com, westeri@kernel.org
Subject:
 Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16 G614
 series
Date: Fri, 19 Jun 2026 12:28:49 +0200
Message-ID: <P9sY7IKaQumFwq7UGDqIPA@disroot.org>
In-Reply-To: <9643455e-f4ce-4496-bcdf-1122420c18eb@amd.com>
References:
 <0e6ea9d5-68ac-4d18-b40a-25e70216b288@gmx.de>
 <_tDfR2zvSRyshOH99j8NCA@disroot.org>
 <9643455e-f4ce-4496-bcdf-1122420c18eb@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,vger.kernel.org,amd.com];
	TAGGED_FROM(0.00)[bounces-38709-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:bnatikar@amd.com,m:w_armin@gmx.de,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[archlinux.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,asus.com:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F9996A539E

In data venerd=C3=AC 19 giugno 2026 12:17:17 Ora legale dell=E2=80=99Europa=
 centrale, Basavaraj Natikar ha scritto:
> On 6/18/2026 11:37 PM, Marco Scardovi wrote:
> > In data gioved=C3=AC 18 giugno 2026 20:01:40 Ora legale dell=E2=80=99Eu=
ropa centrale, Andy Shevchenko ha scritto:
> >> On Thu, Jun 18, 2026 at 06:59:15PM +0200, Marco Scardovi wrote:
> >>> On Thu, Jun 18, 2026 at 16:35:37 CEST, Andy Shevchenko wrote:
> >>>> On Thu, Jun 18, 2026 at 06:46:28PM +0530, Basavaraj Natikar wrote:
> >>>>> On 6/18/2026 4:44 AM, Marco Scardovi wrote:
> >>>>>> On Wed, Jun 17, 2026 at 10:33 PM, Armin Wolf wrote:
=2E..
>=20
> I also checked the BIOS 316 ACPI dump =E2=80=94 the stalling path is byte=
=E2=80=91for=E2=80=91byte identical
> to 315, so the AML is unchanged and it'll still stall if pin 21 boots low.
>=20
> On the OEM side, I'm connecting internally with our AMD contact for ASUS =
to report
> this behavior and follow up on a firmware fix.
>=20
> Thanks,
> --
> Basavaraj
>=20
Hi Basavaraj,

Thank you. Does that mean that my patch will not be required anymore?
If that's the case you can consider it as null. I don't mind having the boot
flag added until it's completely fixed on ASUS' side. BTW I have the suspect
that my model is not the only one with the long boot bug on ASUS [1] [2]
but actually the only one who came up with an actual patch on the kernel.

[1] https://bbs.archlinux.org/viewtopic.php?id=3D307251
[2] https://rog-forum.asus.com/t5/rog-strix-series/linux-boot-is-very-slow-=
at-this-moment/td-p/1138746



