Return-Path: <linux-gpio+bounces-1145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5780B129
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 02:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACD89B20CD0
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 01:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3907FB;
	Sat,  9 Dec 2023 01:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVuErclE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC681724
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 17:01:05 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5d34f8f211fso26065357b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 17:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702083665; x=1702688465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElaXcfV6dmgzWzzP1M0WxFihXPQM8C12PJOBL/Tp0sE=;
        b=HVuErclElmHD/KgnB6aCiA2Y9l9gvaSgPN1y7qasGlO+vUaGqUXjVKVNwHC+CdLAuR
         RjJGtpjNQDUeIeL4HLL9CSDQ0pLgjE/c2vBtH2sZfFL/2NCQaxM+IAmkMWQcedrzFdbJ
         udeffoMiSLBPuCMQIpbmayzM0el+7Qu+9zRwvgBQMDgx+Jtq/kjSEyCfT1eWlfPTHNUt
         mTcyQqkGiVTIbrN/NQvnRpyqfN8QTcaBk9SrhhTXE/tBe8kEKHXSBqfFJN5xuDBi7m9g
         p/04gPTodWNdBRhhk9re3Y+PfgM+PIrCMITdT6LCYt9B0kqdjsrxJVvUzuA05BGNxnKV
         JRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702083665; x=1702688465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElaXcfV6dmgzWzzP1M0WxFihXPQM8C12PJOBL/Tp0sE=;
        b=O+BNueynrqZFI5PiG4M/7SbJV2ql/UqI3L1sMlEa/L1v915bS7jhCrVtom+dYjl6uB
         YLSf07/0Gb0S+wKmSaTDYt8IhgkMMEUaKyv32f2ITjZOPS8L0Jrc6FPFyktSi5RMafIe
         uNuPMJpgVuRlNOZxOxq//ad9QEwyKMuJMqdhtg2fPRuoJUMXNmdlBLcg9wgWSTeOeMPX
         dLpgVWgG/VxfNTWnzmwwTzLAcb6IktzA7cVKjaphdg+idnrh+a5yQxkePN6HBXtfDiUl
         jTkMgreNovQyVDElwy3fbm9TxrZkskDMNBjcds/WfNeUs6B8CkHxl8Ax0Rp6zLzsHsd3
         Lfgw==
X-Gm-Message-State: AOJu0YyRWLzNUPPcRK6O4rNM9IWY/MEGDcqlYKHfYVcK+4NZK9k2YBgM
	Qv+UDJho27tzGsYrKbCPdBzAp2sOIEVOsquiWXZG4w==
X-Google-Smtp-Source: AGHT+IH5c7drT+7MHmk+IZXb9MS8muJJAtPfMa/43napxTl9DXzmHgSvTulnvFbF7nfeWXmR3prdtkp8JfQyLi6/3nE=
X-Received: by 2002:a0d:eb02:0:b0:5d4:1a53:861f with SMTP id
 u2-20020a0deb02000000b005d41a53861fmr925367ywe.1.1702083664866; Fri, 08 Dec
 2023 17:01:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-19-peter.griffin@linaro.org> <CAPLW+4ki_GUAnor4sTanXFLzKrAB9JpxK98PED1fUY-MLCzUdA@mail.gmail.com>
In-Reply-To: <CAPLW+4ki_GUAnor4sTanXFLzKrAB9JpxK98PED1fUY-MLCzUdA@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 9 Dec 2023 01:00:53 +0000
Message-ID: <CADrjBPq-MLBVrW0ju64JdXia+QnDSsKR9+DSi==rkZXokMzt+g@mail.gmail.com>
Subject: Re: [PATCH v5 18/20] arm64: dts: exynos: google: Add initial Google
 gs101 SoC support
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat, 2 Dec 2023 at 01:54, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> > (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> > phones. It features:
> > * 4xA55 little cluster
> > * 2xA76 Mid cluster
> > * 2xX1 Big cluster
> >
> > This commit adds the basic device tree for gs101 (SoC).
> > Further platform support will be added over time.

[cut]

> > +       spi0_cs_func: spi0-cs-func-pins {
> > +               samsung,pins =3D "gpp20-3";
> > +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> > +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> > +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> > +       };
> > +};
> > +
>
> Nitpick: this empty line is not needed.

Ok will fix

[cut]

