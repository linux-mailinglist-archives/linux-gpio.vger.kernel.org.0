Return-Path: <linux-gpio+bounces-28472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0666AC5C350
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 17C9D3605E9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41E830215D;
	Fri, 14 Nov 2025 09:11:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB3B30215A
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111503; cv=none; b=harhDl1FcV3YTR7845V55UEbs2AaQlCvCtc9wqzrj/Z6LOifYsPecJ86JsJNSDxrr5+Otx1Mhmnj3PAOdtxKkdxxrlHa0qo1hyEn39eR8R2AR4Mwr6vVYJItuNkesKTCan1rguSQ8Fq/fkzl+hpnanPtHZUjRO80rujIj/MUxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111503; c=relaxed/simple;
	bh=BHvm3hbmkPoS31CB/qQMOauxLpXwLi+jzNOEIhvIoqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Igv18wN9m3QHxTqRXiO4HBMpLCuWHGFfK82GjH1Gt5X/U24iaQmM4wISCm+9JorbBWqrMdrJzADoEtzouyoWdAJQ2DgHmcJ/LTV1c4GH4VForkFTN5v9v4eywDvr5n6gr+Jn57l9Dt0ZMqPIquEkeEs6gk3tnYZYcyzaQznYZmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2953e415b27so16735175ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763111501; x=1763716301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gil5rxl+Rfqu8BNaVY7z8XkReqTcCBYpfj3RKeayOGo=;
        b=vXjRh7QaECcZCqYfSNwfS6/ErScTHGRbNaKWHYUDtNvlw2ISxqKUGFgBF+xI1lrd3b
         cRJWPH36CsigCCIiG6gi9aomA7VwKVqVlM0jnsV2do2vFM7h8j9dyVtoXgc9gKH7JHQE
         Lo2jk2PFaCSj8o379G6ffAW3yUMqqdhhiGWhTt3TJmpSUqlodarn6dQPOrgrG1Q032sI
         KVvQXHlnsS6BjaqNrzlMEUUooOQuVU/9gdflaguuRKLSWohyo9Mbgi8hLhRLEHL11Aud
         6m/aGiOwnE9DKFCmTMa0Y994YvRcYGpLfojWFNFJGtaDcX+NEMzQJq6AfBa1BgSlqsrH
         JwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS7LbCLUMJx8rW5Sq3tBIfw2LnkWp61/N7/zNQ/DJLkqKm59BP3DvPFPoqFVpKsD6xGDhOL6phv7Wb@vger.kernel.org
X-Gm-Message-State: AOJu0YySEBHpgvxLBY5uCuxLKTlEoESDw99r4g4NhCdS/+anpESdC0WD
	0V8JG6LJezBRpBW1appC3RD4kIWnx1d58QKsiFe0IU9ow66BIpWEejEd9ZBdPDlI
X-Gm-Gg: ASbGncvfi/3yeka8bF99J3ygX6XFTew35cDzw0ug8CJsGinKfLRj7+Y0iFbFyCJ7kM0
	dDTn/bmu1dxRNWJCUHibdzeumChGLOxHuS30zR+u7OBvbokntzM1dmkLTqRGa3/UDY/yjmJi0En
	Va+2Jww1gREgSSb8j1eJ9knKvD024uu2ACScWgckO4/k0sGfQHQ991+Es8ykzxa1dqsOjJaTYJx
	nCsuknQdVBJl0CQdyFKakRjGBXrw/P4t0gx1doxaSjmsSDzR8Q/R3d18NdjJLC9A+lhSbSyW+UC
	+C4EjBdAbJbdFyUwI/KJT+iHWyoMRwrl8xUYenvjwnlkeEOQKg47DusLYcd+aTEFkx8WWdkg+se
	me2xIFnU18OusAVXMio7N6uLKSMIsVQsLStlp4IbRwnhDNEu2K3NRfSY7NGkho4ADVJj5VJ8+G0
	V95/fLLhDAsRe3rJUWmNeL3RqUv5+QKRN7fdhYJ1cZIukc/nOXXY6rNz/x
