Return-Path: <linux-gpio+bounces-13648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A549E9E93C1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25878188727C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1827B2236EB;
	Mon,  9 Dec 2024 12:23:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDDA21D008;
	Mon,  9 Dec 2024 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747038; cv=none; b=LeUx1NiFWwvwgarraFXINJbEZiv9WQLMoLVqnf+YfAVGJp17BfStS27vG91I18w15bZCPjOQX+EBIpyfo+2dPMGsGaWvHU6TWD0op0a+WUFZQlJQFkMjRs8znbsbqed/LCCVDHgfkKCyXEJQaaeyzB4wPfbja71uGb46tu6bSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747038; c=relaxed/simple;
	bh=nJWsB2IKS0EcKbW6Pme62FOLn+NLxCo9ZDwpU8lvMuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7zeSmea+/rjUGDK5zpnOfDmOYjT2tUnh1W0smqtRE8qwc9g0NXwmrL4NzF2OUu3n6NnipDnGnRowRP47551tpSJFKIdQoFHAGFSj/x7xvWZNG3R/Wu6AhbW2p42QA7SrxEFJUzoCarQclB6m5Hw8z9Fmn2NJIx7ItQADWaMJUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51882c83065so207528e0c.0;
        Mon, 09 Dec 2024 04:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747033; x=1734351833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BZxzxSlX/poqaet0n5zcusvxow0QtKoWGJb3xa8Qns=;
        b=irHdrpjsxZWpCMAwbTpcV+cMnQFAKEs2M3OpPabPVFx0VehovqrMbyK5ewuhI4xbeh
         UDd8AVw1/w5JVgASje4De2Yug8js5od4+hPrY4BpOdznQAocZzKzRrWfj+02SDrv6qd8
         qpcZ4LY0qygum4Az2cXNghFHnnhJryrF9GeZJfhZ4mCPE+y4ZAfSkANK3Uwyg2hQSJrz
         LYUCNGW2Vp/xxjMwF61attBxwk8Mjk4A3ii04Ba1Lr18AlnCdGbT/EwqmMdKEkMYWRJ+
         nqsCrAn6ttgn3H/uYjtsSifwa4Jb2efXfF2guGteEdUibXvS7kiS1qd6h23M1qRwEU2/
         Oqfg==
X-Forwarded-Encrypted: i=1; AJvYcCUGpeFRNqb+a3kpYsLdjnRD3Pz5TWfLW5k5Ezv4aVBPSYaeI9OZ8qkH4FceOu9kq6F8rL87aJ+xRmzWL0M=@vger.kernel.org, AJvYcCUNx0v6zQ9836hVbGY+zhhb6+jvwo2NAMiGvrO33x46x8smR7rRI2ELP/r0fzcYQ/7JDsYOiFaTFO/MWg==@vger.kernel.org, AJvYcCV6I5EX39iOOi5YTK7y/PF8tCa+p/gx5ZMYKB0eropWV4Mj7lhKOh0951KwNhr7Q8rocdpg6Byv2Uby@vger.kernel.org, AJvYcCWCvRXDIuEaYn6i2zAM3VDXwb7tC/3afzGt855uLu4tdAQttzzDbTAnYM6wI2bvVOraBvgudE8rYquW@vger.kernel.org, AJvYcCX/HKYuNkep/cx3iATkHz8hJukCzwwJsNEaEE/9+GeBrf5V4JWILUhvIEHd3IBBR4CybLvWge5ecApx5SZjrvMPUts=@vger.kernel.org, AJvYcCXvGqzpwyNwCwHHT7yfJXaF4c+KOPwYFfNi/gN0I3dQdrmlxx0X+GHhRII1CxAK6h9EvJZY1dMLA0bssrYo@vger.kernel.org
X-Gm-Message-State: AOJu0YwiVfAKUYkj3hUKGADyv/Uw95LwdPIAe1nYS4/Qg4ZD+N7KhBHd
	8TvgSHeVgu8VbP4XEFibyveLX6ArVFr58+IqAuwgzzVU8xHbftstRCihyddxsxM=
X-Gm-Gg: ASbGncs0F+kWarH1LJCLe643kkvZ0+eGRHr4MzMCbM32B6j5kadi6YTwc0tIfqG0ceM
	xD6nO1vnUAM2F+ZCAmaS36LqgzZDPQfU5tR7hoTTERGMnL45ShW+Xda/kB7vdjwBvk4i47Ec4fv
	C5RbgTDl8t155ap9AF8SWs8UDFNVNL5tRW92TlkaSVrxtxt6+gTPYZavj4t9Ov3tO6ZBsdpjQna
	+MfR9sGMjkzVmtMy/eTGkeD9SUZN8SWJwdlh4smcnSOgYJZxmOejCmMTg5ANYiNSnbRFwXZZLbU
	ILOF9IHkAl4V
