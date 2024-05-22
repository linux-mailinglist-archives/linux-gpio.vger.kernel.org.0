Return-Path: <linux-gpio+bounces-6574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6BC8CC214
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 15:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888DF1F21806
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 13:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F2F13E03E;
	Wed, 22 May 2024 13:26:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B9442F;
	Wed, 22 May 2024 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384380; cv=none; b=QHH06kwR0ssEA/V8DlKlFBEzpkglp8GCbiAHW6UAa9gQUv5wjkubQ+Ppr7U4R1r8OuIS9ieFCXPvTp3uLCZPeLilEapjJrRxdJajAex4HmgYm4thB54KVbt4Q/UsoZ6CvXLE/C9H/mlbRue70OcW2rqmQJ5EcPWBtI2AWRIU6sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384380; c=relaxed/simple;
	bh=PwuBs4l7tsqx9ftMhCIr0LE9XDNUnVnc0QS6mT26CC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKPt1Cw6RmGhsZkGcnGzDcjAt4WvxHRi5h4b692RPki+oZSNBbMqxqUFWZ6NGNH5L2DeooOK3FX64d3q055mIC5kFBDEK96V2Ylgcko6LAWoQ6UR1LU/9BAGuFTm81WszGWb/NdbZsgB7iJdcI2Awpm8cd+7C6pP+HdZVE/U3g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61bee45d035so51561607b3.1;
        Wed, 22 May 2024 06:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384377; x=1716989177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BWoCUxM98JZE/5KyJauDn0ibvz16sXHbDWtdw8RsPE=;
        b=DDScg13nnpu+DfO1gA8E9NpIuoWn0lqMBqmo2/eeIrXGv20srKezIv90kCrwMxiOwd
         5BLOs0JDRPz7z33/twKRxq9dKF19Cmu6vSr4gs4Pl/pTYLryX9y3zwPuQ9mQxQ76yr8V
         UCRJXOQ8VcF7deJQYf/zxbefPWWGFhE3R0+aV1NM8G4NgINrsbuDIEAlvn/H58YC1z6g
         yZYrbLQoa1xxZC+VlpmRcWQ8hkCrfMrWPmMuS3nPy834iSlgW99ANAni3qcArWtoX8/6
         TgZMrIJ4TQqKu+KoFViv9Pg9qwdF3XPfWg87XbRqDQSMT5/U7BEQllt+1byLRo0hPP7K
         aG/g==
X-Forwarded-Encrypted: i=1; AJvYcCX4ds4JdJhnhWY35z4Sx2IlvuyqvuFZtCfKy4CLqLO893IQZrsi2KVtwkglJcuOZkQ6hRBo/45rIDJYRHmQdJXiUQmLvEvRZBSbySX62BL48oBxAaJhjx2o2w5vpavuLKC2Qk2Dzx98PcZ/3DRMHN3Ee+TZLHqC3Xwp2hR9h02cuXmCt9CoAz/crGBodv612YTxHlNNV/7ieS8avsI+u8pUfeSt4nwT2w==
X-Gm-Message-State: AOJu0Yzdp4evN8kAUgOrRZLkYU50S+wJQvQ04LSKv2QxVdoDG6r0BztB
	XHTD4KGUIuNNM64QctfW4t5A1jpPbiEDyE6CBIsIIJDUGtX2Qn414YZ2jqlO
X-Google-Smtp-Source: AGHT+IG2yLD/pLM9yMBjejRRS5meOttP051kmqUwivWLJcGPpTsQYuWLEWyGFZcPqUNBJNDIRIkO2g==
X-Received: by 2002:a0d:d50f:0:b0:615:1cbb:7b81 with SMTP id 00721157ae682-627e488130bmr19090187b3.46.1716384375491;
        Wed, 22 May 2024 06:26:15 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e3818fdsm59081277b3.129.2024.05.22.06.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:26:14 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61816fc256dso9276877b3.0;
        Wed, 22 May 2024 06:26:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNdKbWzdYxjJiE0xDIMH4OYvY2IYU7dFFKSAcfBB7/8q01x+Kw7HbneI8QsBq0fL1jjFwmw/wQDjwmaU1yZLflj5VBRPwRp4O2NLIhX8P5VIDlvMu99UrfpueigjPvOZ98aKpoxOOTKWF1diNCgOTBztEiElYqLpNfqeAVX2qCrowam+59wPP80mdDK4EITcuAROwVLkbI33yCccadzMuzpJHq7ZaBLg==
X-Received: by 2002:a25:c7d3:0:b0:df4:d9ba:2b68 with SMTP id
 3f1490d57ef6-df4e0a6e544mr2042601276.11.1716384374368; Wed, 22 May 2024
 06:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 15:26:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWS8TNVjd6UBYe1X7p=aVVFBBErh8StL1urJL7w_WYLzA@mail.gmail.com>
Message-ID: <CAMuHMdWS8TNVjd6UBYe1X7p=aVVFBBErh8StL1urJL7w_WYLzA@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] pinctrl: renesas: pinctrl-rzg2l: Add support to
 set pulling up/down the pins
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

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support to configure bias-disable, bias-pull-up and bias-pull-down
> properties of the pin.
>
> Two new function pointers get_bias_param() and get_bias_val() are
> introduced as the values in PUPD register differ when compared to
> RZ/G2L family and RZ/V2H(P) SoC,
>
> Value | RZ/G2L        | RZ/V2H
> ---------------------------------
> 00b:  | Bias Disabled | Pull up/down disabled
> 01b:  | Pull-up       | Pull up/down disabled
> 10b:  | Pull-down     | Pull-down
> 11b:  | Prohibited    | Pull-up
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - New patch
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 102fa75c71d3..c144bf43522b 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -122,6 +122,7 @@
>  #define IOLH(off)              (0x1000 + (off) * 8)
>  #define SR(off)                        (0x1400 + (off) * 8)
>  #define IEN(off)               (0x1800 + (off) * 8)
> +#define PUPD(off)              (0x1C00 + (off) * 8)
>  #define ISEL(off)              (0x2C00 + (off) * 8)
>  #define SD_CH(off, ch)         ((off) + (ch) * 4)
>  #define ETH_POC(off, ch)       ((off) + (ch) * 4)
> @@ -140,6 +141,7 @@
>  #define IEN_MASK               0x01
>  #define IOLH_MASK              0x03
>  #define SR_MASK                        0x01
> +#define PUPD_MASK              0x03
>
>  #define PM_INPUT               0x1
>  #define PM_OUTPUT              0x2
> @@ -265,6 +267,8 @@ struct rzg2l_pinctrl_data {
>         void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, void __io=
mem *addr);
>         u32 (*read_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset=
, u8 pin);
>         int (*write_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offse=
t, u8 pin, u8 oen);
> +       int (*get_bias_param)(u8 val);
> +       int (*get_bias_val)(enum pin_config_param param);

Please use consistent naming: "pmc_writeb" uses <noun>_<verb> ordering,
"get_bias_pararm" uses <verb>_<noun> ordering.

Perhaps "hw_to_bias_param()" and "bias_param_to_hw()?"

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

