Return-Path: <linux-gpio+bounces-18768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A88A87A91
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84EF53A9D89
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C0325A62C;
	Mon, 14 Apr 2025 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7UCw93U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E511DB548;
	Mon, 14 Apr 2025 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619943; cv=none; b=Wq3r7xXlwiZ5IPKBUAQLBIBChjtaowXC/Fqw34TZno4Qepzr8xQXXICJgwAr1muoyJpJyqdg3IzZAVBnaUODqpqlj3KbnP5wGuU6hkKk7o/jkU89nxtK+cj8eIGxG0uMS9qCB/dxnyzrF+bHST7jBifaRPXanwWuJcc9I+lJMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619943; c=relaxed/simple;
	bh=1pYizhz20oToa6cWJxrwH/gUKSxRyRkYLirNJj35J1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+5l9PDR94X0yZRXpHJnG4nqOso/pZN+tH3GowLdW9awDJ7fzenGC1lqJxFY+jJDz2FyR/pHFKl15tdyyJ8Hj5f8AEz1q7/uwbAQj04ujBFKr1Ft5vmAN/Xam0Ug0ZPGtlRFWS/Qq7HJZHu/7/nrJbHpuy5lYKSBfOLUoydv9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7UCw93U; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso4572982e0c.1;
        Mon, 14 Apr 2025 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744619941; x=1745224741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTy2dMzAPbwuVa9TxRLDUeltXU5gUdwfv5c3E4fDx6s=;
        b=R7UCw93ULDiyrmkehnlhV2aA5lWLRWf8Oiy/iWjmlhitimo1kZjJW3jd6ssEDHFPUp
         1ID9JUVbJ8TQ6k1nlIxzaTOF7oV610XSPfPQ6XEV8QQTYLuEtH/zAFty5iuG5KlNw11B
         ZldLokEHVPDT9G+BeMPfjcTyA7Zz0bvVdZNQGWI7Ubbi0FD0WQb6Vqk+n0fgIFfM/mnH
         sxEgM7YrGzHaRuCGD2qa1THzMnBANbOu3ES32CwEzszOfaiQ84FAsSJRXFiBlNhk2GAM
         g4toQGPvFCW+WkW80/PfBW767fuMcwoIbsDtkRQg/zYnaJIg8SCnF6WeQqFfKFEnE8B4
         X/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744619941; x=1745224741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTy2dMzAPbwuVa9TxRLDUeltXU5gUdwfv5c3E4fDx6s=;
        b=ScS6ODxzA7xaB928X0JPnuCLyqtaB+lLGyO+yBYxDfrdlzYBhxUq+GK3FG/pt/FXto
         LzdSLhi7YPFmRoRTRHTWrzwABQHokA1cdorLyHXDDtKJwr1TVAJu21ydVF3WqNkuw1F+
         Er7u0vyz7hwILQZ7A2ylMGzj/g7DVofvz1V3yNmLIYKG0h/yO7yLuEPwpJBpSbZ1uPOX
         cq1dbo0ek5PggiO7UkU5qxrvLzfAFcffG6ubcoJdJd2o2Wo+MmxclxiBadZPOdkVhKWI
         TI5XZAAkP3bK1daqTeyV33KrFYg3XeAcRcRS1qmHW1k9YQmN7pDYL/J/I/sgJyNrlbWX
         sCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrZK1QgX0qKfFFd6TR0msDn1aDJ6Tv98zAWqD79P/a1D1Ds1eukz1eNKv5aVWK3Sne0D0E9jDoGrkZg1bJ5qPjl/Q=@vger.kernel.org, AJvYcCWIZmQABIMS5ull83GnZmD0OaVRQsR6ubDu2SAtLj2JVi5uizSYgXToazdpLUQPocIeJPhq7oApLtfD+fpk@vger.kernel.org, AJvYcCWUK1Vp6ZGsKPCfHl1OdAy5Lx3doOAvdGdS2TtuRSDsyPhirZFOXlcJGiniEvhY7OmIbJ2GosITJ4Lm1EJz@vger.kernel.org, AJvYcCWZp7NTFuQwOLJMzCxNoQvn9junbO6snSiEN/GE5qOhGyLTH6uLY821u4oKHcCxtXZ6+k+D8Z/TNkpO1A==@vger.kernel.org, AJvYcCXVeYVIAsWDjoEfwW7ypt4nQJVZM2kq2jyitqD2yv5anhnjv+oR9FqeaxSGwzfeHSDa7yRyumki5o67@vger.kernel.org, AJvYcCXjkBeaWbD4X6TsuXVpXKYkzar+kDB7Kd/lZNewppNrKpDwXI3bmxxKGD6w0X9aYSLifCAINc3ucnyk@vger.kernel.org
