Return-Path: <linux-gpio+bounces-26072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E09DAB5513B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58F497BF336
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A809320A28;
	Fri, 12 Sep 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNQ02lqS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585B8313538
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686966; cv=none; b=Rnc4t1rVIcmUcGjH7udZLjRVaVdZ/8GMCFdOUK+nWRbB/X6NHxTi/WmiAR2zoOWGRZwxA4LXDJQl0ZK9YynSCdj8LZpLw/NovWXdOg+fOjRSo1gBGUdOs9sqFYhht+J+6LPzHaad01GtDV6x611nuEmOZP5U/+6Z0HzYL25uZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686966; c=relaxed/simple;
	bh=t5l/naQj3nmZrrosN65ssHKsRcpoZMY4WQY0oZATpMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djswyMjsgio7eLwgVM8ru+uSOe9Vgk2G8hvSXg/Ice91y5Hl9vJVTXszaaLFsZlxipFHjDZvduezKundVPeSY7d+H71IkXyKH/VdApRoyGJyQSut3II7ZOFIZ1GBl1R809PY/d0y5cv9DOztmj/jlAtcUXUtGFfmSo+kzfsKjKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNQ02lqS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo1155430f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686962; x=1758291762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VymCpN9fDyNm7QOg2yye26PyPlP5MnwUCjdKp/JISyg=;
        b=BNQ02lqSuqirbnxTe2NFyyhmcOufy2yu2NRTUkrDQcJukAkwxwk9Nhyrextlnm8rUD
         he5z2XsPFh7qL5wOWZoBdKfJFuJ/2VEVD0pIh6o54ifZ+BEDWdc3FETVuUI2ZPZaeGIx
         qyZFjZtZs6dVVonYBWBH7IcNJB9zeo/qn0ikHV9JVin6qrKTcO27Wd8lkiuzgsXbpsRe
         vRLzyKfRYh3itLF+sC4/3B7DarGOYKTfZBBPv1MUAvdCEdfM4gIDvPLS/VAEx2xhg3fN
         fwnhIfThBa4B+MZ1Zbll1aLDwQEZcJFUbum27eIUNMYsIPf3t6pxUhmUYLnoGzPrBdau
         Slig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686962; x=1758291762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VymCpN9fDyNm7QOg2yye26PyPlP5MnwUCjdKp/JISyg=;
        b=wElp4OA6Ff+Y0jT3B+8UTGxcEcREcIvQkZglgDtU11esATZHMgU4pb4gb0UFWx25UY
         AWqMDaROWUfFJXV7mdKsMd+yuGNW/1yxobL6zOFSTFCoIf0WWDcVlDTLwVAFZEfhFB0V
         bwrD0yncuDdumO9rsF+hBuNw87H/6Np6p3QIbS+ckg6fH2xaT/GDyKv9J9kRuBXfcVpU
         4VTdvLu17xs9UnAFXQn+pDaF1OdnCClQauAJr3ibz5g6dbqcV6G6dY44PUoRw6w2/l7u
         HNcZaF61eGAxi8VmJ19/D0BH9JJfduB82cp1ppboaQlMKM88QAgulggHAkv3dyi6MvIg
         /Glg==
X-Forwarded-Encrypted: i=1; AJvYcCVJlCybFrY5eZrXWFUb/R+SfiAeTKp3TSRfeUoIndOJ4f5bAipR9IIYr84BfZvMi3i92CfuPWap1dCZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+bphMajWHEoW1e5I5JbuxQDEzhFFjoAr4kY59jbZePvCExKP
	XuarNvApe3kM3qOc6wNjUi/cDliBhTpMVjLxPSBC01EvcTcTaXs+ZHGA
X-Gm-Gg: ASbGncveK0nhRHcN9u1P2MXAaMvW92KElaDK6qByF3froT4gVgPKMRa5XXdAuyYZAAU
	ugQ2taU0MmBSn0mbJJgPCWMp18OMiMczL7OpUk/G88PlhNuE21JB8eX7L9LRON6jSBWeMRm+0+O
	xTuB+RKdnfTBhyGfEl05ce4dwGe0kAD2aoMZlqgGiRap9tv4cOdLZHD9lVruwvRkqg0Ok+FpNfC
	cKtuk+N8sbFZ4LwBQfUVIWTHj4ceQ/85NSFvBpfvi4KgET2jsafFy/ksOShY+sLVSju7WBH585R
	T/FkoYCeBQS5nRhMRrFkJfRN9Sa1U4Mpa7e8fmttTpDAN2dyppPAXNYWqq7zABu/vMZaeOwDJka
	yFab8DQWAg71FjjY63n3T+CYT8NevenY=
X-Google-Smtp-Source: AGHT+IGS/ldf5VzaTVStAjlJrTC/ggG5z3uMdvDlNsP8I8AfAyjYBZwViC4ftI3Cml1zaAZD0YLmkg==
X-Received: by 2002:a05:6000:2509:b0:3d9:70cc:6dd0 with SMTP id ffacd0b85a97d-3e765a05342mr3225811f8f.33.1757686962105;
        Fri, 12 Sep 2025 07:22:42 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a16sm67350635e9.12.2025.09.12.07.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:22:40 -0700 (PDT)
Message-ID: <b28210f7-8154-406e-b2c5-70de85deffb7@gmail.com>
Date: Fri, 12 Sep 2025 16:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/38] arm64: dts: mediatek: mt8195-cherry: Move
 VBAT-supply to Tomato R1/R2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> Move the VBAT supply to mt8195-cherry-tomato-{r1,r2} as this power
> supply is named like that only for the Realtek RT5682i codec.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 1 +
>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 1 +
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi          | 1 -
>   3 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> index a82d716f10d4..a50b4e8efaba 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> @@ -13,6 +13,7 @@ / {
>   &audio_codec {
>   	compatible = "realtek,rt5682i";
>   	realtek,btndet-delay = <16>;
> +	VBAT-supply = <&pp3300_z5>;
>   };
>   
>   &sound {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> index 2d6522c144b7..a8657c0068d5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> @@ -13,6 +13,7 @@ / {
>   &audio_codec {
>   	compatible = "realtek,rt5682i";
>   	realtek,btndet-delay = <16>;
> +	VBAT-supply = <&pp3300_z5>;
>   };
>   
>   &pio_default {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index e70599807bb1..d40f4c1b9766 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -535,7 +535,6 @@ audio_codec: codec@1a {
>   
>   		AVDD-supply = <&mt6359_vio18_ldo_reg>;
>   		MICVDD-supply = <&pp3300_z2>;
> -		VBAT-supply = <&pp3300_z5>;
>   	};
>   };
>   


