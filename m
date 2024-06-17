Return-Path: <linux-gpio+bounces-7499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010090AD5D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35E11F22E95
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 11:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A4D194C63;
	Mon, 17 Jun 2024 11:52:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7419308B;
	Mon, 17 Jun 2024 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625150; cv=none; b=a+fOqOo0q2AUPTDi1hYNQMVryEq0HO4ErdjINpkRF9kyI5uE9C/Sp8v4JcU0tztyGEC1L9ZE1xEBcHQQnY0g3IFCI8iXjh1WS5M8SiHY5ucSmD35NDrnDCJ5aZ1G7fLrM4MkwPR02hLtwp0+O4qDtz1+ON+VSce2uD9h/q7PEDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625150; c=relaxed/simple;
	bh=koL3WREvFr2U0RRtHWd4nkmpdRMZEcmn0TkoxHD6dTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsfak/ham3ivRxy0ZnLGHaC8PLO4GO1GlT5LiW4ScF37i6kraebf3T/r95r/6hLn1+EgQCm6FY8NzUM6bRZIbyEtTw5Hy+uV22cUAl1+AlU0z56CaaATKQP+Vy1YegmyjNvyIn6dTOyeWMnY22ngk0ldecdxGCT+UhanKpyQFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so4296340276.2;
        Mon, 17 Jun 2024 04:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625147; x=1719229947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GA1oJlzvRviKeAzuoDJY598HuGa5/dcrX2d+DsjBQl0=;
        b=QpPtXVFAp3mlcxQc/zsYVmvm9hcbEkr6jKEaUzMT5fC4NWVZK0eC7pqKRXAo73kzNs
         nhkYrpMVuXbc/cVXwhMdndGL6PNPOkVikFuPN76eQ9cMf4qYB1hPNj+j+MMvK9vE+BgV
         zDNjUtNdW7Q5bg/FTYk6SlbdU2ctmPUsc0f5Re3xKwif874nTfEYY/pazi6dlq7anNoL
         8aLbIakIVp50G0A9yXMIS7xTrBTzzC2eW9xJg0xGp/IeEI+UZU6rVdMJ45F8TEDaZcNV
         4HaftE5VX0ngm2Sk1bX3347b2eGoQHNB9zeeX3J4RAUhxpcTpxDyzPbW4ITm8i86PDCw
         JIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUAtUIlTjKC9WiAAnzzLKlNPQLrjezZ4k1vtC5JpJxkBa++1JumBhTv2GERzSNbOuRuNMGfOP0JCNXpGv8waYrIMMK4xyQgrwmBdbuJ/nOb8Sf8T++VaHQ4hldg52Wr51ub+HvCZwMDc1u5/8NKQZ5Mjv6iFBJJX1e2e14cyLtZky2qGE6KxDPg5Kddgt9t+rp584nZlct/diXZLW7PBnVMKG5LP1q7kg==
X-Gm-Message-State: AOJu0YzXfykB2/vlR7la4FogsYjtzs8RssKbCyfNZyFhsCYk6I5iY2I/
	NL3bsweQYPPs4TOqz54ZE4UeAhLPZiNs1KcjGkA9oiG+s/wITmTkh6osZnUR
X-Google-Smtp-Source: AGHT+IF0VMI7ITzhl0oirU2MwPIqb7+85wB+ph3qLTChOmQ6/p2ZeD9ZJ17YqyZkPjcAqbaTx+oGlg==
X-Received: by 2002:a25:2e08:0:b0:dfa:47cf:d293 with SMTP id 3f1490d57ef6-dff15474608mr8396439276.40.1718625146877;
        Mon, 17 Jun 2024 04:52:26 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04a4d8e5sm1815763276.46.2024.06.17.04.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 04:52:26 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6312f1f83d9so30329757b3.2;
        Mon, 17 Jun 2024 04:52:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUN5UUMplf47zRJ3ja+fMgRNCCjXrMF9Z//R/3OQm4tfyscYPDhWMjE1pXCMKux5pjCU5yIUQGQkS4ggVRGXum//0o98plVrpsi0fy/ZBfm3/a2sBUrtNxugcjYms6BIWOu2pgHcPtbt8hjX1ELbQF7PRaAs3f6e5cqgBJBzTKqWkhlOH0Ua96Xo2JVE5FqLJ+wkx4PDb7c3RjLkTLeEZRBxjqgrdN3A==
X-Received: by 2002:a0d:e982:0:b0:62f:664d:b6f6 with SMTP id
 00721157ae682-63222a57989mr79724687b3.20.1718625146469; Mon, 17 Jun 2024
 04:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com> <20240611113204.3004-2-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240611113204.3004-2-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 13:52:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-BrHBt9eDw_GaW7JwJ+TP6Q+68EN1Tpp2Z5H00Dq+3g@mail.gmail.com>
Message-ID: <CAMuHMdW-BrHBt9eDw_GaW7JwJ+TP6Q+68EN1Tpp2Z5H00Dq+3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] pinctrl: renesas: rzg2l: Clarify OEN read/write support
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Jun 11, 2024 at 1:32=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> We currently support OEN read/write for the RZ/G3S SoC but not the
> RZ/G2L SoC family (consisting of RZ/G2L, RZ/G2LC, RZ/G2UL, RZ/V2L &
> RZ/Five). The appropriate functions are renamed to clarify this.
>
> We should also only set the oen_read and oen_write function pointers for
> the devices which support these operations. This requires us to check
> that these function pointers are valid before calling them.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> ---
> Changes v1->v2:
>   * New patch to clarify function names.

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -1016,31 +1016,31 @@ static u8 rzg2l_pin_to_oen_bit(u32 offset, u8 pin=
, u8 max_port)
>         return pin;
>  }
>
> -static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 off=
set, u8 pin)
> +static u32 rzg3s_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 off=
set, u8 pin)

> -static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 of=
fset, u8 pin, u8 oen)
> +static int rzg3s_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 of=
fset, u8 pin, u8 oen)

As commit 7d566a4d270c52ff ("pinctrl: renesas: rzg2l: Add function
pointers for OEN register access") did not rename
rzg2l_{read,write}_oen() to rzg2l_oen_{read,write}(), to match the
.oen_{read,write}() callback names, this is a good opportunity to fix
that oversight.

The v2h variants already match the callback names.

> @@ -1215,6 +1215,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl=
_dev *pctldev,
>                 break;
>
>         case PIN_CONFIG_OUTPUT_ENABLE:
> +               if (!pctrl->data->oen_read)
> +                       return -EOPNOTSUPP;

Perhaps the check for PIN_CFG_OEN in each of the .oen_read()
callbacks should be moved here?

>                 arg =3D pctrl->data->oen_read(pctrl, cfg, _pin, bit);
>                 if (!arg)
>                         return -EINVAL;
> @@ -1354,6 +1356,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl=
_dev *pctldev,
>
>                 case PIN_CONFIG_OUTPUT_ENABLE:
>                         arg =3D pinconf_to_config_argument(_configs[i]);
> +                       if (!pctrl->data->oen_write)
> +                               return -EOPNOTSUPP;

Likewise.

>                         ret =3D pctrl->data->oen_write(pctrl, cfg, _pin, =
bit, !!arg);
>                         if (ret)
>                                 return ret;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

