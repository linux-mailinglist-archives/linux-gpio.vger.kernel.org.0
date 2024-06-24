Return-Path: <linux-gpio+bounces-7649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2142914F3B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 15:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31901C231DA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 13:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B2C1419A0;
	Mon, 24 Jun 2024 13:54:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13414199C;
	Mon, 24 Jun 2024 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237272; cv=none; b=Hob10lwcHgt3UcQ4au1OV6z9Cxt9QVc1U7Yx7mkZoDYHXs9IhXlyufzXKq8DYfLDZg+FrC/7YugRiu9exKip92etOvYJ9EKcXy/UCiPB+5K/rnroU8b740h+9xoaWUjbZMwBN1Vu8kZkCbuabp9uYWOT6A4yJCa03v1TzA5hjhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237272; c=relaxed/simple;
	bh=bSuD+8D7Rz+hm5eVrQsl9osZv3K6KDZA9Wtay1ky1vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eA64j9CqYD/Cq/n5ry6mtIDMxNlPc9TFMdfx/7F7uZe0Fa5uzg+jMVGZG6SfkGwy3VHBF6GIX1DLbvIQ1j/0BXPCqOmZ3Epreqey03Wm7aiJbpC83MQHwdVqvsPcPn3lqLvjFTwfx2SyZFkSuSU6KF1massq2rUoz86ivnDsXn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63bdb089ffdso33478827b3.3;
        Mon, 24 Jun 2024 06:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237269; x=1719842069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfAlnFTJHlQKWIhVQFUuWrbtwp9vlom9Wv0aMSus9tA=;
        b=nqkhIdkR5Jd5htvwMxZQJxpgPQJKju4iZb9Cg7vLrsx0vzTBR9l0ZTuxBjUE6/n46A
         0l2L0k8Uwp5mgeWyeFdX7vDb6RW1GdGZjl/aQaT380VUSRtsLjZcal0wrXAk2//0oE/e
         Kz1kWOqjdd9q9jhFa78Fob/wioeXPxiREE2SKt+loJDlM5Pb5QIm+UV3c3J1t2UnDL4Y
         /HzT/iuK+HOJFeZhCVmGyK6g6SwA8lvwySgvNFDeCrWu6lLCDVB5MDSpV0a5GE4uFeo6
         jDaeT4Q2WMBde5axDpXx6eOYdGc/cDZLc9ZN6yT872/08hOMZ9W7adEjClK3sLkJD26A
         UciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwhDNr+P1NWuR9uEcrYz3JXjYVPd1QXRKXXkFVzGnoHN10RYEbDC6gzAl88JPCEuE4ivPHAjnMNhN+wP/fC44LPvPxJsZsq9SaqQp3Zlo8ndVNu6wwi78GkjLdGmq8vNFHsmE1Y4SHbXKgUuGo
X-Gm-Message-State: AOJu0Yw2UeSTTp5Ef9xphrJlAtS9hhYKGbLtoNO20hVFst2vKGGOJHu2
	zVdl+Cqp2mKI/7Nv/cuSlDohtA4WEN7gCJDFoywU/ijnh9glY6gCzFIZ1Zbl
X-Google-Smtp-Source: AGHT+IFj2iqKo6IwSGSTKMxP1hl7lvCh/4I86/czEEPTycv9qlQ0zrWAnDukQl86y1ZiJn1aFkP5dA==
X-Received: by 2002:a0d:d047:0:b0:61d:fcf7:3377 with SMTP id 00721157ae682-64343efc76dmr32323797b3.44.1719237268590;
        Mon, 24 Jun 2024 06:54:28 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f156c307dsm28442057b3.124.2024.06.24.06.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:54:28 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-643603b1feaso15191917b3.0;
        Mon, 24 Jun 2024 06:54:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhsEMp81+t+SHoXwiQ3aziRy9kEjxYoYATMjWZ3TbjBQk2fXqTi/5McDP9XVvOPMjrh4mSJ1dWAXAckphGKjkJ+uIRikjctv/e8iyrxfN68IzXB+KkMTw0Lhm91TRh9dCWEl6AZX/k2sc7IejR
X-Received: by 2002:a81:c741:0:b0:61b:e62e:82a2 with SMTP id
 00721157ae682-64342e91b81mr35950887b3.34.1719237267852; Mon, 24 Jun 2024
 06:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1717754960.git.geert+renesas@glider.be>
In-Reply-To: <cover.1717754960.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 15:54:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu5iNSZLALBasS6vSzMrPT-Cba8wXO5X-_xSF-xyRUHw@mail.gmail.com>
Message-ID: <CAMuHMdVu5iNSZLALBasS6vSzMrPT-Cba8wXO5X-_xSF-xyRUHw@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: renesas: r8a779g0: Fix pin group suffixes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>, LUU HOAI <hoai.luu.ub@renesas.com>, 
	Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>, Phong Hoang <phong.hoang.wz@renesas.com>, 
	CongDang <cong.dang.xn@renesas.com>, Thanh Quan <thanh.quan.xn@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 12:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> On R-Car SoCs, pin group names usually have a suffix ("_a", "_b", ...)
> if and only if there are alternate pin groups for the same function.
> At the time initial pin control support for the R-Car V4H (R8A779G0) SoC
> was introduced, there were lots of ambiguities and inconsistencies in
> the naming of pin groups in the documentation, violating this convention:
>   1. Some alternate pin groups may be named identically, without any
>      suffix to differentiate,
>   2. In case of two alternate pin groups, the primary may not carry a
>      suffix, while the alternate may carry an "_a" or "_b" suffix,
>   3. A pin group without an alternate may have an "_a" or even a "_b"
>      suffix.
> So far the driver followed the documentation, except for case 1, where
> an "_x" suffix was added to one of the alternates.  The plan was to
> update the pin group names when they were clarified in the documentation.
> As technically these names are part of the ABI, they were clearly marked
> with "suffix might be updated" in the driver.
>
> Unfortunately the pin group names are still not updated in the latest
> revision (Rev.1.10) of the R-Car V4H Series Hardware User's Manual.
> However, the newer R-Car V4M (R8A779H0) SoC is mostly signal-compatible
> with R-Car V4H (they are not pin-compatible, as R-Car V4H has many more
> pins).  Hence this series bites the bullet, and fixes the ambiguities
> and inconsistencies by adopting R-Car V4M pin group naming (from Rev.0.51
> of the R-Car V4M Series Hardware User's Manual), and following the
> traditional naming convention.
>
> Note that this does not affect any upstream DTS files.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (8):
>   pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
>   pinctrl: renesas: r8a779g0: Fix FXR_TXEN[AB] suffixes
>   pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
>   pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
>   pinctrl: renesas: r8a779g0: Fix IRQ suffixes
>   pinctrl: renesas: r8a779g0: FIX PWM suffixes
>   pinctrl: renesas: r8a779g0: Fix TCLK suffixes
>   pinctrl: renesas: r8a779g0: Fix TPU suffixes

Unless someone objects, I plan to queue these in renesas-pinctrl for v6.11.

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

