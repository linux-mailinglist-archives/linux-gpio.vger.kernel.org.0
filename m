Return-Path: <linux-gpio+bounces-8050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881D927C47
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 19:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505601F23F5E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 17:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F5514037D;
	Thu,  4 Jul 2024 17:29:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4F04964E;
	Thu,  4 Jul 2024 17:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720114189; cv=none; b=ayq6hKh4l7gIksWc5er2XfLiY2fFOCSfHXiF1gJZVEEA4shuzbDUGlOCgkBEdoa9qt0ODuDeNPZdoxVz53jeWTVQAnyWVWXfEj5uHspw5gcDbZwbJcS5kTusYa0ITASsuK/2hrx40EjIJiTMu1kF4hiUA1A9IFY6wndxcaRh9MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720114189; c=relaxed/simple;
	bh=4Wsbr2NxsRTX2OtbK42P57QdvwytpLHmffqyJLEMNlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke3EyGN0H+6F9tC85HcKFLqYTP/EdDuIjRZZKnAANwNvNM08YSF1DtXIBsrMuOUMs34fkm+wpuFnFWXL930dCdbExW10z2T3JzP+QiBsmgAdobuS+fS3JBONIHIJvfc1kR7HTB5AabTr5awRgsyThjmdJl/KiW2r1++tN15Id8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e03a17a50a9so905747276.1;
        Thu, 04 Jul 2024 10:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720114186; x=1720718986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgbAK2gmsO/PF4jPJxOEopv4w1e21JKoV2IL1BCw5Go=;
        b=UKWhNAiwF6oXMfUC8eDVzR774bDPv60zJ8TIfhWMuloW/R32i9TvV5tt/GazHazSlz
         bPtiZnW1LJImMJWzkdKs1pnys+c65kzv3Kv5VL+H7YfztpmBEtAcOLJIiAqOAsj26vON
         cxyAs1yB1OF1JTTXLvZ1U9nKDdMSGOIG8Jz9d0F+HwrXxK5MgjBV8tMT4ia8/YsOe6EF
         vLRUUJiZnFFGvkNwFkKCfmvxy7Qn6GSV8dnlEglYPyV9p0FbZfsRjC8GRubZ/5mXBDs8
         y4A15kJBRbwzj6n4Th9r1QTQG+1BvxNcsqT6IYI8MgHjigOnr8+Mbj58Zf+3Vktk33+4
         F9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpZQgAGH10Zw3+wD0PabTbJ0hLLWjm8zkysCjAzkDGadvh8ygpBlIRVqqcTJCcTLPrluCcis0k+Tcgo0skK1s3SHcBJUNX+6pU5M586DXH46+QPn1+ZRbWUrX7ATrttyKOU3KQHPVVxtLtnmv2ilqtTzCwrUgS8tzxTrPoO9fkNyRRn8yBzHYKn4q0cXmUzBceXrBmcGXQXhxGn/+9ilOp39uwDE2s2g==
X-Gm-Message-State: AOJu0Yyn9ZgcIhPLQhm7DU2AleiDV1qTfni7UAHzyQthb/qdycoHuAXz
	vt0VUaEzH+6sgTIQBV/J53UnEDRC2o+h3vTXXF8/hV78nF8IHlh3TkiqJp70
X-Google-Smtp-Source: AGHT+IFZjsO9ewiEjzbgBpzemu3XQvaSNNPVO6kLW3HNuSidg0ssPZtMGo+f9sd+cX1cuGQfWH2KAA==
X-Received: by 2002:a25:aa71:0:b0:e03:adcb:f8e8 with SMTP id 3f1490d57ef6-e03c1934e9emr2503622276.30.1720114186257;
        Thu, 04 Jul 2024 10:29:46 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e037fc7a070sm1564902276.51.2024.07.04.10.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 10:29:45 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-650469f59d7so7798887b3.2;
        Thu, 04 Jul 2024 10:29:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFG5ZkEK472Np8QaqEpEkEfBtf6AKNM24b4ZBadS1iYYpV1N0muAtF+BOpw7iTr7P/rd0c55BFJpwKFRqea3tQksAEM+SceUd/vBm/7J0e7SlX5A/npKwWhiTjLxaROJ+7eoRTXHzP5xPyE66vGa0Zw1CeziE94u5YmtgrpaE4cDWT/LuxYu8zDIe/BlXzP5ILorxK3E6Xq7MnqvGg1+xNYNA5b6apRA==
X-Received: by 2002:a05:690c:498a:b0:646:25c7:178e with SMTP id
 00721157ae682-652d53481d4mr26390677b3.5.1720114185422; Thu, 04 Jul 2024
 10:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com> <20240625200316.4282-4-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240625200316.4282-4-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jul 2024 19:29:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbq_L1o3WxeHoD4n12DjEYV_k9RzGQbYP1EzhX6tr6_A@mail.gmail.com>
Message-ID: <CAMuHMdWbq_L1o3WxeHoD4n12DjEYV_k9RzGQbYP1EzhX6tr6_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] pinctrl: renesas: rzg2l: Support output enable on RZ/G2L
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

On Tue, Jun 25, 2024 at 10:03=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> On the RZ/G2L SoC family, the direction of the Ethernet TXC/TX_CLK
> signal is selectable to support an Ethernet PHY operating in either MII
> or RGMII mode. By default, the signal is configured as an input and MII
> mode is supported. The ETH_MODE register can be modified to configure
> this signal as an output to support RGMII mode.
>
> As this signal is by default an input, and can optionally be switched to
> an output, it maps neatly onto an `output-enable` property in the device
> tree.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes v2->v3:
>   * Picked up Linus W's Acked-by tag & Geert's Reviewed-by tag.
>   * Simplify arguments to rzg2l_pin_to_oen_bit() and decode pin/caps
>     inside this function. No check is needed for dedicated pins as no
>     dedicated pins support OEN in the RZ/G2L family.

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -994,6 +994,61 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinct=
rl *pctrl, u32 caps,
>         return false;
>  }
>
> +static int rzg2l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned in=
t _pin)
> +{
> +       u64 *pin_data =3D pctrl->desc.pins[_pin].drv_data;
> +       u64 caps =3D FIELD_GET(PIN_CFG_MASK, *pin_data);
> +       u8 max_pin =3D pctrl->data->hwcfg->oen_max_pin;
> +       u8 pin =3D RZG2L_PIN_ID_TO_PIN(_pin);
> +
> +       if (pin > max_pin)

Likewise 2/9, just use the original directly.
No need to resend, I can do this while applying.

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

