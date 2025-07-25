Return-Path: <linux-gpio+bounces-23813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D2B11DDA
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 13:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C371CE3DA0
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 11:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF71A23D295;
	Fri, 25 Jul 2025 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OkI5Hk7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9B71F0E26
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443981; cv=none; b=Qs+myrDO1naCr5uig2FVBDBOjpaxR2OVXpMZ7LvPh/EHDB9dTNXl20Dvgw2emRiuUAFVN7Tp25iwBo/JS25CwQpjgg2cD6Kho8Bl2qag7BKM0D89va7kF+kgS2V7ENW8bmIZ2kOee9nxi2cpFCaJlKD7YqV2d6GM6ilw4SwwTOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443981; c=relaxed/simple;
	bh=IU7jvnAwzmp5GuJHgplXAk58lqyd9tH4hjc214tIw4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWvCJi+VkoJvNTQfnJMd2I+ERFQRW/XiS8+icSuLePYUg32VEuLrlAjwAl60JFhuSDAc6ozvE4y88caO0bDsV6vjUST7gogHiTmcbepZJnrFzmpH5i2sRPRbA/QjOueFlz3eWu+K56fyX3h8ZV/HP9RJ23uqx1UxAyztUl8nMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OkI5Hk7K; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-707204de185so6142586d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443978; x=1754048778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=OkI5Hk7KwKYJHy9yp5l1CU+UonWr8N5cWdZgatyVq8NDfwT712mMNI9WEuK2T/xG4p
         v/sRGDEOAfrk+G2WXQGlx6LKcI9crIPFOrErll6IZgKlWlT+bgesB0SDSEYg4xymZkHc
         LqWZQDp2TfoK/i9hRL74cgik+wOr8dl35ffy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443978; x=1754048778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=mlPNoOFIfZhbMTU5PTaWYmEqgKwrzTDSRvDb+sM5QDbcbhaHhI+zLrT1jzJOSi8s6R
         giBtbwDhyswRdQAS3YEF60rv21KkjH6APcIJOKqAgyk8u76+8PbCgD7lcmfYkNCbVeld
         FolxanK/Dn7X4VGLPaAVUH4LpCA80U3EAFrgz4JiuqU9pLv9IrSqheOlTVBmssTiiyoT
         TtMSkDAQKXJELJLIQdFT+qQW3pPerlpAVdBn0J1rs+9Ilfsl9ofcUEzivaoT2O/v/mM1
         SLPCo2An3qWMpxdgWs+0xMc/lpT9YSJCbfMro+WsY+TZ77/ZtRR2y9T2eF9FQ+edts9W
         KtwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJLzFIvVcSKBtteRe+15rEl2DoXGnzJcNxRxdFDL+LBdqdGQVVrfGsGMsYnfEk9LLbr9Kvqd0Utp4c@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrZuby5Yj5ryA/SsXUQKYxlDLEgZLMqJskvs+GPmz02ceeBnD
	mFf+4mWjPOkjPFi7IfbSI4QTjaqJTCN3fwBK+l1Iy7vVPalcClcfmEPgC0jjI5E+Ylxr6Q0rqSm
	hp9c+dQ==
X-Gm-Gg: ASbGncuz41EKo95jC0M8w2IkWKOFSftPMZago2w2jQx6z9W+mG9GwmKXQJSyTVIXOxa
	Uopj+bR80RCH7oKimZDCmAJhcmFzZTHAg86URsBUHXnd2+gBmRBXC9ZD4x2ikoFx4bb+bzBhiah
	/YMkL1pa2+44GluhIQdit0iK9DeJHGNJHEKtQdcdqplEY9gAZ3TfcU3ssN2l4CNz5LMFdAc+6yN
	F3jtlHvNHaBHEyrdKWyvjge3SeBzCIHP+waMdxwMUVCZsKk7Y6VJZraIRQF1d9g0rtwVMly6PH5
	eZmgvdnUbwT2VIniWGfDzYhpoDVNXLJtgU5uAk6ZZHUVgi35jwgigP7y4yS+Nc9d8fmlGx7W07+
	mb1A0glkyBpclEmqUO74GL2GVLhGi80yzHx37YlSVY0cy70Vm/ycEzGI/8A==
X-Google-Smtp-Source: AGHT+IH4bK2WxE6J7HuD6+/uWyaDJqX3xkWjeeWIIqFuCtyHJzx6PsUqDgcE8vx8VIiYEdLaDbIq0g==
X-Received: by 2002:ad4:5b83:0:b0:704:f952:1882 with SMTP id 6a1803df08f44-707205f8a3amr16697866d6.47.1753443977584;
        Fri, 25 Jul 2025 04:46:17 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7070fce7deasm25627366d6.99.2025.07.25.04.46.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:46:17 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7072628404dso1950786d6.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:46:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn+GUnKYOIIz7hYiJTQrTIF4AoZnNGIqX3m7bTuMx00xMZ7IBYDN3d8BFOIda+P7MQP7gav5F3iV3F@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr308667137.17.1753440019738; Fri, 25 Jul 2025
 03:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:39:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
X-Gm-Features: Ac12FXzAeqGgOrEJjRR1J4ryO0U3L8RJWv4_H_TyT4RYPsIpmGY3ViSbTr41uno
Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
Subject: Re: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix
 MT6360 regulator nodes
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the MT6360 regulator nodes were wrong and would not probe
> because the regulator names are supposed to be lower case, but
> they are upper case in this devicetree.
>
> Change all nodes to be lower case to get working regulators.
>
> Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dt=
s b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index 4985b65925a9..d16f545cbbb2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -352,7 +352,7 @@ regulator {
>                         LDO_VIN2-supply =3D <&vsys>;
>                         LDO_VIN3-supply =3D <&vsys>;
>
> -                       mt6360_buck1: BUCK1 {
> +                       mt6360_buck1: buck1 {
>                                 regulator-name =3D "emi_vdd2";
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -362,7 +362,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_buck2: BUCK2 {
> +                       mt6360_buck2: buck2 {
>                                 regulator-name =3D "emi_vddq";
>                                 regulator-min-microvolt =3D <300000>;
>                                 regulator-max-microvolt =3D <1300000>;
> @@ -372,7 +372,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_ldo1: LDO1 {
> +                       mt6360_ldo1: ldo1 {
>                                 regulator-name =3D "mt6360_ldo1"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <1200000>;
>                                 regulator-max-microvolt =3D <3600000>;
> @@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo2: LDO2 {
> +                       mt6360_ldo2: ldo2 {
>                                 regulator-name =3D "panel1_p1v8";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo3: LDO3 {
> +                       mt6360_ldo3: ldo3 {
>                                 regulator-name =3D "vmc_pmu";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo5: LDO5 {
> +                       mt6360_ldo5: ldo5 {
>                                 regulator-name =3D "vmch_pmu";
>                                 regulator-min-microvolt =3D <3300000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo6: LDO6 {
> +                       mt6360_ldo6: ldo6 {
>                                 regulator-name =3D "mt6360_ldo6"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <2100000>;
> @@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo7: LDO7 {
> +                       mt6360_ldo7: ldo7 {
>                                 regulator-name =3D "emi_vmddr_en";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> --
> 2.50.1
>
>

