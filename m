Return-Path: <linux-gpio+bounces-39097-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/VTEDkvQmq/1QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39097-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:39:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D854C6D7932
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:39:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39097-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39097-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F1AA30086D4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEB73F5BCB;
	Mon, 29 Jun 2026 08:38:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5F33C1973
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 08:38:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722323; cv=none; b=pG/h4wCm+6oPs1JUerKzoyxw0oVReOT2FmTvSawi2Q/vMRPYi31Hyf5DqtH7xXJ2rUnKm/BmZEltRmQMnMEf3Bn86Ug3seyWMdMZx0w2htPT1Vg7HNQupOqDuXZ6YJj5FPR5V3EB75RIEyenDK3IFQBen/KNPt4npoih8HaAU/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722323; c=relaxed/simple;
	bh=S2YOaxtQdi6QG/AVmwNg6keinWl60WoxMa9xPYTPTjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvJYo96SdEjggMTienbsDHoagVg8KQnqlfSrvFwpNyCrwSl8AqWEwamgHMn5LVsYMWFLTed4dYdqz/M/W6GWtCnJOSrSp3zaIaap3Fzz2NfR1wbbukWol+ImcjN4c3BbFvdg6dqeSlhwOc392Gm7oiGsvn+X+7B4Hae/o82sn5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7387ac7d28cso213459137.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 01:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722320; x=1783327120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04ii8yk8L2rC2i4LLn0g5pk2Zun6f5/ExAFsCusWtvM=;
        b=MeFz5wWJFKgHM+Eot9Ac8pqmn+fmXOicV52/OwkAfI3sNTetxWWaiiMtslzTWJCH69
         1HGMkN3hXRgqcCdt8dHg3INq8VzZ2kUPYpSZIQZHPx34dWRZI2I2F7zpJfbTFJ5BCACY
         1humYxb0gJ1AeLSpquVz3lJ4/xtIzJ1JcZIB6XlgV+TnioTBWuZMEgujx35uMUxjgHlI
         X2wgSB4a06PU7Ppznm28T6mQo/Ig73dEJhekZ0t3+slVLSQ89LTTnxiC6tKb7Bn2L8PD
         /Xa7BD8F27rZ1WfTVHdAyG7jgODp2+0FLZpnaJyhv9mtRY+IldKql3YtrbmCWk604CxL
         fUyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz2c1l2qXjJkYVr4DWePqgdtWoHXwBuy5jnyIqwaktcLsyH6ce5WGo/sk4nWSm7i9Tg5GCvVjvxtLx@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnk2VrWXEQUC2oAEZNnxWa/9jGvPz89Ltong8uPa/uOOeS7+C
	yENf9t3/uAN/P4bP05R6lOlKEA76qm3EzLbtfMyx0uyel0dFmFQhCm9ADx1sGU2a
X-Gm-Gg: AfdE7ckBSAbYgrHkmviJ4yVhs6gq9sFHBprULB43mK3RKFhxZOPppkEZRhBA2F1nIzb
	gj/pKuy8X9o8Qlf0xlHRhPY7XzHedV1p1gH2u5H7mpBh/fGJ1WZ48ut0zFdae9nNuXupPt3fi4a
	zM9yv1yjUTa9v25WOt5q60eTHbYJqbE0tKku3+gYpq4TCB7GEJBWhKJTMJGRu2NS1dD8HXbuQBE
	W8iddWiwwNq+HUwsn7F74tuaTcavfQUjdebNyB4Ka74Cn9KPMTAYiPoAnrmIlhtGo8cJIgD1MMF
	3p2chSDEt3V6KFk72PyRot5PWCzl56Rd4ZO3IRaTnZvg5D407UyhelxVwGMRio192oweqqkhqbU
	C724OG/aI8J4yP37kdhIIy4BoahVpCDieL0qKrL9Pf1MTVYZ2NiWzymZUiUEHs5wsjI3lKVIg4J
	znMAulXaadeD524DM6SllZfVWyKNUdOF5WmkXOi8koOGoRaV4YtyRRe3G8Ek/3
X-Received: by 2002:a05:6102:5715:b0:6d3:aad5:6d17 with SMTP id ada2fe7eead31-734366c9316mr6326116137.19.1782722320519;
        Mon, 29 Jun 2026 01:38:40 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-738f72b4cf2sm881297137.7.2026.06.29.01.38.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:38:39 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-96758e83292so787651241.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 01:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpH6HbT01jiZrXbblFMrWRW3McoykmJeuiYQpopvXSyV9zzVwhdARbRkqfwO4Wrokro5RjgtizNJRAK@vger.kernel.org
