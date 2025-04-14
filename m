Return-Path: <linux-gpio+bounces-18769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C6A87A99
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031A23AEA8C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A8625A626;
	Mon, 14 Apr 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TahVKnII"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CA615DBB3;
	Mon, 14 Apr 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620027; cv=none; b=KL0x9lxJg1JqMMnj5Ug1dKMuNRXK13vPRvTpVK/q0961szpxtzDWFFwM1NfgPs5+gW4a2hZ8xws2KgB+wPQqUT+jZmD54z1hEAMkOQUMWOM2V2/YrTMDU9JAjavp0sGy07qw9fH/Jo/V3RORFF1KrRUQjIAzT2QOMC9ymgbgiIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620027; c=relaxed/simple;
	bh=zKaosKnqxAEMJEQPHKc8iNMMQCXDKe5oSZ2DRY1bgWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDTS0SfRcYUBzHsSZ0PdPirLhMnQG5H2PlY2MT7foLYiFEeNe4vCtvJtwGYdb857hB0SpCTnD8jWt+fHjM2hTrKaHxQxUarJuQ3aVvqXunKWaEuis+ItMvllnv63RRv8T0Lz7aC5AsSZGGjvG6aDhbFoEj+HFnjo2djbqmTPUgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TahVKnII; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-524038ba657so4055770e0c.0;
        Mon, 14 Apr 2025 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744620025; x=1745224825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWMxGH9MN2lw9UiJgZXH2sA9J8cJGOnXvoh40QjiLJY=;
        b=TahVKnIIsRU1HpboyrV0cL4n709KE4bPEkvR2NpKjrlucZaR9DLKDCcopa/WgWjK27
         wE+Xb8b5Hl8YajAR3Qu0YQgi6sTZLNOD/v3FhOiBC/qf09yPtSIpaOYu049QRv71HIxm
         6GjxJD/c3n1WBJVMPsB2huoWJJSmlywNX7sHyfBQ3usgg7M4mLVD2t6/Za7F80FGQV0f
         PJ+Q8eFXEu+pTk01RwCMsm8usb1W1vH/Uj2DwL4ONalv90LEsH5gNJb3ERPikai8MoFG
         rRhdy6fHAKatQ3FIrpxeYH/mL2fJtW2zWT/SioQo5gvyo/cSc7mSubafE1axgvvgH88A
         MtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620025; x=1745224825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWMxGH9MN2lw9UiJgZXH2sA9J8cJGOnXvoh40QjiLJY=;
        b=a9UNQdAiC6yGMweuMBaImSir0QiwfAloTxjBvnUlqAKNObXWNW8qSOWBJ/66rKt8T1
         0vtOt3g0cfLLUe8RJxJDiaOXCkkxngMUifuBkpJvnrTX7GcFPVZCU9MrDLwXif1QBldH
         34am4fSxlVMFyuiiKiBCpvYpPIlLKgAfY8SV2i+gGgpdZBdUszsr9kXr6/usNO3MnxSL
         K1GOHn0iagDUCFFCFpQCI9q/M4z/nMlk+sLAYeyQRLDGYH0d7ZzB//ErhDzwxdi5MW65
         /DXwUQjJXXHnqrel3ATiWlCIPOESccMIC+6/44mX298WUSC+oeMO4yRrnqqSWycdrdNq
         w95A==
