Return-Path: <linux-gpio+bounces-1057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC8806DEA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D215D1F214BB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 11:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B688C31A6B;
	Wed,  6 Dec 2023 11:28:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE921C9;
	Wed,  6 Dec 2023 03:28:38 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2866951b6e0so4493420a91.2;
        Wed, 06 Dec 2023 03:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862118; x=1702466918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S0kmFImYzeIHSyo7VpqV5Zap9umvn3x/Zbri7a4b0g=;
        b=S+ZcXaDZtRkudeRDU3JGQ82h8uzqy9iOkCfwsj7wgUc5RmFC/I0fpecZTjYy2mUnwQ
         MbuMIhpESW81vB1/wGlYzfs8ZVwSDnrFTs/w7tb/bnzeer0g7+f0XLUjmdn41jPOUZqx
         8ckwEwDZ7zo1Jx0xw2e4Hikg3BF/VwbSeM1KukJkYg4cd7XBxlhRxyGtDvsWNtFNvWIb
         Vn/2NaBQFi3OIc1wpQoNH8a4bgoKKFB5BO4+paRGKcpWcNY40Pip0VtZE7DPFM+3W5hF
         RIVwzjoi3QydozICbYagpNZ+q0mRRqjI+M62FWi0odMzx2OOSkPMH0kYFvyKoig6hgzP
         BlXg==
X-Gm-Message-State: AOJu0YyhpMp4KcUJNxKNT982DRN9InzgUbSFBn/Rpl7E5Fjm0sKF/Tlu
	PmIGNe/JBDHteltijEFW1zCSI6MO2PSiEA==
X-Google-Smtp-Source: AGHT+IFJRKN9kEYEzXAgQhz5tCOXfmXnrkUfAqeHzyOLSzTJ7Wxo8oNcR3Nsi9GvM97os3Jl3pJXng==
X-Received: by 2002:a17:90a:780e:b0:286:ca3e:be8c with SMTP id w14-20020a17090a780e00b00286ca3ebe8cmr718479pjk.90.1701862117992;
        Wed, 06 Dec 2023 03:28:37 -0800 (PST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a194e00b00281032f9f9csm14159353pjh.35.2023.12.06.03.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:28:37 -0800 (PST)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso4324519a12.3;
        Wed, 06 Dec 2023 03:28:37 -0800 (PST)
X-Received: by 2002:a25:bec4:0:b0:db5:47ee:47c4 with SMTP id
 k4-20020a25bec4000000b00db547ee47c4mr366154ybm.53.1701861745075; Wed, 06 Dec
 2023 03:22:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com> <20231120070024.4079344-14-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-14-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 12:22:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXs9tKo9W31f5OybNR51a_i99Lyx=wHe0GLrADN_8KZTg@mail.gmail.com>
Message-ID: <CAMuHMdXs9tKo9W31f5OybNR51a_i99Lyx=wHe0GLrADN_8KZTg@mail.gmail.com>
Subject: Re: [PATCH 13/14] arm64: dts: renesas: rzg3s-smarc-som: Enable
 Ethernet interfaces
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux@armlinux.org.uk, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de, 
	m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com, 
	broonie@kernel.org, alexander.stein@ew.tq-group.com, 
	eugen.hristev@collabora.com, sergei.shtylyov@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thanks for your patch!

On Mon, Nov 20, 2023 at 8:03=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> RZ/G3S Smarc Module has Ethernet PHYs (KSZ9131) connected to each Etherne=
t
> IP. For this add proper DT bindings to enable the Ethernet communication
> though these PHYs.
>
> The interface b/w PHYs and MACs is RGMII. The skew settings were set to
> zero as based on phy-mode (rgmii-id) the KSZ9131 driver enables internal
> DLL which adds 2ns delay b/w clocks (TX/RX) and data signals.

So shouldn't you just use phy-mode "rgmii" instead?

> Different pin settings were applied to TXC, TX_CTL compared with the rest
> of the RGMII pins to comply with requirements for these pins imposed by
> HW manual of RZ/G3S (see chapters "Ether Ch0 Voltage Mode Control
> Register (ETH0_POC)", "Ether Ch1 Voltage Mode Control Register (ETH1_POC)=
",
> for power source selection, "Ether MII/RGMII Mode Control Register
> (ETH_MODE)" for output-enable and "Input Enable Control Register (IEN_m)"
> for input-enable configurations).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -25,7 +25,10 @@ / {
>
>         aliases {
>                 mmc0 =3D &sdhi0;
> -#if !SW_SD2_EN
> +#if SW_SD2_EN

Cfr. my comment on [PATCH 11/14], this looks odd...

> +               eth0 =3D &eth0;
> +               eth1 =3D &eth1;
> +#else
>                 mmc2 =3D &sdhi2;
>  #endif
>         };
> @@ -81,6 +84,64 @@ vcc_sdhi2: regulator2 {
>         };
>  };
>
> +#if SW_SD2_EN

Likewise.

> +&eth0 {
> +       pinctrl-0 =3D <&eth0_pins>;
> +       pinctrl-names =3D "default";
> +       phy-handle =3D <&phy0>;
> +       phy-mode =3D "rgmii-id";
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;

#{address,size}-cells should be in the SoC-specific .dtsi.
Same for eth1.

> +       status =3D "okay";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

