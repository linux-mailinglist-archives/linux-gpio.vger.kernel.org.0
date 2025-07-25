Return-Path: <linux-gpio+bounces-23817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4719B11DFD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 13:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D87FE5670BD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 11:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A312E7173;
	Fri, 25 Jul 2025 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="feumHuCt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0727223716
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444645; cv=none; b=IkjurvnOe5QleMi81IJq8SJlVYj/sdUnHXX9XLolKJpIhwSk9XTnkgC1Go15ClKByDpCZeeOMo3NtndQanIA3YH7PNROkdzgetEYDLrx39ftD1zkqJ4Rci6SUah7IyXJLdGn9PaIAUl3e7B0nDB7gHlQT2VGWA8pVLY4ZUlEeQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444645; c=relaxed/simple;
	bh=/FWxLS8hqus1+HRqR+NgfMdxvAEHUA0sDpoYtqNCdMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiEm35OuVOf8H2Hn3kTq9ceAHWpDpRJgn8Js3ngY6IKxM3Y9dHu5KuabRDL9706zlz8TxUMYPUvZMkvtkJdrt9Y+7nmjidfI9CoaXuSn/qZpj+5uD4pbOlC8eEJtkiCNL9j9+3dchD4WYevBTBBTh0mKotJzgDKm/Y1swj/zOK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=feumHuCt; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-41b7d12401bso1262386b6e.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444642; x=1754049442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=feumHuCtYuyvp4Wwjiy0gicEFw6pFIwSC9b/X+7NYmsTCAX2E/wsOg66L2FWwjsQ4M
         KJ3cbJwxstovyx5IjQILy0aIYiSXxkiKmYKpMCqhWyRqdq65RVnI5iT9V1xnFmb4K2x9
         eh/OZhcxDp18QwWiIUnkfnn8aT/WG2g2hXgdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444642; x=1754049442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=BvXyZ9w2kSviQxKFiXN6xE/PSql7Xx1frz1K14SpvAYDpKAmL0XlFjySepyMUr52Xg
         Xws+bX3e7y7JKj4kFATeSPxTU9Ba1wa/dC/9BoyctInMb2q6Rc9dbF5r5O5XuP/oZX8y
         BkEsbTvHNN/KNCaDl0cRMSsA5QjRnKZBt7/N43b7Xx5KozXL2U1MAmo+UBO23rnf83Hr
         YkBybP/ypVqy1GbLcqF6by6u6SFowuNhRsP797NC131d/N7mFINT9NwJP+9u2xr5Nvyh
         pSYCXAQsC8M2jiizl6VX4qbMlZJBJsA+byf/8PITNJ2255EXFTDLuzC48IXQ/RxcONhL
         fG0A==
X-Forwarded-Encrypted: i=1; AJvYcCURQrcPCvRV7Q7CihyXHZt0uXDv3QPXfqw5LRhNkCv3BA5dBoHe38Bs2rMBLzxg/ikrfsu1siFOW0Pp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy//z6o7kjST0F/+HmjywdnYZYMc98+2fUgVS9aZfNP9pwMfGCD
	7V6xT/EOhFYi6Le/Jy3WxdxuvCDQX2838IGRuX6SRi1qc0n4NzQjSbzm4RfBTjd/UwRUrqnrNMV
	lQCc=
X-Gm-Gg: ASbGncuTgXAkX8cRgEtenWKiYX9AD4cgwaefCENRJUJT3FfsO60dULIiZ+/pyhQAUcl
	GxkxSwHPiBIhpte6WlIrTua6OnzCR9TF3NnsdkDczt3lnqxN+lFj4id2XC1WBNUs5Yzw5Wbu9Si
	OZDkA+KDI36oPZ90tOSqT6yDHNce/jgXDcss70AZxyI7v6T829yWk6m+sLIs4eWZ1y210kqod1r
	Oy5kT6ZfwD3s/3Pt+J6rKchYylT07K5qXuWAbpTwvFykJ3fkBQIAvP8Q0PfchjiQ7XCOt6IZQFp
	ZuaRsbyx5i9wwOHgX8D5AarJcgJRGa5reqS0u3RFIaysrDXEQMdrtMTJrgKrYs1IIewTVO6xgCD
	kulFLUo1Pvk0VbajWvX4obMzt9c5cpo2NTK6zBz8b78HK+CfdzIEvwSNGuQ==
