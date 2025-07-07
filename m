Return-Path: <linux-gpio+bounces-22893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E30AFB756
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 17:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A42C91AA609E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 15:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2AC2E2EF4;
	Mon,  7 Jul 2025 15:27:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CAF17A306;
	Mon,  7 Jul 2025 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902057; cv=none; b=Mhq53+/rpJInxq7zqj684a29I/Q7vkzxpnsTG45/9dkYcDKz6C4FlhLwC6RPFeu6AqtNT5pgvB2yI4TUbQ9UyOYfoxrC+dXkVGRuhBOu7jCL/3TS6iNHSnAUTMB3V1WBdtLasiWqmn4MfoK2Y4FyOWdO1wJZ9UBgJB0JzF3jAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902057; c=relaxed/simple;
	bh=bCbvPv8OcDDSwGLS18hZIPniIsTnQAxmu1wE9+Jmwkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKQ8EopmN0offEPC5/vgRzVmYJBnQ9MY3maAMx6BTkHogD/tjEd7cfcME2FjJCH9SIy7K0lU5S2Ae8Ay1Hbq5qnwOE+/U+53kfsqP0MY6uAMysvSO9iHfaW4ViNAucYWfoDxJVI1NPy7D4GF4MRw2h+iXeaATY2Qm/bL+3EM3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5551a770828so3222808e87.1;
        Mon, 07 Jul 2025 08:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902050; x=1752506850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gq/m+uuap/74CMqzIl6lm2BPBa+nZJNp0jVRl5qDPFY=;
        b=hgT0fVrK40CppWPha0oIPHHYTT8x0nc6PqNJgFKvxIDdN9KEBt+n1R7VtNpvTBuMCZ
         6w8kAr47QJ61JX35y60/lYDf3Do0PNkjQ+BWVHivwHPKdf7QOQE9Ms/Upulk51qJukZr
         ZhUk9GnVB4Ftz/ikxv+emU4A/PyZpXyuw9coFi1gd9tOqfXspEsbF0NWRV0UaagDkDaF
         Fpglbtc+l5tAu85DoQffwXFw17r7w1zxqX7yW21H2Kt5Pg28xPpqcMjqccE2LX6t8yn9
         kRTw/qoQx05JjBz7E59cp+k27k4s3LHloxj4QXwEt9QDK/pzyZw9OhHtXIvmwx7QDm7A
         FzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR0wz4tpvlydYDIs6Hk4nIpkETfJbD2iAUtofwYrD+fDUNhpCFRQ6Fq1ipncvlHxb1Cz1//1qH@vger.kernel.org, AJvYcCVHpDKPO9aXqhCOSJwmHCwtrNi0eKpDe8Mgq/jJqLQqhPdjuTz/oI45qMCoT20AiTrvyJYjKIuoVwzybvBS@vger.kernel.org, AJvYcCWDdN5oyxjzfTDia4qJYSqBEt3oeIfj3nBWAsJ8EVF7LMijpC2D84HNRvGtr5SH2NMDBHHUyXZostIZ@vger.kernel.org, AJvYcCWN5I3wrNjy+utmxEkYSMIE/wKHrunjCn+qT3GrVDPVnaOFFPBVBjCDMppVpB6cyRKuFltosB6hTWZZhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCf8rgphpMO820Flkbd8AhmGvovlIyXkFsMauutthaHOwRhRwy
	Zqn3NEVpwZuSfazWS57UJxwOy7xAxiFTrAyn2BOY/BCxztjQ/duYrQA5SxBgsWSa
X-Gm-Gg: ASbGncuWtEHhui4WDxxhlHj1vUIGH3f1mIxPP5j9YW13V1lnAbhYGnFkdR9AcnlLHhD
	cb38yVWEqVa0PemsPV7RtESFboDwZsT0u9rKYrYAvqRe6I7ONM8iV3XQzsOMQL2XDrBGmIxWEyg
	mrptAa+84RVZ9XlIUiEfS/Mf53sUrQfEjebGC7JXEaKSYWJ1q1lLheGdxuAII6VpxiBKYTgMbwi
	wtd2KgzTu5FEghs6BWtkfz3ERlP/KQKtGFr/JULo78fEu1LtzprJr9mHYnuVBAeUMOkzLm/jUvM
	ko0H13AEhMlhgGha/HV9GlMdgUnTJIm3g2UxLLrXw0LwO/nMw1rkK4TjGspIgRdnRVbrPLOSXBw
	BifLOm02AjquUNqPCZAQ=
