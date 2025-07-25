Return-Path: <linux-gpio+bounces-23815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C10B11DED
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 13:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 765673A5814
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 11:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5462E4266;
	Fri, 25 Jul 2025 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z8v7EUd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4AF2405F5
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444295; cv=none; b=VCxf8DSOHiQq733kpdBlYmeahdJ+x5CfJ6idn+nzTMBH/0JSkcz9+sNPEYwfVg8szrbl5zKTeHdF7V55VeUi6qXR7SypijVssWoSBWNfIlK+bCjcnf3eRamciyukaeneiDNTfjrJ1hrqkrnGp5IDeYe98fvMZresLCaycyOHgAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444295; c=relaxed/simple;
	bh=V8hirrUVOWBBWHrhJ7nvVXSHaacevucbhSLPMWQvrV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i51zO8OMBROvnncOeEkcFTfpD5c19OIh1a3Qa5s3VJ5nIDBOiqX+RbvfFj6n/Aly9f7VyR7jfl/a/f9SflD5YZaOqCX8tXSWAZj2R4h2MfTq0IgbZ1KE8NjVV+IlmvOt0NvCX/mfODSbmsZPMWw916pFU1ZTo+AIOPngSa3U78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z8v7EUd4; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53140c33563so1317854e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444292; x=1754049092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=Z8v7EUd4CL4aFWbDvguZEh2bXbpOzoV51ZoCW6mdpi2yN7eyJLuu0AtFaDu9hJZOdx
         y57BGpsnab2o4nMhCx3fN6CwYfgp5ishxdVqvNyBM2a6sNFZbOeWKijrdYVX9B/AUeIs
         tg02wJWjg2kAb+J42EQD0m4CVUN8DPsvzCqsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444292; x=1754049092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=RhjZVoRCxlWlOfdb0DMuJtVJk+CYoSYz9P3ZTJWmDtujhnNN0xzuf9B7oFWBMiz4Vu
         HEt7MYzchXfgjOkQGdr7hlHC9MthfIsFUSvm+u6tVxVBUQnCBmn7vIJK9JbWEHrs4gC9
         rXcwZo96Bzh4JGpUs/ItXM0DGaBc890GCMhKpDXh0g0BMZKMT9pO7zDwgdHbJEUCZxEA
         zwKDwCYQMzWWw98woXL9acmmSHrPHm/dFCCDpg7hjVVpv8iJVrmvhdXwM/wAiBYGwyxq
         K3dwsPdlurVntFZDTPHP5VW7dzYuTLD6t+xZKT8nCSFDWlycrHdsKH634geSMsP6p6sE
         ynYA==
X-Forwarded-Encrypted: i=1; AJvYcCVnCY3Au3ZdO/azO2yP/Ldv/mrhIiPIWAhAUs4qiLpedZiq7Uh6A7cYoJPQlsLccvz5zkmBQ7c4uj7c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5R9DTBCwR7R7UhwLuSDUtUltfwe+iQ3qW3lxkbQcFyTpphjG8
	VbEH4mAYI2wg1ukGlJdKKt9GccVVBNSdUlOTUAqIR9cP7nxuADpEQcRt/DmFQDzcgLO+4FZfERw
	YX54=
X-Gm-Gg: ASbGncvcsjH3OvDh2CBHKzrP28jFtqguTrPzgoVuRM0C5+yoHIABANO5CbpvBI0dMKn
	hCmT7EjL922Bgw/KGI+JWzbWlznfx9XqJL80WgC2Asin2IMuC5E8eRWu0K9Ug58VhM2HvvLnvwK
	w43DzmGptrKF735Yv4lKGeGkS/tG9bvOCQr7FXEl1JRk2138M0IL7zDvxg5nA25VRMIwSB1XVoG
	v+J5FQxdWSudJbvnJ7BKY8iqnbvoD54oRqNm5J+1BLRna4yGxb+pQmiJrwEGP7dpvctBI3qP7L0
	FPIkTpLz43Fq3X0I2VMY7xU05HH91d4xzlOQiUIn8H/1uMqdGRykoCh6X3OQBHMUVbs+M3Jsq33
	Xp35iSkYABqXSi4CKzCz8wAgduni7++b4JUxFskzMZJp5vgXgfN7tkZn8rA==
X-Google-Smtp-Source: AGHT+IEN49Yn8QIkHjyfe5E5HJe49MJ7Xpv+wbPaSB9NCGnCa5IOpVpU5r8C8Eert8KuEmbp9Kbq6A==
X-Received: by 2002:a05:6122:1d46:b0:534:7580:e153 with SMTP id 71dfb90a1353d-538db558235mr410451e0c.6.1753444292223;
        Fri, 25 Jul 2025 04:51:32 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-537bf6066f5sm921390e0c.2.2025.07.25.04.51.32
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:51:32 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e9c6b44477so1307837137.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:51:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8zOWnMyu8CJQx5OC5xZYzXKMJBgunak4x+Cxs2TiSJldudIzqhyMC7TVjGtw1z3+Gxs8C0AgAkevz@vger.kernel.org
X-Received: by 2002:a05:6102:358c:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4fa3fc6be93mr374132137.16.1753440996607; Fri, 25 Jul 2025
 03:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
X-Gm-Features: Ac12FXy6b-EYxcfTGxWYM-OfSnpWrsOFjS6YFWPk3kTV_ZIdvcSVvNebJ1JSwHk
Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators,
 rtc, keys node names
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
> The node names for "pmic", "regulators", "rtc", and "keys" are
> dictated by the PMIC MFD binding: change those to adhere to it.
>
> Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6331.dtsi
> index d89858c73ab1..243afbffa21f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -6,12 +6,12 @@
>  #include <dt-bindings/input/input.h>
>
>  &pwrap {
> -       pmic: mt6331 {
> +       pmic: pmic {
>                 compatible =3D "mediatek,mt6331";
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> -               mt6331regulator: mt6331regulator {
> +               mt6331regulator: regulators {
>                         compatible =3D "mediatek,mt6331-regulator";
>
>                         mt6331_vdvfs11_reg: buck-vdvfs11 {
> @@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
>                         };
>
>                         mt6331_vdig18_reg: ldo-vdig18 {
> -                               regulator-name =3D "dvdd18_dig";
> +                               regulator-name =3D "vdig18";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-ramp-delay =3D <0>;
> @@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
>                         };
>                 };
>
> -               mt6331rtc: mt6331rtc {
> +               mt6331rtc: rtc {
>                         compatible =3D "mediatek,mt6331-rtc";
>                 };
>
> -               mt6331keys: mt6331keys {
> +               mt6331keys: keys {
>                         compatible =3D "mediatek,mt6331-keys";
>                         power {
>                                 linux,keycodes =3D <KEY_POWER>;
> --
> 2.50.1
>
>

