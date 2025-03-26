Return-Path: <linux-gpio+bounces-18001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE524A7144C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 10:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4133A79B8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 09:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA791AF0B6;
	Wed, 26 Mar 2025 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kSC0IVL8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067B27456
	for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2025 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742983090; cv=none; b=HeYwuB6ePfXouqDlhCOVmr/UABVjOOZwFla5pVp8wxIJ0QAAYO4CNwQo5hSSG01jGaixCH/VlKnYQ4tOPLVjg4DBDqSHyCGd54JZZlpaSZfFF0aIUg0jlK+qqpu/dlzaP7H7JSrR88rdf25WBrmjMtR8doGxyWAopkzbu2/JYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742983090; c=relaxed/simple;
	bh=G2mie2cYylZkzBkEuGSmLt098MlPBjaPdn6PWJttyKw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwlfMRd/PGMKR83l/qtDtrTx9BfqgNPQsJlRWvNQPALeJ6IkjCZ4w7AWr6jOKP2m7CC4DclFtjViRlVMSjUvF54UmrgAQR9igAjpIORTT+axgS/ZjcZqW7QDxwFjVlxPJ3dd+C6uQVvf2aQbkPb1B0EF19pP115037v/0aQSa6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kSC0IVL8; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F33B63F2A3
	for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2025 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742983081;
	bh=YmqDnJYd3sHMeIErDl7QaGhRZ3q+ZmYDEpXuE0o+U+M=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kSC0IVL8JmSktY0WSq0OhRFYzMwUSal03M9I/Zz1M/sp6uc+R0mirHdpsmivGNzmg
	 kjuP3AFuqDJwqE1ds058kb7TCWYjC3vr4dgZ/AibfV3AEI22EFhzzFaQYZWRQPer2l
	 XsNKV0VDispLH531mlNLpzBbAVOSZ8mOJBbAcyQ/f9ek5tYbBb6zEkziHeShFof0DB
	 goGVX3TWZmfenWx5sCCEvTQPr1GnBSrui8Ij09BLgYP61lKG4vGPlqOt+Hj3nedAGy
	 wFFvWGXMupfbRl6aDylONPgZzZkhHwXofA3xh5pLaDw0n32MZtM/5EjALc2jcE7LEs
	 bMeW+/2GNS47Q==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2a8e3905c56so2853034fac.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2025 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742983080; x=1743587880;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmqDnJYd3sHMeIErDl7QaGhRZ3q+ZmYDEpXuE0o+U+M=;
        b=DnPZO7RxPwdIy+1UW1DV1kifMy+Sz8fq9Ck8fxpJMVFG0MKqcAFsBrKwGSqryoqS85
         hWYQBcLbPLpx/KP+iGi2RI0sm7de5hbkWZNkov9DZa9i5JwGYZ4BDbM36WlT7bfsmEF3
         tUS3BOilfeZsfzbCmzq3qCiUfXe+cmN2kyvt3A2qV1MlsNyn3Hli0FVa94fsZoKoBEdP
         CAAkq6JCEA5Bcn5oFRXQaGvJ+smdea1u4loesG3gMohQSMb/yXMF7LNMDVLRQbxyUmAj
         9YOHIikDBRStALE9gQQvUo3Lse7bGSdow8EzVxKlfGOCEiMReckuoB8Mm5Vcio5QamG4
         Lr4A==
X-Forwarded-Encrypted: i=1; AJvYcCWrvtxL0oXagMBYsvdi8ULTufI/8vHfymGE2dFH2Np3MndccXyMLUQ91xKGqZx+V3KonztK4sILIX/t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpno+i2XnPFJhjka2xsn2BWQdawWbE7hJwTRDkv/Ju99Om9wJc
	eWddUFsUI7SbHrs5xRt6UWZAxb5ClVyDChKhTnXWJC9b50FQY6XDPrKXJ+Vk4Yv70p2WtBRH49I
	Pd0VHxDhsRS4kXvUFVgZSEA5kZS3z6JBHd1NNRa7H66Krek5onFfSZWKBqyHyurGSmfeqYqMkiW
	ZwxoNXyiyviVUzwXHaw6urDOq1jdGLmnu7+vIITK4IehZ9kXHPpA==