X-Google-Smtp-Source: AGHT+IFh24e6k9mwDJlyg98Xc0LhvXZ4uBvtGnTBjY+7TJiNmmGIRYHFaeqZdPNpCzmPFnXL6PtNiw==
X-Received: by 2002:a05:6512:1193:b0:553:515a:5ebd with SMTP id 2adb3069b0e04-557e5528c38mr2116362e87.8.1751902049783;
        Mon, 07 Jul 2025 08:27:29 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bae8asm1366322e87.25.2025.07.07.08.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 08:27:28 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b3b250621so30012021fa.2;
        Mon, 07 Jul 2025 08:27:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkGDHtD0wWiHcWZ7PmEJ8+GaHAewzHzOCAJuu3tj39klxqcgnTvOcqO1zTHbbFCtg4HFf+EKgu36ihCw==@vger.kernel.org, AJvYcCVLeZYM1vLnbz/maRkCL1YlPEh0+yNlCJcIhFXf/Gdj602VMU4Z5po2Do16cxICdctlJBCwSFJbLz/Z@vger.kernel.org, AJvYcCWzFxyb/HssA4hFnrURGBrO3TN61WWHaDlG4LoYFrLY7faMxiHtwBRqo5BRDXjxiCLiL8SNND1T/6xc6CmZ@vger.kernel.org, AJvYcCX1O2snR16T3weMeZzfgI9Aelbb6hFdVC9TrNQjxl4kG7xsrCOAC7hjnSpjg2afN3PN0VMGzEZi@vger.kernel.org
X-Received: by 2002:a2e:bc1c:0:b0:32c:a006:2a1d with SMTP id
 38308e7fff4ca-32f199879cbmr21879731fa.4.1751902047688; Mon, 07 Jul 2025
 08:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins> <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
 <aGud0aVLHGoql3Vj@collins> <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
 <aGukLuQ359MOyTqT@collins> <20250707133806.5bdaa536@donnerap.manchester.arm.com>
In-Reply-To: <20250707133806.5bdaa536@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 23:27:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65--6xh-nyFEqo1xOp3hDgHAXpE8zhJ3yyD5A11J5eG3g@mail.gmail.com>
X-Gm-Features: Ac12FXwiFCZSyLXcmIIR6tnFY5t_cCAiUdzAbmkyD4wbVfCGAj0_snduGWwU3UE
Message-ID: <CAGb2v65--6xh-nyFEqo1xOp3hDgHAXpE8zhJ3yyD5A11J5eG3g@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 8:38=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Mon, 7 Jul 2025 12:40:46 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> > Chen-Yu,
> >
> > > > > The block is the same, but the integration is slightly different,=
 as
> > > > > the register for the RGMII clock delays and other stuff is at a d=
ifferent
> > > > > offset in the system controller. The BSP handles this by directly
> > > > > including the register in the "reg" property.
> > > >
> > > > Ah I see, I forgot about the syscon register. However it doesn't se=
em like a
> > > > very good approach to have a different compatible to express the id=
ea that an
> > > > external resource is different. Just like we do for clocks, resets =
and other
> > > > things, we should probably find a way to express the offset via som=
e dedicated
> > > > property instead of spinning a different compatible each time it ch=
anges.
> > > >
> > > > > So yes, you do need a separate compatible string, if only to deal=
 with
> > > > > the slight difference in the integration layer.
> > > >
> > > > So maybe an additional allwinner,syscon-offset property or a new
> > >
> > > If you can get that accepted, I think that works?
> > >
> > > > allwinner,syscon that takes the syscon phandle first and the offset=
 second?
