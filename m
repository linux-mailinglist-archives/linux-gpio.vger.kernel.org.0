Return-Path: <linux-gpio+bounces-18049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A985CA72BDD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4F45189A6AE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 08:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B7220B7E1;
	Thu, 27 Mar 2025 08:55:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8E5A79B;
	Thu, 27 Mar 2025 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065737; cv=none; b=hRvMj6vCeCVsrVm5gDiFvsMc72IyGspTR9xqWpxQwTFq5ejSUgcbXd/K2jHxDeUvSZsQ3mlHEqgt0Ex7yp1wrJTyB2fdbgDGnzdTiwPeuf/oaCDd6yMH94vB4/Wwgi5HCG/zB7rQ0uF0LfJadsHnhcmBE7yl4b2SFqngWkSXz9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065737; c=relaxed/simple;
	bh=wvP8K5jCDRc2bxGl9NjMTxlO/EqRfqfDWOCnH7CiRSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJEUyrKbYcrq7Z2RW1DBMcDvL0oCMzt4WxwqE0hxC0lSmiOtkE0KRVy1UpLyLcBgs5nbrs+sgSS/2/P3AsQt5d87QBjag/C3lD02wJKUOQ8RIABCXFfdbF+e1HCeGmhrkJuaNfj2ZVpivpEL/6b2rh8Vpt+VO09EhrdnfsLKXEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86715793b1fso330781241.0;
        Thu, 27 Mar 2025 01:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065733; x=1743670533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wK9lKk51F8Ig4IUd/YTVgiulwDpAR89rwMrTX7A/kVQ=;
        b=hka/0wOydXRExKl0IaJ/Fvix/LnUTmlLWn5gfqs2U3t0D9u24U4CJGPYgWZVUgEGpv
         bHgYnxFL5p3TS+8mfbDvBi6yz+jf9U8EbQ27CIRerI/SRotIrSl8GiHNQdYNVV0agp8y
         IgwbSerQrQGNTR5z7cHPLQnTUOxoWtgeDq1mVHzUAmgLSzFpyyQA/gZHKleynwYTsscG
         3zQxz7gn/z/29oJSK5NoxqlLRM13Xy5nrABOsu8dxIOfXPUXxXOW08hWt9057n1Z0FtH
         /oEwpnFPa4yaq4u5XohNThfyh+ZFpS+6Tk4zb0429fPBwVxCtlrUzdsFFlIhEMobcCJf
         7FSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUM8NWH6R1lOFgd1L+rOS5Vt8B53tba3xW3DztwAznChxF2PXPQ54CdDxUYvPeANG5MZZtMFQkG3hmUglC@vger.kernel.org, AJvYcCUv9w2Kz6gZdWNg8J6cdfLY/RNP+wPDMKNmpRA8F+NXWjDWIuD2N8SUqhssczX7vASj4yojRiyFgzmc@vger.kernel.org, AJvYcCV8uNsFB3DIKdyYVxiH7BKpSXGLrEIAG1wxcTjR9Wv/5vfjh1O5Cq7Ft9DRYVG06SexYKz7EzJhLmbJ1g==@vger.kernel.org, AJvYcCV9IBU+q0/NFZAlmTQKMcJ++qr6wzQtKfsbT6FihdT00ZxvKIbbsvxkVMV2xF6sg+uByIBAOu/RN77olT4n@vger.kernel.org, AJvYcCWjjd2pi2H3VW1GbC7mdn/Hn/edP4qTPzyT0KJW37a2KOeAiCMb/oSVOE3bDEWY+srYO3DxGMrPO4pS@vger.kernel.org, AJvYcCWkW4wYU/RnzEbyjAMIERJR67cSwc4UJVqqVgHVhWz7Qj25drUhFfIZRQOU/vH2MBaqtk8tCTS4QczQ@vger.kernel.org, AJvYcCXBQv6aELkSFmtpMu9P/d2jxLYeoyqC2TOmlgOoSe9TZCbmYnMh3JZTRE3HLNzUMFUtsRTWN6ARZ2KVO3pXpOx8ZyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUat5BP9mV1o8OMihgN0es+CSJsMp+u0x8HiH3nr7HYE0DHT/r
	Gcz07VHtFAwvIp5dxB4XXNT3ul0k1/FPIgqV2eLUeJxI4s5/vQfk3lQxBNtv2ik=
