Return-Path: <linux-gpio+bounces-18668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D91A8427C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 14:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C98B19E6F0D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4744283C8E;
	Thu, 10 Apr 2025 12:07:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C9280CFF;
	Thu, 10 Apr 2025 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286828; cv=none; b=sCwXMl56rR1V4hbAyYZUf3sjq8saW4aw6jM/2pXGXujSIqwGEKsIw7F8yKoFwQAIQ7Tn8y/HN3jH2fifNUQRS/1KfXwJzagzakeXkri+UiPJiB44leOKTZxjtKDcTiz9EuE6qUN9VlcLiVem3OHQ/RMboe2SDJneH8fvudOCpsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286828; c=relaxed/simple;
	bh=FsHvlmClM0GMqX9no6wWpUpR5lKtX5Iqyq8UgL37wdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvSr3tVi6oXaOx1hiO3fo/Q9a9qe7EfbMJ8i9dMdxloq6h7q1ld/lKB8fMDFLhH1nytKl0h2Z1DJN2fugIb8d0VT97I/EcVKToQRC6teslvfix7vf7T4gROG7390KOZkOSvcinjIlCrcc2HOUBhIarlnzdK7wRChP8hYE5p9X44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so689141241.1;
        Thu, 10 Apr 2025 05:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286824; x=1744891624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfcdHlJ2PMoCxR66t/GSWsV/takeL5uVdDX1C1wdF9k=;
        b=NgCbZkEfS21bpIqdRx8w8ZiQhxLjnVd6/UeDoEUZKbgs70AtohmLAaBS0HjX0zbDs5
         SxlWwq2m7iU8qTtwdgnGUrQn/G1dQzKQZIYnHeAIdiq5P0ZJ0H7GwzjH+T68W/ejdf2j
         9sPPkgJ0cBZtCA6HHfkp0ZwbhShY4y4oPvzWk6aAc2qze+vEq0t+8yuowQXeTA9goPs1
         ON+f6UWS6BUI98GaliZaHDTK5LnRcwSed9h8SxR+w3iSwYVSZ//juScCQa8WBIsIylYG
         eXyLjnIPWNDnhUchvzX4oRWcnnJaVj295OHa+QoEpVaG5uMy7+22uNm//3oIPRMtOmdN
         2EDA==
X-Forwarded-Encrypted: i=1; AJvYcCUBmLRaMIa6yB+Aslv0xv4qpS2yavmd8gT5Z6jwb/qdC2csd5vXMZjX30sHIUFeqpxHqglSKBGZAdPjbkFYKzNGm4w=@vger.kernel.org, AJvYcCV/WN7RJodCz3rrvmfMzFYTCJyjl41vE3cmvRvt2+YYiPRkU8vMPWzUHksWijHu8wbLv9DJ0IZLKM77@vger.kernel.org, AJvYcCVNh6vibCk/iMd+k+xayTimemg5oSOyzFkQuYYhXJ8U6d9WQQYc/lfmV2DhrngtOk3Mc/4G23i/LThj@vger.kernel.org, AJvYcCWww0gkIwJVb03CMoi9a3opSDO1POYFYgIZnZViNkWxmG3lIxPt47VBElzVWjyzc+liiW9vLPv7Zz4K/g==@vger.kernel.org, AJvYcCX4XIXz1XV/jEXtysGDJcTt5T7zyWXAX19VW2kaSFBMQot7h8QmV9Nb0Z12dDW3clHDwpSlNlNDe4F6zaBF@vger.kernel.org, AJvYcCXY81wYWg12i98HPcI37THJ9S4D3YinOALvEt6qJjEG7r60j/U9NThn8WUmTKkNpCScWkWSuQkRMF3B3m0P@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQoLvsFvqtXBD6DGkdelW9ksHwnwCbC1d7ysuyxec/SNBlmeO
	AcD3mAH9htVYIQOno+B6fEtnIZKqySYVVecebY5+b1Imo+6laaq67AxJZMTFVb8=
