Return-Path: <linux-gpio+bounces-3568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0661C85DFFE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 15:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 383341C2432F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 14:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B167FBA2;
	Wed, 21 Feb 2024 14:40:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE077EF03;
	Wed, 21 Feb 2024 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708526412; cv=none; b=gW7kRj3ASL/QPXulj0yK96kMA0X2Uyy4E1TEXHYR9dKVibmtP394eVfEV0os1u9+vJFArkCljR4mnvgS7U74FIU6GYEuQVroRHz6jPb5EaHe5zsLIrm84C9tDoey9YG0DPzaMrMPd1/cTxPZLCwYr/shldkErN2TNQcDX+ilf34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708526412; c=relaxed/simple;
	bh=G6ZTjbqPICD31e+rOI/+nBkpVKCVey6wOmltX4d0iUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKG54FWjlkD8eJTqW3dm0940Iq/fItpcWj1p40PYMu8x9xXTlDRlJRvULgfXgb8fMQsp3MnvIcYJE9+zOQNTpf0CNtb0C/HVb9Wdq22kJF8XzRkZjKnVawurLJp69eCuR5Xz8wA0E0uHXmSDKKjnYT+YRk/FihI2tSYpdxGdbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6083befe2a7so33842647b3.0;
        Wed, 21 Feb 2024 06:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708526408; x=1709131208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph+aCEksg9IN0nKeG7YiLKMgU01clCW/JuozsVmAcSk=;
        b=qmNPi2Uxv5MhiXD0UTb7hUVPt3hG443s4ck/90uxGdgvhDbwt7lK66Zkwc2xdUvrnt
         Zq/VSNZZ2v1SjmjaC7IgbxJbTSd90n4CEdspYoDRlBhop3BSM7uJ/CYD4V5ULbvY45FX
         rLT6NIdnE81/wC7CpdTQuNFSnyuK7RR45Bbo/mBwQm8pN7zP0eIx0oIodUtZYFlX9x95
         9NlT7IvMa5cfuZnTbIDAyKgLhidXymZYRDm+uNAl8L799yavg5HQXFQFLL7GSD9NZ9Rt
         jnOrUIcheL99t3+EPE+3/tvtMeY8HJBjjXpmkyZS8wUoZAa+0sLTsNjoHJw5M6IGwvy+
         o/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQdBqFB9+YDV9ROrRZr92suetTG4Ei5qzPHNZ7+Rt+CF0OOSAH4xCtQxuFzLobmab1BB82r/sbq1wHHwvS5CYADynn9VW7w02j1oa+B3MN8Hod3t2vL6/yAqbt8hbX7/98d1V1fRb2Blp5NK3+
X-Gm-Message-State: AOJu0YyQVeFuyiUqJDSwYKmW3u6ZqzXSwjVbMU3Dow0Uz0V/JbmoMRld
	joRJr2uOk2pvuCiHpUVs+ObR1Z4MuBdijmE/d8bBqf8M4yGQzXCNG5Azb1GUHr4=
X-Google-Smtp-Source: AGHT+IH2/1xTtx9PwrUbhssseQqTzbmgcPUeDz3c+5Bdi5YJpUV6luGpK11jYUjwM02LH0Xr1c5ezQ==
X-Received: by 2002:a81:8304:0:b0:602:b810:c837 with SMTP id t4-20020a818304000000b00602b810c837mr15890822ywf.47.1708526408445;
        Wed, 21 Feb 2024 06:40:08 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id o16-20020a81de50000000b006079f55766bsm2522804ywl.68.2024.02.21.06.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 06:40:08 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc71031680so5466354276.2;
        Wed, 21 Feb 2024 06:40:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi77j5APGpjUjWmvTYbHVFAXWcxp+jhR9WivLyQrO8B1O+r3QjnNj5VNSg3Y7arGnwslbjBSYmvlk3sp5eJsxRxQ/CjeUTx8k1e/cD1ADnjBHV2nBVhnmz+ShbPAqW41S0aPNT5aHDVjyvLjUb
X-Received: by 2002:a25:83cf:0:b0:dc6:b9d6:1542 with SMTP id
 v15-20020a2583cf000000b00dc6b9d61542mr15221124ybm.48.1708526407842; Wed, 21
 Feb 2024 06:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com> <TYCPR01MB11269C52444CD5F53B56AF08B86462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269C52444CD5F53B56AF08B86462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Feb 2024 15:39:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZPX4TF6U=8wWLMB9OdRdxxWPSswnyq7vhNQibvOS=Hg@mail.gmail.com>
Message-ID: <CAMuHMdXZPX4TF6U=8wWLMB9OdRdxxWPSswnyq7vhNQibvOS=Hg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] RZ/G2L pinctrl trivial changes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 3:10=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Tuesday, February 6, 2024 1:51 PM
> > To: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; linux-renesas-soc@vger.kernel.org; linux-
> > gpio@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>
> > Subject: [PATCH v2 0/3] RZ/G2L pinctrl trivial changes
> >
> > The first patch in this series for configuring GPIO interrupt as input
> > mode. Also if the bootloader sets gpio interrupt pin as function, overr=
ide
> > it as gpio.
> >
> > The second and third patch is satisfy the prerequisite for IA55 tint
> > registers(ie, pin will be always in gpioint mode)
> >
> > Currently on irq_disable(), we are disabling gpio interrupt enable(ISEL=
).
> > That means the pin is just gpio input and not gpio input interrupt any
> > more. So, move configuring ISEL in rzg2l_gpio_child_to_parent_hwirq()/
> > rzg2l_gpio_irq_domain_free() so that pin will be gpioint always even
> > during irq_disable().
> >
> > v1->v2:
> >  * Added as series by adding patch#2 and #3.
> >  * Replaced u32->u64 for pin_data
> >  * Added rzg2l_gpio_free() for error path for bitmap_find_free_region()=
.
> >  * rzg2l_gpio_free() called during rzg2l_gpio_irq_domain_free().
> >
> > Biju Das (3):
> >   pinctrl: renesas: rzg2l: Configure interrupt input mode
> >   pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
> >   pinctrl: renesas: rzg2l: Avoid configuring ISEL in
> >     gpio_irq_{en,dis}able

Thanks, will queue in renesas-pinctrl for v6.9.

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

