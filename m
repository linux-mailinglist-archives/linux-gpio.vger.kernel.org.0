Return-Path: <linux-gpio+bounces-13325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF849DAA16
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 15:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6562B21C27
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 14:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52171FBE94;
	Wed, 27 Nov 2024 14:47:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F59B652;
	Wed, 27 Nov 2024 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718831; cv=none; b=NprzRp8qZbUYMTA516MD4JjWcAm9L+Dq2DQADKpDB4swDGBVCQysGtzHFvySExf0I/+JepYtgxd7rXmOkZSwMKKhqZK/6UUgNN3zjIYlijH1OlGPgaO5ygvZKgTumbyiRyzgYKpn4j5fsamnhOlYAWBvqgU6btz6SS7bkGhFVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718831; c=relaxed/simple;
	bh=99N+WhVI9/y39t5sBv6sXReC7pzbFGrxQUgPEFqAE8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dadDKH2Sgl33cyKxez2viMr2tdMfJNCYH99xOQSeOPKxjyEa0pknOGtivK3+xK0J1YaZiCp3iNoW6XON09JQthcnS8lDGYMaHM6FpVgOpHdUhLuc5rsghM21aY4PH5lPfR5l34xhOUpjWtg/PKKMtAqu9Qvn76uas+UJgtSsILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cfabc686c8so7943040a12.0;
        Wed, 27 Nov 2024 06:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718826; x=1733323626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oO5LdOmCG0wIh47g8NvSkPwghS/9DiaDmcFTr+YTjt0=;
        b=nOTcRdE79UNuVrvcHtcIBoAZ3wI1EtqDGt6orZj0fr3ysNpU2n3IpzRNr0Ha0nSVL2
         fCpAxcJ1e1pfM1g7e3LNlaIIsHNOGjBO4xabJyqqMtw5QO52hMpy0YAaqQwZoNyQjl5C
         21i0Nhl/MESXiwMfSKWHn2DU7c161yWRkCb2Av0nAIg+abDUak/4llHCavPKpxjimnep
         jSJSujXpWLtBNsXEWBb3TBj4avW45pJmOUvDa35Q9AXDoMKaCl9bH9M3LkyRW/cYrkij
         dpB5ZbsAmyNucJBdqfrsCkjgVz7l7h3/42o9NgPr4bLUheH7MurvIN+O2hx2RLPQW3Ix
         dc1w==
X-Forwarded-Encrypted: i=1; AJvYcCUDzmKHQxQU8tyiUJPWXT4MFgvBbyJRZONHzL3VPlA5hs7OHlh/A7AWgr5r1O3UrFlg+VOysOvN0VuiIy1T@vger.kernel.org, AJvYcCUPnA+RzfPX34a6ZIGXsoB3TNnJzu75ODHmsjeur6iuXzB0lZV/UJZd/WAWvB7Kuc0MB65i71jqKTnx@vger.kernel.org, AJvYcCUjVq3zm0/oEWhEGdv14KV5/CONDPPigeZyDc5yXOUj329GQqnW+sNNhK9g18zYFhH72WYKIUfT7sxDUA==@vger.kernel.org, AJvYcCWUaHdvJFJF2dQNYsJl0LdGHSbz1VcPxXcU/n9Qad1HNDEMPph4xZslflvbWh/1bunflK21Ng9ftobhgLw=@vger.kernel.org, AJvYcCWdzvDh60UiJYt55d2xjAoAeIo6fcZicuwpR45tkDJJt9/sSKSgRY/b3hcKXiXCYJpNrOmOxg4kr4HatdtgHJyaePo=@vger.kernel.org, AJvYcCXMhXTO/LDnxcMtcW274sduNXr1tfHBs8jEs0rYG+wURavtbxYMdc+lNOUAsvfFsQe6JNsg8eR6Oq+E@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+USldY/lQZTaX0BLU75ArSLeAf3YkHopMPaWrAhQGgNoFKvG
	yHLsC1r2cjZyTBwF7klArQc7T+7d7xUoPQ5XNgS2CZNrfvT1DccM7qCVqjo0wxk=
X-Gm-Gg: ASbGncu7a6wZDVnBSWri2BBajgD41yjapNQDhCM3mPLf9kSIMchrSS4HpqN4q+qIznh
	LZsYnoiJx57R4B8ACEI0xqd+w3n2ART3VQpV82I2x5TfpmH7uDj4QTU/nq7GcbEsozXNvDDIk1X
	XEJd3gAhgKy+7fM5kvp4yBI2WA5cDu4EAXJYh/SCkM3KT5dmMh07i/dZ1NDAYJgYMGBcVcrqEHw
	PEU3SYCdZVUZhSffsWGJjrN0ZM0282+TFLp9+KPCK6ywSlurvOlQKBWkPE77fscFgPRq4Vc8q7S
	p54FhilOyI9o
