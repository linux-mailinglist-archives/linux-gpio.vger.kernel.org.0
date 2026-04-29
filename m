Return-Path: <linux-gpio+bounces-35814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPGYEQBt8mkMrAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 22:41:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CAD49A387
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 22:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E37C630733AA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 20:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209EB3A0B24;
	Wed, 29 Apr 2026 20:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="sfNIO0Aa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kCyvdObN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB13A169D;
	Wed, 29 Apr 2026 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777495242; cv=none; b=Ff3vJL/Qjnkr6OML2b7L+IxhJSFVOP474ZsTVBtnzxg4nhFZU2lxgUZS7D8KK9e5mtcXvYnD7nJf6zs1WDPBDNltkNfHEMPUwm6n9n3hbA6THQhJvDe6dQlVaJA1/xqNbc06XRO4PqviqIYXc6CEQXJmAIScOgk6bqPdNaAkFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777495242; c=relaxed/simple;
	bh=JoO+kiDS9lCjnM0D5q8AivSUp6pOCLZnSPutCMTU1MA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ReKrKnFvzc0PO1tFE4MPTWUrZaYpx7tm4aI/z6OMtGiTVKs8IT9yTdfbgEKlpeihQsNfJacM6LpgwDdjXVhw10LU0MQkiTzmV6SiPaDGes6TZ14gelr5TmbZy3zsPjEKLm18z6UBa5qAbrXfEwLfdDYiVAfc755GqLppWlR/lrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=sfNIO0Aa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kCyvdObN; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3C4A87A0160;
	Wed, 29 Apr 2026 16:40:39 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 29 Apr 2026 16:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777495239;
	 x=1777581639; bh=BvdNns6hGXgygmKMa5u+Pktc6zncY5vwm48+QMEazsc=; b=
	sfNIO0AaVZtzx4WCNMQtM3v6aoE5wJbFA7EFpf4blp/fV7hi0hu7XKpU3y2hlrSm
	hIt+07grzmvmZzrs0moU5n1ZQKyEO3qq+SSQXZjKxNVOxTxqxbKQFiFRfmd2on4G
	ERaulsQDPllUsE7QFoskh8rXHCNUP7BIP3388GI1jm9tlxhjKRixeYo1CAh91gn1
	CaoAIMSvxkSWxHjnlP/ti/mOdLf65fCYs0jrShrOpq3+b/PEhpYaq5HvUfwUiJYg
	0+Qw44dZ1Zg264fhGkSUUwVm6sR5acEkEClfaJuCGbBchrXc3Pr4VLVlGcvs8FEE
	q8CkZTSb2iRV6cItqGG7Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777495239; x=
	1777581639; bh=BvdNns6hGXgygmKMa5u+Pktc6zncY5vwm48+QMEazsc=; b=k
	CyvdObNfgLCrBzQxA+Ys06QQo2I+pfyAggTmAUJ+mmE/c15slO/iRbynfFK9WxyR
	oXBNayqVt9HCJcFifZpy6C0Y38v/0dG6c6d/E1+/GwbWCwlopqGTsC28627iCYC6
	cxSnGsJQeZVoDDa1HI5frh3ck1VZnnHt28Ca5O8xVIRxZDcdrLJ9SQTA6xzyiISE
	lSBnD6W/fEei+vYfAYr19mHMViZT8vOmffpWh5OzwvBnDjvWXo4zJiGCfqnsIuar
	mW/drFGNruI2gwuebaicw2VyqdfxrZlYg5eNg901RIFzn/RiqTTmfpPOEPb/5KLF
	pQLB/ns9+c/1zoiqSBYuA==
X-ME-Sender: <xms:xWzyafzKNpf5qftu3yhEOWbAs8O432rALVtrMFqO44O-V0yXJr7SSw>
    <xme:xWzyaSGpkSDvek2Ele8PLPdmxnRZPTpRlxqAo7j6MGFbg3Se-eLs87yT3Gx9mIcJd
    BgWJtlPzwCHGC2r36hjxsUpLBzU_wcf_QbzaNrb4-g0JUnaVO9-3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekheegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeetkeetuedugeehjeejhfelheehhedukeeugfegteekveeugefhveegudetveetgfen
    ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpse
    grlhhivghnkedruggvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrh
    hglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehtghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgi
    ekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuohiilheslhgrphhtohhprdho
    rhhgpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnthgvlhdrtg
    homh
