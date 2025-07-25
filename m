Return-Path: <linux-gpio+bounces-23808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A0FB11C47
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 12:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFEEC163A8F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 10:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0385E2DE6E6;
	Fri, 25 Jul 2025 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K627GQjW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021322A808
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439152; cv=none; b=YnnmZue4IvgYU6aVgSg5O1qmUcVDM/SPBo/86ZJbkiNdEKA2LcATlPHsGATDCejnkQqpIINSdzmgd/Rj6p0SYCCVe0o6KaeH/Fdm8VvMhwFsXMLb+oFR+mNFsqMAdVBpx1ElNG5yfp/z0j83UoKiizYQcbelLxoD6PmRSBU/Xng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439152; c=relaxed/simple;
	bh=2XXVnmKfKOuWrZjQTjDdYxCXEPvU5YjHEeLez+QHVDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKaqLytzUtLBu4bTK+ePrKCMz8gGew9K+pwgHFeK+DnQziSbUSDFhS43rrM3FkT6VKP/vXJL9fPCRLOnG+hc/6xLsZonIPUTp5Ydr/Czen/PFMiLyxYkLe9R/5V4j/H9cksC8nJ3ZYwYFSm3tM13BkdSd3lkes86agsn8+dsl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K627GQjW; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ffaa884a44so1016868fac.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753439150; x=1754043950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=K627GQjWoFQx1Lz3aNPzjp+QxkH9sydM7sYnjQQe1o7OAKSwdgdFLc3Fvd2AGi+0Qc
         CDnUCOhSTOIvmZAYx6jmPJqWz6onqdGrk2jPlnODziP9fLp+vWKcE7jr0ndb7a55NNio
         ItI+ldC2i69qPi7nWd1zjQCDhVYt8bgTCnR3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753439150; x=1754043950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=en5TbQwJvJsjuMBBIgc4cbjoXUsi2cAWM+prKDJWEu/rl9p3R9tqYEcwDC1mtRlVQO
         MGGO+Mj9byIhK5ltTmZywk3zU5raNYym35jFqll/s5PBkPAatnrEjnJjK5cQSLZ0DZE/
         iGnheFdqrp0kqmCL5ng6a2YuBDgnemFKMN5Drg6rdR0g3ctLzmYWiKw3AJcsIjaRX2dU
         S4RwvbcJJVcJk7SD3gepCho8KzAXUq7wWgh9K+u8hJbiTNzlznsHpNVjdMeA72n3jh2g
         fjye8L6d64DhM0l425vvTYp6f2hhmvADGCacnXw8LEd4g4JrRtUXKnezmb0ZhUKW0Ww2
         rDKg==
X-Forwarded-Encrypted: i=1; AJvYcCVgO259XAz/O/86fYgxhAX5iAi2HjVYMbVLyCustH6BYiFzn6FpAL+4T9XiSJtNSyflQ5BkYAwgmAaD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ZN6qgrsi3BCFJDCFVJj9VEK86vgku6tSjx13g32n2hcbMuYi
	UnMMSINyyuBDreyhSHXKpDtV1u7BfU5oZYGkbfpBdXzm/1LtkPrWwuEU+b6AKy/H1p1btL2F4Yy
	4HNE=
X-Gm-Gg: ASbGnctZ2e8X8n6Y2ZBN8cQDBBUdUJ7mSCqAi2kwS9GwQ7jD6EOwdCoMAr871dH2Hkz
	5AsJo4rjaJqBP0Xfq9ifVdosdVmPPgPtSb65CGsRDbZUJlTD7qH82p6XI4DGgoQV7QOJGzmp46Q
	jaz+4R8CBU8jFHfOXoGjqira/Kwb47WIdR5uPfeDRtY6fklHfc8K81a2NZZRR5pY4bAUqvWcuEd
	6ccwzRNqI9/8p2AaVJw5qGytiqeGsd2w9pROex6dGNfFpgUJIuazedx+oqB4mmpmwFmc9lupCjI
	4VcvXL/CGLoPHoVVR4PPgLUH5nJ7eaAe0JRAuFBCoJPZcI9CzCDoZq06f71VdcQEkDmb78yCXzl
	c3+3WhMZkMoTttoE/y6vlYWTt1R5B6ojgf9YitrPTeTcoUTHftkRVd2vm2e8+wKZL0vOIgkxQ
X-Google-Smtp-Source: AGHT+IEJmFRYfDmOH72S6OS+NLh2h9VF3F9DvmH49djrO37q5/YOcUzrgVoAsAqz7K6wF8MVLm3WDA==
X-Received: by 2002:a05:6870:5cc8:b0:2e8:755d:b4e9 with SMTP id 586e51a60fabf-30701e3c96amr888820fac.1.1753439150185;
        Fri, 25 Jul 2025 03:25:50 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1f20b87sm990515fac.34.2025.07.25.03.25.49
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:25:50 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40a4de1753fso1057333b6e.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 03:25:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcovUnztCiUjOecQvavzF4nnb7+D7LXtV/tW2Th21vPfbA9VCaG01EmtLvIa3XbDUY9NLJI4XDUplv@vger.kernel.org
X-Received: by 2002:a05:6102:1623:b0:4fa:dd4:6877 with SMTP id
 ada2fe7eead31-4fa2eb0ce5dmr2502816137.4.1753438693359; Fri, 25 Jul 2025
 03:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:17:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
X-Gm-Features: Ac12FXzF0-E5XCOaIf5MFeMvqjYMvWSzSdwqzh1uEwhsUpfXPcd-rqBecXNopmU
Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
Subject: Re: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm6=
4/boot/dts/mediatek/pumpkin-common.dtsi
> index a356db5fcc5f..805fb82138a8 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -198,8 +198,8 @@ &usb_phy {
>  };
>
>  &pio {
> -       gpio_keys_default: gpiodefault {
> -               pins_cmd_dat {
> +       gpio_keys_default: gpio-keys-pins {
> +               pins-cmd-dat {
>                         pinmux =3D <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
>                                  <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
>                         bias-pull-up;
> @@ -207,7 +207,7 @@ pins_cmd_dat {
>                 };
>         };
>
> -       i2c0_pins_a: i2c0 {
> +       i2c0_pins_a: i2c0-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
>                                  <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
> @@ -215,7 +215,7 @@ pins1 {
>                 };
>         };
>
> -       i2c2_pins_a: i2c2 {
> +       i2c2_pins_a: i2c2-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
>                                  <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
> @@ -223,21 +223,21 @@ pins1 {
>                 };
>         };
>
> -       tca6416_pins: pinmux_tca6416_pins {
> -               gpio_mux_rst_n_pin {
> +       tca6416_pins: tca6416-pins {
> +               pins-mux-rstn {
>                         pinmux =3D <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
>                         output-high;
>                 };
>
> -               gpio_mux_int_n_pin {
> +               pins-mux-intn {
>                         pinmux =3D <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>         };
>
> -       ethernet_pins_default: ethernet {
> -               pins_ethernet {
> +       ethernet_pins_default: ethernet-pins {
> +               pins-eth {
>                         pinmux =3D <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
>                                  <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
>                                  <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
> --
> 2.50.1
>
>