X-Forwarded-Encrypted: i=1; AJvYcCUgrR4sR0mcD1qxUIBgd+M/JMZ/zBby4oRF6k9UsjfQEJNFz5kn1m+jiLkP+edJCDFGNBw4aiHTyD8njM3T@vger.kernel.org, AJvYcCVXgUQ9yDG1IvWfptbupnWCNzeWMrZ8Eyx2WFYnTRFVwR90+hWPqrSJ+/XhvRnoCI9xoTnCrzpNTWiV5XiZ3QaZwaM=@vger.kernel.org, AJvYcCVwfFWIhF/m0OsANW5acaqc2xMdjM62gbyOSsRrH47t9h3dyYciaXsHdAd7alWHPYWP2HJxyXPBJuR7@vger.kernel.org, AJvYcCW9CnbvKKXm3Nqo2ZqeZAPcV6OIb/uptRdMNLGS6HeUKZu8C/nPApSCWrnlYTsrXkF2Il9z5Uw7elUeIQ==@vger.kernel.org, AJvYcCWWbyNzE54M1TE7HQVzK9fe/bast6Xt0P9CJZ9KeqjXX0myxH6qScaVOZcubjg+vIzGe2ToXbRfMP4STXaR@vger.kernel.org, AJvYcCX/D3B+Km0kOkhQdRHKuimlDxBS21UptLPELdkJjaHMjmtEFW386VwKqCxrw3i8NP4tsTSn3c+U7AIH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl6tXJqXXx7BzLTC/4cXTzOelgi1dd0YQfkoWGmA6+UT0EJRpP
	QidB+9jQzY6vqeLps+xuIwCoQKljkhmpSWd0MPY+5dR969LPbvhLCQdeZMTHVcAVXUUJ+qVQzxi
	5hKSvmVs0HHZ96Fw53jiDIdzD7F0=
X-Gm-Gg: ASbGncsPHsYMa3YZvAdQWhQr+zDkFaJtvYo28Kl7L8f+PQA2WiUfDpeO94K6dAWu6df
	Qo0ZVOcWKy7CZ8/WQfV/9YsL/1FGbSs/3WVcxL3IsX3IFKBxV5V7srRvqO6byfQvD+K/UAla4dT
	Gvvg8jsgupJtg0894GH4Vv0P5gRVkG22Gf
X-Google-Smtp-Source: AGHT+IET2qRXboEKhidUb5hBJlClL8RXUpYBKRhEnEi/wLWquyPq+HRgvLZKLIrzDsDjB07VIxygOjghYhgLKS7v14g=
X-Received: by 2002:a05:6122:3417:b0:523:eb47:2884 with SMTP id
 71dfb90a1353d-527b5ecadcbmr12260095e0c.6.1744620024811; Mon, 14 Apr 2025
 01:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407191628.323613-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVYfe7oUp+2QiHbBqxb3zKUYufpZHJQWmbzD1cu3TuRxg@mail.gmail.com>
In-Reply-To: <CAMuHMdVYfe7oUp+2QiHbBqxb3zKUYufpZHJQWmbzD1cu3TuRxg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 09:39:58 +0100
X-Gm-Features: ATxdqUHlsc5uJ7-xCYIyly9sEU832hppwQxRaNf8N6phxVH69LOeEigYs5a45bg
Message-ID: <CA+V-a8vzPuxAqJ8waJWw0TNRqV5FMeuojZ7bxfPJzLMPNdy79g@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/V2N EVK
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

On Thu, Apr 10, 2025 at 1:07=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the initial device tree for the Renesas RZ/V2N EVK board, based on
> > the R9A09G056N48 SoC. Enable basic board functionality, including:
> >
> > - Memory mapping (reserve the first 128MB for the secure area)
> > - Clock inputs (QEXTAL, RTXIN, AUDIO_EXTAL)
> > - PINCTRL configurations for peripherals
> > - Serial console (SCIF)
> > - SDHI1 with power control and UHS modes
> >
> > Update the Makefile to include the new DTB.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Followed DTS coding style guidelines
>
> Thanks for the update!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.16.
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
>
> > +&pinctrl {
>
> > +       sdhi1_pins: sd1 {
> > +               sd1-dat-cmd {
> > +                       pins =3D "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1D=
AT3", "SD1CMD";
> > +                       input-enable;
> > +                       renesas,output-impedance =3D <3>;
> > +                       slew-rate =3D <0>;
> > +               };
> > +
> > +               sd1-clk {
> > +                       pins =3D "SD1CLK";
> > +                       renesas,output-impedance =3D <3>;
> > +                       slew-rate =3D <0>;
> > +               };
> > +
> > +               sd1-cd {
> > +                       pinmux =3D <RZV2N_PORT_PINMUX(9, 4, 14)>; /* SD=
1_CD */
> > +               };
>
> I will sort these subnodes while applying.
>
Thanks for taking care.

Cheers,
Prabhakar

