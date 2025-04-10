Return-Path: <linux-gpio+bounces-18663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A2A8413E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A53D71B80063
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88AF28135D;
	Thu, 10 Apr 2025 10:54:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234644690;
	Thu, 10 Apr 2025 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282464; cv=none; b=Z68Uk6fVi2k/DRaQfNcomp/OW8fRM36BkmI8Inkj7QSdmooSzlzczZ7bH6VGT1gBpHuC5VjhdiUg64OYHau2tcwz8OShlH2ps+lont/DEnTiLiRt+ur1KygBO421+fUR2mT+5jwugZY1PYjdqeXuQkzmjWRhh2s5/Y1hVqSJRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282464; c=relaxed/simple;
	bh=3ZjhVQhXgUVzl7u2Q1b7HE/KyGfPJMzUjaTDhjtJCkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmOIMu2yk2V9A5dw4KOQifn52bjVGHdFRUQ1sdObF3mYnGD77k/wDJKvozt37olOjyPz33BLwv6Dv+nULmhc37WZxSItjbqaUiocgT/GFcPMqI59P48aLqIz1NmOQBwUiBbW60gOU6vU1AcetqLsoOEAnIQOA0AVOAkMcCgUwng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523d8c024dfso328187e0c.3;
        Thu, 10 Apr 2025 03:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282460; x=1744887260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXUMzxyY/nqVjyTK6tLM93ONA5mg90DxuHmVhn37KJU=;
        b=eO1ENlqFubPYmoYzDaxWVi6mRkK6atCFiGIPzkC7GrVNdXmX57i/jEjbwFTeEmOV9r
         83GkWtDJ0aJELtg9nkXKuvyUOSazJeHgrQuiSqP6Nx7n39b7lUCBWnbp0ey3JeUyIC5l
         hRNhMK70HeMBSowAG3uFOHj4Y3o2hhW9nycvou+UxUz8HDzb0Ry+n650cqb4F098dm9d
         y+51aeXV0Xc/Q03amAWqQssS0F7hVn5K2rxHpHKaidaYkumTrFs4U3QRCEm1PmBEedlw
         SVq7JgLd4CTJJ3m0FtRJufF+Vm7yE76uz4P0xe8PU8IISbU7PSrQOOiKnI18RTCEJAY7
         E8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWf9RjCZXLWFx3aEvk/YQAXWfZuZ8YprSKTzmzW/sQaQIswG4yROyH058xVbS0F2ugntt0esgOVHVZ@vger.kernel.org, AJvYcCVb5cczj7NxYv29/wqn9BRHCFuxxoR3XuAFc95qC3QfhOXqx3rojUifg3ahmFqdKjrXiYNGGjBj3nkb@vger.kernel.org, AJvYcCW352GHpY7zO65PuF91DAzvxWoiftRpdM1zJnA2pAnHmoiE11JUw8m+9gWcWcsOfYuQdWRWk46FPFC2k1+gA2PK25E=@vger.kernel.org, AJvYcCWMERGViYa/U0X/rHvFOIWBK0XZAuXNVFqf//iD9sjJAGiV6vHQSsj1jt0avUVVmwXKdOhpGhiMVaOzSw==@vger.kernel.org, AJvYcCWYOillPIO8iVsXIK2BJyyqwGlS3+aT3r7kO0XikX6cT1CsXbt5TKgUWjk4MLXZkR0iv4lIrSvjYWFPkIKg@vger.kernel.org, AJvYcCWhuY3uZyM4Da2WLi4kjdaZo/Z79H8tE1gDwstZFMw0OZu5tS9j7OUQoTGtyrkCSWRk/YSNgrlE4Nq6im3w@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa5BGxhexXs9PqRrqCvVVV6mvQzMiZotwDNOBXYJcngZzbwNhv
	vMthPWHpFJ0GwW5G6ZAQnVmsqALZxHK9V++ZNNY3Ttzm0e49HnCxPFIPTamAHxU=
