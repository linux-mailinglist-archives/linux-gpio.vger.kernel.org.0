Return-Path: <linux-gpio+bounces-659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2202D7FD56D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 12:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D0C6B212A9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A651C6AD;
	Wed, 29 Nov 2023 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2BBD5C;
	Wed, 29 Nov 2023 03:21:57 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db4422fff15so5594180276.1;
        Wed, 29 Nov 2023 03:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256916; x=1701861716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQMIsPSnGej6JUmLAmR8223gXbEgbLhru5iUfZNaJ9Y=;
        b=aG3ATMfT3/n0QjJZAKgzaLaeH9mOjMtsgwwPD4OnB/2zLPL9+9knXssPG0W+TEdMA/
         vtPnx/c/bVaatTiTZYf3nbOjlEHSutM++w3B0lGZiz4bfKdpk7x4AzjETtdtRJNIw1at
         ip+oMbP4AT4zTbQnCRVbdnw+WAgrON1Xc/7EyHtD8lVefsYUBGHRiahkQjy71Y91Y51u
         LDYUPK4DbX4V8CsTif3b5B6BmVFDEPPSNRVErnY42hrPu63ueU09QADCgPucQ/ntmg7s
         mWCVL558DegtFdF/8rpXOXkYL8BBLPDQ2b7EQse+EW7iqlg2SsVXvF9khgRTGtFW5e3d
         vsFw==
X-Gm-Message-State: AOJu0YyQZXo/qE1134HIvr5u9xQBQiA8E2nGbAMZS9A571mCT3wkQD43
	4LXufgca+SnAf02lSZmGgyqMgRZFX00WCw==
X-Google-Smtp-Source: AGHT+IFEXZ4xfi2mEgBMBigLSielKuHT15ssBs+m4TCTuJMeTnCclwHqIUn2Cz1OJb25aJ2NQGYCPA==
X-Received: by 2002:a25:256:0:b0:da0:29df:ae62 with SMTP id 83-20020a250256000000b00da029dfae62mr16626470ybc.35.1701256916142;
        Wed, 29 Nov 2023 03:21:56 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id c84-20020a254e57000000b00d9abff76f5csm4143479ybb.9.2023.11.29.03.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:21:56 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db4422fff15so5594173276.1;
        Wed, 29 Nov 2023 03:21:56 -0800 (PST)
X-Received: by 2002:a25:fc22:0:b0:d9a:618a:d727 with SMTP id
 v34-20020a25fc22000000b00d9a618ad727mr16348333ybd.41.1701256915894; Wed, 29
 Nov 2023 03:21:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:21:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
Message-ID: <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
Subject: Re: [PATCH v3 06/22] pinctrl: core: Make pins const in struct group_desc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, Nov 28, 2023 at 9:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> It's unclear why it's not a const from day 1. Make the pins member
> const in struct group_desc. Update necessary APIs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -642,7 +642,7 @@ static int pinctrl_generic_group_name_to_selector(str=
uct pinctrl_dev *pctldev,
>   * Note that the caller must take care of locking.
>   */
>  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *n=
ame,
> -                             int *pins, int num_pins, void *data)
> +                             const int *pins, int num_pins, void *data)
>  {
>         struct group_desc *group;
>         int selector, error;
> diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> index 530370443c19..01ea1ce99fe8 100644
> --- a/drivers/pinctrl/core.h
> +++ b/drivers/pinctrl/core.h
> @@ -203,7 +203,7 @@ struct pinctrl_maps {
>   */
>  struct group_desc {
>         const char *name;
> -       int *pins;
> +       const int *pins;
>         int num_pins;
>         void *data;
>  };
> @@ -222,7 +222,7 @@ struct group_desc *pinctrl_generic_get_group(struct p=
inctrl_dev *pctldev,
>                                              unsigned int group_selector)=
;
>
>  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *n=
ame,
> -                             int *gpins, int ngpins, void *data);
> +                             const int *pins, int num_pins, void *data);
>
>  int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
>                                  unsigned int group_selector);

Probably this is also the right moment to change all of these to arrays
of unsigned ints?  Else you will have mixed int/unsigned int after
"[PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct
group_desc", and purely unsigned int after "[PATCH v3 22/22] pinctrl:
core: Remove unused members from struct group_desc".

The Renesas pinctrl drivers already pass arrays of unsigned ints.
Some other drivers still use arrays of ints, though.

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

