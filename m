Return-Path: <linux-gpio+bounces-35736-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDMlHCQ28WmFegEAu9opvQ
	(envelope-from <linux-gpio+bounces-35736-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 00:35:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970A48CA56
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 00:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 172323011742
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 22:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FC7326938;
	Tue, 28 Apr 2026 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4qK3P5h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3682C74C14
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777415707; cv=none; b=jT1GUEnRqfHeT5Qxg7uNTJInsBmWiw3pqUT2bHjwUxC3c09b/6lut/cXa4y868GjgpFm5PgrYp5wDvw0Dx4Uo2LMQ/Rwv+TY31zl9NikI8QSRET7wxJAtiRMto+7Ttre7woTNBnGHZw3R4i6Ml3g3VXKWigvy9CoJfOH1jARZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777415707; c=relaxed/simple;
	bh=m60VIMf9sVomym6NRIenvxjyeThXVNSwbW2YEhZFRiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTQleO2zoOfya6mmlGUzkuUPcsstSHs2+5vTwkXYMNKJWdDmidiwHZuH/rrp71LearjNZKP//HRr9N1NFLk9OnHRt4RoYyBdB0g+/YrwGhGLclBGfTBEaoasAuJHm6dQaJWktHZOIfSOWXjCvmBYd2cdMBfVl9U5WagNrAx51RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4qK3P5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB34C2BCF4
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 22:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777415706;
	bh=m60VIMf9sVomym6NRIenvxjyeThXVNSwbW2YEhZFRiM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T4qK3P5hL9gzdGR4JstVcbq4OgsZiNlAH/Yu3LlMzd1CZHfReq1JhOqBdH7sHI/kh
	 bujnw0t184HE0rYexjRl0DUz3Ch6eVN2GbR2a0KIOBcLjCp4mdw7MQWRz4gvWycxu2
	 MMB6kVSTFIcKK+Po8SpweJ+CWf/9mtQOamETXFw+kPlW4IwYh1GLjdIUjkuxmYReX2
	 CdXoUQ5qIm5jWr6io/KML21d2+vNvr/UU/7QwsYI1Bh5CD0dnMJNPfNSZVT7Li/1jc
	 EjLyw5HNF1Tb5vAzf/EwjbcBQhAw8+SzjVRnrj1pt3j3AZAye5XK0yLsLrEPfq/s9u
	 pQf6Pq9okZtdg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso282998e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 15:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+B3DRBoAQx/gdkiAH7WrIbd4C/5MCFQq7EcIRYPKUGmXw4m+6hL5TcQTV6Xhl7QiW1lbiueGahQhUd@vger.kernel.org
X-Gm-Message-State: AOJu0YwG/3wu5TjaQow9IfrogSCzEYcNORZ5c6yJk34v2r7SVTw0He2m
	ui1qUd4qB23L5Waioc2jRFxJ231ZPuhasOYkjvM+Jr+V0yee6vrc19wddm4fcgCSPWUQtWMGnVl
	77kQV/6GbUFJGCyj2lIFbWHtfZ712tWE=
X-Received: by 2002:a05:6512:2385:b0:5a2:b259:5569 with SMTP id
 2adb3069b0e04-5a74a352322mr190491e87.15.1777415705564; Tue, 28 Apr 2026
 15:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427144338.3436940-1-arnd@kernel.org> <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
 <63e9542f-c170-4361-9b2e-7fde8fc16da4@app.fastmail.com>
In-Reply-To: <63e9542f-c170-4361-9b2e-7fde8fc16da4@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Apr 2026 00:34:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>
X-Gm-Features: AVHnY4JLeEXASXyecr4rbCctxEgfRvTK1yiPkgCNIDBPLTOBDacQ3txCo9OKmEw
Message-ID: <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, James Cameron <quozl@us.netrek.org>, 
	James Cameron <quozl@laptop.org>, linux-geode@lists.infradead.org, 
	Andres Salomon <dilinger@queued.net>, Lubomir Rintel <lkundrak@v3.sk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4970A48CA56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35736-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 3:57=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> On the other hand, even the XO-1 was widely shipped to both users
> and developers, super durable, and influential. There are a handful
> of other upstream board files for the SCx200/Geode family, but this
> is probably the most common one by far.
>
> I see that the display controller driver (olpc_dcon) was removed
> two years ago after being broken for years. It was first
> removed in 2016 but restored immediately as there were still
> users at the time.

I looked at the removed driver
commit 214c2754fb0af78fde9faa2e5f9693c4618f3d5b
"staging: olpc_dcon: Remove driver marked as broken since 2022"

This is a simple driver and would *not* be hard to rewrite
using the DRM helpers that exist today, by just looking at other
simple DRM drivers such as drivers/gpu/drm/tve200/*.

So if there is interest full upstream support should not be
hard to attain. But it requires some dedication, and I wonder
if such exist.

Yours,
Linus Walleij