X-Gm-Gg: ASbGncshIC5F0Vb5b5yVxa9lwYG/HwLRSzhTCgEz9+eFutuv257H781q/NMfbL5/Go2
	FrsF0u7XzHmz4qSnbiGxRhjpOg3n0S4tdABj1Ic/4/ZiG1eNSn/WAYC5P+1WFypO/C11U1OSSSZ
	obemsC5bWOBSSWLFcJjK30RzTxgbqZEVrlGu+VXIrkRhHW2n6HANEMDZl+3RuEKdwx3e4BE++rm
	SHVPJ209ijphz15ONDt/2+A1WoeiJdYpSgVeomgY5Cc0svSwGkxWywTbrQSvZ60C+CG+QozLbTs
	95CioiknMNDdoD2UYKeE1BfBxwmBP+jOBGgNLy1qsm6rH+7hSsJRomCd5GfcpgBZlmFS32wCZBe
	xdZg=
X-Google-Smtp-Source: AGHT+IG72Y/9XubavCVGulTQleGDJuPaNQQLIm5s9ZmgPwgZq9cOF9NZ3VXwuwg8q0LqfySIQgH3bg==
X-Received: by 2002:a05:6102:5615:b0:4c1:83c4:8562 with SMTP id ada2fe7eead31-4c9d629409bmr848750137.13.1744286824487;
        Thu, 10 Apr 2025 05:07:04 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c97a2b38sm546308137.15.2025.04.10.05.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:07:04 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d5e42c924so621235241.3;
        Thu, 10 Apr 2025 05:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC6OuHm1X9jUiCI6OvorxOo37Ao4sLNXezP3C94AWcNCs3OiMkuAuJOxeX4HK0vtsMHl42Jv06ekztge+F@vger.kernel.org, AJvYcCV2jUrsMkXmyt5IZTaC8vo9UDlXLoBOKL9isVoawF3sVS+b0LGsHcUeH9FQwO0PkPeDidy++DH9CRxNFAKDTBxEZbI=@vger.kernel.org, AJvYcCVhONVDvTgbUe3R9uXwEPi8VfA+XsanbYZP/998rpwsaCyD47avO9ExeVWhN27q/7IQILdMB9M9DgS0Ww==@vger.kernel.org, AJvYcCVrNZ23cVNXIpRJ5B34oO/c8sGSbCYKSkTc+zY0TwhdbF5LVPb9g7wX+sV/ibiEr3Y9UFMVtxpL6hkBB4K9@vger.kernel.org, AJvYcCWK7ZmgAlqs+WSBuoUPJ5a/Kqrk7XBL0x1QPmtXJTtO81IYVajaCVYz0oe+5MeAQKWo61vUlcr5PppY@vger.kernel.org, AJvYcCXJCuUoBYGARaCDRj1kmxBAucC29BF94FPckFp1QSND9e5AR07Uxx3751S1LKty1AGcV4iwRAhR1GIc@vger.kernel.org
X-Received: by 2002:a05:6102:3ca8:b0:4c1:9526:a636 with SMTP id
 ada2fe7eead31-4c9d62c8d5amr914699137.15.1744286823794; Thu, 10 Apr 2025
 05:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 14:06:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYfe7oUp+2QiHbBqxb3zKUYufpZHJQWmbzD1cu3TuRxg@mail.gmail.com>
X-Gm-Features: ATxdqUEiNZxbpljvmV2Rh2j3dyixwd3mbyXsNxgjOyX-oweSfY5v8rMCzTpccpA
Message-ID: <CAMuHMdVYfe7oUp+2QiHbBqxb3zKUYufpZHJQWmbzD1cu3TuRxg@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/V2N EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the initial device tree for the Renesas RZ/V2N EVK board, based on
> the R9A09G056N48 SoC. Enable basic board functionality, including:
>
> - Memory mapping (reserve the first 128MB for the secure area)
> - Clock inputs (QEXTAL, RTXIN, AUDIO_EXTAL)
> - PINCTRL configurations for peripherals
> - Serial console (SCIF)
> - SDHI1 with power control and UHS modes
>
> Update the Makefile to include the new DTB.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Followed DTS coding style guidelines

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts

> +&pinctrl {

> +       sdhi1_pins: sd1 {
> +               sd1-dat-cmd {
> +                       pins = "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3", "SD1CMD";
> +                       input-enable;
> +                       renesas,output-impedance = <3>;
> +                       slew-rate = <0>;
> +               };
> +
> +               sd1-clk {
> +                       pins = "SD1CLK";
> +                       renesas,output-impedance = <3>;
> +                       slew-rate = <0>;
> +               };
> +
> +               sd1-cd {
> +                       pinmux = <RZV2N_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
> +               };

I will sort these subnodes while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

