Return-Path: <linux-gpio+bounces-24169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53775B209A1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC2A42609B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872E22D7803;
	Mon, 11 Aug 2025 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lX/QAk+0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F72D3A69;
	Mon, 11 Aug 2025 13:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917699; cv=none; b=FM+0kmOZDLnK1cuyLQvM0LqhDQQayedOQqzgfflIDzkn4ILgdAE5LJOSLnmTPMoCmMD/JEVsDqGB5Evp37ZZnZemY/z0D+p952A+W8Co2F1fT+L1ipkomGO4Sb71hy7ZKWKI0q6NYMmccTEjHIvBX33Es4Ck9cgCBnOhyXNhgmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917699; c=relaxed/simple;
	bh=DPK58L1OvoRC8gFPv+jYnVCoAPKAptX6supP1tIwMSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsPh/f/1rwW0RDCZbYXYEuCo4ngeQ/ht2R0BnbPKtPvRgpAlbX2tlVXHRwVkjN0NdTlkNkDB9aD8s5WS4AO8nXvZ3dfd99hMx+tnnhxdEfoyh6DIvIJYqI3y8r88HQnRB1NszbPfozD3L+Lqoab4Xx/e78kw2mmw063T/ViBzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lX/QAk+0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so2661213f8f.3;
        Mon, 11 Aug 2025 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754917696; x=1755522496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0jZqH0YzwVwMNkNf0iJO2HEg98XWKpoKoM3gmGzW0k=;
        b=lX/QAk+0fotinMtvuzPzMgEhNlut2+2VoijAXSKbn9iFI/WlekBiLPL/f/jrwnSMzm
         BllrWQDAwz3B9WcLIBqoOQqGg0xdByBQSnBVeffq6aOfs0f8EvXqY3ZTp80ctaLjjuVI
         tQelX8spHFNR6EWl3A79HHfv2IOTpolErA2QdfPdtLZJ+NTGtFFDwL6/IWcxxho50Ex1
         PZQnjGXIAJrmtD52nWHeLhYIU0R/7df5Up7hrJllgbF/1ugRRPUrMfIBFEs8iz5h05wZ
         EzNXxddS2oCLrxjnrNI1jYtjrZivkhoXLfHhaq1nT3VJeF4xVNihM8XJmJts0ub/aQEn
         EvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754917696; x=1755522496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0jZqH0YzwVwMNkNf0iJO2HEg98XWKpoKoM3gmGzW0k=;
        b=AOGXVfYrullhgnHruQVK1Yzyik1XXPeSzN76LopIcq2hyPPsZtsK1+FNpcr+DrlXjg
         RKRnlMRFu0k+5ZvsqNQWljGOmE2KraVbsPYce4t+p/gsQcIrJJlwXy1ZANxu3bKxn/w9
         3ziqUGsVeyfwIqWN8q0aKbCFGA4HTZzzvxPAAuhPDo7KwKjQU0GNfhMDmv5kUkjbX4g7
         3Boqh0jq0z6nIGpArXeI9EyVI267Pe92R0QYIw+Z5Pfg0SFskKnYVwDV4WRt6tl3i/D5
         P66E5iUC8TcdekVjTOu6NZ1rm240mE4t6B2NhLhjIPTjW3ZgeVUNBLWhiXPfhdLNgYl1
         R8sw==
X-Forwarded-Encrypted: i=1; AJvYcCUxnT7tfHq97snKrV90jzbn2V3za/v4txM5NAIL8fpt/vHYsuk6vtER2zShgCdycUrra4TBxLeLY/CE@vger.kernel.org, AJvYcCWg1QDQKKJQmfJvfR/9Une0Hs0tS/52OlMQZjVfL8SKuVyVRLqy/gekrqmxy2RcHw6I9CQrQYEXu0hO9A==@vger.kernel.org, AJvYcCWqpC9X04LYEVPsXQDMWMqeEC9LC23wJ2kTNb9zZHLtavNzkLAGMVZd285lwhPETBw1uQ+nQRp+UdTtUhvd@vger.kernel.org, AJvYcCXLhIaKsNOJ38VakG7XjwfL/dhoQBeOAEQIgpV/mvuaGfoHDyq1Zg2KYSiju25j14MGcVRtkbJ+6mBHRk+uE0iECDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHxIu850tOp82azTSBi1C+iCg4JEpqOBkpddSU5kD47oBYPwZr
	tvXdKQ0DHYRhPa90cj5hVcpLimJDyg7FKNOAko+QKBLwyh7HHqcA2ezIRo5wDcXBgWLQkcuwLNh
	M/LHnTvxEnEuL9ek0ayKvMkEbtFV45wI=
