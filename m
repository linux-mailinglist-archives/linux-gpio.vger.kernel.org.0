Return-Path: <linux-gpio+bounces-9371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB94964622
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 15:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDAE41C23D51
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 13:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A1C1A7047;
	Thu, 29 Aug 2024 13:15:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B519005B;
	Thu, 29 Aug 2024 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724937351; cv=none; b=kSN+iYkyFrphZRkk+oLa2Yg8OMLD5lriEOrSZ2c5yqjMuhbweP1Sl6kKnrwBV+0/iDdaIMGBsxyVDgK1qLvNlEkFQ6M3P3DaERJgPJLsUJWqUznwkO8S1V2y+d90v7fXQtfoVx0JNtL4iQGehHPuyiCdoAh6DfhkDh/Q1/Rd80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724937351; c=relaxed/simple;
	bh=SvcnL1CiJ4UYqU1+vWZ1TpjbnhjVzEHNqoFcTIuferw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FT5FDeu28wfoYGvTWbuZX6zXAAUtFUUOOA9nrkKsyo8GdJACWVyHeAr9EeTQxBSuU/jqSvG9/9JbJ3CdgqP5jCNkB2b0emZaJ+LMN+N5jdBX41IbPhwbouoQg6MgQfJQzdobcRv1L3+6oWv8wjYpWf9ODY348loVoYx4L7NG4+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1a2264e907so649667276.2;
        Thu, 29 Aug 2024 06:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724937348; x=1725542148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZP+WcrUbXlpLIN+zbDAxSw3wyDZd7f9soRRffkD1mr4=;
        b=PU2puXnBDzErqfK8znng/hMqbzZc3CjOlpRW+uPNIeMrYEVCgYo4CWZsn6ZI4h796k
         9x6KXUmxd926BmkIXuMjpXxbP41Z4cDJ3h6anQKNuAnfpFUQAm8Yt7J0dm7Z2NcG5F9U
         gltKz5K6cIXXGdf9QksfS0bbFr8LZSFGg2TjvP/WUqvtb9hg6P4ATcXjJy52PaW5WdVr
         HvErukvwE/uRNxnCQdTnVTDgEzEwcpmm/pdGtYcwdii/LmLnI+POr7obVer6/0E3xKYA
         2CDIPT7oT1wtyf8QultEsVLA2M/AmG4+u/OkIqT3AlebXIud5ogM3nqgBqA/PDV4i6f2
         GFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8USoJfhDSH0bFsYQR32k/+v4C6pG9rIpz5HPIEnlDGWDzwm37BCR7goNCOTbNy4/Al/AKVwNtm5nEKT/aIS4euPc=@vger.kernel.org, AJvYcCWs2bia9+kiCY6dwVhYpHNKsjCQAd07kFonFT53uxw9bFFP3BbWDaqM7Ja02S0heUhUsXjCJB9oC66qrRra@vger.kernel.org, AJvYcCXE4+d4XfOnXg3dRZDUs+/y+pBnKIwnpThoJZqTT11+jI1MzKqN+psSPzfv97dUer/ggshtiIVsPAGt@vger.kernel.org
X-Gm-Message-State: AOJu0YxgI8TnsZKmWpvPyRiCksJ5rrB96Vx5EttzCxc3kgc53N+Sdfyw
	OEUhl/aZINReGILxFsFKUmm2qHMyQHcR6I+5N4Dv59f/ETYh56BroXm4UBzX
X-Google-Smtp-Source: AGHT+IHK5HgicfN/6dt1utpjkwz7mf+Sgz81J6u0cgCFw213cKeEXvqhgKtifuY/V85XzfHPS6ZSbw==
X-Received: by 2002:a05:6902:2503:b0:e0b:eb79:d49 with SMTP id 3f1490d57ef6-e1a5ab80046mr2609991276.18.1724937348163;
        Thu, 29 Aug 2024 06:15:48 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a626853absm234636276.28.2024.08.29.06.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 06:15:47 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e16518785c2so516106276.1;
        Thu, 29 Aug 2024 06:15:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTDuEcuWhpq/CPDmsSL722JzIeatOmMK7oaV8a4I8plIl+2vWNY69Oq2oPWM6SzBckF+0BPYtbO7HZ@vger.kernel.org, AJvYcCVsWObdyEFCaswuIN0L38VX9qMXYMfgNQFsRZBpidYSSzFUvzBY4z9DxTLnXJ3MH+CGukq3xhyDS/KIrNQ1@vger.kernel.org, AJvYcCW0bY7iInQ94Ut+QTK8ZVdO3xrhmMtOWj9Cx0hPiPp3j3QyjE7+Y3wuO7rEjCGH9km/4V25h8fdgHPmdXDEyz/pMHY=@vger.kernel.org
X-Received: by 2002:a05:6902:1b0c:b0:e16:6b7e:94b4 with SMTP id
 3f1490d57ef6-e1a5ac9a7f0mr3023234276.26.1724937347265; Thu, 29 Aug 2024
 06:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240827131722.89359-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240827131722.89359-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 15:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ-hy7aW-rs5eTLSOULF_GHVV=NHvjCLhPW3XS3Y=+8Q@mail.gmail.com>
Message-ID: <CAMuHMdVQ-hy7aW-rs5eTLSOULF_GHVV=NHvjCLhPW3XS3Y=+8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzg2l: Move pinconf_to_config_argument()
 call outside of switch cases
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Tue, Aug 27, 2024 at 3:17=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the `rzg2l_pinctrl_pinconf_set()` function by moving the call to
> `arg =3D pinconf_to_config_argument(_configs[i])` to the beginning of the
> loop. Previously, this call was redundantly made in each case of the
> switch statement.

This is not 100% true: the PIN_CONFIG_BIAS_* cases do not
call pinconf_to_config_argument(). But I agree that calling it
unconditionally doesn't harm.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1395,7 +1395,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl=
_dev *pctldev,
>                         break;
>
>                 case PIN_CONFIG_OUTPUT_ENABLE:
> -                       arg =3D pinconf_to_config_argument(_configs[i]);
>                         if (!(cfg & PIN_CFG_OEN))
>                                 return -EINVAL;
>                         if (!pctrl->data->oen_write)

Missed opportunity for simplification:

                case PIN_CONFIG_POWER_SOURCE:
-                       settings.power_source =3D
pinconf_to_config_argument(_configs[i]);
+                       settings.power_source =3D arg;
                        break;

> @@ -1432,8 +1429,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl=
_dev *pctldev,
>                         break;
>
>                 case PIN_CONFIG_DRIVE_STRENGTH:
> -                       arg =3D pinconf_to_config_argument(_configs[i]);
> -
>                         if (!(cfg & PIN_CFG_IOLH_A) || hwcfg->drive_stren=
gth_ua)
>                                 return -EINVAL;
>

                case PIN_CONFIG_DRIVE_STRENGTH_UA:
                        ...
-                       settings.drive_strength_ua =3D
pinconf_to_config_argument(_configs[i]);
+                       settings.drive_strength_ua =3D arg;
                        break;

The rest LGTM.

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

