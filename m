Return-Path: <linux-gpio+bounces-28478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F1C5C62E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 733C7353C75
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D139D309F10;
	Fri, 14 Nov 2025 09:45:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2668B3090F1
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113539; cv=none; b=kdQR85X4GUnRGsMExNaqbQk6E3FnwuafHG8kkXEKmQxNQIdm3OWk6MVnrSstaDOAfKQiUlzVWMGZMUVSNUZ13qIq3NH8yo6XkH81yRlNrVY8IP37Nc2dVZPXCQMWw0JUn5Tgkxo38TrjmXytN4fqDbAAReGmEgbt9AlDGfNNltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113539; c=relaxed/simple;
	bh=wTzVYr5CLMbxZcELo4IOLIgxiHBUFwH2iRqyR1aLWAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1mUAnxoCBQTtBNkFBVX4Iw0EkGgDF/Cppc1YxZZ8f7q5XkmIFjH37DZ+Xv8JEFtjW0bhTDSPKx5QR07J4Izfani0ZO7O/NWdQI/zGujdjJYP9JvBgs1EnkREmV3iKXjlHh8bUXyFXNJ82U58XtFCYDpoZSn8syymohdne+eIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b0d4b560aso1103233e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113536; x=1763718336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAUhmj06/ScrYHjhgghrsX3axL4gTCjs2QTqxYaasK8=;
        b=MU0SpmiSCAwYUjm1Hj6bS2CC0tT/WctfIZb+SxcNioFKeI8jytBmTaUKZQeUBPt30j
         WvPAyh/deBSlUplawrKalrW0+a06ld9d7qWB+eFYiwN7WTqulBZwd1+T9pmpvdLEGuLo
         wdjUTA8ycFJC+t94JeTQYC6RuGRLgq/gfS842Voep00N5jtCHdxIPMalqTgLPvT/5bUz
         wvCIlOcwdCTRezioJZxw6p3+iSCqcjGCCykKiVzS4zKGNRNvhl7x9sWrR12W0t+aYQh/
         HgPu/HWKaoIM0VYz5UBo0+t2aYA8pLZ5Ggqmzwh3xlpQbfI7guzHVBSYC2C9OHUet69j
         tw9w==
X-Forwarded-Encrypted: i=1; AJvYcCVBB0ogEh0kf+rDHKVve4o6+LJwQ83b2ZSg6p9PwfeC1b2zHN0NJauKNY1zP1oBypL1WiOhSNzL8Cyf@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4uHQxBzlFQrnKUGzIk88g5MoK1uBV1PUGKdF6lZm8Dz45bs+
	xVPOsUFkOpbE6mEFgu5OJ4QPp20jjpFlNbl9rGQJbdTo/XhPehMK8nuAuMmkYjmrR94=
X-Gm-Gg: ASbGncsPA74nmtQVy/+tgSkMwr/mcviDNpKoBKNYdvhv+8NsSzIYvD/MyVlVJVpvHDg
	TmCfFkCYNcDel8hXc9pGRENGaIrzJ3UuIZ2fdVRweJJtORkB0Imzq3Y6Q51I0CVMe5rlifvdwuA
	WeW8O8nuN+4P6NKEoDxYLfRlLrj831VcyI4e5xda/9j/VMx4iwurwY31purU9Ldqm13uxLeBZiB
	RCIp64VzzcHWfpws/A/WdSxyAOVEUHVhC9mp06n2W/Bb3SLi9w49Iozlqz64f15Ur8q2R/l5fC1
	gH3kMgMgSQ/zqTo8H1DPVPRnq20Gh08uqsafLDSvKgTTGn/IvJICXH8vPRMhbHOVza5v39g4C13
	Y87H94XIbkgP9WaHbYnT7u6Gplg2TX0qUhozdld68sOnH+kF000r+G+pOoj5mdWkyu4PqsqCzRB
	3eE9SbYyB2lcbXJ2f0PtIwbODvZO+JwmD4Y33vmtUv7A==
X-Google-Smtp-Source: AGHT+IE1bs32Cs6hj3pnybjme8Eykgq68bfoIH7GM5bjrUsbib+yqXDzYC1yJCEvd51sX1+g0NXsyw==
X-Received: by 2002:ac5:ca1d:0:b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-55b0d108dc9mr1642675e0c.4.1763113536436;
        Fri, 14 Nov 2025 01:45:36 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f44268fsm1504815e0c.15.2025.11.14.01.45.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:45:35 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b0d4b560aso1103206e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyVH3ubBpTB5UqcJplAzMM7AxgcgN3lLvthaFhbHUbHXTqLsAvtI6esaSdiPbJDsc53ddy8rl30tt0@vger.kernel.org
X-Received: by 2002:a05:6102:800d:b0:5db:f897:59f0 with SMTP id
 ada2fe7eead31-5dfb41e268cmr2558400137.11.1763113071580; Fri, 14 Nov 2025
 01:37:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-9-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-9-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:37:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULa3Myv5M13mZnBfGRfpnCasRbDFSFsh-Yji+Gw3gycA@mail.gmail.com>
X-Gm-Features: AWmQ_bllwARgosfbTXod6oIXQrjpImVz4Lng-lsiZr7z4SHhmighCo7rwlxoBpU
Message-ID: <CAMuHMdULa3Myv5M13mZnBfGRfpnCasRbDFSFsh-Yji+Gw3gycA@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -534,6 +534,14 @@ gpio0a: gpio-port@0 {
>                                 #gpio-cells =3D <2>;
>                                 snps,nr-gpios =3D <32>;
>                                 reg =3D <0>;
> +
> +                               interrupt-controller;
> +                               interrupt-parent =3D <&gpioirqmux>;
> +                               interrupts =3D < 0  1  2  3  4  5  6  7
> +                                              8  9 10 11 12 13 14 15
> +                                             16 17 18 19 20 21 22 23
> +                                             24 25 26 27 28 29 30 31 >;

I would drop the spaces after/before the angle brackets.

> +                               #interrupt-cells =3D <2>;
>                         };
>
>                         /* GPIO0b[0..1]   connected to pins GPIO1..2   */

> @@ -620,6 +644,23 @@ gpio2b: gpio-port@1 {
>                         };
>                 };
>
> +               gpioirqmux: interrupt-controller@51000480 {
> +                       compatible =3D "renesas,r9a06g032-gpioirqmux", "r=
enesas,rzn1-gpioirqmux";
> +                       reg =3D <0x51000480 0x20>;
> +                       #interrupt-cells =3D <1>;
> +                       #address-cells =3D <0>;
> +                       interrupt-map-mask =3D <0x7f>;
> +
> +                       /*
> +                        * Example mapping entry. Board DTs need to overw=
rite
> +                        * 'interrupt-map' with their specific mapping. C=
heck
> +                        * the irqmux binding documentation for details.
> +                        */
> +                       interrupt-map =3D <0 &gic GIC_SPI 103 IRQ_TYPE_LE=
VEL_HIGH>;
> +
> +                       status =3D "disabled";

So this is disabled by default (despite the driver being enabled by
default), because the board has to provide the proper real interrupt-map
anyway.  Makes sense.

> +               };
> +
>                 can0: can@52104000 {
>                         compatible =3D "renesas,r9a06g032-sja1000", "rene=
sas,rzn1-sja1000";
>                         reg =3D <0x52104000 0x800>;

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

