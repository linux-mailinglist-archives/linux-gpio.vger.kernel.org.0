Return-Path: <linux-gpio+bounces-6569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A62EC8CC180
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D361F22C2F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DD813D891;
	Wed, 22 May 2024 12:44:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6AB13D61A;
	Wed, 22 May 2024 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381857; cv=none; b=n/XfuQkTD+D3w6P6db/UeRqfbgwgkjqAx90oFO9lFiw4yjbTg8WFYRfBTpAq5if4T0japOjJezrUt2xMhWzf81LaRFwWkffAvcgXOVUY9hH9IPQXLMM23d+YNr8HFrbbjUeNO2NUhP6jYpJI1EWfk6UCIkUGh+ccbqDFRBduz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381857; c=relaxed/simple;
	bh=EiN3xmZjGrf5FqymJCw/lgKqJlb1gSHhBc32BLRhF+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1nwMOHDC5eht+6JrSTfdPo69rxELhszc/7gpaJ0mIwfGlw8ZS3tWBAw/i6BsTZdcfg5ELtpSJ/oHQ1lQfKhEFkUI88GRr1xaORFIkTW4/7eclWJTsx+0qpGYtFIjetqnB0faufJY4CmWrl5lJJLCKHvjZLr/0ikeAOUblKXYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61bed5ce32fso49441197b3.2;
        Wed, 22 May 2024 05:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381854; x=1716986654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ucyg8fHsLLOL6udU8E/THdPub1Fnu5dEytzsH3zIgzA=;
        b=ncEdHAjYyOPW0qzn9rnx5BGxQfyyFPqKXwLI5YvVq73qb23lpwZdxcELmEGsvU2mp/
         LSFtlpv6qj3m28pkgsODWiHhxqfWVw6e4f86rZzJtzbTEBk5WQpHrBAguk7zIyP6/kUF
         dsAIPoQJXaDb6Cg10WlPXVGLn/JtVVLlKGjZ5ovDT1GRg3AIJ/aVv0EGu1jovtBu/enp
         c6fduWgOWnt1qe9KWspOvP3QyGnTt2i2pY7cJGw1lWSQMNIZVstf8ndZ2wVH71lRb2H/
         L0o47y/9LsrnkkOsSKytj9Qq+cfQtp4gaXzTCvTdm8nA1RNZqWdGw+4PDCj+NZXycDIL
         jqVw==
X-Forwarded-Encrypted: i=1; AJvYcCVnot/pfevaC6sYL71I+MVybTTna3KlGJZ1HppwYbHRICdVuVIvjmfjTGkgmoAQpiQFURgmuUA8e8vu5Y1N9RrX8aEpqa2kZT0RRwGUZOON1niE4ljf+VR3b/vEPakuBipG3R9YHNFNmWOhJONBmGhgNDPZPU5hVQ+OCq0PdpBaTNzC/q2ydLFmVrnWmbRAjcFj3OznJkJ60gtrrjApPL1NHcNPndptlQ==
X-Gm-Message-State: AOJu0YwgFD29V2RIsQDjh1SJRovoPkEXwaLefZigSXmaO+oJDgGUm8bw
	+9Y02ZP0kC8MkZqtSdI+eiSfVRHZqcb1fKc2YOamynTiVLdEUZYEZWt5Xdro
X-Google-Smtp-Source: AGHT+IGtgJVHQX5lsGe464yjKaN7CnBTHOBYtjhX9zut22L64ZPbLbJJ54TzZIs4rGJRPp/oe6KYtw==
X-Received: by 2002:a05:690c:d8e:b0:615:1527:aa2 with SMTP id 00721157ae682-627e46a4cffmr24420637b3.10.1716381853792;
        Wed, 22 May 2024 05:44:13 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e234816sm58227207b3.26.2024.05.22.05.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:44:13 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61bed5ce32fso49440817b3.2;
        Wed, 22 May 2024 05:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJVethaYJIkPOBPh3rUVXpB63vbNer/Phn3no1JpS4xWF41o0+QIJkm2kJg+OAa5Ico/hmWwRPmZLKxhGsKGwHHZyv+q1ITXp8FCI0qr5cYV9S+OHTqCD8S5epFRrLU28slvUVyR1DUgUhmgl0G1bv9FWEwYssww0q2DAnYZCzpz8hfPyCuweu/FdKDYdfoxTTBhG4MGUCyOhu49NIBSP0fnaS6IYANQ==
X-Received: by 2002:a81:7186:0:b0:61d:fd3e:abe5 with SMTP id
 00721157ae682-627e48a417dmr17328727b3.52.1716381853122; Wed, 22 May 2024
 05:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 14:44:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBbujS5VV3VKe3dtRfZBPoMZGhXn_8g13b=F0WUj+OAg@mail.gmail.com>
Message-ID: <CAMuHMdVBbujS5VV3VKe3dtRfZBPoMZGhXn_8g13b=F0WUj+OAg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for reading/writing OEN register
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch introduces function pointers, read_oen() and write_oen(), in t=
he
> struct rzg2l_pinctrl_data to facilitate reading and writing to the PFC_OE=
N
> register. On the RZ/V2H(P) SoC, unlocking the PWPR.REGWE_B bit before
> writing to the PFC_OEN register is necessary, and the PFC_OEN register ha=
s
> more bits compared to the RZ/G2L family. To handle these differences
> between RZ/G2L and RZ/V2H(P) and to reuse the existing code for RZ/V2H(P)=
,
> these function pointers are introduced.
>
> Additionally, this patch populates these function pointers with appropria=
te
> data for existing SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - No change

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -261,6 +261,8 @@ struct rzg2l_pinctrl_data {
>         void (*pwpr_pfc_unlock)(struct rzg2l_pinctrl *pctrl);
>         void (*pwpr_pfc_lock)(struct rzg2l_pinctrl *pctrl);
>         void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, void __io=
mem *addr);
> +       u32 (*read_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset=
, u8 pin);
> +       int (*write_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offse=
t, u8 pin, u8 oen);

Please use consistent naming: "pmc_writeb" uses <noun>_<verb> ordering,
"read_oen" uses <verb>_<noun> ordering.

The rest LGTM.

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