X-Google-Smtp-Source: AGHT+IGvmzSks1uOq6Isa67hSqBT2sCvywJVgEP+YWMAsbPchawOcuKjXuYLr7eqCv3aVfWrf1vI3w==
X-Received: by 2002:a17:903:7c7:b0:298:616a:bae9 with SMTP id d9443c01a7336-2986a73af36mr19658005ad.28.1763111500929;
        Fri, 14 Nov 2025 01:11:40 -0800 (PST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db21e8esm4178513a12.5.2025.11.14.01.11.40
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:11:40 -0800 (PST)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b98983bae8eso1029294a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:11:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4Ir5PkvnYUtF/SuFqaIhMzj/7MciVAVif7xJu3s2zR3sfGLBiICL+Kkvjiw7W3zsDnEH9ZOo5+7g1@vger.kernel.org
X-Received: by 2002:a05:6102:3e1f:b0:5db:cba0:93a with SMTP id
 ada2fe7eead31-5dfc5a6064bmr814214137.35.1763111062738; Fri, 14 Nov 2025
 01:04:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-6-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:04:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
X-Gm-Features: AWmQ_blv8a_OuSRESNKfbMrLVNnd3bpz0G1F8NnKOsI4crGuxZwqclBQZ7aOGl8
Message-ID: <CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] ARM: dts: r9a06g032: Add GPIO controllers
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

Thanks for your patch!

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> Add GPIO controllers (Synosys DesignWare IPs) available in the

Synopsys

> r9a06g032 (RZ/N1D) SoC.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -499,6 +499,127 @@ gic: interrupt-controller@44101000 {
>                                 <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_=
TYPE_LEVEL_HIGH)>;
>                 };
>
> +               /*
> +                * The GPIO mapping to the corresponding pins is not obvi=
ous.
> +                * See the hardware documentation for details.
> +                */
> +               gpio0: gpio@5000b000 {
> +                       compatible =3D "snps,dw-apb-gpio";

Don't we want an SoC-specific compatible value, too?

> +                       reg =3D <0x5000b000 0x80>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       clocks =3D <&sysctrl R9A06G032_HCLK_GPIO0>;
> +                       clock-names =3D "bus";
> +                       status =3D "disabled";

Usually we keep all GPIO controllers enabled by default.

> +
> +                       /* GPIO0a[0]      connected to pin  GPIO0      */
> +                       /* GPIO0a[1..2]   connected to pins GPIO3..4   */
> +                       /* GPIO0a[3..4]   connected to pins GPIO9..10  */
> +                       /* GPIO0a[5]      connected to pin  GPIO12     */
> +                       /* GPIO0a[6..7]   connected to pins GPIO15..16 */
> +                       /* GPIO0a[8..9]   connected to pins GPIO21..22 */
> +                       /* GPIO0a[10]     connected to pin  GPIO24     */
> +                       /* GPIO0a[11..12] connected to pins GPIO27..28 */
> +                       /* GPIO0a[13..14] connected to pins GPIO33..34 */
> +                       /* GPIO0a[15]     connected to pin  GPIO36     */
> +                       /* GPIO0a[16..17] connected to pins GPIO39..40 */
> +                       /* GPIO0a[18..19] connected to pins GPIO45..46 */
> +                       /* GPIO0a[20]     connected to pin  GPIO48     */
> +                       /* GPIO0a[21..22] connected to pins GPIO51..52 */
> +                       /* GPIO0a[23..24] connected to pins GPIO57..58 */
> +                       /* GPIO0a[25..31] connected to pins GPIO62..68 */
> +                       gpio0a: gpio-port@0 {
> +                               compatible =3D "snps,dw-apb-gpio-port";
> +                               gpio-controller;
> +                               #gpio-cells =3D <2>;
> +                               snps,nr-gpios =3D <32>;
> +                               reg =3D <0>;

Please move "reg" just below "compatible", as per DT coding style.

The rest LGTM, so
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

