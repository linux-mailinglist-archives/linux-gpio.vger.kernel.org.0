Return-Path: <linux-gpio+bounces-29024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D45FAC80DA1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 14:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A39E94E253D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 13:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F70D30B52E;
	Mon, 24 Nov 2025 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNM8p1oq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F7126BF1
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992368; cv=none; b=AYw1u4HiPC+W1OD5sH83OQ4gekZGj5aKUP9BhdfT6sRXLD8okYOwzt8CqFoxMvQ6Afqcpn6F+2OFicklUBGuHjks/2I7Cp0T9fD6wdi5n9kHGO8e6m9hzLI3hberqw4RilQjkUBzlQStDQaR1IBdgd2jgvA5TSzLbBT028IGWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992368; c=relaxed/simple;
	bh=Grxi1FitEaNf298AS64XP+HFPYh/D2UTvN2jgca86T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+sWwJK5uuYLipoefx+aD2Bj5WEHY6gfbJ+imN1kqxXlCOm16vgwUlSqEZU2uAK3qf/eD39ybCSwRwLSNVw6A6793V7F9/tkvADYr9VDxPA1Rz2GcJPQZI3vUVKGWH151PHrhPRkGlNjQZAp7QddJULmFsL3XRQEyR/0fJakRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNM8p1oq; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b72cbc24637so720983066b.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 05:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763992365; x=1764597165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP/FY6KH/8vHEYoomKdq34/+A+H8nhmZ7rG1Fh9qu+Y=;
        b=nNM8p1oqOJdgmJi998S3O0Muq6FT1JPEnk5MPj9NDb2ykqNIne6+tqG1eNuBYws+HM
         sSAG0hcXrrePYVjUv6H9fgMYmz0TP0pSj8I2D2MVd4v8k7PwimuVr666y/GaqR6xR04w
         P86aIrlhQppUToHW6LsqhPfonnr75c45sybtPltz+D3ePV66fLrHOtdyIwgHWkm0doDk
         dpkzT82Cug0Xro1fUwa//E+ZREQcelb7GAADDhiYzktyL9RLwnvCVaIHSSTUPC7KieDP
         fi1zlEIa/cgjpk2IwFKPSTRlU49zUrwKlwvYbYepLsUOF518lp0zeCvK/2B9oexh856X
         MCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992365; x=1764597165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JP/FY6KH/8vHEYoomKdq34/+A+H8nhmZ7rG1Fh9qu+Y=;
        b=wWnLlPVzh6fKwamiIoZy5SJWoN7+8DIGDKmUsSgezbANiIDeIgeZg2ne3LiV0aemib
         vZTHyiYJIfvW2/d2z0KS+6Xu28WBKfxDLcKCvyp5Uh77Zj4RGfyKAeQAaAb4jWmuyvBb
         Ljl1ut3R2plRv21Z/Wg5PJ4lufmlSkxvXmIjWNkym5eEqy4z6ZNQI0SWQtsys2aPwjSF
         RkyRj5Out0IBxiFmJXX16ceIlycAuB/yZ8s/Q8Zt01jlbOCRS+b3nKk9v3WcBJ8XwjmM
         fPRpQcXra62dRdezfXsAqfAKvjciwbxfCs2Cpz9jKUDlKF51kMlBPWVl9crrYMy1cO2m
         ZfcA==
X-Forwarded-Encrypted: i=1; AJvYcCUmW16N/JTKmsAYcx3Z+Rbe9YOMhZ9AXEDSInrYmaIzs/SrTtN2t3dGQIqj2ADYeu02QIvzLK4OZsOW@vger.kernel.org
X-Gm-Message-State: AOJu0YzvE43A2g0bicZgQ5Tz9eeeNTy9wq1R5vJtaeaQTkt19TTarYM9
	QLCbW8gQJ6HmSep4xTgcvnKLl06+rTm/6FllHSt94By9suCO5skRivTRESxUedWO6ntMaK3ZOTB
	sDPC9CV0NQUMvPHiTsK/lLX7oIN3S7iM=
X-Gm-Gg: ASbGncsE+GsnphuNmjDL2t3rONAtKQ9ZecBRUCRgams7/19GWj+coIdPQiuIutEPTNz
	xjwa4TWhczFRFCu7QOucadTnH9ltR68oxzje9bbtmJvcMsrfBO2w/HjW7+KwF3SZAl8sYbntb/i
	Fd3xO5whNpd7ONiJKHaURDOy6dR5OjqeBaIzaGhd9pbYr2QIIZXIEiAMkFxx8n+foYnzmxfK6wE
	O8MZcPhUmDg/0UdxwSje1S7Te88L5bCzXzq5BMQ1ParZWcgikxaHrz6q27A5nTpIvjuUL21MvHF
	n8VlyeKwz0GMH4P2xTGX5zi/ESKn5DaDQTpjagySSJSQK2BsJvqGVyNRwuBuGeFJXpzXhyQ=
X-Google-Smtp-Source: AGHT+IHbYpoHWWQRtCEXegw2OC1ORK4p1rONYVKXwRB9RhnKrG4ujzsP4M5fg7GySo7VVhYPLZwcZKF+RtaqPvD4xlI=
X-Received: by 2002:a17:906:6a13:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b7671ad9240mr1140942166b.50.1763992364480; Mon, 24 Nov 2025
 05:52:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
In-Reply-To: <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 24 Nov 2025 15:52:08 +0200
X-Gm-Features: AWmQ_blafsIDEwQKFYXpYXLa3SZzKfbNXFzdND1Q9pD2iYZWVNrjXK4_jaogO3c
Message-ID: <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gmail.co=
m> wrote:
> On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org=
> wrote:

...

> >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > -       .resume_noirq =3D brcmstb_gpio_resume,
> > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> >  };

...

> > -               .pm =3D &brcmstb_gpio_pm_ops,
> > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
>
> won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> !CONFIG_PM_SLEEP?
>
> You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> all other *_DEV_PM_OPS() macros do).

Shouldn't it be covered by the same trick as pm_sleep_ptr() does for functi=
ons?

--=20
With Best Regards,
Andy Shevchenko

