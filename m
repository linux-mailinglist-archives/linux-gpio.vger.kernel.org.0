Return-Path: <linux-gpio+bounces-24162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A60B20923
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98D9C3A9E35
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 12:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64DD20F07C;
	Mon, 11 Aug 2025 12:47:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D8E134CB;
	Mon, 11 Aug 2025 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916444; cv=none; b=R21+35lyqPDUP6cJaAakWgqgPawgh8XP2V9FMlD3VXfl+NmFUoP0np+++eb1CJtBpP4wa0i6CcoJaYEXlPlq25R+48X57pd8Hobsuubjj2o1UfRZic+oe/l6PchhUsdrq5kTuGFXCEMxP5rTeJ6QhJ8B7nzeIXGp5cYN5Q01Pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916444; c=relaxed/simple;
	bh=mJZcymr0DoHOyUMqMHXVnkKtMVmpnri15Ov8Ipo2DZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae13AIARYUpwSlDc1nPa7LZowbBcZSgYPiTHCfTJl+Ow3zRKGMbNIiZ6eXONVER//yrCmrIfe8loKGFyd5XNEbRjq6wHlEgOLEVyfNGNT6GufbEyVbQSXX8NjJue76KvDkaPAPh1gpO0RoUrQqALjtXLoJjwQwPf2w1qnN9snZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5047bfa77fdso1743824137.1;
        Mon, 11 Aug 2025 05:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916441; x=1755521241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe+CCBQJrxuVCY6WW9MnNCbhinxHYUJgdHlSe87J7VM=;
        b=i4AaHyCLwWPggwmERXvoZrZ2Cusclt7Fjx96xxjuftzXJ7lAkKRw3myFuWsI4icKIu
         v6lCDztX6RvNw/d3bJH1e1QX9ufFlzYspNzaRfYddUPHU2yifLODpn5aD87ELaSLceXI
         gJUR1spKggdFGZkEUpr3wXjgbnLfuzI8a/l95PIHd/k1lRIvozu3bVX2rYkHXhwzaxQv
         1uWe93f/zeQvVjdkiJXxpqeSxH0geKyOobuLaeCwHgRmYJmTybjoRC5QjHcQ1xd84iFQ
         6s7zzLoP0+k9WK9hkqSWDMxy28CTGQGntp0KAHb3CsTtEP0mcYLEtsH4P4u4vl9pDqmW
         3hRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhtPZy6FevJJzlsGQK5rXiuKnicp2woiZT/G2gIrLM7y9ioviHqnf7NlxPKhrIlTIS98Hh7JHMMTHtFA==@vger.kernel.org, AJvYcCV4N3MSAAFkLsxCUmFSA9bVqYe/VG2NbCcQ7g5UEcgTeTVNKuEFjNwTVawCNpIAhrrHiMwuowBZj8l9@vger.kernel.org, AJvYcCWOZhxKdeKP3BfCZtRt353+YiDhHYcTydyTn7aeXJ5BdeShWQvEN65GSbVzLoZ5L06KjQpE7lDacP6/cws2@vger.kernel.org, AJvYcCXWPjTcUHn+wU79aECExH1r/kGFhs5j07SmG1fKayuqRmfyqL02ec5mniliOLU/pI2cKfLf4a3us8nwnOgKOmNGCAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsjrwHF+lJ3ykE/nUIB2vEW1muh6qH7F/F7Zv0cwMWflsneG62
	mrblnH4a6whInsXGgB+NA0mQcQI9g3YcjQhqMznhN8QK8GUkih3nSD2RFE1r+OIF
X-Gm-Gg: ASbGnct9fnPsf23iGTJclDkHMqx8CR9ECFRY28gUVPArKnTEByC0T8mTSVXSVsduzLH
	0etaya4aIx4Qxiwq7na6LPXFvoVcdgAudMHl9VCoYP0qX56I1B8fdM/i6z79o1SNCa+5VTOaKZS
	+fj87DapmZe2mwnX7bM1DFLDW71HiL8qn7z3aTBHOQ/vdTf7faZrujCs13AqtV7GqdBFx6DXvBt
	s+zIv5GA81shS/+GKm2c/2YETgCdnPJ3yAaeiWJG0edUxs255oRPc6rr1+Lx3HRz1fFmw650G0z
	M0sAJ1VXv+qQ10m83UNqDChFVlkiY4DYqxjqQZZu8I/dMxB28M5mfCs+8l8g+TmB/WkQzoXDIDq
	RsEgRetJp7hl9eivKcouWD06kcjX0RtEtgHjU2T78xi8Om8JNIclGTggMwBqPpvjh
