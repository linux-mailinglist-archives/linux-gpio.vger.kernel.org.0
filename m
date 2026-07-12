Return-Path: <linux-gpio+bounces-39937-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZ/mIbMFVGrsgwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39937-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 23:22:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E1745F24
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 23:22:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gPOP6x6e;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39937-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39937-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 908B7300C019
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 21:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EA8372055;
	Sun, 12 Jul 2026 21:22:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2748E2FFF89
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 21:22:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891376; cv=pass; b=d9grBgGVeZ2nsZDkW3eV/DF1Bt//nkoOgvKyjMy07xOLtvAeqWJMnHe30D/m7aMDRNB9fVDBSHZbbRSrOVbL0I6BzJBjSLmlDTI9bDNPcLLZcbPXlxzyQLXf3nt3ywvEtFk0Nt0I5OlDLncl8N2btINIPUB07Wno+dfQbDT8mUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891376; c=relaxed/simple;
	bh=GprJbn2FLZS/4TsFceKjZfXp39myjmRlV0ypEAEzA3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhSGopVobsPPHQ5KTFUmk5pAEqe18HEuK2acq3W7zW81U/v4c1YS7f6HSbc2mvssaO6LVj9V8qpSkrdSjPX8skTds2ZkUa3JNsyf8zUyPwayr6monjfXrPncmZy/5SvplNXoXgZgwcXjYK3+CAOHpjWLU8eJ5nxsvcLtBkxTod4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPOP6x6e; arc=pass smtp.client-ip=209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso4575798a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 14:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783891373; cv=none;
        d=google.com; s=arc-20260327;
        b=EfoLL1bgLDg2Ja56URN8wwmM35/gz6qZC6jtEC9X3GZOAAIivE8mAcRTBtbmOahjP6
         nX4ahOaaUtBHHxTxNpFh2dpfgtigCXRAO1iTlwcNC/l610NNlMNNErgvelA6mXL365Gd
         Gynljm/DqaDzTzeKj16/e4VvraXv0LcffbQJipKArAfXwVDkzb0R9+/r+J1pS8P0BURf
         2dpE8OSGU0hXwaTJHN4/sEe85s5gqt8q8A44vDAn99qg8lb7a6nqoSjJS04jIu9g5ImI
         1PerxM3ifefYjgHPAfUXbLtKwAMvx2UEK2iEWdJJCJZ4qyw5tZGmq1+/MWQ4cB6uMnP0
         OqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GprJbn2FLZS/4TsFceKjZfXp39myjmRlV0ypEAEzA3A=;
        fh=UV7Sc1ZZn1xp55Ilpp2uQ6k1gROTyvGl+Qo+0my4q4k=;
        b=L38A5HDw9OcHnkY/DqSqjw93ioeZrwGYBcOrZwnkcrVgqPcz9F0sD70sopli+i+2e6
         9iN8p+wkx6hQsBVukkeUXWIom/rBjpHtPvDGAFYWCudniwGQzR1XZnF0EkPeI4d9GxjL
         2nGcjzY7nAXvMv+u8sF20jl+LHG/v5gWnqLo7mgjXkuAbBptSWsx4MzK4Ql82KkidCrf
         P4pOWbpf4ch29RU39D7cw/oGKuK57SwwNoSQxEBC8OyDP02Xw0747G4Ad7F0p7iAPjui
         j82+1mSeDtPm7Im89r0zzhjPgWJuFyOf/Y7OSWjF4OQcZWiswa8ycm+lXWt+Pe8wAZhJ
         EdUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783891373; x=1784496173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GprJbn2FLZS/4TsFceKjZfXp39myjmRlV0ypEAEzA3A=;
        b=gPOP6x6eY/fOoJXZ7oXzB7DeEkPUm76wWNBCn/SZzqYxVjpELuImxJ5+Qf1PvKi1Jz
         SdKJLWykNVPqGiSoZK2NUXqExXDOzkCAecCeExujU2LupWivpEMccLbRDH4QwFsBhguo
         kR6lBqgbPeIdJRHdSYa26GaojM/7yaYtnF3n9Tx8Hv04l7BcQZvzsFU3d0SEA0t8OoZK
         kHllr4Yko3NtsWjRjrcTwxPOf4EH2lPOA7PtY1L2RNgI2BqwZvrEeWc1RLJOKq4hDA6l
         seRqFvQTvEto4ojWLumphz0/TJ8/fLg/7ZmQUhRzqkjRfA4OamKrYSS9lgZZRh+Zr/tQ
         wEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783891373; x=1784496173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GprJbn2FLZS/4TsFceKjZfXp39myjmRlV0ypEAEzA3A=;
        b=d11vuYGZs4fE8b4kAjvvRhtnTmYPijm8A4TqawtQilINM7SAwYIn9djQevCGiS/Bjp
         Npr0+DyxvaqXKG8Hx0FyNzabTEpDKx7S/i74o2ZP9Hp+xEw7BPSCHzvKL24fkCm7noev
         RDN4i6nnK5atfDyzURX7/giAsMjUcJaUhl3Bd4R0jDlVnHUWK6NDUk9ZXQa7k8QT4AtW
         7p2MN3ub1TG/U6xfKv5ppZpHO71GerUd8YvTFJmPZoloze+Mqxsl4U/VpMinYmz465s5
         WpX2Lo4hUG+XZoLQA+dlRkUO0QMB+xkzsAk7liIw6lcs8YmsGg8uJvkyJ+gfcHJ7VBbt
         f8aQ==