> > >
> > > I would prefer to avoid any changes to the syscon reference that woul=
d
> > > require more custom code. I only just recently found that we could us=
e
> > > the standard syscon code with the provider registering the syscon. We
> > > could drop the of_parse_phandle() + find device + dev_get_regmap() bi=
ts.
> > > This is partially covered in my GMAC200 series.
> >
> > There is already syscon_regmap_lookup_by_phandle_args which supports ge=
neric
> > extra arguments to a syscon node. It just requires a custom syscon prop=
erty.
> >
> > I personally find this cleaner than adding a property just for the offs=
et.
>
> Well, I proposed that already for the H616, where the second EMAC has the
> same problem with the syscon at 0x34 instead of 0x30:
>
> https://lore.kernel.org/linux-sunxi/20210615110636.23403-10-andre.przywar=
a@arm.com/

Nice.

> I don't remember the details, but it got eventually dropped, partly
> because the 2nd EMAC isn't supported yet due to missing AC200/AC300
> support.
> My plan was to let <&syscon> be the same as <&syscon 0>, which would
> preserve compatibility. Though I am not sure the fallback compatible is
> then correct, because it typically means that older driver can cope with
> those devices, which isn't really the case here.
>
> But we could postpone this issue as well for the A133, to the day when
> there will be a device using this 2nd MAC.

I guess I could maybe use it for the GMAC200 as well? Then if the GMAC200
is used in future chips we don't have to add another compatible string to
the driver.

ChenYu

> Cheers,
> Andre
>
>
> >
> > Paul
> >
> > > ChenYu
> > >
> > > > It seems that various other platforms are doing similar things (e.g=
.
> > > > ti,syscon-pcie-mode).
> > > >
> > > > Thanks
> > > >
> > > > Paul
> > > >
> > > > >
> > > > > ChenYu
> > > > >
> > > > > > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/=
kernel/linux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > > > > > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/=
kernel/linux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> > > > > >
> > > > > > All the best,
> > > > > >
> > > > > > Paul
> > > > > >
> > > > > > >
> > > > > > > ChenYu
> > > > > > >
> > > > > > >
> > > > > > > > Cheers,
> > > > > > > >
> > > > > > > > Paul
> > > > > > > >
> > > > > > > > > Cheers,
> > > > > > > > > Andre.
> > > > > > > > >
> > > > > > > > > > [1]
> > > > > > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/ar=
ch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for=
 the Allwinner A100 pin controller")
> > > > > > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 +++=
+++++++-----------
> > > > > > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a10=
0.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* =
SCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD1 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD1 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* =
SDA */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD0 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD0 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* =
SCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXCTL */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXCTL */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* =
SDA */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* =
OUT */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
CLKIN */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
CLKIN */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
TX */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
CS */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD1 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD1 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
RX */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
CLK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD0 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD0 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
RTS */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
MOSI */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXCK */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXCK */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
CTS */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
MISO */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* =
OUT */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXCTL */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXCTL */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* =
DATA0 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* =
CLK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* =
BCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
MDC */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
MDC */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* =
DATA1 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* =
MOSI */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* =
LRCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
MDIO */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
MDIO */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* =
SCK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
MCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
EPHY */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
EPHY */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
BCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD3 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD3 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
LRCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD2 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD2 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* =
DOUT0 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* =
DIN1 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXCK */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXCK */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* =
DOUT1 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* =
DIN0 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD3 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD3 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* =
OUT */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* =
DOUT2 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* =
DIN2 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD2 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD2 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Paul Kocialkowski,
> > > > > > > >
> > > > > > > > Independent contractor - sys-base - https://www.sys-base.io=
/
> > > > > > > > Free software developer - https://www.paulk.fr/
> > > > > > > >
> > > > > > > > Expert in multimedia, graphics and embedded hardware suppor=
t with Linux.
> > > > > >
> > > > > > --
> > > > > > Paul Kocialkowski,
> > > > > >
> > > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > > Free software developer - https://www.paulk.fr/
> > > > > >
> > > > > > Expert in multimedia, graphics and embedded hardware support wi=
th Linux.
> > > >
> > > > --
> > > > Paul Kocialkowski,
> > > >
> > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > Free software developer - https://www.paulk.fr/
> > > >
> > > > Expert in multimedia, graphics and embedded hardware support with L=
inux.
> >
>
>

