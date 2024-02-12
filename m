Return-Path: <linux-gpio+bounces-3217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E504851D70
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 19:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E956A285C07
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 18:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C6045018;
	Mon, 12 Feb 2024 18:58:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD283FE44;
	Mon, 12 Feb 2024 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764326; cv=none; b=Xaz/Did+qQ3h7Mz5LYeNT0Xj1iFukSPxXnw2h291xa7PYytHM0ONje5jY3K1Q4z8hy8bih31HyPM1VjLT+e6b9fSBEW+7pU1BDtZK3cbL9EIv4/fzKnB2rFvTemesRpk7ti9vcYvvaBFraKt1OauVgTWvoVXcgRPS+1gMuRlU4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764326; c=relaxed/simple;
	bh=plrXdSzX2cXpZ6Di178taVe+HVkNMfViZlH5AuPB9gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHZzx0/r4+d1CbXoJlYqAmseMejhkiF8ndgLgn28+T4sbqHAG+Jd4B2S2hx1PtjAOQfhDjH8iHTkg+BvvK5SGku6HFloHC3X5Xxc1MD8lWLK6JCyLQwgaQ5fRyCvaVZxNJUKiLR0jAYpQT0vTiAF24jBSzzUrgl3NxzmUCrMyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6077dabae03so2187097b3.0;
        Mon, 12 Feb 2024 10:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764322; x=1708369122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE+rpTjs9eBLf5jPsgmKdz9gvYpfD1G97Uge2T8CuAg=;
        b=VMaf6bd4KepF/cXQf29FqX2Fw1h1fkMMXx+AC4Wxexwz4+RJqq7GUu1hCj70fU3RqC
         mk6DhB54Wf0TWS7NwLkZGPk4CfBzWexauLC2Wulc+VP9BVzX6m3OPMMau3BTC3BAtzQA
         9IJh+mZWgniq1sbBtCrFb7h2rr3nQeWiKcs5AmNgqBWF3EM9ayH4rl/0+6ZAs93ps2mE
         GPyFJakXoLV4kP2salXvtCgKjpxczZdyRP3vllern2mpF8YIUboBTg0GeA6HKmV7hsgC
         yi1+qkVMQR9LzdnefPP9MGLcbQ+zMl8tT4IfSGckqjaFrYmnfAhciIYLUBOsPZVV72wF
         U93A==
X-Forwarded-Encrypted: i=1; AJvYcCVqynwbveKO5JoB8HHIqcGjK9/RlPsjtzt98DdPZAF0f49mF85vBCXrN0wyQhCpG3K1ChDn7XmZP7DH8NrGiooXjD9hDP4m328xlz6pPbKnFpsT8bP3pHqgVlrR8O0hHEY+Ug5Px0FSG2V7VNMA
X-Gm-Message-State: AOJu0YyQAErF1hKq2jfre4joB8fzWVxKAOKdCQiP2UrmuUhv3lmR0tsc
	NY+P9MVo5X5UEe+BkNSeinMRTPouwfyD8vzR5s994xxwp1IlIS768HT5+2Thfao=
X-Google-Smtp-Source: AGHT+IE/KA6hlTT3UE43aWYdG8wLx/tQf+t7LHUylcs8UOnvWa/3ZWPZ6szZm6OZv/NZ3kbLuXWj9w==
X-Received: by 2002:a0d:ce02:0:b0:5ff:981a:2aa5 with SMTP id q2-20020a0dce02000000b005ff981a2aa5mr5839259ywd.46.1707764322137;
        Mon, 12 Feb 2024 10:58:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgJIiYGVWLILDR69mnTNX2DsYrB+xRgm7fL0TtxKubengPRQ1z8CWtgYFcfcnh+b64M9KbNzzm6ANoI6mQi+Xz462ka9O7XXJUYsqV3DYNjLkZKDl4ionreR2PZXix5WdU0O5z5bZSYi5OXteK
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id m126-20020a0dca84000000b005fffb25df43sm1290040ywd.22.2024.02.12.10.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 10:58:41 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso3583491276.3;
        Mon, 12 Feb 2024 10:58:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXthf6eyw9O9dYBurqTzQZMCimM2PHKHEV17JA0wJCoMGi680C/5FUv7jQIH/tjdGWSPY9F6qgfneMj2ynm3r9NvmShjgGpNiR5FN8/H8pXJPuSv5AkV5+Ewu0WXG+YatfRdo7/qkA8gGWb12KP
X-Received: by 2002:a5b:4d:0:b0:dc7:5cb3:256a with SMTP id e13-20020a5b004d000000b00dc75cb3256amr5340489ybp.42.1707764321673;
 Mon, 12 Feb 2024 10:58:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
 <20240206135115.151218-3-biju.das.jz@bp.renesas.com> <CAMuHMdWwHwZcGj9Efuqp-vnAh0Dy9br7RScOjpsL5zcCKFcbhw@mail.gmail.com>
 <CADT+UeB4PL+gfiV=x2RO0U9hTDtrr3fT+8039w9eCZM8HvWc-g@mail.gmail.com>
In-Reply-To: <CADT+UeB4PL+gfiV=x2RO0U9hTDtrr3fT+8039w9eCZM8HvWc-g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 19:58:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpN+ntXVw4+7p-r8HpQATvcHahKsYBHEcrFi7BUeehTg@mail.gmail.com>
Message-ID: <CAMuHMdVpN+ntXVw4+7p-r8HpQATvcHahKsYBHEcrFi7BUeehTg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
To: Biju Das <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Feb 12, 2024 at 6:03=E2=80=AFPM Biju Das <biju.das.au@gmail.com> wr=
ote:
> On Mon, Feb 12, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, Feb 6, 2024 at 2:51=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > > Simplify rzg2l_gpio_irq_{en,dis}able by adding a helper function
> > > rzg2l_gpio_irq_endisable().
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2:
> > >  * New patch
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Note that this conflicts with Prabhakar's "[PATCH 2/5]
> > irqchip/renesas-rzg2l: Add support for RZ/Five SoC"
> > https://lore.kernel.org/all/20240129151618.90922-3-prabhakar.mahadev-la=
d.rj@bp.renesas.com
>
> Do you mean patch [1] conflicts with the above as it is irqchip related?
> [1]
> https://lore.kernel.org/all/20240212113712.71878-6-biju.das.jz@bp.renesas=
.com/

Oops, you're right.
I've been seeing too many patches today...

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

