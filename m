Return-Path: <linux-gpio+bounces-13680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D857F9E9A1C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 16:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B34161775
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768361BEF75;
	Mon,  9 Dec 2024 15:12:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A07233133;
	Mon,  9 Dec 2024 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757154; cv=none; b=ijEFrMOAkkpntVyf3clHZ2F8zMvKaqB0ilHtCE1NNr4hhSCAqQlt5NqnWoxCDzV05YctSNYfZciBXxdYklVT2PDBHPDpE1ydTeCxoFW9kz8hkSkZcBsyzzwXkWEe7wEx57Ylzvkf0NgXwIIvaUALa8kCzsiRroCsunlg6VwkG7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757154; c=relaxed/simple;
	bh=+ifZWT9KFK7/CMJKg3gDWnMlJDYO+L1kCWVAFEPVSE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YfTSTh9EGGMH2G1as27oI9FXgfyZ6BtN3r9vt/g4NBwCtddr4iwAKIjR6ewDqL2JMEy7aBYeoIo3Xjt465wItWt0m03murvYmLaNuAXzSTDMu2PRGVqDe8Jb17Mv/IbgDUFLs5s3Jp2E9uB5g5MG7K6RNwPv/CbP81U+A7B7cZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6c375b4f0so143309785a.3;
        Mon, 09 Dec 2024 07:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757150; x=1734361950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTTAFWhXK+GXq2DggiRg3AsKRc195SUBzTDQQERiP0U=;
        b=HZ+9b8TjTNHe7gtTD5PkGzVXqnZQIi6C5foAMbDE6EMAxdNo4lwfkd/+Nxh0xmFSsK
         M6x0gDtSiikS4g7Z3Sv1dL13vv/AhPHwkrlAFG4wjN18Pu7F40nXK/BAjISf1y8V3ugZ
         G40DvdfLZ0WwNp2ayKkZ1PW60gZ1MfpdcSW4GNE+ox23EDPijCRCRnJIU5k8RpgdBxVH
         sspFyVQ5WFnM2Z+a1cADU58kl7rHeTrkZfcn3B7LqAwhK3Y2KE09Urlup/7JiRHHEaSB
         YWNIxQb0VEYTz3EdJpqCyKc31Sb9SNr6Gk8ETXbFpPrdr+O/i8/zBbIKTuh+jhBhF5il
         QwCA==
X-Forwarded-Encrypted: i=1; AJvYcCVDAXJLt1sG4ru3RvWegPEf8ZDmP0B9MADW9j3O0QTNflrilJYClzhhG0fbDh25imydV4UkRBCDYpHn@vger.kernel.org, AJvYcCVIeXrSFxClw1ZIyM5V90l0JxZCA0TZ7lIjgiXTtWy3rcCRKx3SNlkkpggoVgg2I9RbUZsPuB2SR5EF7PV8@vger.kernel.org, AJvYcCVOgqwzXR/WdGR1OlxXeTEDG+qSBRU9cLXPaigLUoP7wYptA5GxFrWssD9idFlIMH14WrrtMaWtjeqF@vger.kernel.org, AJvYcCVVVLVUmj0EA4de4f9LzGBXAbefaWpEgl641zm2mvBeuxBL2eZJ0BcwTzxL/Fp8sMuuj22X+KE7I08DSubpBu90Fmg=@vger.kernel.org, AJvYcCWMGvRMbZyTynWfPqrZrReGAdhOGMaR25pOm4Wsy4dFHo6+6Kl57ugveLE6tSxAtfYszl6rmRMUjI405A==@vger.kernel.org, AJvYcCXSLisoya4qW3t2Nnh6UGFxC2b2Bh1nQLvGkAKHKNRpl4idcEAD4ckTis0Yycy5VfJPvXqhld1xh8+qAZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqMfJgcZ7H1DXGv4mYhmnvHQ8bLMwnfASxMKnFzQfUVM3drux
	e0OwZr6w9+68nw60IdtblApQz/CZxsZyp6CHecNN3tjICGHXOMTEDeW3jXXLPWc=