X-Gm-Message-State: AOJu0YzSmsRoJHVaFvcMjlWV/qZMJr5FLMP9zHz0o1Uu/knR3PuLkgNc
	FH1eJZS0VgdhSUiWnq8sE8PpNU9ar9vhaMuVpKnOmAW9yXwUmtZXeclpD2KzmhP4raJtRfhFXx6
	Jj4cB/eSCOfrNr1ehLJjAsoL1jbg=
X-Gm-Gg: ASbGnctphqaMLMxw/8eNHXIjbgn3+u2lMTmhXrrUm2Xxoe8dxThGZK1A+LcDYtAb5XL
	Bn8LhB2aZR+mf8bBLMG+RRs5ou7WTwjSpDN/R5V3InCgqX6NhDuK79tPg8ULZ6L5sT7nv3aD6R6
	QEH2F0sFVmSY7zk1FjsB+5PA==
X-Google-Smtp-Source: AGHT+IFSFoNvOiSBCPBRkuOl5Uhz3zoZyl4y08/FP5haIRysNk2ejFDXSTZThvetx881XzIBVxPwNb+BF8ztClx7lZ4=
X-Received: by 2002:a05:6122:a15:b0:520:98ec:b25c with SMTP id
 71dfb90a1353d-527c34834f0mr6710866e0c.1.1744619940931; Mon, 14 Apr 2025
 01:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407191628.323613-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWV97ctfp+DbxdZ3c-X6hZBH9zapGEzcfp=tQ-hxt31Tw@mail.gmail.com>
In-Reply-To: <CAMuHMdWV97ctfp+DbxdZ3c-X6hZBH9zapGEzcfp=tQ-hxt31Tw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 09:38:34 +0100
X-Gm-Features: ATxdqUGXA0V5Kweq44jxVUfYGeZpIlKPpS3FeZUSMLwi-wC15286H87_1RX_W9o
Message-ID: <CA+V-a8uv4yL+CMJB-HXAmHNr25_PqPfoWAV8e5OuiAVQnizKAw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Apr 10, 2025 at 11:54=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the initial Device Tree Source Include (DTSI) file for the Renesas
> > RZ/V2N (R9A09G056) SoC. Include support for the following components:
> >
> > - CPU (Cortex-A55 cores with operating points)
> > - External clocks (audio, qextal, rtxin)
> > - Pin controller (GPIO support)
> > - Clock Pulse Generator (CPG)
> > - System controller (SYS)
> > - Serial Communication Interface (SCIF)
> > - Secure Digital Host Interface (SDHI 0/1/2)
> > - Generic Interrupt Controller (GIC)
> > - ARMv8 timer
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
> >   SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
> >   in pictrl driver hence to keep the consistency with the
> >   RZ/V2H(P) SoC these macros are added.
>
> Thanks for the update!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.16.
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
>
> > +               pinctrl: pinctrl@10410000 {
> > +                       compatible =3D "renesas,r9a09g056-pinctrl";
> > +                       reg =3D <0 0x10410000 0 0x10000>;
> > +                       clocks =3D <&cpg CPG_CORE R9A09G056_IOTOP_0_SHC=
LK>;
> > +                       gpio-controller;
> > +                       #gpio-cells =3D <2>;
> > +                       gpio-ranges =3D <&pinctrl 0 0 96>;
> > +                       power-domains =3D <&cpg>;
> > +                       resets =3D <&cpg 0xa5>, <&cpg 0xa6>;
>
> Note that support for these resets is not yet implemented in the clock
> driver (also on RZ/V2H).  This is not an issue if the pin control
> driver does not use it.
>
Good point. I'll add the entry for both the SoCs once the initial
patches get merged.

Cheers,
Prabhakar