X-Gm-Gg: ASbGnctIVHN7/TpGqgKfNPzfvU+/GvaN3ESZXNHweHa9jhFbDrFFl6yOyARycdJPpGk
	em8dBeRcutr7PiDANDsPDupEuc239FfMpab78o8SNDafnwJr1ovrt8KS7XVYy7pVBYbbuUvUpaG
	ZFBI0oizoNLvfbcsF6GUpYc+k=
X-Received: by 2002:a05:6870:c0d0:b0:2c2:4d76:f1ad with SMTP id 586e51a60fabf-2c7802fc7f4mr11949994fac.16.1742983079703;
        Wed, 26 Mar 2025 02:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGusUKpLdTuUy3QkZj5OSCHZAzUQifzrm4ATjVXeFFaB5uxz8Mol5J1QaqA22HHkXCckElEM60R81g5exSGuLQ=
X-Received: by 2002:a05:6870:c0d0:b0:2c2:4d76:f1ad with SMTP id
 586e51a60fabf-2c7802fc7f4mr11949984fac.16.1742983079188; Wed, 26 Mar 2025
 02:57:59 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Mar 2025 02:57:57 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Mar 2025 02:57:57 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250326-owl-of-algebraic-wealth-61aeda@krzk-bin>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
 <20250325141311.758787-2-emil.renner.berthing@canonical.com> <20250326-owl-of-algebraic-wealth-61aeda@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 26 Mar 2025 02:57:57 -0700
X-Gm-Features: AQ5f1JoPkONs1cP6b2bcNZ0PAFZ-pHAaJXVnYD4E0Nk0jWsjQfMiZsd9uQXxdiM
Message-ID: <CAJM55Z9+dpbqt-c=55WXUXsw=Dhk6m6Q1_Js3s-T+8W7dtrURQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Min Lin <linmin@eswincomputing.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski wrote:
> On Tue, Mar 25, 2025 at 03:13:03PM +0100, Emil Renner Berthing wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - eswin,eic7700-pinctrl
>
> Blank line
>
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
>
> required: goes after patternProperties.
>
> > +  - compatible
> > +  - reg
> > +
> > +patternProperties:
> > +  '-[0-9]+$':
>
> Recommended is to have more meaningful prefix or suffix, e.g.
> -grp/-group. I also don't get why it has to end with number.
>
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        allOf:
> > +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> > +
> > +        additionalProperties: false
> > +
> > +        description:
> > +          A pinctrl node should contain at least one subnode describing one
> > +          or more pads and their associated pinmux and pinconf settings.
> > +
> > +        properties:
> > +          pins:
> > +            items:
> > +              enum: [ CHIP_MODE, MODE_SET0, MODE_SET1, MODE_SET2, MODE_SET3,
> > +                      XIN, RTC_XIN, RST_OUT_N, KEY_RESET_N, GPIO0, POR_SEL,
> > +                      JTAG0_TCK, JTAG0_TMS, JTAG0_TDI, JTAG0_TDO, GPIO5, SPI2_CS0_N,
> > +                      JTAG1_TCK, JTAG1_TMS, JTAG1_TDI, JTAG1_TDO, GPIO11, SPI2_CS1_N,
> > +                      PCIE_CLKREQ_N, PCIE_WAKE_N, PCIE_PERST_N, HDMI_SCL, HDMI_SDA,
> > +                      HDMI_CEC, JTAG2_TRST, RGMII0_CLK_125, RGMII0_TXEN,
> > +                      RGMII0_TXCLK, RGMII0_TXD0, RGMII0_TXD1, RGMII0_TXD2,
> > +                      RGMII0_TXD3, I2S0_BCLK, I2S0_WCLK, I2S0_SDI, I2S0_SDO,
> > +                      I2S_MCLK, RGMII0_RXCLK, RGMII0_RXDV, RGMII0_RXD0, RGMII0_RXD1,
> > +                      RGMII0_RXD2, RGMII0_RXD3, I2S2_BCLK, I2S2_WCLK, I2S2_SDI,
> > +                      I2S2_SDO, GPIO27, GPIO28, GPIO29, RGMII0_MDC, RGMII0_MDIO,
> > +                      RGMII0_INTB, RGMII1_CLK_125, RGMII1_TXEN, RGMII1_TXCLK,
> > +                      RGMII1_TXD0, RGMII1_TXD1, RGMII1_TXD2, RGMII1_TXD3, I2S1_BCLK,
> > +                      I2S1_WCLK, I2S1_SDI, I2S1_SDO, GPIO34, RGMII1_RXCLK,
> > +                      RGMII2_RXDV, RGMII2_RXD0, RGMII2_RXD1, RGMII2_RXD2,
> > +                      RGMII2_RXD3, SPI1_CS0_N, SPI1_CLK, SPI1_D0, SPI1_D1, SPI1_D2,
> > +                      SPI1_D3, SPI1_CS1_N, RGMII1_MDC, RGMII1_MDIO, RGMII1_INTB,
> > +                      USB0_PWREN, USB1_PWREN, I2C0_SCL, I2C0_SDA, I2C1_SCL, I2C1_SDA,
> > +                      I2C2_SCL, I2C2_SDA, I2C3_SCL, I2C3_SDA, I2C4_SCL, I2C4_SDA,
> > +                      I2C5_SCL, I2C5_SDA, UART0_TX, UART0_RX, UART1_TX, UART1_RX,
> > +                      UART1_CTS, UART1_RTS, UART2_TX, UART2_RX, JTAG2_TCK, JTAG2_TMS,
> > +                      JTAG2_TDI, JTAG2_TDO, FAN_PWM, FAN_TACH, MIPI_CSI0_XVS,
> > +                      MIPI_CSI0_XHS, MIPI_CSI0_MCLK, MIPI_CSI1_XVS, MIPI_CSI1_XHS,
> > +                      MIPI_CSI1_MCLK, MIPI_CSI2_XVS, MIPI_CSI2_XHS, MIPI_CSI2_MCLK,
> > +                      MIPI_CSI3_XVS, MIPI_CSI3_XHS, MIPI_CSI3_MCLK, MIPI_CSI4_XVS,
> > +                      MIPI_CSI4_XHS, MIPI_CSI4_MCLK, MIPI_CSI5_XVS, MIPI_CSI5_XHS,
> > +                      MIPI_CSI5_MCLK, SPI3_CS_N, SPI3_CLK, SPI3_DI, SPI3_DO, GPIO92,
> > +                      GPIO93, S_MODE, GPIO95, SPI0_CS_N, SPI0_CLK, SPI0_D0, SPI0_D1,
> > +                      SPI0_D2, SPI0_D3, I2C10_SCL, I2C10_SDA, I2C11_SCL, I2C11_SDA,
> > +                      GPIO106, BOOT_SEL0, BOOT_SEL1, BOOT_SEL2, BOOT_SEL3, GPIO111,
> > +                      LPDDR_REF_CLK ]
>
> All these should be lowercase.

