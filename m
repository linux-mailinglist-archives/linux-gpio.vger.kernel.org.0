Return-Path: <linux-gpio+bounces-26065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D83B55108
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EE55864D5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795723126DD;
	Fri, 12 Sep 2025 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8bJWuWo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577B025C821
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686863; cv=none; b=T4LQVeovkcmjFaJ2DuAVjIUwzK6eKVBqCLQ8pNyfCw4HvjhNx/2+8UbaG07TZstLMlDHfG/EMauN8fOMTLfypGzjKHlXPRTu9ErrePprw4tguGEabKXUZzS0Dt4Q63vt0FRKyUori46d37rxdqjgAAX7YyQuhlnSoxYUVHg+V9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686863; c=relaxed/simple;
	bh=LhFvZeUZESo+BqKcF+l1lftDAN8nJvGBnxH4OQlr4Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPyJA04lLyGE++SOM/f5JVKpHlJojqDpwziCl4m2QLQzDTPn0W/vuEHVNbgaHJudOQXdWw5dsKwXP5EQKjwjX+Sv1RbvTMW4givQpsSOtED6jLp49rEetdE/HwrdCw3/aALpA/VdEFm2kdpTBWfKZmecp//q48lDuJdTqwE/sDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8bJWuWo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3e2055ce973so1121839f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686860; x=1758291660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4cur4X75SOX+L9Hbv3cU7NjYIOtP0WJSnDy9zZzynTY=;
        b=b8bJWuWoQT98KnHA+pT3gitJeCu0mmyBmd5H6yoIbZW/KT5S/VipU+HlTqGXT8cy/f
         0dAKCJde9nepMrRilLmKKW1cZxI6pfTtEgPh5YhnwK/pRWTdXpgsYOAsxhosKwn/jRc1
         OJsR9W8c5oSo2y+bqhvRMJqY+tLIC21elJhj1M+T064a3OLSzrDGETrMt2sbu/HTpGf0
         SQt/scjPtpjY/YZNcBBuDEFQXgQlT9q7DhzPIcdNUJ7BnDVF+fkN6wbm2a3K7xjHrSwv
         qFd7Pflb0ScCfELi7EkM8/BJFbF0FMKgib3sLr+VRTFisfP60ulqYfoFIWSNjVDEHkD9
         dLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686860; x=1758291660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cur4X75SOX+L9Hbv3cU7NjYIOtP0WJSnDy9zZzynTY=;
        b=apysnY1GkvIl/EZVuMx68LwW5Oi+fUqL8zkkT1AHjXFXmmq9CsZMM3hcQTXNK6JbES
         ppc3Q0x5gfxdtYBC9LAHTeyjZG4EFQADAZStY6OP/2oPa2vHMB52J4GOYKjO+gr55eyb
         HdHwU/B+nsVWp7rL4chl8c/GMapW72//lJv1UY9dvHWFAR7OV/FXqJ26J3/el8qJTw63
         fRq+a6RN0bGogZiL7QkCHd6qtnzlxqQb36nJ84/maPHq+JQ80UeYfGBqS+6qAciH+9ml
         iMMFjduGI5Gg8IAv4K1YfrwVzR8k0513EP0+yME5/uFTPfGIZhCqRCXrepP7zyZVoHAH
         Yg/g==
X-Forwarded-Encrypted: i=1; AJvYcCXNWX87YcV5XDZ1QKYnOxnSGxoKf8ENsQNwRJiAQzDhYcxutPodFRA7qSHkcpc2N8+s9AAtA/nt1x4L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eF2GObr6LJSzwdH0hCnYIL/oOdB1FIEzxdhV/pyOzNySKJ8e
	BVRdTh63S8Yddqba+XzVMTTQN0G2EC+ZsJyFuzIup3TRDrCsL479qMKF
X-Gm-Gg: ASbGncsgpAdEVliYIDbyuJdPB/M1BPfVEpTme0G4+4YC2ZbU+g/cvG/5EJjOooso00D
	3tWAp6JEe1Zg9SCNhL2CTMbV07JMFdzdTd+mIPDKj2UFdV94yBwXhDZ4W0jg/BEayZE1yyCPEFR
	bvqc7wp/R/SzSxODvCmoAfdAg71Qq/TUiM8vk1kk9Nm20KR/9e7yk3CCus0/8b4DuXlkHXp5DDC
	zSZ05dLrgJa/OZrHty3JEdSoQ96HWzOS6B8uQE2qQiKBKRGEgs9+jr+VpOflhNjG4BwUuGphZf6
	EUJjdFOXlmYIrFTD29Ylc/lO4AH/xdkYCdbdkVBv1lfhYX+RaiB17IgeFQjzsmobxKpsiEgOTqm
	t2ZTutyGoPdFIe3WW9CdNRMA9Tre1edQ24ZyFkaYnfh2oy2oIdlnz
X-Google-Smtp-Source: AGHT+IETnSVaOaRKN/Bmr4IDnznOAwChZ2qQ4ywH5VxUBMfTXYJEq367ON+ECBnG0YBYE/RxZE/ipA==
X-Received: by 2002:a05:6000:2012:b0:3e7:441e:c9e1 with SMTP id ffacd0b85a97d-3e765793127mr2932126f8f.18.1757686859589;
        Fri, 12 Sep 2025 07:20:59 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd415sm6697435f8f.30.2025.09.12.07.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:20:58 -0700 (PDT)
Message-ID: <cda40929-12d7-4206-a4d9-3a74314c6b2e@gmail.com>
Date: Fri, 12 Sep 2025 16:13:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/38] arm64: dts: mediatek: mt7986a-bpi-r3: Set
 interrupt-parent to mdio switch
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
 <20250724083914.61351-26-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-26-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> Being this an interrupt controller, the binding forbids to use
> interrupts-extended and wants an `interrupts` property instead.
> 
> Since this interrupt controller's parent is on the GPIO controller
> set it as interrupt-parent and change interrupts-extended to just
> interrupts to silence a dtbs_check warning.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index 6d2762866a1a..e7654dc9a1c9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -200,8 +200,9 @@ switch: switch@31 {
>   		compatible = "mediatek,mt7531";
>   		reg = <31>;
>   		interrupt-controller;
> +		interrupt-parent = <&pio>;
> +		interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
>   		#interrupt-cells = <1>;
> -		interrupts-extended = <&pio 66 IRQ_TYPE_LEVEL_HIGH>;
>   		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
>   	};
>   };