X-Google-Smtp-Source: AGHT+IFv4IYD40Zt7LZ/ySspN7+1PeRiXYMW0ey8s/mrZC7I/02RwJMqR4uajyn/qJUUU22RnsOfIg==
X-Received: by 2002:a17:907:28d0:b0:a99:e939:d69e with SMTP id a640c23a62f3a-aa581062e0cmr225674066b.51.1732718825757;
        Wed, 27 Nov 2024 06:47:05 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5c621dsm708405766b.205.2024.11.27.06.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 06:47:02 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa52bb7beceso577797066b.3;
        Wed, 27 Nov 2024 06:47:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUttit19WXmM9C985sO5+OqQv6sIQFl0TbuCOnJ9c7MdEPbgQ5jUy2mYgHSUBy7vsujxFQHpQTBTKOz@vger.kernel.org, AJvYcCUuZN4Xs8/gpvAlZrRAhUB6g3l52fV/P6SIeewWELCyrnBTcnsyg/WwH8pkB8P4pZmWK4GhbIYdjmrhpbaa5yDKhUA=@vger.kernel.org, AJvYcCW2P1kgM2Tz3N9jnzdcCOYZIKdRSw4Ce1BQM8oAeMCKn+uRnTFFWC4XOeMpyALVyM7/CrzIgg0hBFMtWfw=@vger.kernel.org, AJvYcCWPZ8LncmYgc8H1SXmbAgFqIPPQlXdwPUth3M6Bn1Fx5bwlztwmXCrwYiQMXcaQTLVVa7w3PFbzs3xJfo4f@vger.kernel.org, AJvYcCWQ7Z0Z4WQPJlMF5JyRW5j7+QIpgH9Lv7Pl/EUGsfTqcBU39iqT9pMyHqJZeG/sbw2iwiq/GDzFbuHS@vger.kernel.org, AJvYcCXJB46Y6i3xCe9lPGlodRa+jl+9cZlUaEuwf6Kfk3cjoTj2O+d2GOOR4rcH63tb6E95BvxhAHSOtVkQYA==@vger.kernel.org
X-Received: by 2002:a17:907:7781:b0:aa5:3b48:8f9b with SMTP id
 a640c23a62f3a-aa580f01c0fmr238937266b.13.1732718821101; Wed, 27 Nov 2024
 06:47:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 15:46:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfSmkbnTS463xa5ty_2W+vFbWhRK65nN1yiN_+c66P5A@mail.gmail.com>
Message-ID: <CAMuHMdXfSmkbnTS463xa5ty_2W+vFbWhRK65nN1yiN_+c66P5A@mail.gmail.com>
Subject: Re: [PATCH v3 01/25] clk: renesas: r9a08g045-cpg: Add clocks, resets
 and power domains support for SSI
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	linus.walleij@linaro.org, perex@perex.cz, tiwai@suse.com, 
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add SSI clocks, resets and power domains support for the SSI blocks
> available on the Renesas RZ/G3S SoC.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - collected tags

Thanks for the update!

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -209,6 +209,14 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks=
[] =3D {
>         DEF_MOD("sdhi2_imclk2",         R9A08G045_SDHI2_IMCLK2, CLK_SD2_D=
IV4, 0x554, 9),
>         DEF_MOD("sdhi2_clk_hs",         R9A08G045_SDHI2_CLK_HS, R9A08G045=
_CLK_SD2, 0x554, 10),
>         DEF_MOD("sdhi2_aclk",           R9A08G045_SDHI2_ACLK, R9A08G045_C=
LK_P1, 0x554, 11),
> +       DEF_MOD("ssi0_pclk",            R9A08G045_SSI0_PCLK2, R9A08G045_C=
LK_P0, 0x570, 0),
> +       DEF_MOD("ssi0_sfr",             R9A08G045_SSI0_PCLK_SFR, R9A08G04=
5_CLK_P0, 0x570, 1),
> +       DEF_MOD("ssi1_pclk",            R9A08G045_SSI1_PCLK2, R9A08G045_C=
LK_P0, 0x570, 2),
> +       DEF_MOD("ssi1_sfr",             R9A08G045_SSI1_PCLK_SFR, R9A08G04=
5_CLK_P0, 0x570, 3),
> +       DEF_MOD("ssi2_pclk",            R9A08G045_SSI2_PCLK2, R9A08G045_C=
LK_P0, 0x570, 4),
> +       DEF_MOD("ssi2_sfr",             R9A08G045_SSI2_PCLK_SFR, R9A08G04=
5_CLK_P0, 0x570, 5),
> +       DEF_MOD("ssi3_pclk",            R9A08G045_SSI3_PCLK2, R9A08G045_C=
LK_P0, 0x570, 6),
> +       DEF_MOD("ssi3_sfr",             R9A08G045_SSI3_PCLK_SFR, R9A08G04=
5_CLK_P0, 0x570, 7),

If you don't mind, I will rename "ssi[0123]_pclk" to "ssi[0123]_pclk2",
to match the define and the documentation.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

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

