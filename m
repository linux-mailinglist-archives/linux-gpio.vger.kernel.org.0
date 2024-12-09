Return-Path: <linux-gpio+bounces-13639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752D9E911A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C373162C21
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD104216E28;
	Mon,  9 Dec 2024 10:57:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5635217731;
	Mon,  9 Dec 2024 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741876; cv=none; b=nPo/6i+gAZlUVfOATK6vAhDBGTwO4gozYA4W+KKzFqCNyAu/AtLxzNPNvFR84EkUIl2ihf/Kz3bfh74PDyqP8FCwFlJL4IwpEsknVRlS6d8EOb/liHTN3vY/vGu3/rdrIgyYOqtecK//mEs+sHOXRd7NGCuYN43FTxOtuRJn8eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741876; c=relaxed/simple;
	bh=QXr6n+QfcqXedrJjuICXhjRzx1EfLG/EKMa9GQW4mXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2j6fzeLzUgtGGfGnCnQOII2dHLvfP136KnCz03kCdxYxAtxxMGSZN3T23Iwc/aVBt0kdHenhrQVM0E//dUbjFLs3POeG88zRhigivbDWit8Ybr5sVJE6m20Pr3QgyNGNgqZQnnJU8GvUpqrz2jZTWVKopu1wMEGgLqS3iDVgUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5152a86a097so2005430e0c.1;
        Mon, 09 Dec 2024 02:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741872; x=1734346672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDGLHZTic4Z36lNNifchKIKazGqmGlJkqfaqt7HaXMo=;
        b=ELE8YvAg3MhlNqXaP7KFKPzBAEdxSbmVMxAsRYS7s0wqFbwlSApOyIyqBfgYAehje9
         gA945NSVLIPHZaKUphftyun+f1tCOdeY5h1lkUmAPXOsqqOnYIiJDbwSMoT2jIjMF3kl
         +qZSnV/8VHbRWmQrmaLPHauLkQKsI3Rp+3NnZxfyzkBKoGQd2bt3jdw+OIoTjUd/jeiO
         VBdx4rrVbGWuFdb+tn0+Xmit+LnfQskCGv4J2yKS1bKa7Rc/Q1JCDc8g5hCSkvIRF2vq
         tkeuge5OFIo/51jEwJfP9XVQ3Wb2o0MdUS/deu2Q8N1mUPCBawIBaMvS5jj0Nbr+zacK
         67Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVXfU/oaVzsNnLAyBiDjM0uQFOuLk0bpdZ5EQachDkzB0dLntYedjMQE4ASB09PVhcsiZjzN8SduJ3k@vger.kernel.org, AJvYcCVwVdlPdLNmcmzMO5VQzkXko7mFqhtlPRClO/pPKTeTCPwTTDagzvvN/0txXxWB1m3m9Z/r0ZXcVBp6R7Q=@vger.kernel.org, AJvYcCWQ1XPwYdIA87oZoF8YIIEwEjqlQFOERSO1Z8jMB/sqqZVkU/dQBAH9ZHp9VWg5I59/1HlEZniwg51PfQ==@vger.kernel.org, AJvYcCXG0E+FmESUQbqkhTkUMv4K9epNrVJj/+fv3tKP9+udeAGa142wKKCLydNjAvU1gIHZGnDx+6yV0ll4oemw@vger.kernel.org, AJvYcCXIGRituA433kx2ku0E6cDiQgWPzB69u8aK1dK/c9QHON4AMaHYFBDj3+XaUKhuJUbFLYdbHEorgELy@vger.kernel.org, AJvYcCXeOieWk+d4hXytnX4tSoWwg3FqboeBdPGR5F6cOQlOzj5yM1Zdn4npxuv7Xcr3CDnWLj5H9QaT4tXgCKoO3Xwn5KM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyLpJJ4lVLR2GpGMjm/PN/pTwbFQVHphvbAjzoxIzcn/HqaEVG
	8DVbMRMcVZIxxiGWsFg1xf3MaM1xOTadmDcV2Yx6QWcvIVAWgKlKb+Qgnj6rEJY=
X-Gm-Gg: ASbGncswVrNx2tjAO+fGyJgeY/ZN6nx8xAJntDugL9Xx9cedguspgQZcm5Lk0ZUQYgF
	ICKVcBNs42NM+bp8HLugBqhUfuOYQO0vo2xO/aGmMqFkx3G8gmZJuSxREgfxqsQcKr/+dkBR+cu
	BphqkLtksgdkVWL+51tfpNyu8lCkz3OsdmfsdLb2BQNH3a3ntk+UZwmYrckpJG1Hgi56mOtdtSQ
	jekA/9MqK1aMOIxQ+dj+1jHaSbhApy/+X+G7RbdePVfp7xkhT7trndvxgDZKDZRONmDMsRPKcWF
	5L9lFoYadpOA
