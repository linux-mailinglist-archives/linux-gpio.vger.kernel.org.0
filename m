Return-Path: <linux-gpio+bounces-39547-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fKf7G/1jTGqJjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39547-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 04:27:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2C2716CE4
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 04:27:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=n7szU3LS;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39547-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39547-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF4503055D60
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 02:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C6E1ABED9;
	Tue,  7 Jul 2026 02:25:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945332D8767
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 02:25:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783391110; cv=none; b=DguMCXvRNfSaSPQlR4oeII4syc5aRjLGnuYZ040Ai2K5Ozt8jtp9vD/nZvYGLZdsDm6GbapzucmzWxKXSIM6vn/4oqJ93blOYKRbqOH81biYMxY0Bkl3OppVd+6WARku2QHGeCQW3dwOISq6mgdmIelHzGAoOr5Dkn003s0htYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783391110; c=relaxed/simple;
	bh=2KmZ7Hb3On5nh1GAU6ccvCHBoNxXzKsIit/vgYPVkic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItbrGtAPTzWG7GaGrZFp2T07yM7T8bSnHaFMIp6906wAc9lnmoC9wjGYx2/6xAlLzMcWRtvGWDe9ze4gONn3a9C5TQxNODpZpKMqYyjNaV5GVuMwRgnMkI7jxBRFGwJQAXf9QZ0PXMKk83z9P/D16uQuk8Mlfe0B0wLtL+78h2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n7szU3LS; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3963151a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 19:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783391109; x=1783995909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IWwXV2NoQ084hyR/IchuMFSWerplFFVpf5f6Ij6vjU0=;
        b=n7szU3LS+bhgNJgWgskrhYxfjug4wTGvWS6pWZWrj10H12XKcFhFmU3Et+ChAhmd4Y
         W8xgQTCdf2q1RxOuNf4MMgTerSGTQSNR3SQdp7pv5p0YkyGMHPMU/onPJA6Xj2M+lKBf
         hncDXR83ASEMnJLnRB3woWx/ccnfMIbKBhAfh6kPvaZboAKcSrXiqrgWiSn0G0/8JWMm
         FmrCa1+A7ugbOWIS/bDnv44cOvOb69JAAlCEx7ePexjO62C5OSARwOjBl5tAQnhQacUi
         XMq1spAZqezMq04lxhv95kg2bfIliKGqXS2DfVKcZx+aJj481FHv03OLh2vEbq/CcFIr
         tulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783391109; x=1783995909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWwXV2NoQ084hyR/IchuMFSWerplFFVpf5f6Ij6vjU0=;
        b=b9CdETRJhhjBEwu57NwfKIqznQqazjAwysWRkElOlK2JCTmIYR/IGwr4FWpzzbIeVG
         5u9z8G2mpucQKnEbs5JqMjF5fEyR2nuT0xTvFeJVh/oPgFxqTvKrZ+WYG/gIdTjbQGah
         R4uIJRGyjXqWfE3rI5sz/PrIUq16xl3aZtL/+iPOib8OooudbL9rHkAXqoMW+FRER43t
         JF764WMgS8A7a4OKvDM1oEUPGRjDjGKorn+kAGRTMQ0Wx//PQFCrOMT4Kvrc5TqECAkn
         YVeJj7Mqu+hVb03NlnUVTOj2WdId9jdksM8TPzj0y+1oUvgcz6LivIJdG/96E3rLS0uB
         +AkQ==
X-Gm-Message-State: AOJu0YzChQvzN9HxfH1FRI9YeO60kuarqdiAGEsDGWeoq7S9/L2B1+ha
	J+BxQZSO/i7HLg5WYs6V2mRqu5RwLj5cmC5REzetAByAIeb/IO+pacwC
X-Gm-Gg: AfdE7clK3L66QmeoKTqaKoTOqbT4AjeBpdlxsNAcpFA1NtVj9zFXjvq/94japETIW99
	s8m0nBNSddAbSnsEaeZM6thUwIiDZ05HmsQa1d5b4VGrXvnYmFK7C3KJhZv7J75vcj30I2mV1u/
	BDie54jDMt+5PeBYMsz8hALyd0blu6a8ZekFKQ1n92rLUiadcuC45vqPEMhQmrdmpD+nEU+bCqe
	++af0QF23kdKcYX1mcogbln4/dLWUrirWo0sSGBhtGQpbX6bfFqbeHYJltx4KrYpiKs2eEnmnww
	zuwp8eG6Yq2NMGHl2qnZfXc0ToZqbRn7jFYv+jNKtPkW0M1u9RmH5ZXre/H+0tfruFvULMQV5Me
	qJWrmJnC5avy8xHzUdwYVU2SWzstvWkcpLJTa+Yl6fXInzDFG4rEC2IKDuYMK1DHWYzTc+DLWKf
	nM/ID8fzG13jNDx0icnGmFf8pkFefGI69pkODEdGSwvIUUFShiFICPrw==
X-Received: by 2002:a17:90b:2dcd:b0:37f:c683:e643 with SMTP id 98e67ed59e1d1-3875920ccabmr3345962a91.24.1783391108945;
        Mon, 06 Jul 2026 19:25:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm2378094eec.16.2026.07.06.19.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 19:25:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:25:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 0/6] gpiolib: fence off legacy interfaces
Message-ID: <akxjQtCTcx2TOQMk@google.com>
References: <20260629130329.1291953-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629130329.1291953-1-arnd@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39547-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF2C2716CE4

On Mon, Jun 29, 2026 at 03:03:23PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is the remainder of the series previously posted as v2
> in [1]. I've changed the version to v5 for all patches to
> not confuse b4 too much, but the patches are mostly unchanged.
> 
> The patch "Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY"
> was not part of the series last time, but the build bots reported
> this as a regression since I had dropped that since v1.
> 
> I hope that all that remains now can just get merged through the
> gpio tree. The gpio-keys patch needs a bit coordination with
> another patch addressing the same issue that is already in
> flight, so I expect that I'll rebase my series once more when
> that is in a stable branch, but the state I have here should
> just work as-is on top of v7.2-rc1.
> 
>      Arnd
> 
> [1] https://lore.kernel.org/all/20260520183815.2510387-1-arnd@kernel.org/
> 
> Arnd Bergmann (6):
>   [v5] sh: select legacy gpiolib interface
>   [v5] x86/olpc: select GPIOLIB_LEGACY
>   [v5] Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY
>   [v5] Input: gpio-keys: make legacy gpiolib optional
>   [v5] leds: gpio: make legacy gpiolib interface optional
>   [v5] gpiolib: turn off legacy interface by default
> 
>  arch/sh/Kconfig                           |  1 +
>  arch/sh/boards/Kconfig                    |  8 ++++
>  arch/sh/boards/mach-highlander/Kconfig    |  1 +
>  arch/sh/boards/mach-rsk/Kconfig           |  3 ++
>  arch/x86/Kconfig                          |  1 +
>  arch/x86/platform/olpc/olpc-xo1-sci.c     |  2 +-
>  drivers/gpio/Kconfig                      |  9 +++-
>  drivers/input/keyboard/gpio_keys.c        |  9 ++--
>  drivers/input/keyboard/gpio_keys_polled.c |  4 +-
>  drivers/input/misc/Kconfig                |  3 ++
>  drivers/input/misc/soc_button_array.c     |  2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Could this be done as an immutable branch?

Thanks.

-- 
Dmitry

