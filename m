Return-Path: <linux-gpio+bounces-1358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A28112CD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0543B2818C9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3632D022;
	Wed, 13 Dec 2023 13:26:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6848391;
	Wed, 13 Dec 2023 05:26:29 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5e263e43ff2so12275317b3.0;
        Wed, 13 Dec 2023 05:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473988; x=1703078788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/dW7y/88rRyjaO7r00R6o21E2y2IyUgTVUEboam7dg=;
        b=Oz+yXYJpq+Oct7FrkI1dqm8rpVBHqo2R5SHLaG6h5EcjNQHCdNMHay8Q8EKkw6wB7c
         tTq46YkMbHxT8AJiBIFuriCIysg403prfas+oCNFJQiYgOpZTj3tpOlfm7cjko2pPebU
         +b9+kC4xJu2thZPy8lQGb37eVcS1h9DcKHDj7tq0DldInrUzBH1vxgLvrrmDMB6ZStBq
         7wjcEB09iiIBATMaoOPCnBL7of9PVe3ieHGxSDsxlzRGq0xQ7dy9vowALELBukDivO2V
         B8PQWroNhq6H8Un+pPhkHol8XrcnRf+zJEKtZaNfuM3q4V3UjQtvtrazJirzkEWkyYzc
         shGQ==
X-Gm-Message-State: AOJu0YyksD0PKXPM92NAJatNFvU6YrKtsSLFDqVdmAtEPZgIA8Wzv5bG
	je4K5S2JU2pyD7o2xJt0qYVuexnX64qApg==
X-Google-Smtp-Source: AGHT+IGxXAV5YJNHjGtnfjrTF6PsWA95v4gJZvwnyes1B2rIui/NwQOTqCwPeq3xFEYM+5W4Z7whrw==
X-Received: by 2002:a81:df06:0:b0:5d7:1940:53c2 with SMTP id c6-20020a81df06000000b005d7194053c2mr6746365ywn.58.1702473988427;
        Wed, 13 Dec 2023 05:26:28 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id u11-20020a0deb0b000000b005af5bb5e840sm4666932ywe.34.2023.12.13.05.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 05:26:28 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-da819902678so6335862276.1;
        Wed, 13 Dec 2023 05:26:28 -0800 (PST)
X-Received: by 2002:a25:e655:0:b0:dbc:bbff:68fe with SMTP id
 d82-20020a25e655000000b00dbcbbff68femr1786964ybh.76.1702473988098; Wed, 13
 Dec 2023 05:26:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 14:26:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfh7U6WqAgO85bLwZDKWpMgmviNdNfKRYtcxs4VEXsgQ@mail.gmail.com>
Message-ID: <CAMuHMdWfh7U6WqAgO85bLwZDKWpMgmviNdNfKRYtcxs4VEXsgQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] clk: renesas: rzg2l-cpg: Check reset monitor registers
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com, 
	sboyd@kernel.org, linus.walleij@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The hardware manual of both RZ/G2L and RZ/G3S specifies that the reset
> monitor registers need to be interrogated when the reset signals are
> toggled (chapters "Procedures for Supplying and Stopping Reset Signals"
> and "Procedure for Activating Modules"). Without this, there is a chance
> that different modules (e.g., Ethernet) to not be ready after their reset
> signal is toggled, leading to failures (on probe or resume from deep slee=
p
> states).
>
> The same indications are available for RZ/V2M for TYPE-B reset controls.
>
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Fixes: 8090bea32484 ("clk: renesas: rzg2l: Add support for RZ/V2M reset m=
onitor reg")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - adapted for CPG versions with monbit (e.g., RZ/V2M)
> - added a fixes tag for RZ/V2M
> - fixed typos in commit description

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1416,12 +1416,27 @@ static int rzg2l_cpg_assert(struct reset_controll=
er_dev *rcdev,
>         struct rzg2l_cpg_priv *priv =3D rcdev_to_priv(rcdev);
>         const struct rzg2l_cpg_info *info =3D priv->info;
>         unsigned int reg =3D info->resets[id].off;
> -       u32 value =3D BIT(info->resets[id].bit) << 16;
> +       u32 mask =3D BIT(info->resets[id].bit);
> +       s8 monbit =3D info->resets[id].monbit;
> +       u32 value =3D mask << 16;
>
>         dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, CLK_RST_R(=
reg));
>
>         writel(value, priv->base + CLK_RST_R(reg));
> -       return 0;
> +
> +       if (info->has_clk_mon_regs) {
> +               reg =3D CLK_MRST_R(reg);
> +       } else if (monbit >=3D 0) {
> +               reg =3D CPG_RST_MON;
> +               mask =3D BIT(monbit);
> +       } else {
> +               /* Wait for at least one cyc le of the RCLK clock (@ ca. =
32 kHz) */

cycle

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.8 with the above fixed.

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