> > +
> > +       aliases {
> > +               pinctrl0 =3D &pinctrl_gpio_alive;
> > +               pinctrl1 =3D &pinctrl_far_alive;
> > +               pinctrl2 =3D &pinctrl_gsacore;
> > +               pinctrl3 =3D &pinctrl_gsactrl;
> > +               pinctrl4 =3D &pinctrl_peric0;
> > +               pinctrl5 =3D &pinctrl_peric1;
> > +               pinctrl6 =3D &pinctrl_hsi1;
> > +               pinctrl7 =3D &pinctrl_hsi2;
> > +               serial0 =3D &serial_0;
>
> Please check commit f4324583cd4d ("arm64: dts: exynos: move aliases to
> board in Exynos850"). At least for Exynos850 the serial alias was
> moved to the board dts by Krzysztof.

Ok will fix

>
> > +       };
> > +
> > +       pmu-0 {
> > +               compatible =3D "arm,cortex-a55-pmu";
> > +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_clus=
ter0>;
> > +       };
> > +
> > +       pmu-1 {
> > +               compatible =3D "arm,cortex-a76-pmu";
> > +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_clus=
ter1>;
> > +       };
> > +
> > +       pmu-2 {
> > +               compatible =3D "arm,cortex-x1-pmu";
> > +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_clus=
ter2>;
> > +       };
> > +
> > +       pmu-3 {
> > +               compatible =3D "arm,dsu-pmu";
> > +               interrupts =3D <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
> > +               cpus =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> > +                      <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> > +       };
> > +
> > +       /* TODO replace with CCF clock */
> > +       dummy_clk: oscillator {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               clock-frequency =3D <12345>;
> > +               clock-output-names =3D "pclk";
> > +       };
>
> Don't you already have real USI/UART clocks implemented in your clock dri=
ver?

No, not yet, hence the dummy clock.

[cut]

> > +
> > +               usi_uart: usi@10a000c0 {
> > +                       compatible =3D "google,gs101-usi",
>
> I can't see this compatible in USI driver. Does it make sense to add it t=
here?

It is not required at the moment, as it is compatible with
samsung,exynos850-usi. I don't want to keep adding more patches to
this series, and then having an endless cycle of nits.

>
> > +                                    "samsung,exynos850-usi";
> > +                       reg =3D <0x10a000c0 0x20>;
> > +                       samsung,sysreg =3D <&sysreg_peric0 0x1020>;
> > +                       samsung,mode =3D <USI_V2_UART>;
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <1>;
> > +                       ranges;
> > +                       clocks =3D <&dummy_clk>, <&dummy_clk>;
>
> The same concern as above. I think I saw those clocks already
> implemented in gs101 clock driver.

No, these clocks have not been implemented yet, hence the dummy clock.
There is no support for cmu_peric0 bank yet in the clock driver.

>
> > +                       clock-names =3D "pclk", "ipclk";
> > +                       status =3D "disabled";
> > +
> > +                       serial_0: serial@10a00000 {
> > +                               compatible =3D "google,gs101-uart";
> > +                               reg =3D <0x10a00000 0xc0>;
> > +                               reg-io-width =3D <4>;
> > +                               samsung,uart-fifosize =3D <256>;
> > +                               interrupts =3D <GIC_SPI 634
> > +                                             IRQ_TYPE_LEVEL_HIGH 0>;
> > +                               clocks =3D <&dummy_clk 0>, <&dummy_clk =
0>;
>
> Ditto.

See above

>
> > +                               clock-names =3D "uart", "clk_uart_baud0=
";
> > +                               status =3D "disabled";
> > +                       };
> > +               };
> > +
> > +               pinctrl_peric1: pinctrl@10c40000 {
> > +                       compatible =3D "google,gs101-pinctrl";
> > +                       reg =3D <0x10C40000 0x00001000>;
> > +                       interrupts =3D <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +               };
> > +
> > +               sysreg_peric1: syscon@10c20000 {
> > +                       compatible =3D "google,gs101-peric1-sysreg", "s=
yscon";
> > +                       reg =3D <0x10C20000 0x10000>;
> > +               };
> > +
> > +               pinctrl_hsi1: pinctrl@11840000 {
> > +                       compatible =3D "google,gs101-pinctrl";
> > +                       reg =3D <0x11840000 0x00001000>;
> > +                       interrupts =3D <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +               };
> > +
> > +               pinctrl_hsi2: pinctrl@14440000 {
> > +                       compatible =3D "google,gs101-pinctrl";
> > +                       reg =3D <0x14440000 0x00001000>;
> > +                       interrupts =3D <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +               };
> > +
> > +               cmu_apm: clock-controller@17400000 {
> > +                       compatible =3D "google,gs101-cmu-apm";
> > +                       reg =3D <0x17400000 0x8000>;
> > +                       #clock-cells =3D <1>;
> > +
> > +                       clocks =3D <&ext_24_5m>;
> > +                       clock-names =3D "oscclk";
>
> Doesn't CMU_APM take any clocks from CMU_TOP?

No it doesn't.

>
> > +               };
> > +
> > +               sysreg_apm: syscon@174204e0 {
> > +                       compatible =3D "google,gs101-apm-sysreg", "sysc=
on";
> > +                       reg =3D <0x174204e0 0x1000>;
> > +               };
> > +
> > +               pmu_system_controller: system-controller@17460000 {
> > +                       compatible =3D "google,gs101-pmu", "syscon";
> > +                       reg =3D <0x17460000 0x10000>;
> > +               };
>
> Just a suggestion: it might be relatively simple to add syscon-reboot
> node in pmu_system_controller, and it might just work. One more
> feature for free! :)

Thanks for the suggestion. I tried that previously and it is not
included here deliberately because it relies on more than that to be
functional. Although the register offsets are the same, the PMU
registers are protected from the kernel and are only write accessible
via SMC call on this platform. I have patches ready to send out as a
RFC for that once this initial series is merged and we can discuss
that then.

regards,

Peter.

