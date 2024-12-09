Return-Path: <linux-gpio+bounces-13645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5CE9E93A7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1738280FC6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CE922068D;
	Mon,  9 Dec 2024 12:16:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE83197552;
	Mon,  9 Dec 2024 12:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746596; cv=none; b=IUU3TkRymjakQXxvsQ2Bh+Y399776JyZnKlYG0wSRHln8nIprv0HtYXBR4wULaVVuKDwhn6qITIqE5XOmKPsARcrz3ZO7jfJaCmpEoCVzdNZVo0z9xA5Vc+NX84PU5GpyL0EIrdUYpvuaB8Zn1vkMsKzTZjYx5cfEJAEe5E+8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746596; c=relaxed/simple;
	bh=R8cDJqT/EJHCBMtE6uuBqXyVQslFfF1GTxu+DD4z5nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJ6Ck7rHkBp/W7TTFYfanR0F+nW5jctVpjA7TPKSzEKDIU4hPMkNmW6sXOkbh5qyA4X1Npm282Nxe4TE1Szq4xddO1zhSr9EVP9YoOkxoA0K5GIzd8/ppoph6y9jkKm2L9E0M2DLSP6XpUEcTka1K3tp2S4ZI331s5whDokd48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso728572241.0;
        Mon, 09 Dec 2024 04:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746592; x=1734351392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wma2PocbBuNjLA6dn4WqwgnzzUgSYUGAmtXJkQ4fvjI=;
        b=nO85ZIjN5ElToJgfAHm1tzvEXIty2W9upSRFZvHyVC1ZJcDL1EM6tF0ZzMY6wRxH3b
         I2nF0uoTPIvLLmtSvCzifYEbSTcmNUBR2xAc5+Gz8S+C6xS/YLklF8KY7xRdZ+b7bPwA
         jcJ6N9BvrLRvDejQl+bylaLDFNA/hFeu4a7EeMVlc/+uYlO68moOeajWcWXnZ+ead8W6
         aZTK/D8iZhSa9PkkRXccp9IsJh1zSn5qy8ICXVfEEpVVlmm09t9fx3l4Q8OsLKGdTgIu
         sDcJlhH/k2mFMlPxsIsXTSPxmAfEk5kjU7OU8h+kG8OYY1aOn8qPOF0Ef2z2NUj8pNpf
         CpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4KPgJcscDNSZ9Wn7eupV3ORVbxnfVjNG4IA1saD43uLLNmahyIOGy1TUGh/oigiCINYTd875obSvOqa4=@vger.kernel.org, AJvYcCV5I773Zkm9Goxm0y6R1pwKrgJT8toLSP5uUjiY2LvNTjuPU7v2wwlKuKRjXprrxttnT9ar3TtvTlhEiw==@vger.kernel.org, AJvYcCVn5Qecif6hjD0T7aQc0AZQo61Zr0Nfl3wa71MI0oCUvaNI9RGdBBfzz+ZEdQkGu+W/DxkOz3i1TWmY@vger.kernel.org, AJvYcCXXF4qHHMivqam2LOT0bLnBx9P0rEmcVK9eJuM/ssmB3bM3Og2fAw8C4bKi0uzwqGhbCybfhpnvD+Jw@vger.kernel.org, AJvYcCXlnMjfxp/fJMbNtlrcotLw3bTtRJIuI3OokA2v/2IKSw2DSaonJCmJ7B6CgSiyk6cM/wnWwEJ6w8c2C6XuJw1JNWI=@vger.kernel.org, AJvYcCXpkB7C+DBMHofNcir7gMSXVQqIObhmPZItSnJ7a+givoTmKVFoykvjvDUJc3sB4vwTmONdQILpSJEtrrpZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0g5GMfM2lgLOmvEZNYOUM2yHhyVmvL2R2NcJpl+1wke4AXjXx
	fDbfZKCuqaSai3mhQhYPO5zQrgkRFXkSXTlPcLHX3U0fxjYl9y1OYX5MiNtLh7I=
X-Gm-Gg: ASbGnctQdHWN8v+R1ili+LTYt9wh5Lq+uQ0hTMEg6Bn3GXdl4v8clE2JtnLbDYVKSBI
	IkwQTze9HXIaHh4qkMSCaLcACnx8zqyp2ALwZbN8eN3pMRZ59b51Tvc65w5SwZqEmhLrSWy1H0X
	eK8OJD8mojbRlnlgLwiDB6AEqWCC7H48WZDestdf+iQlTnAAXOs788CR8o7UVtW+CDH8NPUy8s7
	7nFJ6KC/TR/a8W9Axf5eC8hyA2aDL4tnaqqgaOinJ/RFld0pHk8coZiiUNuIG9NBhxJ+m+OkjBg
	oovhfCSagFoY
