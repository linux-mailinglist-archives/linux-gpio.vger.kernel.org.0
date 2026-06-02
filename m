Return-Path: <linux-gpio+bounces-37828-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9A5wALQBH2pxcwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37828-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:15:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB16301F8
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:15:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WSH0p9+1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37828-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37828-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A0313028CB6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 16:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137943F39E8;
	Tue,  2 Jun 2026 16:14:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843D3DD87A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 16:14:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416854; cv=none; b=Um1NcM1zPHjGXbLQZQschW3YtH8Wr/FsHWyMGnlfZkNpYwo7ampn0ecEo8NHxKqx2mU1toWk+wOwq4apjyD+C+uCHt5YqWNE1bq/chw+CBo1MoP3zEh7b2/tS9n2tiBmF6dnjAcP8w2OgUd53RsPSs+yu4OJcObl5MT+rEWsc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416854; c=relaxed/simple;
	bh=l8IL37U19GHPUjdfp2/n04axwTT+mVbJ6gNO5Ubpo68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2mP0VrRpe28aqXL0m3xlaknwtUsG2hV4P6/snurJ43h0dDw/65fZ3YtXs8VsrCyL0NtMZMMEQxTYXcR2rVzr6pr/q6nlU2gATX3MyFA+IjzErRMOoGaRfziwbVDcRtowPYQdDD+eTxexfC9m/ZScHqB66Z/V7pu29uXfUB/Dls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSH0p9+1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7997A1F0089C
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780416853;
	bh=4fIK4k6Mj0eTLzCqpWoqo5LQGkDieeZtQuFsCVAowO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WSH0p9+1ncSf+WyMwiAHZhe/H9QxC+BThEM1dwvLTBlT60AMHNeEW54rWn5FebNkC
	 K4/QlsWAWZ9EJb6b6DS3CF3cgJjARyRTY1mhQoRZGMokex1oHkTWPzVyp8EW8TcdRl
	 3vpLNAwU2MzDsiX4mojdYdk4X7l4hi3AaMRXY3yfo9U0fRRP5k1b1GVlyH+DUlB92i
	 sYktxY6piOWQz+DiXLEgPnDypv9o7r0SWd1CbnE4eVRRWlovwbu7oCLzoeVq7YZZFn
	 93jQ10mZgJqiM8m9IFOP5n9ESt0i+/Cq+kakcTssDMeAVotTbyuJzo+SvunJrkm2tW
	 nkDFH2gcukiWQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-396775c2720so23188841fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 09:14:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Kkl046sWZmuhaZX8jh8vzPLv4OCVGZlJiWVOS7Xl/tZptjaVnKoEIpW6rUv10h8TBz6UtTbOvEpIe@vger.kernel.org
X-Gm-Message-State: AOJu0YyZYVpyL0f5fQY0Mg45jLUUMDlWHtv3np6L/ocZU++5gFmsVpyl
	xoYxvosDiVskkfC6dU7ycBrnfBTS7XEffYqCc6yA/BbdBvW3ggQWsXPYuQoD7xWRjHQviwOWzW7
	3Of2R8gjsFGI7/BTGbnh6FQw4BMvRPYPuqgMLL2YRQQ==
X-Received: by 2002:a2e:87cd:0:b0:396:95eb:160e with SMTP id
 38308e7fff4ca-396ac2ed868mr1002921fa.23.1780416852201; Tue, 02 Jun 2026
 09:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <63487206f6e5a93eaf9f41784317fe99d394312f.1780399750.git.chleroy@kernel.org>
