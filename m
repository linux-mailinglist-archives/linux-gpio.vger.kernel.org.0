Return-Path: <linux-gpio+bounces-35782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHg5OgjG8WkbkQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:49:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83A491584
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DDDB302C178
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56441194AE6;
	Wed, 29 Apr 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kaj/8o+2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5D3B47CD
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452548; cv=none; b=qZwE7OTzqK7uplo1ge7f83f0Tt/derN/+hBlRrUSjCaC78RwHTqm0W+nmkR3dS4c4bqP30Lu4glj10+xD1Z3YArjMg1HFqFUoVSoc2PV1YGb+TrRbyqhilysfK5vca5pxuqCOjE5M6JaXfxNTI5mlB1wbYUco2izgU3eziJciIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452548; c=relaxed/simple;
	bh=jvcSwXq2vhwFctE+5eqsyXmsdw/EOJobTuUWj7ocm1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1X7AwptbQZ0Qbz2JtjMadwHmkky/tv87Rioq6TY+McqSlE6q78mXib5goOq6wPLQaMy8L1XHqOrz+oqoKcpmhhvsEQCFKSPINMPDIR41sk0SD496vRBMuxS9XjV2NdVwY2KqAqYIbcSJZWr4uiJDs/mPY+sIzhB8eP1duIPai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kaj/8o+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48ED0C2BCB3
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777452548;
	bh=jvcSwXq2vhwFctE+5eqsyXmsdw/EOJobTuUWj7ocm1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kaj/8o+277I9YGZDii1WQVv9X2dOLGKWK1T5LeJOQRPbeYnwj23U3gCLRy3cWnXnA
	 m9UQ4x2vWZQExRyFjiws/VGu1J7Q1snEMSNtdXg2TU7D3O5CBbbinHnVJw4F0sw5Oj
	 yRfF86IE4JVBO/nvhWsRRUJreNtq0whl7HMoWfb2Jl0YdQury8g3ozcWn4zkkOs6w+
	 gFw46A3ctcCuIrrAMWuLgRlqRBbQq7d8U2EjKCA3RUTAqkqMOwx70dqLOR+kVQoXYG
	 1GqlXAGASG5Ez7/70g4jJtPCXQWEBVHUpwNfjXMLJsNEYwY+q5C7x5MfLylVDzjW6u
	 q5NJcC0MD4X5A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a10d130b37so665640e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 01:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9y4u4qV0TBum3AT/LLTrHiKKQoanIWuZZS8PHlDTE1+aptDjjYmio8gpDnBdPfIw+M0r14IEaBSXdo@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTwnl2THeQSymojGiAjcDOzul+MjStmf9wUaFdOaAi8u01dTQ
	JJymsAI/qVkGJXXyn8+Kr5ptq362YFT3yGvgkf+j/mxnXAAHugQOba/Uyw2bF+rMyRSy5q/FVrZ
	SxQtc01gwekpKLjCqJwbGyR4i/VjdSGbE8f+JEcjLBw==
X-Received: by 2002:a05:6512:2385:b0:5a2:b259:5569 with SMTP id
 2adb3069b0e04-5a74a352322mr725809e87.15.1777452544811; Wed, 29 Apr 2026
 01:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428154522.2861492-1-arnd@kernel.org> <afDX7WabVPVce4kc@ashevche-desk.local>
 <16e058af-dfa9-43b1-be6e-47150d6c7cb0@app.fastmail.com>
In-Reply-To: <16e058af-dfa9-43b1-be6e-47150d6c7cb0@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 29 Apr 2026 10:48:52 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md6koMNyW6hqRZmNshwx8nqz1M+W8vHPC9evMzkCMdReg@mail.gmail.com>
X-Gm-Features: AVHnY4KTzMwsOKfDbL28IoJzkYMkw57uohqFCHTnjbnU47St7nLbwJf2a0MH-XM
Message-ID: <CAMRc=Md6koMNyW6hqRZmNshwx8nqz1M+W8vHPC9evMzkCMdReg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: move legacy interface into linux/gpio/legacy.h
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4C83A491584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35782-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,arndb.de:email]

On Tue, Apr 28, 2026 at 6:17=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Apr 28, 2026, at 17:53, Andy Shevchenko wrote:
> > On Tue, Apr 28, 2026 at 05:45:07PM +0200, Arnd Bergmann wrote:
> >
> >> Split the old contents from gpio.h for clarity. Ideally any driver
> >> that still includes linux/gpio.h can now be ported over to use
> >> either linux/gpio/legacy.h or linux/gpio/consumer.h, with the
> >> original file getting removed once that is complete.
> >>
> >> No functional changes intended for now.
> >
> > But I'm not sure why. The idea to kill gpio.h completely, no need to ke=
ep it
> > longer than legacy stuff exists. I don't take 'clarity' as a good justi=
fication
> > here, since the old header are still there (however just a shallow wrap=
per).
>
> I currently count 59 files that use the legacy header,
> and I have a patch to change those over to include it
> directly. I could post it now, but the exact list seems to
> be changing by the day at the moment. It may be better
> to split it up by subsystem once the first patch is merged,
> or it could go through the gpio tree.
>
> There are another 94 uses of linux/gpio.h that should
> be linux/gpio/consumer.h instead. That patch is of course
> trivial as well, but I have not prepared it yet.
>
> I don't think the legacy stuff is going away any time soon,
> so removing it from linux/gpio.h with the follow-up patch
> should help avoid new instances getting merged unnoticed.
>

True and if anything - it at least spells out loud that this is a
"legacy" header, which gpio.h does not.

Bart

