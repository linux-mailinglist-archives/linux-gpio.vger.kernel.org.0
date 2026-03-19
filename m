Return-Path: <linux-gpio+bounces-33804-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIYBJTjBu2n1ngIAu9opvQ
	(envelope-from <linux-gpio+bounces-33804-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:26:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A32C89C7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E076C3326993
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C320F3B0ADA;
	Thu, 19 Mar 2026 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZmV6CFM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DE73ACF0C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911592; cv=none; b=tIJMR+XE4BmktyKGZLZU+vwd7XI1O3F++FrJ6nMgl/P995gnox3YtIL1xYgyal5R1fcmDEB2HTS5/AFrKm1uxb5JAHwyX/Ik72PKcgAB2MRHpj/30Hm9w/jXKRYP1M9CbkIt2A46Ms5/zcdYSuZUwQ2Q1xo5o9l9NZbRlkka9cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911592; c=relaxed/simple;
	bh=cdqx2le3MiOKH7S8tALTWHQXK76yRSqjFIoOQ1gfdY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NICAlKs4yh+ebde/2JMF46dLmCMXsrmrcSmRpUY40CbEeP9sQBkQtqhhwJ14jCqxVodreA2kfLqSXvTB5TrqG3FnCQ98ZZTGrsR6NF8V8PTrirb1eb4+FVlQ9aJO6JXNYiHsfx3W36vBqiGOQiNm4Ujx7bvXCE86mSPgtooU7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZmV6CFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27916C2BC87
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773911592;
	bh=cdqx2le3MiOKH7S8tALTWHQXK76yRSqjFIoOQ1gfdY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KZmV6CFMsaXpUsc+G0StYQPN5X9UydTUUNqiWJziO0+5TGh2QhFOmN22JO4XwTxnL
	 rBmWAgOKSy7jik6SoGMTBG7C2sXCXyqD8SUWiIqtEw/h0nnTFcGBx7SlhuMdKEjKzW
	 SGNlC8rJ9okkPcrLS9qV1AYxeyxb9dJLIoPhtrxc9OTNIn1nW83Bj39wboIfAAq1My
	 ArfN66XBC3fGxhW7tMeZLyEEn36SPRNj9jDQoKEHVDNBccagMfE7Iwwd4kTAFogyQm
	 iIMEIdrTfjNhx/AasqEk6hPvQsVrUNovvhb0KLZNLNhgBQQWhXdIxTro/xJTI796oy
	 7rMQ9r1gjef4Q==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a133b686f7so789021e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:13:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8U6c3UZapgIKpYOb4BrWiFTQ20lkfYMW5q3Ez+2qvA6y4bybdQJmiWyZOUxxiNhMm6VMgXjDrhOHb@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4Xxp53da/udVAgc2znmiqhUQisI3z1dMddfcZLBNJEf2NNiU
	19BVoeHhDGKBtUF2Dnss4kywEynykLw9nahi2V/8jYgOCEMpmcz3rFfJv6h8nNYeFBJwm63c8B+
	/3aYTTeGjGpmkw9ba1ysPVBpirr0MCkBGl+YteGPXbA==
X-Received: by 2002:a05:6512:36ca:b0:5a1:6887:beea with SMTP id
 2adb3069b0e04-5a2795884eemr1852442e87.15.1773911590809; Thu, 19 Mar 2026
 02:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com> <997e3ff4-c394-4fbe-9371-272220ab2aa0@app.fastmail.com>
In-Reply-To: <997e3ff4-c394-4fbe-9371-272220ab2aa0@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 19 Mar 2026 10:12:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=McS6eojWDMY2MvuRtHNqYD=FGCSc4hOBhWQ=hAEk9Td4g@mail.gmail.com>
X-Gm-Features: AaiRm505I1FYNAi4WYspfUEh56IsgWkjDwEDiCW642SW9oGKdkGMt_QFv3kHNEQ
Message-ID: <CAMRc=McS6eojWDMY2MvuRtHNqYD=FGCSc4hOBhWQ=hAEk9Td4g@mail.gmail.com>
Subject: Re: [PATCH] gpio: scx200: move the header under linux/gpio/
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jim Cromie <jim.cromie@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chris Boot <bootc@bootc.net>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33804-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,linuxfoundation.org,bootc.net,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,arndb.de:email]
X-Rspamd-Queue-Id: 1F5A32C89C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 3:25=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Mar 18, 2026, at 14:48, Bartosz Golaszewski wrote:
> > Headers exposing symbols specific to individual GPIO drivers should all
> > live under linux/gpio/ for consistency. scx200_gpio.h is currently a
> > top-level header directly under linux/. Move it and update all users.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> > With Acks from relevant maintainers, I can take it through the GPIO
> > tree.
>
> No objections to the change, but I'd point out that while this is a
> driver for gpio registers, it's not a gpiolib driver but rather a
> custom chardev with ioctl interface.
>

Yeah I wasn't sure if we consider linux/gpio/ as a GPIOLIB directory
or just GPIO in general. I figured it may as well be the latter.

Bart

> Since the chip was never as popular as the separate geode/cs553x
> ones, I wonder if there are any users left, maybe Jim has an idea.
>
> If there are users, they might be able to use drivers/gpio/gpio-cs5535.c
> instead, but I have not checked if the two are compatible.
>

