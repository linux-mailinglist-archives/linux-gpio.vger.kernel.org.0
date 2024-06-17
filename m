Return-Path: <linux-gpio+bounces-7505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34F90B1C6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 16:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6F991C20D15
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EEC1AB8EF;
	Mon, 17 Jun 2024 13:36:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31D1AB52F;
	Mon, 17 Jun 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631389; cv=none; b=V2Iy/GxELzTrpnn1SL+YBnTSkmEgbMDk/DQUfNqoWHlw9kooiqTmeP69fGUOaCKgSm9Yy2s0WapAeLmcwatvEano0OEeDR5rbIbEk0xAIlpaHh5eEr841kWYXUiQQG2K9fWIbl2BnFcmhi4xPuPmq7jDDrGxpB1KVCaSSf0Nbts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631389; c=relaxed/simple;
	bh=w2U5pZAt/84qA8S9DUJyXOujch5rtf8ctaEYUOJ+FZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfAF76ljm3IVrBROOfGVQi9g4noDulDN8pkFFLF+5pAX/e+APNY0iSRL0oeDO2OZ4HsMr3vJRqSXru8hG7OX4WG2aCg2ABaAvvhJLjASKYaSWpg3jUTH/10uj8kuuDARirPmOTZJkV0yoO0E0t1Ht0lC1UrGacDyMOXHcj+OgN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-627e3368394so44818407b3.2;
        Mon, 17 Jun 2024 06:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631385; x=1719236185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL05cXLA28sNYHpBmwXcBiu29znRtT0jenJjusxIxa8=;
        b=YkJ/3XtkrymD7AAgwQKzRsU+r/gYQDDCOAV/oihO3z78YrRsT1wUQKKIPQ+E3M12z5
         J67hh67EKesEb9ViV5uCBvFOXCPwjW00j6Z01mBp7RSfjYncZyNy3iTowEm8r39tqFoc
         Zmak49+yg6rZaAbyX2hDxAqn9SORDkG0Mzx+Be8xpHyHm+h5dz0LgncXO13Gj5iF6yQi
         Kco8GiJ1HF64eZpzRNZm1vGdYRKK0uxgzzCdJqVWHc/loY9pnBjMzv/YddQg2qs1wh0n
         isERVXTrEjiB6Jeq4jN+qJSAIoGzjm+/qet3gefWxU96wF8V33aUbydmc2Q6gFbxEtiq
         qPLA==
X-Forwarded-Encrypted: i=1; AJvYcCVCwLv7SA3u03S0pDHSOSHV4zliWIa0EmSpNOIIjx2fKSgdGb8EXCx38KH9lVIn02L1SV1CSvzyRlgwUJnr4iQHijPDdgecLi/uVhMY0/e/RIEvpihPDrkovXOY6cvnGDxc3zSB5pq0dd2ZhOMOC2mw/yDi8mvrqJ8aNC37V+aVdT6tMUK2DgG0cV4j
X-Gm-Message-State: AOJu0YxUjNRCTxDaZvGP8yYJZNznWORUAv92PyamlGxUdLM3U2AAhgaD
	mwXMfJ2j0gQaPzKsvf0gPMB30hmwzAb0ATA26V7ZTKo8t5R+oZOvqnBmpWGl
X-Google-Smtp-Source: AGHT+IGMSQjnNkuWJmtMrGtNAkNAZFvqVgJJQ7j8gYXtGuw3GNFVUT6Sg4bNQ23KeUR+jYdMaa2GAg==
X-Received: by 2002:a81:7cd5:0:b0:632:b827:a1ba with SMTP id 00721157ae682-6333082fb6bmr70717947b3.7.1718631384796;
        Mon, 17 Jun 2024 06:36:24 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631189a7d28sm14116197b3.40.2024.06.17.06.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 06:36:24 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso2987246276.0;
        Mon, 17 Jun 2024 06:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvGbtZ+94Ybijwe1JZNAMDUkTWCBvOYD8bOTsfHOtHmRg2grcZJWp1hNwdzXt1QVMEiKCG7WtC387G6G2Nov+AJLNxnp6PIFoQGS238S3x4sr1pxL88GIh8k08cUt5PCTNGf8h4Vpeoj+QVuSxTPcEqYFLosYo3zkHeWTEPrdrbWPqbRT402Lm8079
X-Received: by 2002:a25:df01:0:b0:dfb:1b5:6e6a with SMTP id
 3f1490d57ef6-dff1549049fmr8747190276.43.1718631384061; Mon, 17 Jun 2024
 06:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617131511.160877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240617131511.160877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 15:36:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDDfOeQUwmuYKPvAXaXBJCB17ecH8sfpC4=7dTVKthhw@mail.gmail.com>
