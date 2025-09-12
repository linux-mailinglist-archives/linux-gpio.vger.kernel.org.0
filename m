Return-Path: <linux-gpio+bounces-26062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ABBB550E5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DC397AD539
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD8D3128CC;
	Fri, 12 Sep 2025 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlX1wHAd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4ED3128C1
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686828; cv=none; b=WnJehryT4vKJPKDvFpOmxOlI2oEBbLhSimY0EprjQRwE69Y6IcJ2TTch2JgRZQUL4PpK2wbRTGZnd65ohLALv6Fjw06oiajZeF9JLwqJir5v66JGKvqQ/VdDvNb3rDBuTs5bzFY9dMAgCfbrABwNcu99QDCVL7CA4Tq4mHj5eXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686828; c=relaxed/simple;
	bh=ywoSao/pIMcsJJINwYGsAstaDWlkDRlAqJDHcceNgM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0GSEaVYn5QqlJGjg36mv6qfY9LL3j6vmsM4A5vcfKHa2fMOK6N62NRSp+bmqkO8L7/4YjKNq5nbn0uEy2unGP5LlOJi4Tn8lZjasSDjLWRdtRWSiy1O78sSLa+0QJFOpZYXlQXrF8khHtD5OPPYAUP4etkRoHkI1+lvun3CITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlX1wHAd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45df656889cso13514875e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686824; x=1758291624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ehDN8c0/F5eZ831IVZll96+NWY7i1QcRKUtRMZjXuP0=;
        b=GlX1wHAd+V2nAZ/nKC/Dmj3NhNoYGsNIHbZMVGgp237l9/UyomdS6d/SKxsEeAYQ/j
         3ghdKGOmb5wMpfeokUnmM6JVf/ncMdoGj5duRf81taphxVXUt3UWLdQIhLueldyx5TvJ
         uSiDGqRP8B16sLIQdf77sH2M2PPcglKpWFr21h7Bnzk0Z1G4BgAbeSMRW67VjVrg30A6
         Y9E3217mZVcWzkmZO2UuVxwkCzf7HdXl4K4OeOtTK0JQnw9B9xFyzMdvWhmw/fA/PwZv
         W8MHinFYlNDyRQEfyzKbu9unvRITL7ExlO24AiZ7eX9J9U/ZX7fykQfV54mEVHmuLGKf
         X1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686824; x=1758291624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehDN8c0/F5eZ831IVZll96+NWY7i1QcRKUtRMZjXuP0=;
        b=GQRpyFJmjZo3aqsy2bcmoSXW8/u1m821eweZTrCG+qfz12NK8BSrfs1g4CMMH4KhEK
         KUW+bU0CYSanQSA8ezukj0x3oaGCBjyH74mA93ayoPYkMXY5LIt/8WesSbCBXP52KKRl
         qwTO1wjl1NEM+T2yEMG1TPmUHSSzei4TTe8MStztplneFLh5LelIqfrlzioNXO2JckTt
         G93wGGZdSffHdLZVWcwSeFHuq1WDL5ZrUQyawuCL8sUzRqZKGjFlvAT3sGebD4d4tW7e
         4DbiTvEXbv828mu+CkQyZVw5vtKrHDSrGpPe9NT3m5+tN0sqRp9SzSSi0hMQkpN/220Q
         16uw==
X-Forwarded-Encrypted: i=1; AJvYcCUbLvS1ZljkOrOkt85zzeiVH/5sIb1aabpPTTNWU+FkxxzINv2vsARbNsLcgWnZw+CmVr7U+uM7XiR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3DRu8GS/VDa7oOqKFbgVD/qkrpz1zqOQBXXDBGcELVNqmOYG0
	nyiU9CmV+Xof/SoezaXaZ9JSimEMonUben93bng/FQV5xBQ8gzokBYXU
X-Gm-Gg: ASbGncv1YPsCxVYdKNvJQgxUSouFAtsr+xgGCSVQXSfzUKx03HtycPB77R7jny6MA0V
	9/yxcnp1at0itrFz3j1K4BYiNPxbOeYVrMV0uQ2ehJDglSPqsvI8ZbEAqLxKW/tZtyxjHqPCIjU
	uAvQL+OMjfdGIsNnlnnNdmf7jCqoy+we/YUiJHMtY3mLAI0k7YVzTena2clb+2AmiuL2C5ye2hv
	yCGgTIWNicgVqLyuKnjkltAQSk6t6LY2E5mXH8IPAK4VJ2IcPJUaxpeItz7IWOt1TK1m0sKEMYs
	3hZocWJxyEG+vtRr8XcPkgJDTO9VqguKQTpiYZMWuRz80s75ARENhZ7rQQIe97bbTHbQLXYnu0E
	dCbDhjL+wh6Tms1bph4Q37ZL7K9yiSSI=
X-Google-Smtp-Source: AGHT+IHtSSdiDkUB898paY6KoQvNDE3OgBxVTaH21P4AnZRGobWI8BJOt5uErOIC2i3WhKinxdthWA==
X-Received: by 2002:a05:600c:4585:b0:45c:8e6d:a45f with SMTP id 5b1f17b1804b1-45f211caa28mr37824695e9.5.1757686823899;
        Fri, 12 Sep 2025 07:20:23 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03729c76sm64384065e9.6.2025.09.12.07.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:20:21 -0700 (PDT)
Message-ID: <e06e9568-1129-4262-83a9-ab652101831a@gmail.com>
Date: Fri, 12 Sep 2025 16:12:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/38] arm64: dts: mediatek: Fix node name for SYSIRQ
 controller on all SoCs
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
 <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
> The sysirq has "intpol-controller" as node name, but being this an
> interrupt controller, it needs to be named "interrupt-controller"
> as per what the bindings (correctly) expect.
> 
> This commit brings no functional changes, but fixes a dtbs_check
> warning.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6755.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6755.dtsi b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> index b55d3fac9bd4..8da5c0a56a02 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> @@ -98,7 +98,7 @@ timer {
>   			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>   	};
>   
> -	sysirq: intpol-controller@10200620 {
> +	sysirq: interrupt-controller@10200620 {
>   		compatible = "mediatek,mt6755-sysirq",
>   			     "mediatek,mt6577-sysirq";
>   		interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index 5c579e88e749..70f3375916e8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -138,7 +138,7 @@ ppi_cluster1: interrupt-partition-1 {
>   
>   		};
>   
> -		sysirq: intpol-controller@c53a650 {
> +		sysirq: interrupt-controller@c53a650 {
>   			compatible = "mediatek,mt6779-sysirq",
>   				     "mediatek,mt6577-sysirq";
>   			interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 38f65aad2802..58833e5135c8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -404,7 +404,7 @@ pwrap: pwrap@1000d000 {
>   			clock-names = "spi", "wrap";
>   		};
>   
> -		sysirq: intpol-controller@10200620 {
> +		sysirq: interrupt-controller@10200620 {
>   			compatible = "mediatek,mt6795-sysirq",
>   				     "mediatek,mt6577-sysirq";
>   			interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> index f2d93bf6a055..8ac98a378fd6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -228,7 +228,7 @@ apmixedsys: apmixed@1000c000 {
>   		#clock-cells = <1>;
>   	};
>   
> -	sysirq: intpol-controller@10200620 {
> +	sysirq: interrupt-controller@10200620 {
>   		compatible = "mediatek,mt6797-sysirq",
>   			     "mediatek,mt6577-sysirq";
>   		interrupt-controller;


