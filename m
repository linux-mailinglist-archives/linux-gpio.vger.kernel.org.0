Return-Path: <linux-gpio+bounces-20499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A1AC127C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E276CA406E7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B746629ACCF;
	Thu, 22 May 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lfei/3ko"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1478529ACEE
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935673; cv=none; b=cPiXCZrNyYuuCjqjiH00zS3KcS5qr3MdMj80LzL5sO7e+elYTnw4/hWa+qOdkDe0qNg7N1orD/QW4Y15z10a1e2Zd6otlTUKWnURj907rttwQ6g5QmQujWL1pMsiidg1LV12kVL+MMm2peezCCqPltA43BYiSB0mcEej+xnuvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935673; c=relaxed/simple;
	bh=S6jZhUI+XAJ2PlE5nePNGPGqQp49fPpI3d6PmNbCvKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8vbUWOsgd35tL+dCJJMtkcs/1mbFYUqYy0EYSfAvcZxFnh/mN6KhouSSyb+b/2RM7JSuv3bqhBSlG7YpgXbT+aHdw01XTtSHF48ueGsapeKp4FhgrEr6t8sY4T02mw1wDkS64YNbFGnj8W6WOnMZ3LoaqPbtnm6xv0m31ve3fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lfei/3ko; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so69773135e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935667; x=1748540467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLq9dfH5kw3m9MDlrQzYgeHTL3bjAaliqFaw63+wHMA=;
        b=Lfei/3ko1TmKGManuWlHdW+YkoNPXj/I5U199qy+aVnF0Rizf2NoUjzrKolFl4shgk
         tcexM70t+slg5iS+feIFy6chTIOj4X0gwMvRWiNku1BzK+m00Ke43zw0zwTe7RHCAuhP
         9Dnn3MRFOwuffPrFtrIV2zP50d23ijDbk0yPN5+XjKwVSkmMYwHCkqvZMhcuGPCrE5Kw
         EIrOsDyykJGJA0FF+a1C3bHiIWhaobbD38VYyxg7iCRAlKGxMaohDDwBG6EVDaYt33iD
         GBHJF+f8GyX3dAc7pDZRQYeBR4h/u3Q+zIqbB73SvYahUM6QUv2v/cOszdXtX/UoUOTc
         FBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935667; x=1748540467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLq9dfH5kw3m9MDlrQzYgeHTL3bjAaliqFaw63+wHMA=;
        b=nnimmBrGNE5ZjP5hPDGNIHsf2tZ5qJrVehpeI+aVFDbBdxPCtfUWIaDeBUn2lExOuL
         ZBYxygjPyO4jr+n0ClNnlKmnjvUTKmKyP31dN7uq/ePuFENupgB0FOtfQOPs0L/6xv6d
         Fa/ORjUXNJmUNssqQyLJ3ueqXTdtZHtBfCk87SGMmkyYh0H6sZdSy3N4K1UYPqTbBGVz
         h0ecsuwelKL9SZjSFLcSzIE4O4Za0bEWZ+nM6Jf1CRBprqwNDOPKf1frPYVjpmXXMfOc
         FBPeQ0coA3wUvc1COWVIPOQNTjX283rLoCN5OhNieNa+kNoiPTVs5mTjnP344/ebYEku
         0Ssg==
X-Forwarded-Encrypted: i=1; AJvYcCXWOs1uhhEfDJMZAu2JrXMCNsLCA3oEeVtv5YewuXC0ozCEn0JAXLKdJEDMYh/e9gDoKkMVgP39D81L@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBIIt1vIQe33QgVHtvt93EQEOx7CnLhc68dZ9OdYM6UMr5aGp
	NxNv/+Whdm8qwHJcOzuVKkTpw/SndLLxDzxIxDkveShcgijzWb3XQLCrnilgI9Qxulk=
X-Gm-Gg: ASbGncv7VH8raY01zeJxTsMNw9kaEpBP5OKbajGmUzAASstleFnVbdbrGSmoVxLKs5v
	T9xXCfUfhQdqEzEwx7FMQ7SUIi8E7mrL3RWZSn4OwRyOAOFMzqAmigSTZ8BrlB5pcDuvf2aFYTh
	JIkN6L9wQzADm2a1jn6zsImbYj4yIiKp7sHBapj6uxR6iE6bCVhIKgFILAeXEqCnttaj5L3J5Zn
	nnyvyCwVdSZTIrS4rWuK12j16ydLp1a3oJ7ywDhzq+DeqXkfb4wh5Muu6NbUKQ9uqIZtLRnaOZS
	dAF3Hk5gRYQxLCIKM8mhfDtOTiYi7dMTptqXpzduS5ve8684O2ooZfuvuIw=
X-Google-Smtp-Source: AGHT+IFHZ7GRnEumz9miXfhQcVTeLvcllCBZO2l6C+Fp4Xcd0b3neA0piaRSIcSFkbEs+4+lyCZ18g==
X-Received: by 2002:a05:600c:4ed2:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442fd67504emr198840965e9.28.1747935667099;
        Thu, 22 May 2025 10:41:07 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:05 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:41:01 +0100
Subject: [PATCH v3 11/12] arm64: dts: qcom: qrb4210-rb2: add WSA audio
 playback support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-11-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Add support for audio playback via WCD937X/WSA881X. From DSP
and rxmacro the sound stream goes into AUX port of wcd codec.
wcd codec decodes digital audio into analog and outputs it to
single wsa amplifier hence only the mono configuration.

The audio playback is verified using the following commands:

amixer -c0 cset iface=MIXER,name='AUX_RDAC Switch' 1
amixer -c0 cset iface=MIXER,name='RX_RX2 Digital Volume' 80
amixer -c0 cset iface=MIXER,name='RX INT2_1 MIX1 INP0' 'RX2'
amixer -c0 cset iface=MIXER,name='RX_CODEC_DMA_RX_1 Audio Mixer MultiMedia1' 1
amixer -c0 cset iface=MIXER,name='RX_MACRO RX2 MUX' 'AIF2_PB'
amixer -c0 cset iface=MIXER,name='SpkrMono WSA_RDAC' 1
amixer -c0 cset iface=MIXER,name='LO Switch' 1
amixer -c0 cset iface=MIXER,name='RX HPH Mode' 4

aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 4b878e585227ee6b3b362108be96aad99acba21d..1e2b9d2516b62e2e80c40ed6c3a0c4548a02630c 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -111,6 +111,8 @@ sound {
 		pinctrl-0 = <&lpi_i2s2_active>;
 		pinctrl-names = "default";
 		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "IN3_AUX", "AUX_OUT",
+				"SpkrMono WSA_IN", "AUX";
 
 		mm1-dai-link {
 			link-name = "MultiMedia1";
@@ -151,6 +153,22 @@ codec {
 				sound-dai = <&lt9611_codec 0>;
 			};
 		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&wsa881x>, <&wcd937x 0>, <&swr1 3>, <&rxmacro 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
 	};
 
 	wcd937x: codec {

-- 
2.47.2


