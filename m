Return-Path: <linux-gpio+bounces-24038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6887BB1C7E6
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 16:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7236E16455A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 14:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBE11DB125;
	Wed,  6 Aug 2025 14:50:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128BF1A3166;
	Wed,  6 Aug 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491803; cv=none; b=E495HQZQ5v7VQtNnYnZZ283u/SDMcwFm/QYDqfSvAc/+HK478BQlPIhAmr4vaH57g00DSgf5nnhibCeb7uKlrT6ZcUiGyhLAdz4MZ102wkh2FUXubx2pAAEfuyLOGe5j3SkH+Ncubh/cdwCworiE24bD3qqmd/lE3jzHay1kvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491803; c=relaxed/simple;
	bh=+6SyK8ZmrEFbUZ/+rmzwEs3ygGgK9fzB69pfZ674ek0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohyF8hKqSbIf5y5Wkt+KNPEd8pu4hrDIRSBDL90d1XQ8hcHOfqOvhRPBu4sDSavcycDKUwPV9EZK1USmOUa7YQCUpmAKLJs/2xSbrMjiREQX5Z8hDMwv48XO68FU+eAUe8eTjh/zrabsLhFhMj5yEZ/VriNYoK8TR5FsT1bUsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4febcc4c93dso3480137.0;
        Wed, 06 Aug 2025 07:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491799; x=1755096599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omW+pjCKzU3olfxaX/yXl31LwCdljgRa62TIZGNkUZ8=;
        b=xCRd0tXgW0O9kHUj89cRg7kcAYECJmp39cRwR95qR3IGG/xJ8hqMoX0GbT/+I3qlOX
         /t+qo0rxGcy3QQVOMNhX6bP8UFLKWFNm540oFggSza9apmO9lHOLSgleSn3tNY2wK22M
         zaz9FbhWykmm5gtZZl+SUKOcdesI3ufLbVcypcRiTXOvjxfGFDuUNXaNjs7rt6FtHDj1
         GZiQJaajrjyqGFUXZl8+9yKtXDJy19b58ZMZTf1/V9f3cXimPVH9VD9L9nldMoN1/Fi3
         1ff5VJPsl1kVUvesAIj70sC+3qfLia4JDD1Cwh8eOv2RCew2MrrzDkMrAZi6lxi1pYBK
         WZLg==
X-Forwarded-Encrypted: i=1; AJvYcCUUBlZ5Dhbhyp7VgiGynd/9miFX1GA1XcWhdbCS4qi05wirLnpjeqeHhFh0tp64A/DCLB7HeyPBFNGH@vger.kernel.org, AJvYcCW8+hkHVODQFgHeZS3QTu1aZep0MMZ9nfWIaMSFy2u299B2+Jxf/MXMK5ayH6en2R6XXX0mYSNfrT26RSdz@vger.kernel.org, AJvYcCWqMYHR7rliLRnOvKn+R46cJz1iqysHkXhd58gYeIUXI6e4nvQLLmmLnISaotsHuWXgEEoJtf3gKc2W9Q==@vger.kernel.org, AJvYcCXssJJ4oLhgeLCkJoAHxVKwWJVeRPACEBoRXhS7iQSiQL6wNqqQq58+Y/XYAQYZdEtSbOn0rCDHFV6V5YkeowmS+wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLAikv6z0XFDrHmCg1OyxyFJrIT1ukKaQQVUXwwsGAyIFcPft
	7raSQQw9Svjud7qBJk8oaGTS6rQdWuBztxRhD7GBnPzVWuZWdgEuThQ75mrGCUh+Idg=
X-Gm-Gg: ASbGncurqjxiHshucyBF7XqV7He2rXNZu8tE3EcH8OjggcQPfshHsj0BC9TDWqVkk2f
	0n8W6kw2rmRnDlZiRLVsz1ZYTfF3LNrQkYTf2KuOflLhVZYIVxDoEV9J32RZT2+C9iCIEy1DPzI
	fSAxvjQEXw6Nx0KbsgHMKewcSU37Njx+HJPA7Bs8pEAPIu5NEC3H+QiThTPGLP77V1klUl5QaEc
	wv9BMJ7WcMn91Wj/FFuLZFHR64qNGP7YjSklauEpsMcP8ga13EnwyIDFo5xGAd0tUZ3dAcc+ZXY
	pf5rObGY8CmjlkkLoNukB+7ck9QlWUA+CMIwFKSZAM0b3cGJecbT4AlxtQvUXMjh9Eyelp7Gmq0
	buLiaYf3z/OIJPEFO4Cifl88gTXi2u5ZXL5od4hpFg4HnTzHlckNQzbuJhGE5X5NwbhlrpHc=