X-Gm-Gg: ASbGnctl7XYluZmZ0vnYJXnSZd1aQPQlwrbbkWbru+FHav0YsuMP0lpXGVInCRBQBLe
	CUS7sdyy+d8eI6vpsEO5oqPpmYML++dUeQ3uQIJSEDnY80+is9KK8V28M7xpQutUFVuwN7jjBJK
	TJ3ze0qx4qDEU6zmNfLxgBbCyzm/iyZhrfwmvGn7geyITbiUyTsYnMSve0v5ILTLU+fXPHSUFXE
	WNSQ0QqtWAwO5WaOudyZw29aaVzZI6ztJsVn3ohx64Wbr5w0CH9oQnoLYxxt7mhsNFv2O5LvJr8
	R4wcEZclvdz/7rrNsnx6yy53lCj+YvH9nFiuqWCuTYFVF1iwhBHSzotXZH/eDAj1mtHbnDt4x4E
	jOLj9HoY=
X-Google-Smtp-Source: AGHT+IEIGZkAkfBiG5Ncpc2NKTQbIdtxmpakKbyQefAVcKv5OwG0DYQ8p0OcMmD0J0t+DXrL8xhiBw==
X-Received: by 2002:a05:6102:162c:b0:4c2:d9d3:2aae with SMTP id ada2fe7eead31-4c5870aefdbmr2195083137.21.1743065732597;
        Thu, 27 Mar 2025 01:55:32 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c50bc55ad1sm2734817137.18.2025.03.27.01.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 01:55:30 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so300916241.2;
        Thu, 27 Mar 2025 01:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5r1xHpXGn5TS3L+RAFQdsT+yFi8tf4WNwY6PM341IIKcQieV8xi0eAGTY+e0EWRv5pw+JRmb1il7K@vger.kernel.org, AJvYcCUiUqJhMWkoL6fjrarxlLYZa5y31jr34z6YZE1gd9kAzirqGlpxLrwqaeqEVta+DY6mN3vWD8it0kZHYc74@vger.kernel.org, AJvYcCVFNFnkK1KakRrDi5Jh0Vc+VG0DMLibmcom2P47acf8IBlikUXQm7pP8cLwPpfZ6X666DAURdq1gk3T@vger.kernel.org, AJvYcCVgA0qHBYp2IbSYti3Jm9i1ItBMx45ypqtSrHo2LMj3lahztzASTQj5na49bLUBEa+KKvnEnAh+kZ0Fm6gEoDLNc1Q=@vger.kernel.org, AJvYcCWqJ9WpvGUa6uduKI8nFUZica+3WDZ0F3fvBB9pwjR14pnfnVsH98JR0f9RyLXR5QwQ91WtkXHXLiNJC0Jt@vger.kernel.org, AJvYcCX2palGYjuidhqxgraiRNG0WUZisYOA+flLRMC7NF0DVVXWZPgx2qllh2w3+czwxRoHHfXvjCij4k0B@vger.kernel.org, AJvYcCXjpI/gj9BghIP4YkfWcp0+osOpe9/croDa46dJ3YemH/xH+7m4UfJCRsXota+k3fVjQaB9QSo29U0zwQ==@vger.kernel.org
X-Received: by 2002:a05:6102:50a5:b0:4ba:971a:41fd with SMTP id
 ada2fe7eead31-4c587074bf4mr2444666137.19.1743065729369; Thu, 27 Mar 2025
 01:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
In-Reply-To: <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 09:55:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp1SYp8iWPpWJ6Tj5rp6ScglN-F4PfZy1-_zatQI8UsxeHgk8YvFPlKy5w
Message-ID: <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 27 Mar 2025 at 08:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 26/03/2025 15:39, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
> > defconfig.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 11e7d0ad8656..c7b41f86c128 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=y
> >  CONFIG_ARCH_R9A08G045=y
> >  CONFIG_ARCH_R9A09G011=y
> >  CONFIG_ARCH_R9A09G047=y
> > +CONFIG_ARCH_R9A09G056=y
>
> So the pattern will keep growing and none of you will ever bother to fix
> it, because you have your patchset to throw over the wall.

Yes, the pattern will keep on growing.
Just like the minimum kernel size will keep on growing, especially if
you can no longer compile a kernel without support for SoCs you do not
intend to run the kernel on.  Not everyone has GiBs of RAM to spare...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