Plenty of pinctrl drivers use uppercase names for the pins, intel, amd,
mediatek to name a few, and this is also what the EIC7700 documentation uses.
Do you still wan't Linux to call the pins something else?

>
> > +            description: List of pads that properties in the node apply to.
> > +
> > +          function:
> > +            enum: [ csi, debug, ddr, fan, gpio, hdmi, i2c, i2s, jtag, mipi,
> > +                    mode, oscillator, pci, pwm, rgmii, reset, sata, spi, sdio,
> > +                    uart, usb ]
> > +            description: The mux function to select for the given pins.
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            oneOf:
> > +              - type: boolean
> > +              - const: 25000
> > +            description: Enable internal 25kOhm pull-up
>
> Why bool and fixed value? Do they have different meaning? Description
> says they are the same.
>
> Anyway, don't repeat constraints in free form text.
>
> > +
> > +          bias-pull-down:
> > +            oneOf:
> > +              - type: boolean
> > +              - const: 22000
> > +            description: Enable internal 22kOhm pull-down
>
> Same questions
>
> > +
> > +          drive-strength-microamp:
> > +            enum: [ 3100, 6700, 9600, 12900, 18000, 20900, 23200, 25900 ]
> > +
> > +          input-enable: true
> > +
> > +          input-disable: true
> > +
> > +          input-schmitt-enable: true
> > +
> > +          input-schmitt-disable: true
> > +
> > +        required:
> > +          - pins
>
> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

