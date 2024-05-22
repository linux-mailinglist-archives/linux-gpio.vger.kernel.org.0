Return-Path: <linux-gpio+bounces-6573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D68CC1FE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 15:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81B1285329
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 13:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5520113DBB7;
	Wed, 22 May 2024 13:21:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109D8061B;
	Wed, 22 May 2024 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384109; cv=none; b=dD36IilVwM/7bhwrnp7CG24O5H4se/5UisMwIvANC/Py10NJ6DuPiAYDcOHUnRZraBXm26Ika1CjKirDaKNJZgK/f7+K7prbpgI/cwhts9mwlsV861GEqdW1zOCCsqvnsoEQqy2/fwdK/cY97ZVdzWa/jSYxkCPgbQQ+WJk6TeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384109; c=relaxed/simple;
	bh=1zHWV9lrir7bcF6ZsXjm0Dm5UaAg89JLGm6bgIZ8wRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIGQWiqUhJe9J0Q2dP0eFGgZ5dZo425nzXkCXjQmWNWdM5h5bwHnMX/i02f3pofhaFXTgPgu9tcmSPmj+pQXXRC++9XdXK0Q12Cebf4+qERQ/gScEg61PLQWAs723sXKcIrHPWrov2sW6T6Su6wXEYHL0SDXYD4vuNo6UF7wOv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61bed738438so49578287b3.2;
        Wed, 22 May 2024 06:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384106; x=1716988906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwO3V0ef+iewPljIZQdQy9oZrW8vxT6y27HOdLh4pwc=;
        b=jGX2EeH3QndnhCzshAY+iCS0D9gEl3vq9DrGrrk2TwG6BscwHC1ZxXW8EWRuZsQOi2
         FVeFAw54Vpl4AhAcJzdGWq8yPrGfdLdBw/KdlLp+VhovmjmPZmfjU7vtzs59ZLIqzzCW
         nGyIDlW19lWCksXmQPmptZ2tTQuOLxB6FOqjedSXbrd4p6s6mK+8nFkn/EYTpUdaHT43
         dj5wxiJ+ksIW8WwKq20SNHR0mIW0oa91mN+HTG+yppuaV81N5xAmkRLgqUwejB+pQgZt
         aqLZuh8lg7WBWOk6zOD7FRnaQLgkAL7EqUiIlEMhIZZXFwTln/tl+4K0zKRINBR4k3WU
         q96Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYTZy1PgIK+u86Ny0zMtnTWcFc6wbWt3lyTJM/UetLFlOspGiXTI1XHsLl+aSmwm7hwNX1M0t6rZKSR/uaUXoxHW4CN/VQLH9OzElPoh577FXkKAl1Aq2ytt7VbV3ZmrG9Utmdrt0AJrptf6yDufkuGsGf8PMKG0In706PHCpvdHeKu9dBmT7xi54gBbNn9giX2q707bDJgQkvA1qLRy2bkVbAxciQgw==
X-Gm-Message-State: AOJu0Yw8ZaNbX2kzu9h9FJ0iHSvfkXv203JltQoo4ax9tsqDeh1adQ+t
	SjrI1R1kTpFmC4bRfDi/HyAw8l6NWt9qEbarZM9f1agYRb7UCBqLkivdcAFJ
X-Google-Smtp-Source: AGHT+IFP4p3lCRUBVGwOq/TLnR8fdUV9Ioulf7bIfz0Dj5W31c/p0FlTCSJ+kVJA7j3AREcIh9Fl/w==
X-Received: by 2002:a81:92d7:0:b0:618:8a27:6150 with SMTP id 00721157ae682-627e46df567mr19733137b3.24.1716384105775;
        Wed, 22 May 2024 06:21:45 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e3790dasm59151617b3.110.2024.05.22.06.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:21:45 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61bed738438so49577947b3.2;
        Wed, 22 May 2024 06:21:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqa8bpEpj5wKN26+EYt5s0zq5Ht1N1tnN8QXIBHxD9ANXuXenjCu29NKuCsCJ//pYJeXcnQH3YYTa+zC5N7PwM7TklpLMzlswhNZjhQJYvBinaNukt2bW4gOQv56iwBuOGzNCRWoKBkRkrzUY176d2go3D9w0d9y0wb0EiNE1ACq4+pVZ5OjLmlvoeT66GTJjQfwji2yR4XNaXvmojSqtzv3HKG1r1cg==
X-Received: by 2002:a05:690c:d8f:b0:61e:a3a:2538 with SMTP id
 00721157ae682-627e46c7296mr24311947b3.18.1716384105266; Wed, 22 May 2024
 06:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 15:21:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA8hnV6NTSNdYQNvuBsK5Os9CDgE64xLN3R0wAAmtJgA@mail.gmail.com>
Message-ID: <CAMuHMdXA8hnV6NTSNdYQNvuBsK5Os9CDgE64xLN3R0wAAmtJgA@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] pinctrl: renesas: pinctrl-rzg2l: Add support for
 custom parameters
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> In preparation for passing custom params for RZ/V2H(P) SoC assign the
> custom params that is being passed via struct rzg2l_pinctrl_data.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - No change

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -262,6 +262,9 @@ struct rzg2l_pinctrl_data {
>         const struct rzg2l_hwcfg *hwcfg;
>         const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
>         unsigned int n_variable_pin_cfg;
> +       unsigned int num_custom_params;
> +       const struct pinconf_generic_params *custom_params;
> +       const struct pin_config_item *custom_conf_items;

Perhaps this should be protected by #ifdef CONFIG_DEBUG_FS, too?

>         void (*pwpr_pfc_unlock)(struct rzg2l_pinctrl *pctrl);
>         void (*pwpr_pfc_lock)(struct rzg2l_pinctrl *pctrl);
>         void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, void __io=
mem *addr);
> @@ -2374,6 +2377,13 @@ static int rzg2l_pinctrl_register(struct rzg2l_pin=
ctrl *pctrl)
>         pctrl->desc.pmxops =3D &rzg2l_pinctrl_pmxops;
>         pctrl->desc.confops =3D &rzg2l_pinctrl_confops;
>         pctrl->desc.owner =3D THIS_MODULE;
> +       if (pctrl->data->num_custom_params) {
> +               pctrl->desc.num_custom_params =3D pctrl->data->num_custom=
_params;
> +               pctrl->desc.custom_params =3D pctrl->data->custom_params;
> +#ifdef CONFIG_DEBUG_FS
> +               pctrl->desc.custom_conf_items =3D pctrl->data->custom_con=
f_items;
> +#endif
> +       }
>
>         pins =3D devm_kcalloc(pctrl->dev, pctrl->desc.npins, sizeof(*pins=
), GFP_KERNEL);
>         if (!pins)

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