X-Gm-Gg: ASbGncvfxMrvrk++v/1YiNuaLAjQ6n8o6JiabP+tOXzn5j9E8bsoAl6ohC4hj3wmyCi
	Dq84kdk0KIb5+20h1ipxiBQfrumhrQ6dTaWSaysfaQfBwldn/WEiFM5xv1rjTXnbLy6NzCA7Mzm
	au0bY30sRkyZTPmHnkGScMlC2eddgaTtHdb4GFwWIyFJxDucehCJYOtTTs3ULZSblJqI10tHXdB
	VZHyRLM
X-Google-Smtp-Source: AGHT+IHyKbkQ9g5e/EWJeQxSZVY+tEHej+AaEZdP67ntYrRbY1Z5JXFZBYpS1hatwp7Pa+41tU+yc6eBFmTyVOh6pp4=
X-Received: by 2002:a05:6000:144f:b0:3b7:8362:fed8 with SMTP id
 ffacd0b85a97d-3b90092cc57mr10109826f8f.2.1754917695542; Mon, 11 Aug 2025
 06:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250808133017.2053637-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVexDsBVqgF2Gn4hJAZbyv3wcsa=X=6E_52ufOWmvZd9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVexDsBVqgF2Gn4hJAZbyv3wcsa=X=6E_52ufOWmvZd9Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 11 Aug 2025 14:07:49 +0100
X-Gm-Features: Ac12FXwJ7ps-FoXz7jx5UPbsvs-g2xoZwhuxLmSU3iDHU8gvOb9CKWToZ_bZL5M
Message-ID: <CA+V-a8s-UAAP157zMRD0aqs+N_a7Avk19QYyzOyqkKq4TKpGBw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and
 RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Aug 11, 2025 at 1:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 8 Aug 2025 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the pin and GPIO controller IP for the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> > header file used by both the bindings and the driver.
> >
> > The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> > Both share the same controller architecture; separate compatible
> > strings are added for each SoC to distinguish them.
> >
> > Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v3->v4:
> > - Renamed DT binding file from renesas,rzt2h-pinctrl.yaml to
> >   renesas,r9a09g077-pinctrl.yaml
> > - Updated the title and description to include RZ/N2H SoC
> > - Updated description, fixing the information about mux functions
> > - Dropped sd0-sd-tmp-pins sub node from sdhi0_sd_pins in the example no=
de
> > - Added reviewed-by tag from Rob
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinct=
rl.yaml
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> > +    #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> > +
> > +    pinctrl@802c0000 {
> > +        compatible =3D "renesas,r9a09g077-pinctrl";
> > +        reg =3D <0x802c0000 0x2000>,
> > +              <0x812c0000 0x2000>,
> > +              <0x802b0000 0x2000>;
> > +        reg-names =3D "nsr", "srs", "srn";
> > +        clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
> > +        gpio-controller;
> > +        #gpio-cells =3D <2>;
> > +        gpio-ranges =3D <&pinctrl 0 0 288>;
> > +        power-domains =3D <&cpg>;
> > +
> > +        serial0-pins {
> > +            pinmux =3D <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
> > +                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
> > +        };
> > +
> > +        sd1-pwr-en-hog {
> > +            gpio-hog;
> > +            gpios =3D <RZT2H_GPIO(39, 2) 0>;
> > +            output-high;
> > +            line-name =3D "sd1_pwr_en";
> > +        };
> > +
> > +        i2c0-pins {
> > +            pins =3D "RIIC0_SDA", "RIIC0_SCL";
> > +            input-enable;
> > +        };
> > +
> > +        sdhi0_sd_pins: sd0-sd-group {
>
> As per my belated comments on v4, I will drop the sdhi0_sd_pins label...
>
Thank you for taking care of this, I was preparing a v6 for this.

> > +            sd0-sd-ctrl-pins {
> > +                pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CL=
K */
> > +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD =
*/
> > +            };
> > +
> > +            sd0-sd-data-pins {
>
> ... and the "sd0-sd-" prefixes.
>
> > +                pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CL=
K */
> > +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD =
*/
> > +            };
> > +        };
> > +    };
>
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
>
> > +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A09G057_PINCTRL_H__ */
>
> G077
>
Ouch.

Cheers,
Prabhakar