X-Google-Smtp-Source: AGHT+IEO20GkTs2CycQBAGmUXZj+6oDD9ikGyapwN8cPxFSZ6eobYvT8YbQbdxsr4LGygu2lo1VIqA==
X-Received: by 2002:a05:6122:885:b0:517:4fca:86df with SMTP id 71dfb90a1353d-51888360b17mr269778e0c.6.1733747033325;
        Mon, 09 Dec 2024 04:23:53 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2b9669a5sm1164138241.3.2024.12.09.04.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:23:52 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so1859306241.1;
        Mon, 09 Dec 2024 04:23:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUF25LH1oXM0vpCUwLkm5DVIp3ZccCm3kFL4p1/zNQbAbA3sFzXVo0HWr3HYCByUlzpYiSl7ftPeSCliKtY@vger.kernel.org, AJvYcCUl8ats+VgCrlQCfUGZoOjpq4qlwJGRfjM7n2JwH2urWjE/jg65ILQqJBD8iB/+PvjWE77jD0rIgFiN@vger.kernel.org, AJvYcCUpqR6oEzJ1GMTRXr6IiHPIxHFoUa/dfdzTY+TvHJCQS0PEXyknCjxw+tXSI192xUh9jZdO1k6/LZh0mjWi2xa+l7Y=@vger.kernel.org, AJvYcCVSsHRVjXdlmu5b9JNQ/tteLcT219q/QqWTy+st01BIEvaAq5bTva3fnpMtLnWdXmDh/1F1f8YNQ3R7mw==@vger.kernel.org, AJvYcCVZWhrnDGIEJpHzuf6OcGC6V0PZ4NCRxIc5qmyNduKWyebn8DSTM9GSXfZOid9uUS/zMPHn+0uIx7lTFOU=@vger.kernel.org, AJvYcCXpQgmC3YhcsppqyN+k/UVdZ0QaR01PNj0e5KbVpqotMJkpApNPJI2GSKNfQeKcfDXiYcNdmpH7s41N@vger.kernel.org
X-Received: by 2002:a05:6102:38d2:b0:4af:e4fb:2f26 with SMTP id
 ada2fe7eead31-4b1161e5287mr246769137.24.1733747032476; Mon, 09 Dec 2024
 04:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVv+2tEQ5hf+sbihbJMo3+=8kJaWy0YNU_spxQnmWF-bA@mail.gmail.com>
 <d65354a0-c4b8-4379-b824-f4541718a3c2@tuxon.dev> <CAMuHMdV8M49m3h3NshzK+KRbT1G7U8hc09T9xUH0Gz1GefUcMg@mail.gmail.com>
 <91c80c8e-729d-46ac-bb05-2cdcdb95ba1e@tuxon.dev>
In-Reply-To: <91c80c8e-729d-46ac-bb05-2cdcdb95ba1e@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 13:23:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUyYuWkUjT2-MuALKxkeNfBCx06tHSjEFxG8_aEZAoC8w@mail.gmail.com>
Message-ID: <CAMuHMdUyYuWkUjT2-MuALKxkeNfBCx06tHSjEFxG8_aEZAoC8w@mail.gmail.com>
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

Hi Claudiu,

On Mon, Dec 9, 2024 at 1:22=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
> On 09.12.2024 14:16, Geert Uytterhoeven wrote:
> > On Mon, Dec 9, 2024 at 12:14=E2=80=AFPM Claudiu Beznea <claudiu.beznea@=
tuxon.dev> wrote:
> >> On 09.12.2024 12:57, Geert Uytterhoeven wrote:
> >>> On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon=
.dev> wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> The 5P35023 and 5L35035 Versa 3 clock generator variants are differe=
nt but
> >>>> the versaclock3 driver could be used with small adjustments. The fea=
tures
> >>>> that are implemented in driver and differs b/w variants are the PLL2=
 Fvco
> >>>> and clock sel bit for SE2 clock. Adjust the driver to prepare for th=
e
> >>>> addition of 5L35023 device.
> >>>>
> >>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/drivers/clk/clk-versaclock3.c
> >>>> +++ b/drivers/clk/clk-versaclock3.c
> >>>> @@ -166,12 +167,17 @@ struct vc3_div_data {
> >>>>  struct vc3_hw_data {
> >>>>         struct clk_hw hw;
> >>>>         struct regmap *regmap;
> >>>> -       const void *data;
> >>>> +       void *data;
> >>>>
> >>>>         u32 div_int;
> >>>>         u32 div_frc;
> >>>>  };
> >>>
> >>>> @@ -698,8 +706,6 @@ static struct vc3_hw_data clk_pll[] =3D {
> >>>>                         .num =3D VC3_PLL2,
> >>>>                         .int_div_msb_offs =3D VC3_PLL2_FB_INT_DIV_MS=
B,
> >>>>                         .int_div_lsb_offs =3D VC3_PLL2_FB_INT_DIV_LS=
B,
> >>>> -                       .vco_min =3D VC3_PLL2_VCO_MIN,
> >>>> -                       .vco_max =3D VC3_PLL2_VCO_MAX
> >>>>                 },
> >>>>                 .hw.init =3D &(struct clk_init_data) {
> >>>>                         .name =3D "pll2",
> >>>
> >>>> @@ -1029,9 +1037,16 @@ static int vc3_probe(struct i2c_client *clien=
t)
> >>>>                                              clk_pfd[i].hw.init->nam=
e);
> >>>>         }
> >>>>
> >>>> +       data =3D i2c_get_match_data(client);
> >>>> +
> >>>>         /* Register pll's */
> >>>>         for (i =3D 0; i < ARRAY_SIZE(clk_pll); i++) {
> >>>>                 clk_pll[i].regmap =3D regmap;
> >>>> +               if (i =3D=3D VC3_PLL2) {
> >>>> +                       struct vc3_pll_data *pll_data =3D clk_pll[i]=
.data;
> >>>> +
> >>>> +                       pll_data->vco =3D data->pll2_vco;
> >>>
> >>> You cannot modify the global clk_pll[] data, as it is shared when
> >>> there are multiple instances.
> >>
> >> By "multiple instances" do you mean, multiple versa3 devices using thi=
s
> >> driver? Do you know if we have such a board integrated, ATM?
> >
> > Exactly.
> > Currently there are no such (upstream) users for 5p35023,
> > but e.g. the Beacon RZ/G2M kit has two 5p49v6965 instances.
>
> Are you OK with keeping it as is for the RZ/G3S SSIF support and returnin=
g
> back later with a solution for the scenario you pointed out? Although, AT=
M,
> I don't have a board to test it.

Fine for me, as multiple instances were already broken before.

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

