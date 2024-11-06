Return-Path: <linux-gpio+bounces-12646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E29BF17E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 16:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E3D1C209A5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 15:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC88E2038B9;
	Wed,  6 Nov 2024 15:22:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629552F9B;
	Wed,  6 Nov 2024 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730906532; cv=none; b=CK6MvLOTAOigJsBKLJ8vYpih8NAY8UU/dLzEbatcxIKKG2UQ3v3sU7SsbQ86+yeC4sfyW6FUOIDlZij7bQjNwx2p1Xaunt+e8txYgl0nKx15teuE57aIrZU+VKpzYS9cP4pCliJkuBMLc2jYUSi78PxUmDKZPCNFNzuT15N0Vjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730906532; c=relaxed/simple;
	bh=yWz0ZoIl894qSrEs4p/3LumB+MuMd+WBPNQ8gaStZqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g14/hAX0VGsXHTBiUjOBc+k1xmIDQpARQ/8vbO2iy6afI4af+6qeEYlYsyEbPYtChT53UXTdowFDd5yWMAVXA3li7EDlmuG/pSDVwB1/Bwdts40bJK5X6lflg3yfqDCJ020oTG409xuYITL/QMETZQUU7ZX4/7i+6Yy27+xdrCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2e444e355fso826689276.1;
        Wed, 06 Nov 2024 07:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730906529; x=1731511329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZCcFtuDO9+jlZixEXsylP2Du+IUl9/vDpjq5iLELto=;
        b=G7Fchjo4t4hxeSvA1yAiLyUlrRrfZRx8fWPXpNaXDnxtzQKlAQ0UvfoYUakdTtBSOJ
         f9DYDJzOKG3Q0xBlMPi02HfzmoMbNGxtnXP9C2qbLt65UNEbMXGH/bx4urViYurq2pL4
         9YkKXEpcgT5AMApyIY8zSAc2IrOO2fInL3lcKen8U87iKLONor/gy+jzSk1UHjCqGZBG
         SPXwpz1Wml5zOicWNBca2Rhp9VVyrU3guWsUSM9kB70DGXFs0XhUpuS84xow+UKRNZPg
         V7oNDgd5b/PA0XLn4MFMHxPBmRfs1aZPjj8IDMuQGRJ9b8fkBrrJczvZI0A365M6Y6/6
         leKw==
X-Forwarded-Encrypted: i=1; AJvYcCURGt+iM7ZoxIbjY9ijn5jP0dO1rea0onDm8+3e6BJ0waReNLk/kT6f6KtYAv+8lPVdfouRY84Z6/MelA==@vger.kernel.org, AJvYcCUbD4k4oJO8AzUcWqdwy8frKjlPYpnAPlv8UJ08z/9+uKErOJuQNH2vX7pxZRFdIddyO4FmIuu1e9o7gD+wrIskW9Y=@vger.kernel.org, AJvYcCUhInyFX90000YPGWD5t33NZxLTVermbzwrIjXjJZbr1i49I6LLlEuNEz1t+ODsFK3DvVdTtjnbZ7jR@vger.kernel.org, AJvYcCV5/nNk59N2hRer05pG84s59lmRpgRVLFiJXgYErapoPP8QkpizouccW1UXoDdNPCBvkgje70jqwvEhEMQ=@vger.kernel.org, AJvYcCXvoaWHDeLjm9uezl6b9Q+qCOq+tyxTTZYgAWbAZHmz6lOk/0MNaK9lthx5qRY+80OjLOGU/m5cjtsnZsT2@vger.kernel.org, AJvYcCXvpmj1M0bBTzVuR5/OemfCUAmOfLTwQvhr/RWKSv1MVe2O3NnrUexcnQEtItCOBoVnJAJNJ3s58kcw@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbpStx08L5XwgCFFwN0Y++k6PBjeLZkjsCdLC/9jkvADYdXOD
	YlSxjpGvb/MoreUay3ryQU1Iv/q3j4Z41z8e5KwbSGrNgarliJR4KrO/78eK