X-Gm-Gg: ASbGncuWvkU/B5iOqVaaM5tECZQ+qLUKYVpSdIzIlPPBcGOOsnBcC2mhHgX19f7WwCD
	CvYrWoicIISKAeI0ErJLx4c+mxwy+SvImqElJE2OYrLhtzzgfl7ku0rcyLD3cO5wYDMIQuzjjqd
	Uq8FXR3xpSs/9auTxbaAuHjwEzTPA0jXLukXhAl3nKY2l0pC2mvqbJLhBwoKxK2ZvNR565u/Lq8
	VIjWfIZ6Ss29NFWhydHbXVDcpwtpFRwu75W2xOl8gfO3pOeuwVlUCADOxbpYlJS4STT/Gh/3LyG
	LBrxKYxRb6ZLyOab
X-Google-Smtp-Source: AGHT+IG82yTXDxwxzlwl9ZFHBDQWXX6jUae5TeOWX75g45Aa+giCqoA31qrl+X0wE6OkbATIdHH8kg==
X-Received: by 2002:a05:620a:2682:b0:7b6:62f9:109b with SMTP id af79cd13be357-7b6bcb924e5mr2040730585a.42.1733757150093;
        Mon, 09 Dec 2024 07:12:30 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6d1aae961sm157208485a.93.2024.12.09.07.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:12:29 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6c375b4f0so143307285a.3;
        Mon, 09 Dec 2024 07:12:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULDQPzqQEsex61hksmg+Gk0lNzaY05EA/NFfYPdJm6kw10CgzHVSsaOxQ8yGYI4Ps/RCZ14rUuyiFPqGEC@vger.kernel.org, AJvYcCVangHVLGKOwzMoWq0PpJkUW6uSpevZXMIRIweQQr4MyM8KhLgRb4YBQCADohP8IpyQUhdS9dEwIV3K@vger.kernel.org, AJvYcCVuLYl5tIMbn+HClaD6Fcn2FVJDJoj/P213XOvDLnLECB8FJ4/VubkJ7hs+qebEIL7PpoDSQchmUm5XXQ==@vger.kernel.org, AJvYcCWMOF0pJMpfKI8xwGgf0bUPqVk/HbfTNsPBe80FhvedqMToadkEpYGHwQ6SkCmV9rMqOk2tTzKOk1rwgsUG/fHCJXw=@vger.kernel.org, AJvYcCXeCKhehmfy+Xt2hHvYZEKicLS8tugM7z3lZu6qXWvvZmJV20dRbFhUIHqsLvUdh0aok4y8Qh7lTjj48NI=@vger.kernel.org, AJvYcCXybg11DKW8yyF7Df7T1U004QmQmJr+cwMp6VbU0qCiwPL6hZvuyhXvBsYpl23tFJX8fews577wpMS4@vger.kernel.org
X-Received: by 2002:a05:620a:2793:b0:7b6:67a0:4993 with SMTP id
 af79cd13be357-7b6bcac8c15mr1818373285a.6.1733757149521; Mon, 09 Dec 2024
 07:12:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-22-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-22-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 16:12:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV8zNgqTCc=a9tqP45tQ_rv9NV_zLJcPnqyF-nMoin4A@mail.gmail.com>
Message-ID: <CAMuHMdWV8zNgqTCc=a9tqP45tQ_rv9NV_zLJcPnqyF-nMoin4A@mail.gmail.com>
Subject: Re: [PATCH v3 21/25] arm64: dts: renesas: r9a08g045: Add SSI nodes
To: Claudiu <claudiu.beznea@tuxon.dev>
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

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add DT nodes for the SSI IPs available on the Renesas RZ/G3S SoC. Along
> with it external audio clocks were added. Board device tree could use it
> and update the frequencies.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -14,6 +14,22 @@ / {
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>
> +       audio_clk1: audio-clk1 {

audio1-clk (cfr. r9a07g044.dtsi)

> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by boards that provide i=
t. */
> +               clock-frequency =3D <0>;
> +               status =3D "disabled";

Please do not disable this node.

> +       };
> +
> +       audio_clk2: audio-clk2 {

audio2-clk

> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by boards that provide i=
t. */
> +               clock-frequency =3D <0>;
> +               status =3D "disabled";

Please do not disable this node.

> +       };
> +

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

