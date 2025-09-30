Return-Path: <linux-gpio+bounces-26669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3661BAC743
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F901320C32
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 10:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F302F8BD2;
	Tue, 30 Sep 2025 10:21:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DBC2F7442
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227674; cv=none; b=XMqolOmGm8WMNCKug228iH91KNy5eKVaH/6iParVXA2iNTOp89ARDF/Glqw2h9I1qC/9KnWySKr6U1xCkeIkNHpnGCG2aXVyPcOxjEv/NbLEA9hXTDotBqQJYwe8xuBZQ59f17sSFDn4Qs2ymrHUZRfxMGZQz9K+jBKGhr7MU1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227674; c=relaxed/simple;
	bh=WQLYqqeVFTfkVzqoUMVRfNAxbGpfZXqrGeHdXR29J2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpL9Wb24/mGsqq9HlkDYcePqCSpdQP0S9y8Xpw63LxjBk1GTN+IwFaHGJlMAgDhq3zeQRvA2NrCHbu0AeMmu3CvqGKrpwHfzy7VZdySsKTE1HS4PADE2i6s7zpHA+cnKb2AAUosQNcy4WzUxadDwRW7YETfWqE8k9Z8qkw/Cq58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-50f8bf5c518so4435248137.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 03:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227670; x=1759832470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auZnMEhGQ1qbaDugOLJ3H3dc2TwXmOwQEh+fyQy4fvU=;
        b=YhpSEvGab3CLVJfyQI+75z4VosvUQJ7OZ14uc3d795Sy6aAOig7E7pccV6ECMUDsoN
         7r+xxWjrPU0FdMusPbDyOkHTYpX2/7/MHGXa88XEl+k4/6+cQAKiAGT+zh5PVm9XfZOe
         +7X2w0KHrMo/7tVJnv5qgz099vdW+QArAuQz2OWl0vu8Ni9cXWJDlzQLCcw+dtV/P3nS
         Tw3SyzeSsPxC0/rS6VFJxoMo2reeR7mxxg7r5aAY481HMP0r4dGU8LiDISD/c5/BFwjc
         ow5iqmPzjckHc8vRcGR4cZaXg0GxMmjZPYcTpUU1TDKGnctTdd2UbJ7HYhZXP374Ui9G
         cyTg==
X-Forwarded-Encrypted: i=1; AJvYcCXz5AIrOf9dOoZvAL2Evzev/anL8S6c0z6Eg5VDY4Z9O3zeZCmXR2WHi9MqIMawnensSwzMCKhZi3NG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0R6JgzP7rUw7gXWbnHGvkdkH/BcC9xgUl6iHO+HBN316op7Xb
	CnGj7kuFPtgUh9ylUGDdRdm6g0FuP+lSIKuPvIHbgTJlpEpmP9l0pKa9k6XYxno5
X-Gm-Gg: ASbGncts3bUsloTJcO1rM/bL+/g3SxLxrdEw8f4ZUXpxN41FIwaNbodLo50YFYB4x09
	MZ/tMP/AKO/jrVY4rMNGNqb76Asvliqu51lWeY/s0GTlQOvmkLoL/Ou9A9d9nevAR9pjGNZR44m
	N+aFh82dNwSdBPfSDEuTKUqx/MTVGlv1tz/jT4wW/RhBDdmlpezysn/qaGpVubXC5qfdUq8I8ej
	xJzZiaasGutdH1PXlQhwh601Y5hOw7kVyrU9Vsme4S1WqTYFrGc4xpiQbiHpQyTvX0BtTxwYbEf
	eegCgMLCh1t8bOuD5MZM6TLxJh3WwylhITAHb0Ds9s+h2sbTeatfQrfbkQd+5fxjg90IHVzYksB
	Rx/BIpxqUtXgdYyj7ZZ+KgVfKx7qmtPzm29JLAMR7kEpCGULE+T25xaYG+aNafD/181KVDQqSqZ
	YFBmv1T1rA
X-Google-Smtp-Source: AGHT+IHpR89p9MgfZDFt6qBNETBUilaIHZZmaq9V6bDQX8ILNE4baobdamYliBkIYasLM61yARvenw==
X-Received: by 2002:a05:6102:41a4:b0:529:bfd2:382a with SMTP id ada2fe7eead31-5acd8537679mr8805760137.32.1759227670369;
        Tue, 30 Sep 2025 03:21:10 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae31827c81sm4297320137.5.2025.09.30.03.21.09
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 03:21:09 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-89018ec3597so3197561241.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 03:21:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/+vqxkmzxgofL1Kt7/HMpCyxjbpUK1MeR4eBRkyTFdgVVJRqiuUcdGTxbbDm5qDY/xzzOhX2dFRHy@vger.kernel.org
X-Received: by 2002:a05:6102:a4e:b0:520:ec03:32e9 with SMTP id
 ada2fe7eead31-5accb9fe470mr8731133137.3.1759227669064; Tue, 30 Sep 2025
 03:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXv1-w0SE7FZy5k3jg2FO-a-RB2w1WB=VM_UFEA9zjWDw@mail.gmail.com>
 <ef82c610-0571-4665-a5d1-07a9ed9fb8d3@tuxon.dev> <2bd09757-cd66-4a2a-8801-0f62dc99b9c8@tuxon.dev>
In-Reply-To: <2bd09757-cd66-4a2a-8801-0f62dc99b9c8@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 12:20:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6TQFZJ_r+XZOuh7yTUKwZxQRCr4Ps-xZ8U702xMd1=w@mail.gmail.com>
X-Gm-Features: AS18NWCkJPBMZWKc2yUGwPw-vQOHjjVBBvrCu5QO61We_9-kmpWet2XbZ5yLDKI
Message-ID: <CAMuHMdW6TQFZJ_r+XZOuh7yTUKwZxQRCr4Ps-xZ8U702xMd1=w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linus.walleij@linaro.org, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 30 Sept 2025 at 07:33, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 9/29/25 15:10, Claudiu Beznea wrote:
> >> This conflicts with commit d57183d06851bae4 ("pinctrl: renesas: rzg2l:
> >> Drop unnecessary pin configurations"), which I have already queued
> >> in renesas-drivers/renesas-pinctrl-for-v6.19.  Hence I am replacing
> >> the above hunk by:
> >>
> >>             /* Switching to GPIO is not required if reset value is
> >> same as func */
> >>             reg = readb(pctrl->base + PMC(off));
> >>     -       spin_lock_irqsave(&pctrl->lock, flags);
> >>     +       raw_spin_lock_irqsave(&pctrl->lock, flags);
> >>             pfc = readl(pctrl->base + PFC(off));
> >>             if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
> >>     -               spin_unlock_irqrestore(&pctrl->lock, flags);
> >>     +               raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >>                     return;
> >>             }
> >>
> >> while applying.
> > This is right. Thank you! I'm going to give it also a try (on actual HW) a
> > bit later. I'll let you know.
>
> Sorry for the delay, all looks good to me (checked on RZ/G3S).

Given this is a fix which will be backported, I will reshuffle both
commits, so your fix is first, and the above no longer applies (here).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

