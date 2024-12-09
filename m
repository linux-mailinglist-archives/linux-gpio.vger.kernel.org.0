Return-Path: <linux-gpio+bounces-13677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98A9E98BB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2972859DF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CD11B0433;
	Mon,  9 Dec 2024 14:25:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B201B0407;
	Mon,  9 Dec 2024 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754316; cv=none; b=sa05GrOOod93WqXCk+FkqDApVQVbWv26RBtZHjPvwJ7qzjI2jjFVwinyK/mvHtp6GWg60/cgfA5G3REo/aDOXbTgtBs92jq2wOTijpM+iaA0/hWvv7X9u5gzQGU9VuZSKwKuVjsVn/+hSU+sOIRqbrcZ2IV2WqXZb2Vh5MiSqTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754316; c=relaxed/simple;
	bh=ZdmH0UfwasIfOntNyjdBgMdNC/1PZsYhQsnDrPL6YH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCggGPRlJCt9beqk9mjLFaEM6QkwSLlgZp8oyuCx3FfA4YT+R/4inqk69d4IpiXV1QCh1bJ563vN/xCDZKhx40QdC0UqnVyYdSCry7Z7q+Jx+jd7r7ti3M2IJDq4wLdRQdx9KOF6M7l9tsXB5nUNAquCAwQURX0sfyKtC6v8Enk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso266939137.3;
        Mon, 09 Dec 2024 06:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754312; x=1734359112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Dw6tds6khSrmjocR1oI35lAVtq895XJq3pkFmO/1PQ=;
        b=A6CgIz0Cgh3UE1BLM66IkZxUjD/ICBsKgoFJt66bCDd6J5Gsm6C4WA2GscOO2/5Lqz
         ravT1I/vYQyrKc6Zpp3DYVy6+QW4dcixvOg6d6nKMcyK/MJIEeI2XPX5fteaiiwaWJBn
         juUQOBrBXyhAoLJheP0NvYW8LMPixPEsxKmeEGfD8va2XFIxrXwwhOB8ztbJRYo9cwK9
         ux8p0CGAfAY/2pCVPVb4Yj0vZKR/WFvf/JdrRMMx+vfzUBr5FNFaArWiK2Qmt9BU5zGv
         QAqFg2JjmAU6ukoMxj1KiPJzEdWF7r+AkZQ/l10ZKB5UeBjrp/ksEAr4ApoXBMxMIwUc
         Ra5w==
X-Forwarded-Encrypted: i=1; AJvYcCVhsHdXwucpf8CR3dEWKdQdi8IhNHlilJDD3QUysVDypWq05wh3eE+MBgAkXY5NKsi8Exk89iL6zP2wdfU=@vger.kernel.org, AJvYcCVnbX/eazrohQUpKiyX0QjzqcH5IpKcKT3XUxfEynhsSycxRQkkU8BixWa4RUwS2eGtEuih6Ij1eYKwGQ==@vger.kernel.org, AJvYcCWNtly7Dg9b7po+dEJr9p1HpsUHP64+ecOk8JYraavqjYN2Zjn75N6pXc6d/3FjXrR4txXG1V4Rjr1L@vger.kernel.org, AJvYcCWaLUPKfRym7KsYI3sUVaSV9Ers8vF4Vxhe4YZ35qa9STLwGxjbHjv5cisBHRS/SyrqFTPZ6qchBHmS@vger.kernel.org, AJvYcCWsL0esSOvl3yhDC++zNpDkklfrD/xMc/UPQof9dViUbY9v8b01xb3ot1RTkbAfJFmlzRLvJGGo4K0NV4wU8+/S6Zk=@vger.kernel.org, AJvYcCXukANTaRTiNhJeIphyAmAL4SVoZx/OSfSabXYWoGHXoVC7Gmqoaq27jzLdM5fYjDiivjjxpQs1e6e6sTi+@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFKa1CyADJpLfiWnZH+wJbJtnYxmmOtaKdNC5b+nPCWH2ERQs
	hFGjgOTtqRFRwercEq1yaX6o37Gai7LcsOVD1ZeYOYgz59eIATOIHT2PKonqqLg=