In-Reply-To: <63487206f6e5a93eaf9f41784317fe99d394312f.1780399750.git.chleroy@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 2 Jun 2026 18:13:59 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdngQbJVQTZXvPKzFjcLOPs4=-6Jtf4Ua4AU0D+sUb9bw@mail.gmail.com>
X-Gm-Features: AVHnY4LR9SF3U1YGkztmE9LKi-5QKfoXUZaWczbeWC6npPFsf00S7IfactorVdY
Message-ID: <CAMRc=MdngQbJVQTZXvPKzFjcLOPs4=-6Jtf4Ua4AU0D+sUb9bw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Remove big fat warning in gpiochip_get_direction()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: PRAT Maximilien <maximilien.prat@cs-soprasteria.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[cs-soprasteria.com,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37828-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:maximilien.prat@cs-soprasteria.com,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ECB16301F8

On Tue, Jun 2, 2026 at 1:31=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Since kernel v6.15 the following big fat warning is encountered when
> reading /sys/kernel/debug/gpio, leading to kernel latency while
> emiting the warning, and panicing on systems configured to panic on
> warnings.
>
>   ------------[ cut here ]------------
>   WARNING: drivers/gpio/gpiolib.c:423 at gpiochip_get_direction+0x3c/0x48=
, CPU#0: cat/12531
>   CPU: 0 UID: 0 PID: 12531 Comm: cat Tainted: G        W           7.0.10=
-gitc72c39~-01802-g28c351659258 #27 PREEMPT
>   Tainted: [W]=3DWARN
>   Hardware name: MIAE 8xx 0x500000 CMPC885
>   NIP:  c043c2f8 LR: c043d740 CTR: 00000000
>   REGS: ca89bc20 TRAP: 0700   Tainted: G        W            (7.0.10-gitc=
72c39~-01802-g28c351659258)
>   MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24004884  XER: 00000302
>
>   GPR00: c043f3f0 ca89bce0 c3278000 c20b5f20 0000000d 00000002 00000000 c=
0a76208
>   GPR08: 00000001 00000000 cccccccd c313d830 84004884 100d815e c0a76208 c=
0a761f8
>   GPR16: c0a761f4 c0a76278 1048834c 10488350 c21c0b04 c21c0d93 c0a5fb74 c=
313d848
>   GPR24: c20b5f20 c21c0d94 00000000 00000000 c21c0d94 00000000 c21c0c00 c=
21c0b04
>   NIP [c043c2f8] gpiochip_get_direction+0x3c/0x48
>   LR [c043d740] gpiod_get_direction+0xa0/0x170
>   Call Trace:
>   [ca89bce0] [c28157e8] 0xc28157e8 (unreliable)
>   [ca89bd10] [c043f3f0] gpiolib_seq_show+0x370/0x524
>   [ca89bd90] [c021dd1c] seq_read_iter+0x174/0x618
>   [ca89bdd0] [c021e260] seq_read+0xa0/0xd0
>   [ca89be40] [c031063c] full_proxy_read+0x80/0xc4
>   [ca89be70] [c01df3e0] vfs_read+0xb4/0x35c
>   [ca89bee0] [c01e0180] ksys_read+0x8c/0x15c
>   [ca89bf10] [c000dc94] system_call_exception+0x88/0x154
>   [ca89bf30] [c00110a8] ret_from_syscall+0x0/0x28
>   ---- interrupt: c00 at 0xfc629e8
>   NIP:  0fc629e8 LR: 0fc62a34 CTR: 00000000
>   REGS: ca89bf40 TRAP: 0c00   Tainted: G        W            (7.0.10-gitc=
72c39~-01802-g28c351659258)
>   MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28004884  XER: 00000302
>
>   GPR00: 00000003 7f8df6a0 77e37540 00000003 7f8df6e8 00001000 00000000 0=
0000000
>   GPR08: 00000000 7f8e3efc 00000000 7f8e06f0 7f8e3efc 100d815e 7fe70e10 1=
00d0000
>   GPR16: 100d0000 00000001 1048834c 10488350 22000882 77e3fe68 1000596c 7=
7e40b28
>   GPR24: 00000000 28004884 01000000 00001000 7f8df6e8 00000003 0fde36a0 0=
0000000
>   NIP [0fc629e8] 0xfc629e8
>   LR [0fc62a34] 0xfc62a34
>   ---- interrupt: c00
>   Code: 9421fff0 7c0802a6 90010014 7d2903a6 4e800421 2c030001 40810008 38=
60ffcc 80010014 38210010 7c0803a6 4e800020 <0fe00000> 3860ffa1 4e800020 812=
30020
>   ---[ end trace 0000000000000000 ]---
>
> This is due to a WARN_ON() added by commit ec2cceadfae7 ("gpiolib:
> normalize the return value of gc->get() on behalf of buggy drivers")
> when the gpiochip doesn't implement get_direction() function. But
> according to the documentation in <linux/gpio/driver.h> implementing
> get_direction() is only a recommendation, not a requirement. And
> regarless, WARN_ON() has no added value here, dumping all CPU
> registers doesn't give any useful information for that case.
>
> Lower it to a simple warn_on_once() message.
>
> Fixes: ec2cceadfae7 ("gpiolib: normalize the return value of gc->get() on=
 behalf of buggy drivers")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---

Please use scripts/get_maintainers.pl.

What driver are you using?

Bart