X-ME-Proxy: <xmx:xWzyabBst60YLuXbsIyCWtdKcE6H4VtJrLxPfhI3VVnffIIuHDvwUw>
    <xmx:xWzyaaV0uRMTXLmNoK-uIyebDnc_K1ZW6s457FTQEPBhhYqroaBtXA>
    <xmx:xWzyaX6ZsEDwqknpwdw3z9hql1ZgeS4WOIRZgv2SCJbIkMdYN-y_Ag>
    <xmx:xWzyaTCTb5R8ppq6LDWoObd_1ATIhsvfrBkttoAWzU3aPJku23DE-Q>
    <xmx:x2zyaWW6FG63KWp3MeXFNNR8MdzZBq8vfbPVbD71yH6CI7zx_UDyX_KI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 10F72700069; Wed, 29 Apr 2026 16:40:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATt-TkTEJJAR
Date: Wed, 29 Apr 2026 22:39:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andres Salomon" <dilinger@queued.net>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "Peter Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "James Cameron" <quozl@us.netrek.org>, "James Cameron" <quozl@laptop.org>,
 linux-geode@lists.infradead.org, "Lubomir Rintel" <lkundrak@v3.sk>
Message-Id: <cc7fe7a5-9a60-4ab2-800b-4708abf42032@app.fastmail.com>
In-Reply-To: <86f3a260-5d1f-4e86-afac-23a0e47736ff@queued.net>
References: <20260427144338.3436940-1-arnd@kernel.org>
 <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
 <63e9542f-c170-4361-9b2e-7fde8fc16da4@app.fastmail.com>
 <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>
 <86f3a260-5d1f-4e86-afac-23a0e47736ff@queued.net>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 82CAD49A387
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35814-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]

On Wed, Apr 29, 2026, at 00:39, Andres Salomon wrote:
> On 4/28/26 18:34, Linus Walleij wrote:
>> On Tue, Apr 28, 2026 at 3:57=E2=80=AFPM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>>=20
>>> On the other hand, even the XO-1 was widely shipped to both users
>>> and developers, super durable, and influential. There are a handful
>>> of other upstream board files for the SCx200/Geode family, but this
>>> is probably the most common one by far.
>>>
>>> I see that the display controller driver (olpc_dcon) was removed
>>> two years ago after being broken for years. It was first
>>> removed in 2016 but restored immediately as there were still
>>> users at the time.
>>=20
>> I looked at the removed driver
>> commit 214c2754fb0af78fde9faa2e5f9693c4618f3d5b
>> "staging: olpc_dcon: Remove driver marked as broken since 2022"
>>=20
>> This is a simple driver and would *not* be hard to rewrite
>> using the DRM helpers that exist today, by just looking at other
>> simple DRM drivers such as drivers/gpu/drm/tve200/*.
>>=20
>> So if there is interest full upstream support should not be
>> hard to attain. But it requires some dedication, and I wonder
>> if such exist.

It looks like Lubomir actually did that work already and
submitted a proper driver a few years ago, at least for the
XO-1.75:
https://lists.freedesktop.org/archives/dri-devel/2018-December/201019.ht=
ml

This was never merged, but it's there in case someone wants
to continue where he left off. As far as I can tell, the staging
driver was used with the XO-1 and XO-1.5, while this one was
for XO-1.75, but the actual chip is the same and the driver is
almost portable.

> I can't speak for other (former) OLPC folks, but I donated my remainin=
g=20
> OLPC hardware about seven years ago; so I no longer have any interest =
or=20
> ability to support the hardware.

I see you are still listed as paid support for AMD Geode in the
MAINTAINERS file. Is that still the case, or did that end along
with your involvement in XO-1?

Are you aware of any Geode users that still update their kernels?
I found that OpenWRT still publishes Geode builds (with XO-1
disabled, but everything else built in) but no indication that
anyone has actually run these after around 2017.

      Arnd

