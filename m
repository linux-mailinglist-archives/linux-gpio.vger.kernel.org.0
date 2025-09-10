Return-Path: <linux-gpio+bounces-25879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E92B511EA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 10:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D59D563753
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 08:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40293128A1;
	Wed, 10 Sep 2025 08:57:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE630311978;
	Wed, 10 Sep 2025 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494651; cv=none; b=AejHebfyNxHHTYycCw++GemDn9nl7EmD9ObTBED+1BOHylGqq+JeIVALJqNFI6PIhmzMIpjCvXueffrZ9BuHm2BaOkSax17FhUcd4ytzk/QhawKKNGjJdXuGsfLa/OGOTlUHHHLsYTxx8R/biYs2AbFSyEeJOmBNK+nghsj3W04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494651; c=relaxed/simple;
	bh=pFA2DC4Fr0B/QuLvbQojafhdgkBa4e/UFDYZYrAkV2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQlQuQkV0bwuEwsPrFs/H7A5QHLaPNMNQjUc/morVKHMufNH4j3TrnyfUhW5oNKAItqK+bf3HJw8sIdykBrJbLiUQvOKfNmkTpnqFmmIgIrwOo0o2ffVYnsWTOqtlQHW5L40Ye65VVv2/JbcaRI0m+ZLDfAoVf3yBZ2EBowu2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8c1e1b6ecd5so880925241.1;
        Wed, 10 Sep 2025 01:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757494648; x=1758099448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhpSPAIqH+I0V+MQ5ii2UWL0/YJFPiz2fJBRsk4AV2w=;
        b=o1G0RP1ixwMR066E5xVbEwe5DptB1iWzfzDdEDuB64CRDMnkT/xgJdht2iOTQ155gr
         nklKOxB43o1j2Mn0Z8byAAjphAwACgodvmCJHL+VTz7etjvf9YMIeLuHJOTyBwEQSlNn
         u/wa5yYaem1EFdLqZKCGS6aUiZIXGQEd8+ptpjP8ss1178H+Dd8JMBpAXWAe5quJkg6Q
         1rs5a08XImQ4HWsMKVQTINNbhlxCTA/ug07rYIC46ZWWixvqzHpGdGECJkBbR5NghPdi
         /vF3Dv9AiNTFtLztAW9sOPaE41Fb3OsX/pGuX0mYEX8B+WhTJSxDvDw93DmkeaTAw2SS
         myMg==
X-Forwarded-Encrypted: i=1; AJvYcCUW+qkLGUSlbn+7C7x0WOLKD0R/20NPgHY9g4lxQaq5mRtMKAArPrMHvnv5RvGW75ZeJDDv9zxXpNwbZs7AN5Zw66o=@vger.kernel.org, AJvYcCWIYkeTV/2We0hr9y74HAS5/xjwn6F6a2yMa6+XKtJCkLTJIQVQnV4p45xO3cAK1a6EMNR8yEp6KNpe@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxfTgISCdiaaDOfQLPu/8IBjtDxa4/912Sk++mS8wWmLJBbU8
	6k8Glsii8ThYK5gesMSydgtRSphgjO7zO9h/a7cAPUBoUditJYSkvJHBhxhSSs2M
X-Gm-Gg: ASbGnctgKgHNHyUJqqz1iLEA+kJ9ozqa1XbLgBUSFVhds0VFL95UIwZ63+tDctHfiNu
	W8jNJgCfGcQ3o7XV4aGxp69lrzQuN9dDFbhlFj/uY0/YHR//Frk9qqMxroM9HRjdh94H0RwneKh
	4ET0cOKNHeNBMMgLPUtpL7CDULY5XvvFcMG1TRKKB+1/+3fuY2i5qT/a11lF9uVC/R4ofcoXKrS
	7iqfmJa85BoCwDmr9lfrjPyR9ahyCVtG2DyiaBiobeJhMBes+3DwCQbefkI0qIsWjgs05+ovNJO
	ydwVxU5DPVozNDLrmDiMlqDKdCt19lNcfiyPUn8eniVvmJ15KpQQa3jgTOclkspL1fMK6XFloje
	obvULd3IKl6U+G9+r1J5mImFbLCg6hbslyq+nbSqGin+rqPjexz7A+r/2GAwxAKDPkSr3+vA=
