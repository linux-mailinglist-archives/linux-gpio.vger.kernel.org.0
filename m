Return-Path: <linux-gpio+bounces-24019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CE5B1C088
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 08:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E82297A2F84
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 06:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D05B20E334;
	Wed,  6 Aug 2025 06:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IlkPj7sm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0A1FF1D1
	for <linux-gpio@vger.kernel.org>; Wed,  6 Aug 2025 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754462344; cv=none; b=iiG+srWs6FiOJWJ6a3CpcTNHB453GUq9SRRlyNfpCqhZxHNNGj+0L3iNB1cf69I3JvjW8ylY9umuikSKBnA/WfHZAy8DzV5HXi3Lk/IwjpzgaScR780IYlo0/WqMEuOFUcnDV/+H3ahoV6LCh6baHKfxcT9lIOsY48iEcYbMRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754462344; c=relaxed/simple;
	bh=cJ0u7ROhO3Zb5FCdQibLh0y7+nwoCvz+FtEn5JB6+GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5DaEZGmX0VniFWw9uAvjV8PdI6MiASmVRdf5A8pjUDoIejZM0xcTmL0sr/G/6R2csPw8Px9Qr1B1No9uTsWnxZPWdNsgxOU/0oTvljiePqeXeAnYnyWk70LOP4TaEsrDRCTOJcd/CIxBEvqFCXenwTpPyvl1tNODAowiju534k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IlkPj7sm; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3324e6a27a0so37409281fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Aug 2025 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754462339; x=1755067139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhtoojIstWLZMvAWUii3e0nHW5CIpKIzqhojK1vhx0E=;
        b=IlkPj7smnhv5fcqhha0jo2kOAMUCAUshFBBF61Qnb4GybUdw/uz8rkDrdDefZsMT2r
         PCjzQtNSHF02oMJH78tw2NKOfAM8+GSA5ihE4N3hgsACb+Bn1Gyv9lMFESQHLlDuZp4g
         +ddiy48WxMf0pI98Gwd0z54ZP/Wezgf5roh8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754462339; x=1755067139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhtoojIstWLZMvAWUii3e0nHW5CIpKIzqhojK1vhx0E=;
        b=vBQZTHbTyznH4F/B5AkRwnQuvVy0eLQUOwJ2JejU/nQ+PbY5T0zVKeohXiFddUKn6F
         MJrDDKecXztuoHBxuqinwQeZS8VI/xkmNJDac1gglLWhN4sNZ0+pk+0RYQ4N9m3VPxMX
         8BKPTQ9seshK7k0d13UlbO2Yt7tENbnLu1pP+ntXiezzjWWTV9Eu+xZi1rwofaJaRIJi
         G1mhLEt0cb9PLsiy+kryzdVq4Q+e0Q7vHPTZjIX00SDgvtmlYIr2BgfBudWwoy9ItLh3
         gABF/09/iI0o8qBpR1xAFnqwazq6jA2oBzrDlSRll5t9D+8lxk+6Fvg9QCfnuJZZqDX5
         4rUg==
X-Forwarded-Encrypted: i=1; AJvYcCXefUuSJVOvwopL2OUGiPnM2pIQqVkhJK89mvwzD//g06gHLeof0f45nHEBnQ3FSH9bNXKJfc0heOn+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv56xwSLJGsmJZvLOVyhnQ6UZ17GaKrzcXQMlNZ63mYpW2GCq6
	B4hApQPXX22jD7wRNS7GLLy1I+Tf8TyuRpOBr2c5qJIkm55p2Kh2hv1WpMSyo8eyTh1nbA5UIAd
	fwopyxusMvmNQ/yZP18EpexIqDRSj57WmuWZkcJHf
X-Gm-Gg: ASbGncvTdT2r27oyIYEODZxLCcK5QETcHHQFbJyELm9IYM+qQQC9TK4sOUE8qI09GuU
	5LooQZWoqXyCmtTyn/e3/be7f3NH8a8izc6PP3aI1zQ5ts+E4M+wmirRyYxe+t5LpQYqY08D+dI
	s+7TnB7KxAy7HOBWeuzcWp8F/AOfGBLFaxVzNcW5JO0JuLLgDdAT/briJGPzFa0IBqlJvW9Ksa+
	7AYBnCowE0/vNXbeMSYqwrn0IMqzPwnFbI=
X-Google-Smtp-Source: AGHT+IEQpBY1+GYkqQqfR5rfDKIpVNEsVsD4XjBG59L6bS42oOLB3npxd/OiMhM0pzS9tJDOxKoUlXs1gPu0gbIUws0=
X-Received: by 2002:a05:651c:1986:b0:332:5fd5:e3c7 with SMTP id
 38308e7fff4ca-33381426bb6mr5405841fa.33.1754462339071; Tue, 05 Aug 2025
 23:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com> <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 6 Aug 2025 14:38:47 +0800
X-Gm-Features: Ac12FXzbV3K2KVqpeLliCyv42tL4lMejc8rYQr4TjPtkAaTNfrGgDJMp31K_Lv0
Message-ID: <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, 
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot
<julien.massot@collabora.com> wrote:
>
> The properties `mediatek,pull-up-adv` and `mediatek,pull-down-adv`
> were using incorrect values like `<10>` and `<01>`. These values
> are parsed as decimal (10 and 1 respectively), not binary.
>
> However, the driver interprets these as bitfields:
>   - BIT(0): R0
>   - BIT(1): R1
>
> So valid values are:
>   - 0 =3D> no pull
>   - 1 =3D> enable R0
>   - 2 =3D> enable R1
>   - 3 =3D> enable R0 + R1
>
> Using `<10>` is invalid as it exceeds the accepted range.
> It was likely intended as binary `0b10` (i.e., `2`),
> to enable R1 only.
>
> This patch replaces incorrect values with the correct ones
> and removes the leading zero from `<01>` to avoid confusion
> with bitfield notation.
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 22 +++++++++++---------=
--
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 400c61d1103561db6ee0fb2d2e1c157529d03206..02bdfdb8e53c87dba0ba0024e=
0c69fcee825552b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -574,19 +574,19 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
>                         input-enable;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-up-adv =3D <01>;
> +                       mediatek,pull-up-adv =3D <1>;

I suggest we just convert them to the standard bias-* properties:

        bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;

>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;

        bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;

and so on.

ChenYu

>                 };
>
>                 pins-rst {
>                         pinmux =3D <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <01>;
> +                       mediatek,pull-down-adv =3D <1>;
>                 };
>         };
>
> @@ -603,25 +603,25 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
>                         input-enable;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-up-adv =3D <01>;
> +                       mediatek,pull-up-adv =3D <1>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                 };
>
>                 pins-ds {
>                         pinmux =3D <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                 };
>
>                 pins-rst {
>                         pinmux =3D <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-up-adv =3D <01>;
> +                       mediatek,pull-up-adv =3D <1>;
>                 };
>         };
>
> @@ -633,13 +633,13 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
>                                  <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
>                         input-enable;
> -                       mediatek,pull-up-adv =3D <10>;
> +                       mediatek,pull-up-adv =3D <2>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
>                         input-enable;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                 };
>         };
>
> @@ -652,13 +652,13 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
>                         drive-strength =3D <6>;
>                         input-enable;
> -                       mediatek,pull-up-adv =3D <10>;
> +                       mediatek,pull-up-adv =3D <2>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
>                         drive-strength =3D <8>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                         input-enable;
>                 };
>         };
>
> --
> 2.50.1
>

