Return-Path: <linux-gpio+bounces-26075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15DB5515E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37C63AE2C3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9A031CA65;
	Fri, 12 Sep 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPTq0sfr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44406311944
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687022; cv=none; b=fmyQpCrHd5G8yTsIRpRMgKgLai2UhTasb2RgXX7trf1ch/iQ17Zaqo1rKgP8AEZ2LEocTLL6Urq9SWQSJVk/hm9bsTPX2Am0ob5Kmz0Dvl5olTjQ1P6JPyhesbYZFVT1XvkSVuL+1/9EKLeVMOWkAVNm5ujukXMDrEUsiTiH1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687022; c=relaxed/simple;
	bh=tW3dD0f9mh8+C6/rT/zFdbcRv73mdEmEtYeki1+tjR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUTkjtyK5Z2dBl2HSV774UdFoZsDcE2OuyaEpfZ+Cnsftgt8tLjgUdWAcjOG431InayAbrfCGuMH408i1wpLEAiSLFlP/UdgvOsoJkAcLymqefnAX99mHET2n4GvrQLP6/DN0y4l1BJ35WCclXrVjAQ1/rEy2jK6+IHT4m01Tag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPTq0sfr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so23686455e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757687019; x=1758291819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N4l5zcHW0vFYm8FJd3A+gQjJTt3Y7IkPRU+Kv8jpny4=;
        b=iPTq0sfrw17USnREcvrpqPmDPcArTqXrmPfohEYoWLm50L5PCPMVD0nQE+g+z69e1K
         kVkWy8+TFNxpT4hCKWIacYdQCF778GOXMXvfSKN5pHBbBEVoxdcUf6hYtaMrtrYyk+t3
         wdm0cz4UMIrivGV7bwvG+fVa6VRnsFKgqkm78ClRooJX6C147BF0A0vj9wkYiQeQzUNl
         0IjrTSNEuAZMqqtTwaB7Flms36UiiZHU+fKKayQsxXdxHCNjETtBOpBaobK5lEEOFboB
         qgiY8zr4JrEu629ZVM3jQPeetLQO0jp55XQ9vA5g+MG+05jAKRxhrb0VvqBKs3Z59iWw
         NpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687019; x=1758291819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4l5zcHW0vFYm8FJd3A+gQjJTt3Y7IkPRU+Kv8jpny4=;
        b=koxXBnfYBHzBziYlcwmL3T2xfVrQdtgj5HdwW9k3GTdK0F9vxLqoVp3+YV8UHxGhPa
         zeNRZj2cyCQvVYL/f0SXqUXsGpFp8KloXwlsl3OiP1dBTMaYpHt07RrCXWk0KxLmZ5du
         qLMz0F68UNJlDjtopbF1Xyhi2Ov+/i1+K+RrrUJpYlLW4bChL9RSbw1WATkP0QZw5pS8
         AKHcdsH7jbcKfxiK1Q2ipHg5Qob9O3QbBIhiR7y3JP+I+R6mBtzwzscCjme6A4GvYyWV
         WouxuY5Lg6/81IRu2Y1NbBrqmqlWpssmdk3DlSz2GQQLv/vbYGxvzyU3LNECDxf8dWSY
         EGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw474QByD5Wm8h/6vzNXX3IkdOQOqU3briNLQZekKGJNRU+KQkSc/Ts8NCNuhoCs4pVj9ZkoLZhxtH@vger.kernel.org
X-Gm-Message-State: AOJu0YyoPdgQXPMI1VybnsYVR0HpcSq8EqAV8BigMElPNu8cbW5aEBY9
	Jw2L6HMshqx/uw/38CM/aLHdprduMRNnutofulhV1GbCWvXqyxeeN6vx
X-Gm-Gg: ASbGncuii+weTBxI93+amc8VLnpdjFq44TvcDURl2zVwTUbI9n+9qiXRrVKs5ZT452v
	SEAtU2HQGDQEFlNAMDbq1Efxzr+ai/Ti83cA2j2oXkpHnkk8fi2EecM7P/pNJ2UU74sVVki7Es+
	CJHbC5TF8HKQ6/iiZ2MgPC8OpH1anmPC7/IuolMTW+u/1XguafB9cxJ0s1gZvDa/5ZIaBQHXwMc
	xvY0PrUeRyHnvRwshqR2wHGIS1uSG7DUghU710btbWF5bU5pCCHMTsGt6GNmIKdRX2L0ao8QjEj
	oGlUNczSZ31Lr3aP5uk43nNMFXbZIZ5QpTvxM/+wOoPMOiW9LArIzm9U24/F6o2HRt1Vi0ypx7e
	uAXC4Bki5xQuPG/1M5wdtD0i0ww2Y578=
X-Google-Smtp-Source: AGHT+IEmlb8djEP9UynDPDjjLEk8BahcV4jQiKIO9mchkJOf8JIm0XRWhLHxnVD8kQdDLWFmpvT50A==
X-Received: by 2002:a05:600c:1d2a:b0:45b:9c93:d21d with SMTP id 5b1f17b1804b1-45f24ef20d0mr17392095e9.8.1757687018297;
        Fri, 12 Sep 2025 07:23:38 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c9d91sm62800735e9.20.2025.09.12.07.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:23:36 -0700 (PDT)
Message-ID: <6ae96168-7066-4881-a228-16e57d0f6e27@gmail.com>
Date: Fri, 12 Sep 2025 16:23:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/38] arm64: dts: mediatek: mt8516-pumpkin: Fix machine
 compatible
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
 <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> This devicetree contained only the SoC compatible but lacked the
> machine specific one: add a "mediatek,mt8516-pumpkin" compatible
> to the list to fix dtbs_check warnings.
> 
> Fixes: 9983822c8cf9 ("arm64: dts: mediatek: add pumpkin board dts")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> index cce642c53812..3d3db33a64dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> @@ -11,7 +11,7 @@
>   
>   / {
>   	model = "Pumpkin MT8516";
> -	compatible = "mediatek,mt8516";
> +	compatible = "mediatek,mt8516-pumpkin", "mediatek,mt8516";
>   
>   	memory@40000000 {
>   		device_type = "memory";