X-Received: by 2002:a05:6102:d89:b0:632:88f6:d6ae with SMTP id
 ada2fe7eead31-734367c8106mr6364001137.22.1782722318721; Mon, 29 Jun 2026
 01:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782389357.git.geert@linux-m68k.org> <3615eba18ff6a9351ecb11d9f5a0c86ef7b0e670.1782389357.git.geert@linux-m68k.org>
 <tencent_58921190AD10FFE0501A235142CA54786B09@qq.com>
In-Reply-To: <tencent_58921190AD10FFE0501A235142CA54786B09@qq.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 10:38:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWfYCZwgX1Wv00ZALpk4GNSSnEMwZjo1zWL=5_H3OyQQ@mail.gmail.com>
X-Gm-Features: AVVi8CdpnUH32hqaglQnMeq_k6Bf99DAuybF4xeX8lRDAL_aN0eHjy9ZZecfqJ0
Message-ID: <CAMuHMdVWfYCZwgX1Wv00ZALpk4GNSSnEMwZjo1zWL=5_H3OyQQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
To: XIAO WU <xiaowu.417@qq.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39097-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:xiaowu.417@qq.com,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D854C6D7932

Hi Xiao,

On Sun, 28 Jun 2026 at 21:23, XIAO WU <xiaowu.417@qq.com> wrote:
> I came across the Sashiko AI review of this series and reproduced the
> use-after-free that it flagged in rbtx4927_gpioled_init() =E2=80=94 a KAS=
AN
> slab-use-after-free triggers when platform_device_add() fails on the
> error path.
>
> The Sashiko review is at:
> https://sashiko.dev/#/patchset/cover.1782389357.git.geert@linux-m68k.org
>
> In rbtx4927_gpioled_init() (arch/mips/txx9/rbtx4927/setup.c), this
> patch introduces a GPIO lookup table that references the platform
> device name.  The error path looks like:
>
> ```c
> pdev =3D platform_device_alloc("leds-gpio", 0);
> if (!pdev)
>      return;
> pdev->dev.platform_data =3D &pdata;
> if (platform_device_add(pdev))
>      platform_device_put(pdev);       // frees pdev on error!
> rbtx4927_gpioled_table.dev_id =3D dev_name(&pdev->dev);  // UAF!
> ```
>
> If platform_device_add() fails (e.g., because a device with the same
> name already exists in the platform bus), platform_device_put() drops
> the last reference and frees the struct platform_device.  The code then
> unconditionally calls dev_name(&pdev->dev) on the freed pointer, and
> assigns the dangling pointer into the global GPIO lookup table.
>
> This is a classic use-after-free: the freed memory can be reallocated
> and overwritten, and the GPIO lookup table will later dereference a
> dangling or corrupted dev_id pointer.

Thanks, I will fix that in v2.

>
> For comparison, the iocled equivalent introduced in patch 6 handles
> this correctly with a goto:
>
> ```c
> if (platform_device_add(pdev))
>      goto out_pdev;   // skips dev_name()
> txx9_iocled_table.dev_id =3D dev_name(&pdev->dev);
> ...
> out_pdev:
>      platform_device_put(pdev);
> ```
>
> =3D=3D=3D Reproduction =3D=3D=3D
>
> Kernel: 7.1.0-next-20260623-gaca8efd71d03-dirty #3 PREEMPT(full)
> Arch:   x86_64 (QEMU Standard PC Q35 + ICH9, 2009)
> Config: CONFIG_KASAN=3Dy
>
> The UAF pattern is reproduced via a kernel module that mirrors the
> same platform_device_add / dev_name error path sequence.  The module
> loads at boot via late_initcall.

[...]

> Build: insert into kernel tree and build with CONFIG_POC_UAF=3Dm
> Run:   insmod poc_uaf.ko (twice, so the second load hits -EEXIST)

Thanks for verifying! But TBH, I think writing a PoC for this is a
bit over the top...

And if the platform_device_add() in rbtx4927_gpioled_init() would
ever fail, that would be due to out-of-memory, and the system would
be dead anyway.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

