Return-Path: <linux-gpio+bounces-15387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA1A28943
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 12:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 589D37A4EB1
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 11:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B7422ACD3;
	Wed,  5 Feb 2025 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHFiPboo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D1C22B8A0;
	Wed,  5 Feb 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754915; cv=none; b=MklmAEa0kRMQSVaj5uIgVqq1AH7DS2/gi/dNb20elXh9D64oId5ZG+TL8eKiM1wEQTEOZQHoIrukZSplNQ3qwbhYnoxKmcQcr/9HwQGFkekIOnGdQQ01Lb9zFshbc1v4wjVkvhhuQHVf49lRfODf/6b8DL0o9xLwI/+3G1usv98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754915; c=relaxed/simple;
	bh=h+wVNmyylYiGnfgPser+Aho0uLJrCJGw90EKVPYZExg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRyrRwPEpPjH1OZ60rbvpHWS8cf3dZNfSNel2AiF/y6J/i4fZ4db0pbQEBxmF3ZvosOfaqFMS7VoNL7kkxnNC5HJjeD3Hp/Ty2KPc//3ygybdF7Xdwq4xltuA3SQr8+G7K56uvNPwkSWeDM/v+HNDkfhCnbGDheDVGTkx0RK21A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHFiPboo; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-518954032b2so1991433e0c.0;
        Wed, 05 Feb 2025 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738754906; x=1739359706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zfbqjn/+BTjGn3HRQo9g+ZrBnXWD2gznbIgT8os1cQ=;
        b=QHFiPbooPXsLFS0T2/A+UmTqI7E1rEmH9KIBrRSkMYZz2wVWYSfk+GaBqd2S/cLQHk
         YH82aJw6re+UGDghegxtxu0X7VibQW8w2+eMCIMwNtQx7l12CakYOD6KkDpovJ2tCZv9
         tV84MNGFtE3KzDXAXrjyxHAFEklb27iOVQ1Pvy+0Ed5rftaLEnf5cKOt7SvmhDx2OoBB
         MwlI9XZi1D91MYjvZQrRYCNZIgzgWVikY4MPRWO4a6VtGLf62bdU9zhTkx2nX/0mGE8h
         S2wrw5mksrge+IdbjPm7x67rYrKZM1GtyDc3LuCVz0Y5Z3kjpNphtwAVBF+jmT7mLY4n
         +eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738754906; x=1739359706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zfbqjn/+BTjGn3HRQo9g+ZrBnXWD2gznbIgT8os1cQ=;
        b=ea2H8eOspU+qlJRdX4sGnpPQgQ4YN07PvmF4xCQX53TEjgLCUTE2GZpHFy5/dCBoEa
         7fOtYWTlo4hPPSqCn9jH/tqKTywgA1s1VPRoutEyJwezhJpLoUiKH8Rsjhnfv5700LA/
         S65UPFKECK8cijO88Ghc7UqnZqOOfbN1qcszAEjXNITSkBZ4Gj6ZL3CBZa0fRY8w/ZVY
         hKjyp8cMwxi1ALxHsG1SrAhozMqMOrCrRxPaolNGhaRsC5VMOdzH7zVjc0udoqVHoKYA
         ec+9yfcxlpBJqb2TCOYUIq8ow64S6Ky0XBOLzgaW2ZwrDr3bhaGNHJmnbMqlsjqjHK0V
         oizg==
X-Forwarded-Encrypted: i=1; AJvYcCWcb642A6R0in5NBar3bwYB5WQGHOuHbwjPsalMm49CARjdLAHOOGaF0Z0pSW6BfSey2gtvQNpElTPh@vger.kernel.org, AJvYcCWrX4V5wUHHjDOqMSweZYBRazZS3mSwtT9uoJ5si+cghnENap8CXJCrzWKDh+vFPshY3e4y+7/TnZmYmA+/@vger.kernel.org, AJvYcCXcL61OFBl4wreXaBs0ui0pD7CVZTpdo18DMsNMMJRu0Uww8UiVp/C+a4Dc3B8ParESZbQQddGdN2py/cyjiAIzaWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Nx0IAx5pdCB5f0dVJ5P0KRHdtKedjRUAwutOy45lq5iT3WhI
	SbrIP/oT1pcpctdAzO7SNG50I8Ckx3+ARldWgR7TdEFwbFlsd0etU0VdljpM3igR/vuxSQlImVi
	ZtnzkCgNknbaVWR926RvAlkJ4yRYROec+Q2k=
