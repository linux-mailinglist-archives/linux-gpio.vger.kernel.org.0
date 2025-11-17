Return-Path: <linux-gpio+bounces-28593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3DC646DE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 14:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1DDD0357E44
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 13:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591652E9755;
	Mon, 17 Nov 2025 13:35:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E830C363
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386504; cv=none; b=mYRoy0pEFwyvRBm9YkCPgQ1lU7MDX8WJf5701VZIcU0kuwMtLtDFGdzPiWWTR/a/e88Qjb/v7RpxGlGdv1uaufa1L1zgD4ySnBA3KFnYSymlfaBdDNUaCaAuiekPNM7MCSAwYtFNROe+K2Zhik63xYf9S1/Gut/nYfmZXqzETK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386504; c=relaxed/simple;
	bh=px2hV1A/nOdN7ZX1sTKuZqvlCW5UVG+hbRtvmwMHmns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJ8FYEhkFJay89V0uDT0oZrU7Ov+07U6/aalrV35Hn4/6pbyyhVzzNOOqOQmJkApoHEQnbO/qFMWagMTBS8rByHjoMeCK99NNRvLf4hyEsUEXjfDgrfwPnXZrtpgD1duh5ih3Pd0vnCk3E82jFUkGYZL38sc+QIO1RPYAGm9PYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b22d3b39fso576672e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 05:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386501; x=1763991301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XicRv49ckL1HlqmKBdAWtpcFjnN28YIuiJ+gd2B6JYo=;
        b=h+mPTCZqH0YCbn1LGWkgX15fNHW9nhs0WjjUgvrhV7vhsqGqGUf3KOSKwQFxL1DmiQ
         uNof8+4ArcpE+jFhR5CstoUDwK9fSEQOF2cz3NY8ntA9wEjHYRVqneUy8ZYBYnQYtqcb
         AdsOF7BVXbJWKzYP/mlieEeBji5dei0oxpa9fq4EvILlK6npYq08zmlIK/ulvfSUVd5T
         5oaTP+cm19R/tBYQtfTgXAz5GClHM9p2v9fI0yc/H9eQ44HsIf1g0XLUhvD3HahouVzV
         L3gj5MHGqjrcpCOp29pYWRBNdrFu2vHhqQA69DTxJd9Fz81Y1zM0vL9/Idy/8g8YPgO2
         kYuA==
X-Forwarded-Encrypted: i=1; AJvYcCXqk7DNcwrPWQlEkEeG+CdDXwwfhdJSoFvEPS19PjYVCdwexwGSqbDMx0+EP75sZc2/vwdtfmK8OMih@vger.kernel.org
X-Gm-Message-State: AOJu0YzRp4PyhZYxU27sdAhIOaImInSMOhMWzs9VtpvGZh0jy9DDyFvx
	xVFEI/6HljO6WmewA5oFaUAnUltSb2obtG25zaEPz6hUJoMYqV235pq4OtZOHc4Sxbs=
X-Gm-Gg: ASbGncuYLHP8UkzJtAhtKM+Sx3rLoKEo3PJaG/SQWVR+Hv0kldVSZvh1soUSr/IQ+p2
	u4AWDz5t9Xv/rfbtnoK+EPL/7TeI60zN4xZ1SKARM2a6lGDrWxAISAy9Y7VdO5LcgynMSo6Vl0B
	qrZ3o43p8bF0KEeXbHMQ1eo4sKThtzdDR6n+VEor+osLet36tNoThX2HrBlOXfTRownBuosjtIs
	Efr6qt2pxxa7UAXfJORhOtoZ4IWyTB3rgEr4XI68jOztGkMEcNbaj0qg/MxZPnyFfz9OyNUaHJW
	x3TV9CgiLmWDU6R4+fKtHA7cY4wpT3sYN6NKwyci2MHqYWhhRClwWnOPwg9hjMlaONatIa/sIIt
	2QtyacJuuVQZjtOWSzv6alYZN77i9b9dPtpZPFTizqJmPEQ1e7FvUCrJk8KdljJjUrTtYKNtQCs
	61TaQp25e1eKQuVGAyrwqCzX/j1u7fDN4Pxf6NDg==
X-Google-Smtp-Source: AGHT+IGqnjVacHpTj97s5s0gNuROr2ybAekZE9v/WEzSKdGMOcIturasl+uE9tY4SAqoyc+HobHM6A==
X-Received: by 2002:a05:6122:1d0e:b0:559:f0a2:4ab5 with SMTP id 71dfb90a1353d-55b1be5cce6mr3753018e0c.11.1763386501578;
        Mon, 17 Nov 2025 05:35:01 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f3307ffsm4277738e0c.4.2025.11.17.05.35.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:35:01 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93719360f9cso1122041241.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 05:35:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9GvcRA0nJpUiBhLHHsqOU2Mwon6pSDyeXP8NQ2XT55klRR59+MIaFB2kHx/uPpRPqFJAJKXzSZaWY@vger.kernel.org
X-Received: by 2002:a05:6102:4b89:b0:5df:b085:835a with SMTP id
 ada2fe7eead31-5dfc5b9e6d5mr3484003137.30.1763386501291; Mon, 17 Nov 2025
 05:35:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com>
 <20251027123601.77216-6-herve.codina@bootlin.com> <CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
 <20251114125810.629e8931@bootlin.com>
In-Reply-To: <20251114125810.629e8931@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Nov 2025 14:34:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGjdqSfWnY6JrXLKiTS+wpQuphB+tW1RWoMskO3-MHGA@mail.gmail.com>
X-Gm-Features: AWmQ_bnSRNaycDrtFmwU2BRrd31X7UUoS4AupST9inXGj9lqsg7WOq47fOxQ24c
Message-ID: <CAMuHMdXGjdqSfWnY6JrXLKiTS+wpQuphB+tW1RWoMskO3-MHGA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 14 Nov 2025 at 12:58, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Fri, 14 Nov 2025 10:04:10 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> ...
>
> > > +               gpio0: gpio@5000b000 {
> > > +                       compatible =3D "snps,dw-apb-gpio";
> >
> > Don't we want an SoC-specific compatible value, too?
>
> I had added a specific compatible string in my v1 iteration but it was
> rejected by Rob [1].
>
> [1] https://lore.kernel.org/lkml/20250729181151.GA530390-robh@kernel.org/

OK, if Rob is happy with this.

(If/when needed, we still have soc_device_match() ;-)

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

