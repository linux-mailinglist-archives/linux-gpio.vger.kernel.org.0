Return-Path: <linux-gpio+bounces-38473-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jk5JNtG7L2o5FQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38473-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:46:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2691C684B0F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n4d9Z9CU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38473-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38473-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BA5030071EF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E881D3D1ABA;
	Mon, 15 Jun 2026 08:46:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0AE3C13F0
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:46:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513162; cv=none; b=LHk3ua4fh9wf7jA3buQcFm7+ySrIFx18XTPeCJCF5WqUKuciZ1HydOvVRQY/VAyhOURBHVlZ9b/H8eaehJL0qg86m1RloML4FrR7jjzhipH1mDsd2XROQ1+xTgctGSLswgltNFF3h2E6rbSM9pDCS3V+6jYHajZXA+YgF/PBK7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513162; c=relaxed/simple;
	bh=2n+rqqEQk9Dgk9v85PEmZctuQJcL5Aft8l5cRPlN33w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=en357WUsCL5kQqiNBA30cgP1ZCMXoBBMTzUJuL7LHvAheBUHt9QHRpeDI/+6Vj29JkwI3bWPbG1ibxJA+cPbsyQCJ9lRipP6LfWSWQC5WovkWhwIbp/1PjEgDKXCCvL9f9OlsjYbcswgxiQYNHy99dNcyeTulgT5HPYwntB19ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4d9Z9CU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F191F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781513160;
	bh=OBe0ITxGv6gOrcKtGcU3uQ6eRRXWDLj4lG7UY0EX+8M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=n4d9Z9CUbwfC8ON3UfMZ9ZMsmHnha2OANu1VYlBLWr/Pb78deiFwVZ52DIk8A0HnV
	 YybM+99jnHM6piBa8xn8tW8BrI1ekvyxRVQwpraLcuNirlcNVviWvYluF827lCznb1
	 IlhW6qBIH1KfSwVto3YJFZcTc4hqYI8Y3pe/yw3sWpwL5L+JkeNI/6LlZ50N3ycSeM
	 iU7PMYjIq5I0Zx9hk4+74OW+hnckt1VjBi40THiiBlEcCTbsY4lIE8hJG1zgnf1BjC
	 k9SCantWf/K1TH7oXGXG6poGUkVu6tezGLFQvH3CMfP2W+azOk9vxZA/X5tjVxtiz0
	 EQzAR8ECJrfVg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so3407161e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 01:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DSH10oyFb11sJa0SlvtprzC1KeHFBYMsMAOeEjM/MvrlMLPKm1T/5nIr8oYphDo42I0OGMHcXPPgJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnE8mKmM5UrQ0umv4FknethSIjYwW4gwCYo3TYQppjQAkVpahQ
	KuNti3SGVN4eVw+0wD98E6HzTWBvx0Yf1UTzB4csTn/SxJVRbUvzBxuTKhBGkE2uFqSKy3KweyH
	AGW8XVjiKnIqvLTsLhNylinOVtNEQWJyicOCWqcIc1w==
X-Received: by 2002:ac2:4341:0:b0:5aa:6e86:55e1 with SMTP id
 2adb3069b0e04-5ad2db1f44emr2789666e87.16.1781513158741; Mon, 15 Jun 2026
 01:45:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 01:45:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 01:45:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260615-b4-serial-max310x-gpio-get-direction-v2-1-4704ba2b181a@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-b4-serial-max310x-gpio-get-direction-v2-1-4704ba2b181a@vaisala.com>
Date: Mon, 15 Jun 2026 01:45:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc2WAo0mEFazT=S0R_fYaX=B52AhE+aiuLKei36B1QV5Q@mail.gmail.com>
X-Gm-Features: AVVi8CdTwdnJuiJVu0N2jnzm1Xm_R8Lp-KFeKEhnreTnrWdRHPV4v96weeSz6II
Message-ID: <CAMRc=Mc2WAo0mEFazT=S0R_fYaX=B52AhE+aiuLKei36B1QV5Q@mail.gmail.com>
Subject: Re: [PATCH v2] serial: max310x: implement gpio_chip::get_direction()
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38473-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,mail.ru];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,vaisala.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tapio.reijonen@vaisala.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shc_work@mail.ru,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2691C684B0F

On Mon, 15 Jun 2026 08:38:40 +0200, Tapio Reijonen
<tapio.reijonen@vaisala.com> said:
> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even when the direction is tracked in
> software. The GPIO core emits a warning when the callback is missing
> and a user reads the direction of a line, e.g. via
> /sys/kernel/debug/gpio.
>
> The MAX310X keeps the GPIO direction in the GPIOCFG register (a set bit
> selects output), which the existing direction_input/output callbacks
> already program, so the current direction can be read back directly.
>
> Fixes: f65444187a66 ("serial: New serial driver MAX310X")
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
> ---
> Found and HW-tested on an i.MX6 SoloX board with a MAX14830 over SPI:
> without this, "cat /sys/kernel/debug/gpio" triggers the gpiolib.c:429
> WARNING (tainting the kernel W) on each queried MAX14830 line; with it
> applied the lines report their in/out direction and the WARNING is gone.
> ---
> Changes in v2:
> - Address Hugo Villeneuve's review: use BIT(offset % 4) and put the
>   return statement on a single line.
> - Rebase onto v7.1-rc7.
> - Link to v1: https://lore.kernel.org/r/20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com
> ---

I've already left my tag under this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