X-Gm-Gg: ASbGnctxCxUjMWpYBfmcOpAoexaoXACgQ/8WyiGxes9FAIMaMEsQjHRBfDH3ztnmTxo
	MmtgqM3XEBYu9yEuhrgGLrrFUOuBeSTjp7NYTFBg2iXp+gTpi9N7AagpCBQr9OeWQRU2z4K7E
X-Google-Smtp-Source: AGHT+IEiOtyV8TvJVJz+35M5l1s+wtDuJEj3wSUA7ZuKuOJo+VuTHNinmiau/J43XHvARudE69SFhEIjAco2Q5H0D94=
X-Received: by 2002:a05:6122:4081:b0:516:157d:c5fb with SMTP id
 71dfb90a1353d-51f0c5126dcmr1233268e0c.10.1738754905728; Wed, 05 Feb 2025
 03:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205100116.2032765-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250205100116.2032765-1-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Feb 2025 11:27:59 +0000
X-Gm-Features: AWEUYZl9lUEDen7YN-g7ZtGYCoVQWpMYzvVY7RHscL8of6VR3asaUGW6PGI55-c
Message-ID: <CA+V-a8sd6B+_dSqrQJTggO2mr4GRQ8sqg3ES205mhgp0yz-fLA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for
 pull up/down
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 10:13=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S supports a power-saving mode where power to most of th=
e
> SoC components is lost, including the PIN controller. Save and restore th=
e
> pull-up/pull-down register contents to ensure the functionality is
> preserved after a suspend/resume cycle.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 4fae24453c11..7eb91ac5ba42 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -318,6 +318,7 @@ struct rzg2l_pinctrl_pin_settings {
>   * @pmc: PMC registers cache
>   * @pfc: PFC registers cache
>   * @iolh: IOLH registers cache
> + * @pupd: PUPD registers cache
>   * @ien: IEN registers cache
>   * @sd_ch: SD_CH registers cache
>   * @eth_poc: ET_POC registers cache
> @@ -331,6 +332,7 @@ struct rzg2l_pinctrl_reg_cache {
>         u32     *pfc;
>         u32     *iolh[2];
>         u32     *ien[2];
> +       u32     *pupd[2];
>         u8      sd_ch[2];
>         u8      eth_poc[2];
>         u8      eth_mode;
> @@ -2712,6 +2714,11 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rz=
g2l_pinctrl *pctrl)
>                 if (!cache->ien[i])
>                         return -ENOMEM;
>
> +               cache->pupd[i] =3D devm_kcalloc(pctrl->dev, nports, sizeo=
f(*cache->pupd[i]),
> +                                             GFP_KERNEL);
> +               if (!cache->pupd[i])
> +                       return -ENOMEM;
> +
>                 /* Allocate dedicated cache. */
>                 dedicated_cache->iolh[i] =3D devm_kcalloc(pctrl->dev, n_d=
edicated_pins,
>                                                         sizeof(*dedicated=
_cache->iolh[i]),
> @@ -2953,7 +2960,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2=
l_pinctrl *pctrl, bool suspen
>         struct rzg2l_pinctrl_reg_cache *cache =3D pctrl->cache;
>
>         for (u32 port =3D 0; port < nports; port++) {
> -               bool has_iolh, has_ien;
> +               bool has_iolh, has_ien, has_pupd;
>                 u32 off, caps;
>                 u8 pincnt;
>                 u64 cfg;
> @@ -2965,6 +2972,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2=
l_pinctrl *pctrl, bool suspen
>                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
>                 has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |=
 PIN_CFG_IOLH_C));
>                 has_ien =3D !!(caps & PIN_CFG_IEN);
> +               has_pupd =3D !!(caps & PIN_CFG_PUPD);
>
>                 if (suspend)
>                         RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + P=
FC(off), cache->pfc[port]);
> @@ -2983,6 +2991,15 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg=
2l_pinctrl *pctrl, bool suspen
>                         }
>                 }
>
> +               if (has_pupd) {
> +                       RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + P=
UPD(off),
> +                                                cache->pupd[0][port]);
> +                       if (pincnt >=3D 4) {
> +                               RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->=
base + PUPD(off),
> +                                                        cache->pupd[1][p=
ort]);
> +                       }
> +               }
> +
>                 RZG2L_PCTRL_REG_ACCESS16(suspend, pctrl->base + PM(off), =
cache->pm[port]);
>                 RZG2L_PCTRL_REG_ACCESS8(suspend, pctrl->base + P(off), ca=
che->p[port]);
>
> --
> 2.43.0
>
>