X-Gm-Message-State: AOJu0YwG8IiG9vwhUqSp2dUvQjuBD07UVXQEbIzh7++/47obNBvZ3r2T
	oDe1Q1eAOve2bFEgkU7Pr341oirtU9rArjI289D9rKhmrGm1ic+ey/PW7J55XPLgxfXL5N999Ue
	mLLEo7flp+vvVL7WyOyhzDy9XLxNfEx+BUtqK
X-Gm-Gg: AfdE7cmEJ+PSRn9X0xVORObBzmmOaIRNVDcnfGBRYlHkucyjm63QV+f+CFMLrCp2r74
	op/vSnH4nLb8MWQMDoRxKT2ZOVc4QOxa6Co+ZZuJmax8ahD9LIId9HxYdi0GzUItGcsg/Ex2Mzw
	WpGKTHQlxmxe3NiJSRJ6d+A7dJMHA3d96ywMdNXdlHCtSeZyG4Y8tur4HE4oxxkQtAup5aHO9qy
	83Y1bsLj3XBqznkScqs8CWnvWOIpMuVH2timA4dBMMhpctJ0/FAfcVqctzzcuOW1IYuOe5iXdkH
	+oBFNJ5zg69oVkrBcNYgEPeelM8zYk8cN5R6Bwduf7On5hm7ThIy+H5MiCoB2YWr0GrCGsdSavq
	vlofWi+j+RY7hnDpGiW2q6M/Ck19LC5pQodLAEK6QXH+Pv84oLCRHp76UfOTWSkPFaMkRR9zVEx
	aZ4hhuFN4=
X-Received: by 2002:a05:6402:3786:b0:698:c163:65c with SMTP id
 4fb4d7f45d1cf-69c5ef8d2c3mr2646504a12.2.1783891373341; Sun, 12 Jul 2026
 14:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706232223.774895-1-rosenp@gmail.com> <CAD++jLkom+_yGponUeSrZ38hFB2X-HY6=jER3Dp0_cuh-HntHw@mail.gmail.com>
In-Reply-To: <CAD++jLkom+_yGponUeSrZ38hFB2X-HY6=jER3Dp0_cuh-HntHw@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 12 Jul 2026 14:22:42 -0700
X-Gm-Features: AUfX_mzs9MCykx7nW-nXCDeFF0IRwwcbHORGah1pzGmETvtIE0HAr8NNIZf1Xno
Message-ID: <CAKxU2N9c659skuvYTwXTU4twTCvBKnP66a1gjuxKhBUUBoLnng@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39937-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:u.kleine-koenig@pengutronix.de,m:andy.shevchenko@gmail.com,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D16E1745F24

On Fri, Jul 10, 2026 at 12:33=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Tue, Jul 7, 2026 at 1:22=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> > During driver removal, devres cleans up in LIFO order. The IRQ domain
> > was created and its devm cleanup action registered after
> > devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> > chip was deregistered. If gpiod_to_irq() is called on a pin during
> > this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> > irq_create_mapping().
> >
> > Fix by moving the IRQ domain creation, devm cleanup action registration=
,
> > generic chip allocation, and chip type setup before
> > devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> > first (preventing new IRQ mappings), then the IRQ domain is removed,
> > and finally mvchip is freed.
> >
> > Fixes: 644ee70267a9 ("gpio: mvebu: fix irq domain leak")
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Nice work on this driver!
>
> Despite it's a pre-existing issue, if you have time (and already
> have the hardware set up and all) can you look into converting this
> driver to IRQCHIP_IMMUTABLE?
Not a simple task looks like. This thing generated

 1 file changed, 105 insertions(+), 149 deletions(-)

which means heavy testing is needed. There's also a huge chance of
regressions as the driver touches multiple pieces of hardware. I have
388 and 3720 that can be tested.
>
> Yours,
> Linus Walleij

