Return-Path: <linux-gpio+bounces-35825-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLJwIhn88mmQwQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35825-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 08:52:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A849E425
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 08:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 855E0301FA77
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 06:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE4C377EA4;
	Thu, 30 Apr 2026 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="x8GO7dpF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cIrzY4gL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95218A92F;
	Thu, 30 Apr 2026 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531924; cv=none; b=Z35Npwvemkh6F7S7La1WpOYIZdOM3ZM9cIgcSZCbWKhKWE8Mfob3iBEiVAqaZG8/8F8mCp10w31ok/Byc51DOiRUq+c13kkZtHK0SE/tbcGmHrgS2BRsj7oKFM1bmoXI1CYwg3byab8R8JEQfG/V/LZpsucsOjuD6N+07m+yGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531924; c=relaxed/simple;
	bh=aveps26u73Lbdux+mfz9WLnUDWbrjQgvoV2u2B3BYv8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ly3BFU7FHrKUq9CJWwx/kTM4gZKyuSSiPd4vuDRB6RqltziDiVojHKP7KVE5GcNDeg/iTeIWbU/TqB9/YL7uSnvNQa4pXRWo72snZqmaTHOcNRltZ/M5xKrqeojQDI9/3n/OIR1V3VkG8A8qlULrsHXDemobB9/DNqt/Ld6q31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=x8GO7dpF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cIrzY4gL; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DBF281D0007A;
	Thu, 30 Apr 2026 02:52:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 02:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777531920;
	 x=1777618320; bh=ek6xpIfo20HsnxFyxsCjBtFY92tBng0eH8MYMh2ft+g=; b=
	x8GO7dpFnOzlEbXSs92P6nBLBoR3Pi5hHPIWGsxdCDsX6Eg8NFUWHYqUexubYRdH
	iYt5/UbMhH8tCZwC4pspaAmC2YHMUsAGH2wFb7a/OQIJQcKzgGKkG69O1rFgG6em
	Y/3VirWd7gTTo0O/qSebGUvgeDssn86+elLjXfeJAtrwT3v8/43sPUKBkTUivvV3
	v6cO/cqdi8IB8HNQk+XZN/9E5m2oi1kjEYS2EFvG7XEvvN3iQue2KDH3ICU4Z9Pe
	vMf4kww1nsnloRLRYK1w/6TYaSmQpU3jzZpkjBZHjJBLj1xkWACxa7RyDCKlm1F/
	rtiacPpiKM4XAPqqXx/w+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777531920; x=
	1777618320; bh=ek6xpIfo20HsnxFyxsCjBtFY92tBng0eH8MYMh2ft+g=; b=c
	IrzY4gL6hrZeuTde82C6N/XzutKHBzhcLf1YFO0Irv2WF9KyqsXaTI3GCaEsdKs4
	craBaUcH3rD1FTR9+NKy2l2e9CCIgfHYH7qB98KpYcdncR48yvBv861CGoBsWPp0
	vwkzC9ymwkGT3iv2kSldQpbWYfZLzrBhZXqnuPS+re5YM67iC9v7rEjaesiz6tmq
	ZFsJ6sUyDeeknYkmr1Bklz1Pdsk2/sW8avos2OvV4cXJerRXC9VIcYxuYm0DcFgn
	Z0b6xUdrCvpSRHZbyBn5gXK02oMuRHbeel/8FKaQJF68FmSlcfeE8wotG9brR9kx
	6b/y2wK6p1Xaizcn1B6Eg==
