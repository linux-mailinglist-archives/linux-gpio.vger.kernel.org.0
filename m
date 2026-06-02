Return-Path: <linux-gpio+bounces-37829-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S1KZBAADH2oddAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37829-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:21:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBFF630283
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:21:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Dwtw1pne;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37829-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37829-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89C0E3056DCF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 16:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C04336886;
	Tue,  2 Jun 2026 16:19:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAD03033DE
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 16:19:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417144; cv=none; b=iaHSGFV+I7B5wzJKwqIAGaOb425WbTotdJdDKH1eYchu2P/4LTsXER1MRsAI5c2aLGqwb6nQ7J6rcEyfWymaQlkGWdSv7HqCIn4cV0X6XgUSt5EmevpZuD34hRaTI0UWtztT6XliZSrdRejV/yIQEMrxGK+wglsNzwui/WNWtFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417144; c=relaxed/simple;
	bh=BPbTvHpkT/+atMHfAn83Ogy4KZjiKb1VCoyZTifM4YA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqRU/jvfXGNfxk4htHaSmJ2Llcyl+gxcFhzhVKGK42J4pnOkR8mErOJI4wiWrd5kUAE3gEur143gwZOgfjCfp6CMWOkTp0ZIZZqM2hvFYetHZMWerNcn3obMuWDG6dtAICPzhRCgUrUzIc1Ei4Gm8JH9QbBL8LjpDwxsH+MP+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dwtw1pne; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443B51F00898
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417142;
	bh=BPbTvHpkT/+atMHfAn83Ogy4KZjiKb1VCoyZTifM4YA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Dwtw1pneN91J12PMkaxGO1CMKagCvWg/EPs/mkBH7uGuLxN9b2QAMPXFDWIYZpGOd
	 rdJc1SGshSGuGvO700BuGHmsTZyKJgKx67rSYJQmWV4tjXRzfNcBle6mDExJVGjB/C
	 VPJ6GdESA1DRFgBwX0BvMGUvXeZlgY4l6BbY8ZtFJkNQ1seJrCW50XpfCDyyNNeOUp
	 KY+sgfvNOuXg1O5a7GF7zghpQ7AGwV3cOF9xVw/sOK0KiN3f4Cp8PCJR8puC3HinKC
	 aIyhqICjsIpnKHwEXbU83dqANndYcud9eLXK6c/v2m9tV2I9km0QDhHMJCSonzmO5S
	 ZfbLY3Dzwk6vQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3965d76090bso37223081fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 09:19:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/9XvxqIGunIPjuCqFarG6oV0/dBw24znf6bDwHiXMS/w8ISHcHks9J33abeLr/N5NqKnX5Dg7wSzrt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3FUnqVXW/8UqF7Xbvo6mfwRlPFonWq9oXV2owvdThVtioGc9
	j8Gp5urDvhk+n5F1yKk0fvJmvYQCYNnjA3RKhMjM9EA4hi0xhS57Z7Z0qwCOZeLgjnKYBYOAFH+
	usl4Qn8pyucYvlqbbPn/qUoEzPCskOr2B/EZqEgL5rQ==
X-Received: by 2002:a2e:a90d:0:b0:396:75ac:457a with SMTP id
 38308e7fff4ca-396ac2bf8f1mr1234431fa.8.1780417141042; Tue, 02 Jun 2026
 09:19:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 11:18:59 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 11:18:59 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com>
Date: Tue, 2 Jun 2026 11:18:59 -0500
X-Gmail-Original-Message-ID: <CAMRc=MePduXLREX+X6mLF5qusfjvp6=TZC6RJcQb7vm7=KAixQ@mail.gmail.com>
X-Gm-Features: AVHnY4ISA-VZS8ud-UYiHr-qhu-EM_kTyWlK8MV1UlB9AJNiwyCX_g3JEU1YW-k
Message-ID: <CAMRc=MePduXLREX+X6mLF5qusfjvp6=TZC6RJcQb7vm7=KAixQ@mail.gmail.com>
Subject: Re: [PATCH] serial: max310x: implement gpio_chip::get_direction()
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,mail.ru];
	TAGGED_FROM(0.00)[bounces-37829-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FORGED_RECIPIENTS(0.00)[m:tapio.reijonen@vaisala.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shc_work@mail.ru,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EBFF630283

On Tue, 2 Jun 2026 12:02:35 +0200, Tapio Reijonen
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

