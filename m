Return-Path: <linux-gpio+bounces-26063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D51B550F5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8823F160857
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C7131353D;
	Fri, 12 Sep 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2Q/sAge"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D25B30F52D
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686835; cv=none; b=Ae4ycKvyPHIUiRxLjpxW5CSZAokJktLjxz1NexjiX9UN2SlSbRdOdLCGAirIYdQfxI53I4aWWUG4YmRSJdvyT9pWN+39bpkidv6KmMl/bx2DvoZ8aAoJoL4Z/QcqaYfb377X3vXmTKRXpC/KebbDA0rySiVlEvL8UcEExmFyIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686835; c=relaxed/simple;
	bh=2w0FFD+KJCS9EuSPd15eTcwD4ELNwuxCIigJRl2uqjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeoyG96yxMJWc4htxW+qhUV6pNp+cDrhm6laxn07PQH0MaZkHVfLUJlyXzaLOHsY3k2Lm0ZLhGj3IBTFDN9oGfEIw8EUkEAVuuBl9D6O5N5EM+34Ie1Vj1dvp+whlNMP5uwFtC0Iml/iNNgFPPXP50GhmNwNHyK2NpJMcyg6YWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2Q/sAge; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45e03730f83so9377425e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686833; x=1758291633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tdtO58sGe5Xc/wBa6IQvluyE3D0fIIRJts8BH3BBGAI=;
        b=g2Q/sAgeX/npTzDfUj9TbfuFC2yQ1zZ+ZgmI1dpq8xP8e3O2FzekiAH+bOXeivWvR9
         nXUrs4bPe9KBSXM1XpCcsBV7RU6+9mOYmIFepibvjkJkVZfaY2gEGmEDRmABABaFonqg
         RVWXzNWRcJpUljg/MiNHIOzmlZVAmX9mIrtMH3x6TI5A9STjj14DC1aSE7Jlp4GjwloZ
         7TtInFbwlXxoEqucvu6t2Wzex6xSwaW8YApqosCvM577758ooeD8m6VTOkH0ZitKH6RR
         6drxdX5MwaTh6MZ8w60FFlgJXCohwBoqdzNOIiZVK+dr3JL0OwRAi1841lzf9XzKrxQR
         9XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686833; x=1758291633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdtO58sGe5Xc/wBa6IQvluyE3D0fIIRJts8BH3BBGAI=;
        b=ail0AAGw1tSIaA1PydUTVssQYHUefxQbv7vjzdgnTz0NaTNwxnewn2l4jz3U6srloV
         AEHmuhis3itNV6d19QWo/A8f5kyQVPi/saFHc/aREmZXkJt+6tDFHJ6l2RnwhCospdxy
         lGQ2RG9dR6XVandTgR5b37V9SQX00RC6js+llXYH6bB2Z26/MW0RLdjWuMJy8OLzcNoE
         oQ/GXnHjKVUjB+hwrL4hC+bQvbwODmwFZVqBYhBZRYRpqMuujXrlHNiprq560K0ZHqIG
         +GL81SeCikL4vui4lbQcgWbWwALqv2G6Nd04yx0prLDuJEXrujlV7zCs29+ddG6LQZT8
         bY7A==
X-Forwarded-Encrypted: i=1; AJvYcCWLFYSgqkDgvYr+Ss+SFcZP5gha5oBEWDNyp0sl3u5Zd9nbPHON47jx3cyi84uMopBOmX2IOqqP4qk2@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCSXi3inqYFuH+MdJC5gJElzN0kL9qdKZHkn73DhBkP8hyYOv
	s56a15/OnzBPgwvB5VZacQJqf94RF/AtkqZ85ZIfJZrhJMZI92FgoePL
X-Gm-Gg: ASbGnctzzthiDAm77GY4jhGIwsTQbcJTCTChh3Cz++rfkeOQFs4QiVdRybKTLx7+XFV
	+//GcOSfKIgW2833W9DL5FXrVM13Z3ZwCXv7w/magfgIKXf0cTk+IvAE41X5UQj+pJp1p61j0B4
	bthz2wYZ2M3/M/tIrMuTPIzvTKTYc5/oTXn37q7n80atQ/XnYRhRWSlVXK7aovYkJfUdcVCworT
	Ej0atcAd990VArQt6G65ZxtqXwBEOyaxjAa6dfKW9FbvyYFKM9CnGhCtq9iKcTwEUXy45egvwpH
	Mrivm06qENRKMDVMMMTIhd09dfT7rgFfzrA7BrnRX7m4WHyNJTUMJWb7a4McSG6usrHXF8nTc98
	9BURaH4HFU9rS/leuDp4Jruv7PnuJZoi02nwZGMxmrA==
X-Google-Smtp-Source: AGHT+IFyYXkkR4g3z3IADJ2sI1GciXV959gj5Co89s2pEoz3DeE+MIgrxhl6XFjG4+ecyKdiYbDvCw==
X-Received: by 2002:a05:600c:4454:b0:45b:97d9:4127 with SMTP id 5b1f17b1804b1-45f211e53femr32589265e9.1.1757686832393;
        Fri, 12 Sep 2025 07:20:32 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03729c76sm64384065e9.6.2025.09.12.07.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:20:31 -0700 (PDT)
Message-ID: <947b1c19-e218-4478-bb9e-8b6174815f05@gmail.com>
Date: Fri, 12 Sep 2025 16:12:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express
 T-PHY node address
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
 <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
> The PCIe TPHY is under the soc bus, which provides MMIO, and all
> nodes under that must use the bus, otherwise those would clearly
> be out of place.
> 
> Add ranges to the PCIe tphy and assign the address to the main
> node to silence a dtbs_check warning, and fix the children to
> use the MMIO range of t-phy.
> 
> Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 559990dcd1d1..3211905b6f86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
>   			};
>   		};
>   
> -		pcie_phy: t-phy {
> +		pcie_phy: t-phy@11c00000 {
>   			compatible = "mediatek,mt7986-tphy",
>   				     "mediatek,generic-tphy-v2";
> -			ranges;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> +			ranges = <0 0 0x11c00000 0x20000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
>   			status = "disabled";
>   
> -			pcie_port: pcie-phy@11c00000 {
> -				reg = <0 0x11c00000 0 0x20000>;
> +			pcie_port: pcie-phy@0 {
> +				reg = <0 0x20000>;
>   				clocks = <&clk40m>;
>   				clock-names = "ref";
>   				#phy-cells = <1>;