X-ME-Sender: <xms:D_zyaahAX5lAhDLutqhyRH5u2CokogeWmSs76Swf0KyMsuxryKv6jw>
    <xme:D_zyaV1LFAgRSwXqTmaOFJ-Cggdz9W5QyTi22a3s38lpR_Rx-Nf5MomcTu78uz9A3
    LDwOCHV5uiu7npK9DNZ84lHx2LRzoaXGpEdgNk3lV5lZi45iWSCwyab>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekieeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepphgvthgvrhiise
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuoh
    iilheslhgrphhtohhprdhorhhgpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:D_zyaQzVj7RKxtXPvqXfSZCMFGc4S1VziK7vjCb4Kzvnghb6W3lqYA>
    <xmx:D_zyadGLcGg3swKXvaSoYaZ5_a7DfSw9D5XMvg09x6f1b-7vQjAjlw>
    <xmx:D_zyaTr_BlYIA28XrGBnLtG6tf1LPNbTt8Wlq1Dp2xoK0vKQQZkSEg>
    <xmx:D_zyaTzM7xqisEfWD-nj8SEz8lTVgjIHi6J0rI_GI2ZhiVZ9UL2RUQ>
    <xmx:EPzyabG9-Xw2ZWTLNYQW1UIynBGuxF9kt7BO4_xyEa4gtLWwW6Gkjo2O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E6F71700065; Thu, 30 Apr 2026 02:51:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATt-TkTEJJAR
Date: Thu, 30 Apr 2026 08:51:18 +0200
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
Message-Id: <5a0aca77-8d50-49d4-a3fb-82817f73fd37@app.fastmail.com>
In-Reply-To: <fddba1c8-a95a-490f-962e-8505cb948672@queued.net>
References: <20260427144338.3436940-1-arnd@kernel.org>
 <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
 <63e9542f-c170-4361-9b2e-7fde8fc16da4@app.fastmail.com>
 <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>
 <86f3a260-5d1f-4e86-afac-23a0e47736ff@queued.net>
 <cc7fe7a5-9a60-4ab2-800b-4708abf42032@app.fastmail.com>
 <fddba1c8-a95a-490f-962e-8505cb948672@queued.net>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C64A849E425
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35825-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026, at 23:18, Andres Salomon wrote:
> On 4/29/26 16:39, Arnd Bergmann wrote:
>> On Wed, Apr 29, 2026, at 00:39, Andres Salomon wrote:
>>> On 4/28/26 18:34, Linus Walleij wrote:
>>>> On Tue, Apr 28, 2026 at 3:57=E2=80=AFPM Arnd Bergmann <arnd@arndb.d=
e> wrote:
> [...]
>>=20
>>> I can't speak for other (former) OLPC folks, but I donated my remain=
ing
>>> OLPC hardware about seven years ago; so I no longer have any interes=
t or
>>> ability to support the hardware.
>>=20
>> I see you are still listed as paid support for AMD Geode in the
>> MAINTAINERS file. Is that still the case, or did that end along
>> with your involvement in XO-1?
>>=20
>
> No, my involvement with anything Geode and OLPC ended years ago. Feel=20
> free to remove me from MAINTAINERS (unless someone has specific=20
> questions about hardware, which I'm happy to answer).

Ok, marking it 'Orphaned' is probably the right choice then,
or the x86 maintainers can decide to remove it right away.

>> Are you aware of any Geode users that still update their kernels?
>> I found that OpenWRT still publishes Geode builds (with XO-1
>> disabled, but everything else built in) but no indication that
>> anyone has actually run these after around 2017.
>
> Personally I don't know anyone, but I feel like those Geode thin clien=
ts=20
> are more likely to still be in use. A machine with 256MB of ram in 202=
6=20
> is going to be an absolutely miserable laptop to use, but that's still=20
> fine for a limited router or wifi access point. If you remove/disable=20
> the Geode stuff, you probably won't hear complaints until the next maj=
or=20
> OpenWRT release, though.

Ah right, I was only looking at the embedded boards that have custom
arch/x86/platform/ code. I guess the thin clients would
generally just work as long as the SoC and south bridge drivers
are there?

I'm also less worried about the thin clients, as they are unlikely
to be used for anything mission-critical but were rather repurposed
after the original owner replaced them with with Arm or x86-64
machines in the 2010s.

      Arnd