X-Google-Smtp-Source: AGHT+IHSCWh41KS6+4sJAsgK9JDox7LgYeoBY5mWW8g1bzQIn7He/wf8q4NaVysBhmbJC1au4j1+eQ==
X-Received: by 2002:a67:e7cc:0:b0:51c:77b:2999 with SMTP id ada2fe7eead31-53d1aead9a3mr4868121137.2.1757494648455;
        Wed, 10 Sep 2025 01:57:28 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89984bf4770sm7261000241.22.2025.09.10.01.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:57:28 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89018ec3597so4063051241.0;
        Wed, 10 Sep 2025 01:57:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQFCmIPAKPmcFm19IfYeL5QHYacNMQlLKowW2SPDP8H+uWJoJerya4SaEm9MzXHKMUTRAphvBqCgbufuM2WuhXFj8=@vger.kernel.org, AJvYcCWuAxWkYVzlzcfgdx+LFA5ABO0A98k6sI7uxBKFiC2PSjeEhLvaHcbAvh7ECnv4yiZ16DX15XeZj1rj@vger.kernel.org
X-Received: by 2002:a67:e7cc:0:b0:51c:77b:2999 with SMTP id
 ada2fe7eead31-53d1aead9a3mr4868108137.2.1757494647768; Wed, 10 Sep 2025
 01:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <470389b1411074f0da2cef8c6c3531f16aba6589.1755164114.git.geert+renesas@glider.be>
In-Reply-To: <470389b1411074f0da2cef8c6c3531f16aba6589.1755164114.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 10:57:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDFhAWoAR_2aEW7Ssjy=RxiYt3z2XSQqKDASMshe0_TQ@mail.gmail.com>
X-Gm-Features: AS18NWDrP5jOyYItOC7ZxRyUJrOx2d-6iP8Qf18f4v1ufk6g079Xm_aB1mbqN38
Message-ID: <CAMuHMdXDFhAWoAR_2aEW7Ssjy=RxiYt3z2XSQqKDASMshe0_TQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: Make mux_conf const in rza1_pin_mux_single()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Thu, 14 Aug 2025 at 11:51, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The rza1_mux_conf object pointed to by the mux_conf parameter of
> rza1_pin_mux_single() is never modified.  Make it const.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This has a small conflict with "[PATCH v4 09/15] pinctrl: constify
> pinmux_generic_get_function()"[1], which I have already acked.
> Perhaps the best solution is for Bartosz to include this in his series?
> Or I can resend an updated version for LinusW to apply after Bartosz
> series has handled?

Bartosz' series is now in pinctrl/for-next.

Do you want me to send an updated version of this patch for you to
apply directly, or do you want me to just apply this version, and
solve the conflict later yourself[*], when merging renesas-pinctrl?

[*] And sfr, when creating linux-next.

Thanks!

> [1] https://lore.kernel.org/all/20250812-pinctrl-gpio-pinfuncs-v4-9-bb3906c55e64@linaro.org/
>
>  drivers/pinctrl/renesas/pinctrl-rza1.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
> index 23812116ef42682d..4613d2c8cccc1dab 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -669,7 +669,7 @@ static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
>   * @mux_conf: pin multiplexing descriptor
>   */
>  static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
> -                              struct rza1_mux_conf *mux_conf)
> +                              const struct rza1_mux_conf *mux_conf)
>  {
>         struct rza1_port *port = &rza1_pctl->ports[mux_conf->port];
>         unsigned int pin = mux_conf->pin;
> @@ -1119,7 +1119,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
>                            unsigned int group)
>  {
>         struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
> -       struct rza1_mux_conf *mux_confs;
> +       const struct rza1_mux_conf *mux_confs;
>         struct function_desc *func;
>         struct group_desc *grp;
>         int i;
> @@ -1132,7 +1132,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
>         if (!func)
>                 return -EINVAL;
>
> -       mux_confs = (struct rza1_mux_conf *)func->data;
> +       mux_confs = (const struct rza1_mux_conf *)func->data;
>         for (i = 0; i < grp->grp.npins; ++i) {
>                 int ret;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