X-Google-Smtp-Source: AGHT+IEjFv2YwWwSsE6AvnoEm4qKS9NUpuGrVJVh04raCcfhJVFWxqJl6wIAH1s8zhveIuwuh4U/ng==
X-Received: by 2002:a05:690c:610f:b0:6e3:1d8c:1224 with SMTP id 00721157ae682-6eabf0589ffmr16184547b3.20.1730906529019;
        Wed, 06 Nov 2024 07:22:09 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9a22sm27907647b3.8.2024.11.06.07.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 07:22:07 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e29218d34f8so794350276.1;
        Wed, 06 Nov 2024 07:22:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVF974h96kthoFbYZNfc/4fqjiThIuof49Kh7npWSFc7L2j6HDXb6GDX8lU3n16ZVGcPAi+v+GtQVBTmPmAVD9axGM=@vger.kernel.org, AJvYcCVFS9rYpKNwPYbtCAXWVc90oAfZV7VeBLS+WzvchR9fQvGwccLCxxYZBTW+ArlfQR/7iNSPiyJkOCnh@vger.kernel.org, AJvYcCW/+2gJeudEQVE0fOU9INpEbzwJnZkuAV2rfKkeetOV/DDm3a3m3Vh1TXkvdi/TQCmfX8qYNWGrOezu@vger.kernel.org, AJvYcCWQ8l2KI+xtmLLZPEtOPsy9putGeZ5Xdbh5UScj6lrf64qk6yOLemlble7v+I1g779j3nzu+mxZnBXUshk=@vger.kernel.org, AJvYcCXOsr4k84yF3hlalbxCau9ocUBqDBp6C5qk6jNm/jWmz1TaVQdO4JMKf4ZF0z0ChVak7rmA+p+YQwzLwA==@vger.kernel.org, AJvYcCXZPLyt6WqpeAXqnyr9oKWQEeBltiittQiTpPH7bKJrr5kFyA8jKqA93giVmrI5szKoiG3gV4GTc9A2lvb+@vger.kernel.org
X-Received: by 2002:a25:8243:0:b0:e30:c930:4af8 with SMTP id
 3f1490d57ef6-e335a9c8793mr2201505276.3.1730906526105; Wed, 06 Nov 2024
 07:22:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWxmoUQSSnAVdqhpTQJYvUCJTL0EZbdKmLLhFWi8UCGkg@mail.gmail.com> <4e233ebe-b0e1-4b37-9063-bdbeb5980b13@tuxon.dev>
In-Reply-To: <4e233ebe-b0e1-4b37-9063-bdbeb5980b13@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 16:21:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrKoyRuaa=jtZ5SJ3OX8ytGyN_jwv2uKX2ohGpg6yiuA@mail.gmail.com>
Message-ID: <CAMuHMdVrKoyRuaa=jtZ5SJ3OX8ytGyN_jwv2uKX2ohGpg6yiuA@mail.gmail.com>
Subject: Re: [PATCH 12/31] ASoC: sh: rz-ssi: Use a proper bitmask for clear bits
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com, 
	p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 6, 2024 at 4:17=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
> On 06.11.2024 16:56, Geert Uytterhoeven wrote:
> > On Wed, Nov 6, 2024 at 9:19=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.de=
v> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> While it is still correct to pass zero as the bit-clear mask it may be
> >> confusing. For this, use a proper bitmask for clear bits.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/sound/soc/renesas/rz-ssi.c
> >> +++ b/sound/soc/renesas/rz-ssi.c
> >> @@ -331,7 +331,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ss=
i)
> >>                 dev_info(ssi->dev, "timeout waiting for SSI idle\n");
> >>
> >>         /* Hold FIFOs in reset */
> >> -       rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
> >> +       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO=
_RST);
> >
> > But you're not clearing SSIFCR_FIFO_RST, you're setting it?
>
> The bits should be set to reset the FIFOs.
>
> By "Use a proper bitmask for clear bits" phrase in the patch title or
> description I was referring at the 3rd argument of the
> rz_ssi_reg_mask_setl() function, which has the following prototype:
>
> static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
>
>                                  u32 bclr, u32 bset)
>
>
> Would you prefer to rephrase it in the next version?

The idea behind such functions is to pass a bitmask representing the
bits to be cleared to "bclr", and a bitmask representing the bits
to be set to "bset".  In this case, you do not want to clear any bits,
so the "bclr" parameter should be zero, and the original code is fine.

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