X-Gm-Gg: ASbGncvipprJK8D3cHfegTQDNGfdkfn/uPM7YUYqeLHwKS0Zo47+eQLUZPNNWCQbELz
	U7Wt1BsAQ0d+GAxpBTKEcZmue7oSNZusqhaQdtY68uakLj1+f8FiM1nDQAU7VHEFxnqF9SHt1OO
	1RILklEa+b2Et8YK7VQ/rLY/xfJjZ9aqxWYsnZxZ0IdOKhK5sG2PElMZPFK8ayKkH4xbCEd+hSb
	eFs9PqgkJrsC4Z4N5c9LikOSF8lDkBrwPPRzg+BfnG85p7etxZW1s1m2pkKoePYTSi8uVEJrLsO
	NGM0seRG/VEZ
X-Google-Smtp-Source: AGHT+IEWxjR1MMmCklb8EHzbiga/NWbJMJQAo6fkhplpKmj1XZKYr6/8nQ8SdkHunfb3F/CD7B3QEA==
X-Received: by 2002:a05:6102:510c:b0:4af:ef82:ce93 with SMTP id ada2fe7eead31-4afef82de62mr4256022137.21.1733754311961;
        Mon, 09 Dec 2024 06:25:11 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c5569f71csm759988241.7.2024.12.09.06.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:25:11 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso425537137.2;
        Mon, 09 Dec 2024 06:25:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAh8YeIzUr+IC8pACr2ofHuI03T2feWDCCAYtOxABd/mh2VACtUiILH+iPSxSn6TzB279qSvOTdiNW@vger.kernel.org, AJvYcCUF/9of//+CfW0YJsnpkUbuZyHXv2DGMDEimBPrtLIYxnF8JMwJ5GrrnYIOsbWdtBU0yfuZO81XCCmT@vger.kernel.org, AJvYcCUkX73UnUp1f3vsw3oPJnpoYPgSpBk0q8Edlx5l+/Y92wnFLfoCRe+oKGI5BHqE1yCvLShi+T0k/b2IWu0=@vger.kernel.org, AJvYcCUsAEubn14fnii2edqFgtsQ9Y2IUEYkde0yA5TlSpTYQiC6DpEPGrc+VVzU7iy7d8f1WcO76bVq2njWnA==@vger.kernel.org, AJvYcCVEWbdiICmkM4cLnvAecULfzfmdAro90SreEozBfh3SenpmWog0Z1rrkCjuKVLdRzs7DsVvgk0+REeUoOoWxDHRXHE=@vger.kernel.org, AJvYcCW37adSRU5XB7qTcnRHKwOdzxc8eQ0Dla+3mji+Hf73MNyTbdepR/o7DTd4l+3DIxj14NqMEDv7WoQAUUop@vger.kernel.org
X-Received: by 2002:a05:6102:4406:b0:4af:ed5a:b697 with SMTP id
 ada2fe7eead31-4afed5acbe5mr4633339137.13.1733754310864; Mon, 09 Dec 2024
 06:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-21-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-21-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 15:24:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_2hMfT3tGNEANyWkUqVW3wAEsSttyqfR=L4mn9VxStA@mail.gmail.com>
Message-ID: <CAMuHMdW_2hMfT3tGNEANyWkUqVW3wAEsSttyqfR=L4mn9VxStA@mail.gmail.com>
Subject: Re: [PATCH v3 20/25] ASoC: dt-bindings: renesas,rz-ssi: Document the
 Renesas RZ/G3S SoC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
> one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
> it.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> @@ -19,6 +19,7 @@ properties:
>            - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
>            - renesas,r9a07g054-ssi  # RZ/V2L
> +          - renesas,r9a08g045-ssi  # RZ/G3S
>        - const: renesas,rz-ssi

This part is fine.

The section about the dmas properties also needs an update, as the
documented MID/RID values do not apply to RZ/G3S.  I recommend just
dropping the list of values.  People should look them up in the
hardware documentation.

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

