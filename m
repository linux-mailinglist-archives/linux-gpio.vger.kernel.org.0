Return-Path: <linux-gpio+bounces-37509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lGQbM35sFWoYVAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:48:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A05D3AED
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA7A23042E75
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E613D811A;
	Tue, 26 May 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqy8BI/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707333D813B
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788523; cv=none; b=WyOUtMNyMEfCmmRhzEbTXLxdHD4NK/I6asxrJoybP2GboHGGl1UaIBygMv3EDef2bu0g8TPnC4RpStH4I2y/SQ9iQWoKIqxAj1lJTFAzDst3okxVjYXODNDwwcJ7lCnlwE0sFLISZ2Jj90sJbP56G/Lh4mueXRaGkN/bw1pCKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788523; c=relaxed/simple;
	bh=lVWG8wpF88rzua31SZfbyLCR0D86gKUBFRS5mdzn6Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5wUr5TkPRg6eV862lJ+kDtm28TSsLPJod3QRQy2YKnbvhW+xahzixJqp/JEjTvtShnhpRm4D0uKKIN7G/dTDXQ/iawjWVQ6l9Ly5L7zxajBtQIsR3z5eMyTo1Km8OS9tZJCEvwTxa5jGCQPFXDsuj0nLOY4ZuxucMY1MAPGK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqy8BI/B; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079C41F00A3C
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788522;
	bh=BDbhs6Nfya6qOCkBAjSW0m3ctJeeRrl6BOwxR3bhJk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fqy8BI/BQ5q0hCT9FQ/GWGBkzS3Ru2+elqjWbvGsy/hmceANfPBtb2EwKvH+Zhgr5
	 gSEpShJzkBq8fw7eozUzJbaD7xi8nARLjvt86fG99ra76OKqD33cO8vqZGKxO3QrlS
	 Yc5suOf8U9yKrtC4ufaeE2tBWGbK5F4gz/ZSBpj9fcib1D01PjgVwGU7KHHr9Qd//l
	 +UVShZglZuNlMY/WQuvvuT5tZE2WRAd5K73rtiE+gLG+qWMsVq1ni/MwGoLPo2dSJh
	 w+dlKHJIQzwEw+K8o7KGVJa1fGoc1ZG/B4gY/jOofowXE/vukxEKhYmtumcVl2nBqP
	 9A/f32SqLLvaw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-393925cb1baso105586151fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8zX96iOnn4Czmzbtfhm+kp+pNvxC5c/wCF2DaAe5CvxNE+RUj0IT7RQo3vP3WwAKpNiBUtj0Km5uVz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx+vVEoVfk5Mua3rA0Vbxs+a0uHNc04hcEwQH0tv0DLrkgMB9m
	YpvOYpFjQBK1qd2SEpNCiAa06O6Aj0l6XLXT2D12Fwj6m7r6oYKjdRaVQSNpSDEkgzILWj25/HP
	/LCgKcQY5rJkoSLVi3+hcLa0WSQ+KfflOV+crg55cRQ==
X-Received: by 2002:a2e:bc01:0:b0:394:3e27:53d4 with SMTP id
 38308e7fff4ca-395d8bf3fc7mr61652911fa.7.1779788520626; Tue, 26 May 2026
 02:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523174440.9629-1-hardikprakash.official@gmail.com>
In-Reply-To: <20260523174440.9629-1-hardikprakash.official@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 11:41:48 +0200
X-Gmail-Original-Message-ID: <CAMRc=McOJ6FoLWYfFGeFgh20CNpFASj0gMtfn0+v25BqNUn5dQ@mail.gmail.com>
X-Gm-Features: AVHnY4JmpXz7wK0Lzy6vcqPE6O7WehNS7CYNGba0EvE6KOdl0cxDCVDtiIbeGMI
Message-ID: <CAMRc=McOJ6FoLWYfFGeFgh20CNpFASj0gMtfn0+v25BqNUn5dQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37509-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D98A05D3AED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 7:45=E2=80=AFPM Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
> tree. This replaces patch 2 with a generic solution suggested by
> Mario Limonciello.
>
> The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
> completes. Dynamic debug tracing confirmed the race:
>
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
>
> Previous attempts to fix this via initcall promotion (subsys_initcall,
> fs_initcall, arch_initcall) all failed because the race is not about
> when the driver registers but about when probe completes. The GPIO chip
> becomes visible to the system via gpiochip_add_data() before
> amd_gpio_probe() finishes, and i2c-designware probes AMDI0010:02 in
> that window.
>
> This patch adds a generic check that walks ACPI child devices, finds
> any GpioInt resources, and defers probe if the referenced GPIO
> controllers are not yet fully bound. No DMI matching required.
>

What happened to the idea of doing this in subsystem-level GPIO ACPI code?

Bart