X-Google-Smtp-Source: AGHT+IHEVu/506VQwMOpNnj0t/6fLvryuk196TlC642+KRXEt5Vidtntlej+v1PHhtIYR6m/kJqJ4A==
X-Received: by 2002:a05:6122:885:b0:517:4fca:86df with SMTP id 71dfb90a1353d-51888360b17mr30241e0c.6.1733741872187;
        Mon, 09 Dec 2024 02:57:52 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae17303sm712678e0c.4.2024.12.09.02.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:57:51 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso1218872241.0;
        Mon, 09 Dec 2024 02:57:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZqglOt8SocgYO6DwjnGPHGC4DD/L/LZW1dBv9yNq03kQrhtRdDC47rL4lI+eDs8YH3fywxEStCi0HasU=@vger.kernel.org, AJvYcCVxNKorUWOrvoLWPiddsqZbZVmO30y09hrmLp6ieskzfN/3E5m5gLZAQkm9cQvj16w+4+qQXhprsnds97vV@vger.kernel.org, AJvYcCWFxGA7riSJbj9akGpvZdCtAZM3v+9Vgx2C1Lho4L9YG4SY0pyKzZUUHpIwADa9bd/Xu3Uu1ReM+Y0hRIM7GTxqRIQ=@vger.kernel.org, AJvYcCWRs4GpFrCBmTaMKlSFYTzt2oOvV+yvwxm8CaeJoN8nzVz+efwagFXx2YecnF0JKCxHdZQ0BUsXDgmd@vger.kernel.org, AJvYcCXJXUrXu9yHo/gPfhooh7g22EP92YWwX8ZSMIcbl70CrZ6XqZnHUteWuhx+cOhzFULVRtvUn9PrxY1nkQ==@vger.kernel.org, AJvYcCXMY9qc4hEVcNeiTE8qSRm/RyCQWahOpq+vmhE9psGOydaKfSWJ4kEZmCeJVzqMldkKv5zWRWVqdIQr@vger.kernel.org
X-Received: by 2002:a05:6102:d94:b0:4b1:102a:5834 with SMTP id
 ada2fe7eead31-4b11618fb2emr21995137.21.1733741871365; Mon, 09 Dec 2024
 02:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 11:57:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv+2tEQ5hf+sbihbJMo3+=8kJaWy0YNU_spxQnmWF-bA@mail.gmail.com>
Message-ID: <CAMuHMdVv+2tEQ5hf+sbihbJMo3+=8kJaWy0YNU_spxQnmWF-bA@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] clk: versaclock3: Prepare for the addition of
 5L35023 device
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The 5P35023 and 5L35035 Versa 3 clock generator variants are different bu=
t
> the versaclock3 driver could be used with small adjustments. The features
> that are implemented in driver and differs b/w variants are the PLL2 Fvco
> and clock sel bit for SE2 clock. Adjust the driver to prepare for the
> addition of 5L35023 device.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -166,12 +167,17 @@ struct vc3_div_data {
>  struct vc3_hw_data {
>         struct clk_hw hw;
>         struct regmap *regmap;
> -       const void *data;
> +       void *data;
>
>         u32 div_int;
>         u32 div_frc;
>  };

> @@ -698,8 +706,6 @@ static struct vc3_hw_data clk_pll[] =3D {
>                         .num =3D VC3_PLL2,
>                         .int_div_msb_offs =3D VC3_PLL2_FB_INT_DIV_MSB,
>                         .int_div_lsb_offs =3D VC3_PLL2_FB_INT_DIV_LSB,
> -                       .vco_min =3D VC3_PLL2_VCO_MIN,
> -                       .vco_max =3D VC3_PLL2_VCO_MAX
>                 },
>                 .hw.init =3D &(struct clk_init_data) {
>                         .name =3D "pll2",

> @@ -1029,9 +1037,16 @@ static int vc3_probe(struct i2c_client *client)
>                                              clk_pfd[i].hw.init->name);
>         }
>
> +       data =3D i2c_get_match_data(client);
> +
>         /* Register pll's */
>         for (i =3D 0; i < ARRAY_SIZE(clk_pll); i++) {
>                 clk_pll[i].regmap =3D regmap;
> +               if (i =3D=3D VC3_PLL2) {
> +                       struct vc3_pll_data *pll_data =3D clk_pll[i].data=
;
> +
> +                       pll_data->vco =3D data->pll2_vco;

You cannot modify the global clk_pll[] data, as it is shared when
there are multiple instances.
Oops, the driver already did this before, as the .regmap, .div_int,
and .div_frc fields are modified during operation.

> +               }
>                 ret =3D devm_clk_hw_register(dev, &clk_pll[i].hw);
>                 if (ret)
>                         return dev_err_probe(dev, ret, "%s failed\n",
> @@ -1059,6 +1074,11 @@ static int vc3_probe(struct i2c_client *client)
>         /* Register clk muxes */
>         for (i =3D 0; i < ARRAY_SIZE(clk_mux); i++) {
>                 clk_mux[i].regmap =3D regmap;
> +               if (i =3D=3D VC3_SE2_MUX) {
> +                       struct vc3_clk_data *clk_data =3D clk_mux[i].data=
;
> +
> +                       clk_data->bitmsk =3D data->se2_clk_sel_msk;
> +               }

Likewise.

>                 ret =3D devm_clk_hw_register(dev, &clk_mux[i].hw);
>                 if (ret)
>                         return dev_err_probe(dev, ret, "%s failed\n",

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