X-Google-Smtp-Source: AGHT+IFcsgHpkbcoygeA9czKJT0RqobY6h5fkRAStVHKRC6DnFeGdLEzrQHkOdd8sfcgNXdg0bVYmg==
X-Received: by 2002:a05:6102:800c:b0:4e2:a235:24d1 with SMTP id ada2fe7eead31-50623a02adamr5260363137.4.1754916440935;
        Mon, 11 Aug 2025 05:47:20 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-50629bde2aesm1712339137.9.2025.08.11.05.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 05:47:20 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-539525ec047so4128339e0c.1;
        Mon, 11 Aug 2025 05:47:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUI4Z6/owSkgHZ8MGv/4qRGjoXlqK1uMIkdUayySBmlm3XT31ETuyaa6QG+tqx9m5YJlthecph75fCDA3Z6HuL1I+M=@vger.kernel.org, AJvYcCUT1NA0CJfVj3yIYNAl6h0y5K/FOtOJ4P+56gasmAiusIxbD8oObpbwnBgcdInGVeBXF3qKUODcEwzZ@vger.kernel.org, AJvYcCUXVmjheAUQKDZoUznyNEcTBoE3ZB3sBmyKE9mf2jImQPRceXKAHkVL09Jn8Aax//RvKO5zmNsZMjqUh30+@vger.kernel.org, AJvYcCXMJZ0yQgwgQYaxNFwP3xxoN18v8mDNMoWSJdews/jGz9pNB6E1ou5BKswlofyyJ2I7lxax75jlQ5TyVg==@vger.kernel.org
X-Received: by 2002:a05:6122:494a:b0:53a:d808:1ff2 with SMTP id
 71dfb90a1353d-53ad8082595mr1775407e0c.1.1754916440508; Mon, 11 Aug 2025
 05:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250808133017.2053637-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250808133017.2053637-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 14:47:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVexDsBVqgF2Gn4hJAZbyv3wcsa=X=6E_52ufOWmvZd9Q@mail.gmail.com>
X-Gm-Features: Ac12FXxc4r6WofxL30YmYJi0899llC4OSBPFc5s5IhIOIO_rkqmWozcPyHPqNvs
Message-ID: <CAMuHMdVexDsBVqgF2Gn4hJAZbyv3wcsa=X=6E_52ufOWmvZd9Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and
 RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 8 Aug 2025 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin and GPIO controller IP for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> header file used by both the bindings and the driver.
>
> The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> Both share the same controller architecture; separate compatible
> strings are added for each SoC to distinguish them.
>
> Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v3->v4:
> - Renamed DT binding file from renesas,rzt2h-pinctrl.yaml to
>   renesas,r9a09g077-pinctrl.yaml
> - Updated the title and description to include RZ/N2H SoC
> - Updated description, fixing the information about mux functions
> - Dropped sd0-sd-tmp-pins sub node from sdhi0_sd_pins in the example node
> - Added reviewed-by tag from Rob

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> +    #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> +
> +    pinctrl@802c0000 {
> +        compatible = "renesas,r9a09g077-pinctrl";
> +        reg = <0x802c0000 0x2000>,
> +              <0x812c0000 0x2000>,
> +              <0x802b0000 0x2000>;
> +        reg-names = "nsr", "srs", "srn";
> +        clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pinctrl 0 0 288>;
> +        power-domains = <&cpg>;
> +
> +        serial0-pins {
> +            pinmux = <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
> +                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
> +        };
> +
> +        sd1-pwr-en-hog {
> +            gpio-hog;
> +            gpios = <RZT2H_GPIO(39, 2) 0>;
> +            output-high;
> +            line-name = "sd1_pwr_en";
> +        };
> +
> +        i2c0-pins {
> +            pins = "RIIC0_SDA", "RIIC0_SCL";
> +            input-enable;
> +        };
> +
> +        sdhi0_sd_pins: sd0-sd-group {

As per my belated comments on v4, I will drop the sdhi0_sd_pins label...

> +            sd0-sd-ctrl-pins {
> +                pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
> +            };
> +
> +            sd0-sd-data-pins {

... and the "sd0-sd-" prefixes.

> +                pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
> +            };
> +        };
> +    };

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

> +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A09G057_PINCTRL_H__ */

G077

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