X-Google-Smtp-Source: AGHT+IFpuUb/Pwlx38oZzOk/qXFQcgwm1AWhLrOKm1nV4bTV/uJq7FnUaFxgwXKDUTMLeCBFKlxviw==
X-Received: by 2002:a05:6808:6801:b0:421:4d86:67b with SMTP id 5614622812f47-42bb92476f5mr868713b6e.26.1753444642651;
        Fri, 25 Jul 2025 04:57:22 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1f2cbdfsm1022370fac.37.2025.07.25.04.57.21
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:57:22 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-73e62d692fbso1243736a34.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKif2YIA5NaawpV5abzdRePs4o0GF4VfBN0OBo6btL4Uj0Ahz0/SEs6o8+F+tgOfLOKwy8bGLr+kXQ@vger.kernel.org
X-Received: by 2002:a05:6102:5a92:b0:4eb:502c:569a with SMTP id
 ada2fe7eead31-4fa3fb3f3f9mr285813137.9.1753440864290; Fri, 25 Jul 2025
 03:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:53:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
X-Gm-Features: Ac12FXy3jzZS4uZ6X5J7uIwzpvgV1oXiUrEGuonvNPTbsP1Oacxt9m6NF-3FvZA
Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
Subject: Re: [PATCH 18/38] arm64: dts: mediatek: mt6797: Remove bogus id
 property in i2c nodes
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

On Thu, Jul 24, 2025 at 5:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the I2C nodes in this devicetree has a bogus "id" property,
> which was probably specifying the I2C bus number.
>
> This property was never parsed and never used - and besides, it
> also gives dtbs_check warnings: remove it from all i2c nodes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index be401617dfd8..f2d93bf6a055 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -285,7 +285,6 @@ uart3: serial@11005000 {
>         i2c0: i2c@11007000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <0>;
>                 reg =3D <0 0x11007000 0 0x1000>,
>                       <0 0x11000100 0 0x80>;
>                 interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
> @@ -301,7 +300,6 @@ i2c0: i2c@11007000 {
>         i2c1: i2c@11008000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <1>;
>                 reg =3D <0 0x11008000 0 0x1000>,
>                       <0 0x11000180 0 0x80>;
>                 interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
> @@ -317,7 +315,6 @@ i2c1: i2c@11008000 {
>         i2c8: i2c@11009000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <8>;
>                 reg =3D <0 0x11009000 0 0x1000>,
>                       <0 0x11000200 0 0x80>;
>                 interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
> @@ -334,7 +331,6 @@ i2c8: i2c@11009000 {
>         i2c9: i2c@1100d000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <9>;
>                 reg =3D <0 0x1100d000 0 0x1000>,
>                       <0 0x11000280 0 0x80>;
>                 interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> @@ -351,7 +347,6 @@ i2c9: i2c@1100d000 {
>         i2c6: i2c@1100e000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <6>;
>                 reg =3D <0 0x1100e000 0 0x1000>,
>                       <0 0x11000500 0 0x80>;
>                 interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
> @@ -367,7 +362,6 @@ i2c6: i2c@1100e000 {
>         i2c7: i2c@11010000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <7>;
>                 reg =3D <0 0x11010000 0 0x1000>,
>                       <0 0x11000580 0 0x80>;
>                 interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_LOW>;
> @@ -383,7 +377,6 @@ i2c7: i2c@11010000 {
>         i2c4: i2c@11011000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <4>;
>                 reg =3D <0 0x11011000 0 0x1000>,
>                       <0 0x11000300 0 0x80>;
>                 interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
> @@ -399,7 +392,6 @@ i2c4: i2c@11011000 {
>         i2c2: i2c@11013000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <2>;
>                 reg =3D <0 0x11013000 0 0x1000>,
>                       <0 0x11000400 0 0x80>;
>                 interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
> @@ -416,7 +408,6 @@ i2c2: i2c@11013000 {
>         i2c3: i2c@11014000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <3>;
>                 reg =3D <0 0x11014000 0 0x1000>,
>                       <0 0x11000480 0 0x80>;
>                 interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> @@ -433,7 +424,6 @@ i2c3: i2c@11014000 {
>         i2c5: i2c@1101c000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <5>;
>                 reg =3D <0 0x1101c000 0 0x1000>,
>                       <0 0x11000380 0 0x80>;
>                 interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
> --
> 2.50.1
>
>