X-Google-Smtp-Source: AGHT+IGgK+ZFid1upVBl7L3EhL3jZ6NLpIYhnvuMKXzrnAr4vs37yaA7en6KVhJekSMI01Or87ONKQ==
X-Received: by 2002:a05:6122:2194:b0:50d:5654:951 with SMTP id 71dfb90a1353d-515fca15b70mr11425836e0c.5.1733746591794;
        Mon, 09 Dec 2024 04:16:31 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5187a500e9bsm144589e0c.16.2024.12.09.04.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:16:30 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afc6ce5d94so875190137.0;
        Mon, 09 Dec 2024 04:16:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9CHEVCbDHfiA/TcJhjN/cHL0DGbuZ6EzICzL0OgH2AWJ1oYgp0Sul99w2ghyroIXgKs+hsCHyqFmxKg==@vger.kernel.org, AJvYcCUT7TTcVdCJycRMluF9egJhXgXqhaTxbFT7hs47ljfB/+5vJEjRsqIFfeue7Jr2LjGrIbA5Hx59eY89WAY=@vger.kernel.org, AJvYcCUTQ3C5cjCsDOREM9hcj8w539BZVQkTxUGCB5YPPO5VvEvxkOdxVo1cLON6rOFES9+ZaBdvWJyTB2N+@vger.kernel.org, AJvYcCUnHaecset2ceGKC0jRDPN1DbsyOq0Mltpj4V67KSrMiHZ/nBofZ8S224nZ997XtgvurSffxL7hbEyO@vger.kernel.org, AJvYcCXaoHFuPdQSMdzy55PRRi5hn7oe2xdNXM1SMOrw+DQENPs727LSJdjCPqp1YS4QrGD+efLGNZ9uT+/et37+@vger.kernel.org, AJvYcCXbE+gP3veoioVV/xFNj221V6Q/hRr0jvrQiyzpwEf5oILbmjH97yDkiO01SCfX2uWnLGvyKiq00w6DqKRfUAfTy3g=@vger.kernel.org
X-Received: by 2002:a05:6102:2912:b0:4af:fa1b:d8e8 with SMTP id
 ada2fe7eead31-4affa1bdbcemr2823484137.10.1733746590266; Mon, 09 Dec 2024
 04:16:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVv+2tEQ5hf+sbihbJMo3+=8kJaWy0YNU_spxQnmWF-bA@mail.gmail.com> <d65354a0-c4b8-4379-b824-f4541718a3c2@tuxon.dev>
In-Reply-To: <d65354a0-c4b8-4379-b824-f4541718a3c2@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 13:16:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8M49m3h3NshzK+KRbT1G7U8hc09T9xUH0Gz1GefUcMg@mail.gmail.com>
Message-ID: <CAMuHMdV8M49m3h3NshzK+KRbT1G7U8hc09T9xUH0Gz1GefUcMg@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] clk: versaclock3: Prepare for the addition of
 5L35023 device
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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

Hi CLaudiu,

On Mon, Dec 9, 2024 at 12:14=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 09.12.2024 12:57, Geert Uytterhoeven wrote:
> > On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.d=
ev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The 5P35023 and 5L35035 Versa 3 clock generator variants are different=
 but
> >> the versaclock3 driver could be used with small adjustments. The featu=
res
> >> that are implemented in driver and differs b/w variants are the PLL2 F=
vco
> >> and clock sel bit for SE2 clock. Adjust the driver to prepare for the
> >> addition of 5L35023 device.
> >>
> >> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/clk/clk-versaclock3.c
> >> +++ b/drivers/clk/clk-versaclock3.c
> >> @@ -166,12 +167,17 @@ struct vc3_div_data {
> >>  struct vc3_hw_data {
> >>         struct clk_hw hw;
> >>         struct regmap *regmap;
> >> -       const void *data;
> >> +       void *data;
> >>
> >>         u32 div_int;
> >>         u32 div_frc;
> >>  };
> >
> >> @@ -698,8 +706,6 @@ static struct vc3_hw_data clk_pll[] =3D {
> >>                         .num =3D VC3_PLL2,
> >>                         .int_div_msb_offs =3D VC3_PLL2_FB_INT_DIV_MSB,
> >>                         .int_div_lsb_offs =3D VC3_PLL2_FB_INT_DIV_LSB,
> >> -                       .vco_min =3D VC3_PLL2_VCO_MIN,
> >> -                       .vco_max =3D VC3_PLL2_VCO_MAX
> >>                 },
> >>                 .hw.init =3D &(struct clk_init_data) {
> >>                         .name =3D "pll2",
> >
> >> @@ -1029,9 +1037,16 @@ static int vc3_probe(struct i2c_client *client)
> >>                                              clk_pfd[i].hw.init->name)=
;
> >>         }
> >>
> >> +       data =3D i2c_get_match_data(client);
> >> +
> >>         /* Register pll's */
> >>         for (i =3D 0; i < ARRAY_SIZE(clk_pll); i++) {
> >>                 clk_pll[i].regmap =3D regmap;
> >> +               if (i =3D=3D VC3_PLL2) {
> >> +                       struct vc3_pll_data *pll_data =3D clk_pll[i].d=
ata;
> >> +
> >> +                       pll_data->vco =3D data->pll2_vco;
> >
> > You cannot modify the global clk_pll[] data, as it is shared when
> > there are multiple instances.
>
> By "multiple instances" do you mean, multiple versa3 devices using this
> driver? Do you know if we have such a board integrated, ATM?

Exactly.
Currently there are no such (upstream) users for 5p35023,
but e.g. the Beacon RZ/G2M kit has two 5p49v6965 instances.

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