X-Gm-Gg: ASbGncshPvvxHbkb/lIshh9WKWkBd0VVYs1ojPe3rhkYSCKVSYdFUf9FX3mvEg4TvW7
	opehDLDg1EHxeHfbslSo42OLg5NdH3BUogWnU2zmYa6XQ0+yYCLJwKt10LREqXvhNsQppmJzR7b
	wtS5wCEI6KiG6ohFFXdOJp7VZug/MuAuiiA5nveh6BfCN/1okxafc90mFTWhUuvaHaqa8uoE9hu
	nbcJTQimDEV0SCJzsmgXkfvJWZnGR1kDWJKwTn0dDu46uiaYi+arsd4syivx3z+yPh3vTZcoiw1
	H1uIaVAXVEv8Tdjzwy7Od40cQ4u8xm+RZnR0erXBgDbVvBhhUWjP1qNZ9AYZRie+Vau6ze1ZmSr
	J8HI=
X-Google-Smtp-Source: AGHT+IHwz11FwEkx6cPcoDl6QKzG3ooSds31KlDSUcjiq1lKQgZFFG2dU6vl8FwJWRFsishUF6zt+w==
X-Received: by 2002:a05:6122:2503:b0:520:61ee:c815 with SMTP id 71dfb90a1353d-527b50c5449mr1287712e0c.10.1744282459999;
        Thu, 10 Apr 2025 03:54:19 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abeaffd7sm594896e0c.40.2025.04.10.03.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:54:19 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86feb84877aso258346241.3;
        Thu, 10 Apr 2025 03:54:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7XeEQpGKdHTh8jntjW8Cwd+I+Htt2FO4hB+3Mdp3aIgN1tX4R+3Fs4qOscAJMuLTNGKhXuh9l6A1O3Sga@vger.kernel.org, AJvYcCV6u2LP77s08FzSHdeyimE3o8CMmk8fWTiFrMkgM58guLFMQL5jgHz/MncwqgA/9WAQhEk2rP6IwatP@vger.kernel.org, AJvYcCVbC2VkvphiMlMPI405fBggUHTlnMzEsdxDNiKnM2rbQuBzt1BocsKFBwH9sZayRme7Yb+9MEVYBcga2A==@vger.kernel.org, AJvYcCWySSeBe4NxVRjHvxlDReQJbtaaD+CxKBg32nMR7xdr1SjaMTYN3xNcxiOZDTNfuIF/eibP7kyuKd68tH9X@vger.kernel.org, AJvYcCX00r4x6GWJqcrdVot3UzqD7Nl954hUuoCJ0jYxiyMj+VhszioGKIhv80skIUymsUw/jMwcmw0CJ3FGjSos+zvbnUo=@vger.kernel.org, AJvYcCX56SN5OjXLfNwZVFum0Jvvtz8QocyNHKTQpAJw+KHpEcoblCoWjCyr7u2RqB9IG4KNCkNm1PYSN++H@vger.kernel.org
X-Received: by 2002:a05:6102:801b:b0:4c2:d9d3:2aae with SMTP id
 ada2fe7eead31-4c9d36198abmr1337432137.21.1744282458991; Thu, 10 Apr 2025
 03:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 12:54:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWV97ctfp+DbxdZ3c-X6hZBH9zapGEzcfp=tQ-hxt31Tw@mail.gmail.com>
X-Gm-Features: ATxdqUE7PELT4Lw5P3qntvJhQDFcgQm2dlv2Lg41-N-sk1QDYGCAafq2mdBKoxw
Message-ID: <CAMuHMdWV97ctfp+DbxdZ3c-X6hZBH9zapGEzcfp=tQ-hxt31Tw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
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
> Add the initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/V2N (R9A09G056) SoC. Include support for the following components:
>
> - CPU (Cortex-A55 cores with operating points)
> - External clocks (audio, qextal, rtxin)
> - Pin controller (GPIO support)
> - Clock Pulse Generator (CPG)
> - System controller (SYS)
> - Serial Communication Interface (SCIF)
> - Secure Digital Host Interface (SDHI 0/1/2)
> - Generic Interrupt Controller (GIC)
> - ARMv8 timer
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
>   SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
>   in pictrl driver hence to keep the consistency with the
>   RZ/V2H(P) SoC these macros are added.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi

> +               pinctrl: pinctrl@10410000 {
> +                       compatible = "renesas,r9a09g056-pinctrl";
> +                       reg = <0 0x10410000 0 0x10000>;
> +                       clocks = <&cpg CPG_CORE R9A09G056_IOTOP_0_SHCLK>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&pinctrl 0 0 96>;
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0xa5>, <&cpg 0xa6>;

Note that support for these resets is not yet implemented in the clock
driver (also on RZ/V2H).  This is not an issue if the pin control
driver does not use it.

> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

