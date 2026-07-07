Return-Path: <linux-gpio+bounces-39571-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qSltKJe1TGoXogEAu9opvQ
	(envelope-from <linux-gpio+bounces-39571-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:15:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29A718FA4
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=xpvw0O67;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="l i3FHAC";
	dmarc=pass (policy=none) header.from=arndb.de;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39571-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39571-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D43B3013BAB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 08:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9D430E0CC;
	Tue,  7 Jul 2026 08:15:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FD430E0E9;
	Tue,  7 Jul 2026 08:15:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412116; cv=none; b=LYmgARfPGEDvlI5aAvPWET/GcfpNebVj14oL3kn/8ByouO2hAKtlCcwNFKJdFltm7kxL22ekpOZCHIB1IA+EUDjbhNzz/8BDGtUyaQeiQI8aGs1qRlaJZvD9MDzJ+bgh3UufIP0Nxt+LENyf9PxZWH5JALONxWaTDdEA2CYU7r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412116; c=relaxed/simple;
	bh=V/famXhnFdJPvG7m+YRcRj/upoYmTRYMNHqshosi2BU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fJ895KRooSgPEzSKzDer7gG6RIy+L5j2TQgxxBO+fi62Gh5NLDz+WMx+ltH82vL39mu1haSr+hpgeMXYc0yVA/9pIVZ0yZDCmsnPlq9zeBn8fnlVRay9vBvQWdR7qRONji9+rk1+Pd0s7PHfiZNBwl3BgLYkcky+SctImJtLNz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=xpvw0O67; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=li3FHACE; arc=none smtp.client-ip=202.12.124.154
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B41967A0144;
	Tue,  7 Jul 2026 04:15:13 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jul 2026 04:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783412113;
	 x=1783498513; bh=ksJfUuprun+MhATLDi0LER8gCeLSodgatS7pFZp+C0k=; b=
	xpvw0O67yy5FBKU6rOXtWOrtWspRY7P6BVM/obWyN3sERt8ykH4V9veFkIVlYAVk
	jyGIg2Z+FwpRv4MPZ/khFehaMiusfCX/sspcqbfqbyzrE3FLoNW8HIyhFfdVY38K
	1/roiqwuVUPC7Z1gWOf0cOKayXhHG3p1SrRg7HQIj6fBucbqxvKoyedU5GMoWlPd
	55aBTtQbVryQIAE4Esgzu39XNacL/L6oiNJ3PLLpYeWyesBBQLhLJBxtJZDXVK4h
	ez1QYwJrbThAkL0AfaJBg/Ho0CbPvYyRFQDkUw3VobjngZVdPIEvHFZm6Rl6PSj/
	nXjPLDNGfve1gOVvZwmPOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783412113; x=
	1783498513; bh=ksJfUuprun+MhATLDi0LER8gCeLSodgatS7pFZp+C0k=; b=l
	i3FHACEhOUORRioWZk0bAsZIUwd61EqaAwtJjl1nwJDlF9iqp5flel5T2flTDLkT
	COa/wRbQSoNZze6DzitWefsIKUs+A640L5l/PNzeCB6gUxS/j1q/K9YN1wf6HyGd
	aaAFCbo2aKWsfWHA2VTI62x7J5XzMo0z7UsfkALhy3k5lCW8itl6CKIBLycDnx5+
	NWyhQ9FAjMo8huYc8+j0GzGO4Tws54MsBuwid1EqADHUR5eDEinTtTjfgmC8e/dm
	ZvHCOibHm9hquHLsoqtMy1k8IBVT6kxKatFBpNyQnF4HSseghq+Fu1aELu6+DqVE
	lEGe3YpnzMB9fXk4D5HZg==
X-ME-Sender: <xms:kLVMat593qrpDI2j9Id5XiMvpmEv_vp_HFU52-1H1dRTI0m20fruew>
    <xme:kLVMalvfBw4caDNKyoWxSmuo1VJJXV84rP-my4YdDpWoucr9sVJySpl7Lqw20LM_Z
    7Au8B2IbThteDnXXzXW0KgAq2os6rO4EE9hXlhDIIuoElwho4ZdIA>
X-ME-Proxy-Cause: dmFkZTGmDHHJeVxwC3PNVwH9WBFHWFauttB5daISxm+xlRx9GY+UQqKoNlbj9PfeQY+pGf
    HP++0AgB3cUYgY75wzCwa2iZ6HNfDwO5g/XzBWjVGfOYqkiI5k9n2imT1G7LN2XJyFWLwn
    voKiqNjUigloECOJAk/DYPtO2WxxGtuT8awPZCThuizoUwsp65wngOCKUdE0yXeNXRXQax
    htuNPfLOQcPMLZ5Ib7Kp8h3RbTIPN8ng3Iz3BD04Yf4tjyzOSPXIDWgvi5k67dsWJkcbXr
    KorK7n13sCthqzXSzVsBb0Ljjt7jaDJApmib+6v3kvStB8zBScrKyZL6RwBj4QlNr7ltG1
    eDLhTKHl5xUUehs5lVlsNezLtupqtzL5Bgc/1ActDuIIbAhezWiO9cueth/u3jj6+uZUdP
    Ja/GqS4GFOHFpsJZQF9BovNxDccSBxBCaTzcXs5qehbAYB4aD6qQuLilrDgpX2PhSjf61N
    VRymSULBAxBbPMeBC4l9fOVv5kaRLfZ+ROLktLwpBYOVZ+LhRl5BKYp9R5ZgM9PU6cj/Bl
    99yOczeWYSXyKvWxmW75IYsJRL/JKmA34ryZUjoiPXD5GbTWH7HPtpTRxHIuqM+pfVGLY0
    7gQBH24P8t9ctcvzM7LH3VIkDF0kRWGLmtkL055FFL11UygUjaDkxSEpw1WA
X-ME-Proxy: <xmx:kbVMahIROndA0W6gg4nPmlihoo8ISGUnMR2bd0M6zq4qQcsKbcAaxw>
    <xmx:kbVMatkmSVmQOoCmFqH1T7AaAYuOVfA3W6P8bpEQ8zeds4_jrpG8uw>
    <xmx:kbVMaqZ8H4SldcilE0xndpdvLO4FKPMp_gTpOPutNGb08i6CdoYJxw>
    <xmx:kbVMap8dOeD0pDh6YMIEwZQSmUfRg6tpnQLQzU3P001qIIU7XcKS-w>
    <xmx:kbVMarrASjHC69LJ0Y7c6fEUk-luVa3zeNjtLZKamQPDR28w3oqz-uQP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E57831820082; Tue,  7 Jul 2026 04:15:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A29kydqouFdV
Date: Tue, 07 Jul 2026 10:14:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Linus Walleij" <linusw@kernel.org>,
 soc@lists.linux.dev
Message-Id: <1cb45fa8-df33-4e6b-be0a-63abdaf9d0a8@app.fastmail.com>
In-Reply-To: 
 <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
 <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux@armlinux.org.uk,m:linusw@kernel.org,m:soc@lists.linux.dev,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39571-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:from_mime,arndb.de:email,arndb.de:dkim,app.fastmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA29A718FA4

On Tue, Jul 7, 2026, at 10:08, Bartosz Golaszewski wrote:
> On Tue, 7 Jul 2026 05:13:59 +0200, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
>> This patch series converts StrongARM SA-1100 evaluation and handheld
>> boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
>> (struct gpio_keys_platform_data) to static software nodes and device
>> properties.
>>
>> The first patch registers a shared software node for the SA-1100 SoC
>> GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
>> node directly to the GPIO chip prior to registration. The subsequent
>> patches convert the board setup files to define static software nodes
>> referencing the SoC GPIO controller directly, allowing pin bindings to
>> be resolved via the attached firmware node without relying on name
>> matching.
>>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> Will this board not die?

I have proposed removing almost all remaining non-DT board files
including this one after the next LTS kernel, i.e. in the
7.4 merge window, see

https://lore.kernel.org/all/20260701212353.2196041-15-arnd@kernel.org/

       Arnd

