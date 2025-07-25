Return-Path: <linux-gpio+bounces-23811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EEBB11CD8
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 12:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27A37547FAD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 10:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2362E3B19;
	Fri, 25 Jul 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g8nmxEcz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5C2E11CA
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753440683; cv=none; b=Q5NXUQ7iapdt26CvY2/bXN53W4smvvXKjLdiAPUg4C4IoTN0FumOAVpTggxFb5sZf5h9iV6LNXOVAB4IMNnAQHeZtBbk1s5JmSa7JSKhXF4byxIt+HKdN+LEP5fgQpFGi8aj+tUSqMR4M4Jl1DL1hq4q2VmjaY/wMvgCEWIv6Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753440683; c=relaxed/simple;
	bh=70cZJ5+MOSuyvoTc0hRAELy7cfRbFrHaFdQesC+yVH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uazKZvH77KE9k8TPVTFogR2H0jGXdSjZWzsXSV30kZhi4Hb1p3RMT5Zy2fD4CePJpYLHHuR0umU/rndE2yw8PzFc6IxWThAk4JXQdoyHcNXsC5HVLYQF70zDO0CdNWoO2cB5KzDY2VC0CtM32IUfgXL1YX0OSSUeYvFa4qREzFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g8nmxEcz; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-532d498eb95so638553e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753440681; x=1754045481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=g8nmxEczZ5N91ms8uVxH9pa4W9tMVwZZ0mwoFGGt8Zjko4qEEIFKab3G8OQ1r2O+i3
         JYk8jkkb8Irs7SsoiQKb6KvGszUviwPmkBPESPSz0dggiU0pt5+mQ8JHxS/ULsUY75A/
         kHZDnOQO/GLsPszHofAs0L/0GNrGGAZmFGeK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753440681; x=1754045481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=oSPFUt3pHoVwwN/fHRNyzAM89zfLNX4j0mupe+GyUgL+myCQ2iKLt3irYWqXZTPK25
         8bIc4FPnPBRngSKaSf4RtGQRGkdSGi2rXkHv0pDBf9dwrw3Jj6OSqaMPqLlct1uk9lF6
         ByL9K+pRSh+oWicSYjOiWi/wFp9hYNfr0pyOKKHF6m/q3wZ0j9RWZq8mPMHx4kaayXX2
         ckqjCP3IGq/C/QzXvOpcN3e0SpO6Xr3x1RtjLk/guvOer7VA1aS50CjGkKWQoA88HfkB
         NLb7t8wmH7dDJw98vvz2qVKY6yZq5BpSoC6mbZ9zJsMlMU0aUW02RM7FnvkJV+S/U4vW
         5IcA==
X-Forwarded-Encrypted: i=1; AJvYcCXBM3O88ztJMpXsiiw1S8ysv9B0CXKDLAD24TB/6LyoOaosGU4SIMHq8pXG+UZDJeskKPbKfN4S2FSO@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwzqHoJapFXppVCTjwjfSid6k1ahoJIchjZEhGHe4R7ipqI0u
	XzZM9R69zOwXS1h1bpCEgCbbeayS9rJCT2ZKzPi7yn5Rh5RCSHHS3zHXXyqzm9kGHxaXy3Ggmiy
	ueewLdA==
X-Gm-Gg: ASbGncuQxn2Zn13aeHeJadSKTNvukNPaVgY2exnL+NHqhEIV7NJ7th+XTUZwMwwKa7F
	sFB2TTdjl6fFdNE2CB9kPfWAfWCtGRJiJgYNRTol0/uHpTT//9i26iuiCsgHR1LAVUeVCyiWPAf
	yVk36wu3spXPPInzzxecwnhyhKRYc3p3Rq9PNuCPR5vCyXwAEiCR0w5ljhUZy/4BU6LoAJkV1Jw
	FfdTe//pNKrAw8u+ielcPZbjuJxcO8R9IxMf3L5BS3BFLgInVqkwCXwXwGJQd6bWLyLjqfmvS+m
	5KewX5d1nix9BcSZlFJ8cF5fGzDzrDhPe1ROPMUswSJhJDR7IJMQcrU3hitU/IEfnZNVG8j1M2x
	i/g/BO7982S1OXbAkXPrecR51mzDcFyYKZye9wYjWQrEAcHG6sybUUr8LW1EO3w==
X-Google-Smtp-Source: AGHT+IFnUjVkE8NbbyNFcrrYM18rohItAFq4xel8awIG2+yk5nRBO259h3+xTtT48mv99uo8wJto9A==
X-Received: by 2002:a05:6122:178c:b0:531:4708:3d45 with SMTP id 71dfb90a1353d-538db5e207dmr270544e0c.10.1753440680504;
        Fri, 25 Jul 2025 03:51:20 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b6fa801b6sm682894241.9.2025.07.25.03.51.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:51:20 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5314b486207so650093e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 03:51:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/24yet73OJ63t7+8qkUmBiiMU6NSa0TnAwaNOLzE2UtlbOfNEeyVdQ0LClAEb6X+yF0ymTWykZ9XA@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-4fa3f8f1683mr313640137.0.1753440679035; Fri, 25 Jul 2025
 03:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:50:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
X-Gm-Features: Ac12FXxJVbrVgIPSlm6u4--DKBHxaHRjM_36IT45XEIgpl9bR5PM8dE-s5Wt-28
Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
>
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

It'd be nice to mention in v2 (if needed) that this patch also drops
redundant #address-cells and #size-cells, but it's minor.

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>         };
>
>         /* i2c of the left SFP cage (wan) */
> -       i2c_sfp1: i2c-gpio-0 {
> +       i2c_sfp1: i2c-0 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         /* i2c of the right SFP cage (lan) */
> -       i2c_sfp2: i2c-gpio-1 {
> +       i2c_sfp2: i2c-1 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         leds {
> --
> 2.50.1
>
>