X-Google-Smtp-Source: AGHT+IHXZJt/Qh5JbVY77STVGSBzEQZ98pK6NdWrzDI2Z901fvoz/2pkv7cLkExrLB1NBxwaqo+wvQ==
X-Received: by 2002:a05:6102:4a8d:b0:4f9:69aa:60d with SMTP id ada2fe7eead31-5036a05a1bfmr1517463137.13.1754491799447;
        Wed, 06 Aug 2025 07:49:59 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fca3aea9fesm3123237137.21.2025.08.06.07.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:49:58 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88bc19ddfe3so252018241.1;
        Wed, 06 Aug 2025 07:49:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCyR3BXuOmsMrDyj32Tq+4SI4RrjigL07fOvqTe7ftss+uEPSWO5EzJJtHIvKh53NTjj8yj3juaZOKMA==@vger.kernel.org, AJvYcCUykiynGtqJkjdwhYMpstNMUJraDG7w8GegvGiYjsnNAucbaoSf2WxEkynGobuDNmjNcQD/nEwTpWADldEVTAwTuKk=@vger.kernel.org, AJvYcCX9YP75tXnY/pfaG9CMpR/ucT/KcKBRelpJp6CG1YUvzzybHi3d+kcJ8MCQXWv3yjfP6MS/IlfBnkvt6Tar@vger.kernel.org, AJvYcCXh2wDRSNr/kzrOHucngZCTeh8ZZG9Vn4TMVlKXNYGRYfSR/swjn6oEVg+h8HYnP4b9uk6vAw+BDRrz@vger.kernel.org
X-Received: by 2002:a05:6122:1a85:b0:539:15fb:9f20 with SMTP id
 71dfb90a1353d-539a04e5f8dmr1146613e0c.6.1754491798208; Wed, 06 Aug 2025
 07:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250801154550.3898494-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250801154550.3898494-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 16:49:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVv=AT3G8njFfGU8=gwwGX6G55TdTpspdwX=HBWdsGGNg@mail.gmail.com>
X-Gm-Features: Ac12FXzDu_XNp_pKm2ix0bDrwXxG4DjSW-bObHyakoC8eSP3EW4syyh4bhxCJ_k
Message-ID: <CAMuHMdVv=AT3G8njFfGU8=gwwGX6G55TdTpspdwX=HBWdsGGNg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 1 Aug 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/N2H (R9A09G087) SoC from Renesas shares a similar pin controller
> architecture with the RZ/T2H (R9A09G077) SoC, differing primarily in the
> number of supported pins-576 on RZ/N2H versus 729 on RZ/T2H.
>
> Add the necessary pin configuration data and compatible string to enable
> support for the RZ/N2H SoC in the RZ/T2H pinctrl driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -304,7 +305,7 @@ config PINCTRL_RZN1
>           This selects pinctrl driver for Renesas RZ/N1 devices.
>
>  config PINCTRL_RZT2H
> -       bool "pin control support for RZ/T2H" if COMPILE_TEST
> +       bool "pin control support for RZ/N2H and RZ/T2H" if COMPILE_TEST

Do you plan to update this for each new SoC?

>         depends on 64BIT && OF
>         select GPIOLIB
>         select GENERIC_PINCTRL_GROUPS
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> index 877f6d00830f..55c64d74cb54 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -764,6 +764,12 @@ static const u8 r9a09g077_gpio_configs[] = {
>         0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f,
>  };
>
> +static const u8 r9a09g087_gpio_configs[] = {
> +       0x1f, 0xff, 0xff, 0x1f, 0, 0xfe, 0xff, 0, 0x7e, 0xf0, 0xff, 0x1,
> +       0xff, 0xff, 0xff, 0, 0xe0, 0xff, 0xff, 0, 0xff, 0xff, 0xff, 0x1,
> +       0xe0, 0xff, 0xff, 0x7f, 0, 0xfe, 0xff, 0x7f, 0, 0xfc, 0x7f,

Please always use 0xXX for consistent formatting.

> +};

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