Message-ID: <CAMuHMdUDDfOeQUwmuYKPvAXaXBJCB17ecH8sfpC4=7dTVKthhw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Use BIT_ULL for PIN_CFG_* macros
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Jun 17, 2024 at 3:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Commit 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct
> rzg2l_variable_pin_cfg") introduced a Smatch static checker warning:
>
>     drivers/pinctrl/renesas/pinctrl-rzg2l.c:374 rzg2l_pinctrl_get_variabl=
e_pin_cfg()
>     warn: was expecting a 64 bit value instead of '~((((1))) << (16))'
>
> The function `rzg2l_pinctrl_get_variable_pin_cfg` attempts to mask out
> `PIN_CFG_VARIABLE` using `BIT(16)`. However, since `pincfg` is a `u64`,
> this inadvertently masks the high 32 bits as well, which is unintended
> (on non 64-bit platforms). To correct this, `PIN_CFG_VARIABLE` should
> be defined using `BIT_ULL(16)`, ensuring proper 64-bit masking.
>
> To avoid such issues, update `PIN_CFG_*` macros to use `BIT_ULL()`.
>
> Fixes: 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct rzg2l_variable=
_pin_cfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/5c1bf20b-7e94-4b06-95e5-da9f99750203@=
moroto.mountain/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I would like to brainstorm a bit about this, though. See below...

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -41,28 +41,28 @@
>  #define MUX_FUNC_MASK          GENMASK(31, 16)
>
>  /* PIN capabilities */
> -#define PIN_CFG_IOLH_A                 BIT(0)
> -#define PIN_CFG_IOLH_B                 BIT(1)
> -#define PIN_CFG_SR                     BIT(2)
> -#define PIN_CFG_IEN                    BIT(3)
> -#define PIN_CFG_PUPD                   BIT(4)
> -#define PIN_CFG_IO_VMC_SD0             BIT(5)
> -#define PIN_CFG_IO_VMC_SD1             BIT(6)
> -#define PIN_CFG_IO_VMC_QSPI            BIT(7)
> -#define PIN_CFG_IO_VMC_ETH0            BIT(8)
> -#define PIN_CFG_IO_VMC_ETH1            BIT(9)
> -#define PIN_CFG_FILONOFF               BIT(10)
> -#define PIN_CFG_FILNUM                 BIT(11)
> -#define PIN_CFG_FILCLKSEL              BIT(12)
> -#define PIN_CFG_IOLH_C                 BIT(13)
> -#define PIN_CFG_SOFT_PS                        BIT(14)
> -#define PIN_CFG_OEN                    BIT(15)
> -#define PIN_CFG_VARIABLE               BIT(16)
> -#define PIN_CFG_NOGPIO_INT             BIT(17)
> -#define PIN_CFG_NOD                    BIT(18) /* N-ch Open Drain */
> -#define PIN_CFG_SMT                    BIT(19) /* Schmitt-trigger input =
control */
> -#define PIN_CFG_ELC                    BIT(20)
> -#define PIN_CFG_IOLH_RZV2H             BIT(21)
> +#define PIN_CFG_IOLH_A                 BIT_ULL(0)
> +#define PIN_CFG_IOLH_B                 BIT_ULL(1)
> +#define PIN_CFG_SR                     BIT_ULL(2)
> +#define PIN_CFG_IEN                    BIT_ULL(3)
> +#define PIN_CFG_PUPD                   BIT_ULL(4)
> +#define PIN_CFG_IO_VMC_SD0             BIT_ULL(5)
> +#define PIN_CFG_IO_VMC_SD1             BIT_ULL(6)
> +#define PIN_CFG_IO_VMC_QSPI            BIT_ULL(7)
> +#define PIN_CFG_IO_VMC_ETH0            BIT_ULL(8)
> +#define PIN_CFG_IO_VMC_ETH1            BIT_ULL(9)
> +#define PIN_CFG_FILONOFF               BIT_ULL(10)
> +#define PIN_CFG_FILNUM                 BIT_ULL(11)
> +#define PIN_CFG_FILCLKSEL              BIT_ULL(12)
> +#define PIN_CFG_IOLH_C                 BIT_ULL(13)
> +#define PIN_CFG_SOFT_PS                        BIT_ULL(14)
> +#define PIN_CFG_OEN                    BIT_ULL(15)
> +#define PIN_CFG_VARIABLE               BIT_ULL(16)

PIN_CFG_VARIABLE looks a bit misplaced here, in between all the flags
indicating actual capabilities of a pin.

What about relocating it to the "high" half, and moving it next to
RZG2L_SINGLE_PIN? Perhaps even renaming it to RZG2L_CFG_VARIABLE?

> +#define PIN_CFG_NOGPIO_INT             BIT_ULL(17)
> +#define PIN_CFG_NOD                    BIT_ULL(18)     /* N-ch Open Drai=
n */
> +#define PIN_CFG_SMT                    BIT_ULL(19)     /* Schmitt-trigge=
r input control */
> +#define PIN_CFG_ELC                    BIT_ULL(20)
> +#define PIN_CFG_IOLH_RZV2H             BIT_ULL(21)
>
>  #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
>                                         (PIN_CFG_IOLH_##group | \

Then the other PIN_CFG_* definitions can keep on using BIT().
To make that safer, PIN_CFG_MASK should be restricted to 32-bit:

    -#define PIN_CFG_MASK                    GENMASK_ULL(46, 0)
    +#define PIN_CFG_MASK                    GENMASK_ULL(31, 0)

and several u64 variables can be changed to u32 again.

What do you think?

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

