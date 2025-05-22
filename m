Return-Path: <linux-gpio+bounces-20493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C616AC1263
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9F0C5024C8
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDFC29B223;
	Thu, 22 May 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ss0JgdDf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B9329A32F
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935670; cv=none; b=mG37kto9miaOGy5Aldws09kTDgyJtFSGPOOJiWxtePMcWHg4cTAiTy9A75X4FbJaiP9d21rKKdCGBUlAMGWLdhR1ATiwGgii1VJSvA+rnEGQUUBZaB4/2NPonSML4RzJvYCDI9ebGkzd/1CqA3plmwcHNiVEsJ399Gy0bhwYQjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935670; c=relaxed/simple;
	bh=//LaSD19rZpMslVCOgvu/2qzx/PSAgtZ8RYMihcSks4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe+4SM0r8APOavzfeQoLanhEU00CnuzzyB7vIVr1AhQ1z5iymGLDuXHFa/1W/au9hwjK6uHFnvHY1EzNcQhjyjiNhdut/pGbXHbOQY98ew7PvqcRH24ewY6tYdInzi7rwGgQRE2mwXbvUPdaSUDwwC947oV5HMv+oHTwHb5zZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ss0JgdDf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2898879f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935663; x=1748540463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AREwvIMnafR9fBYm24HMP34qjXwZ6Z/MvmlQ3SqUVM=;
        b=Ss0JgdDfIoHyPdluIw3gpnveihujpL0Z50a/1A4RFHdgpGgB8/Pu438TBZK/OlrTfW
         gh+5njs6j6SYRZuiKEY+ll9XppqYii5ZEuxhQ5orYyKWegZiPCDp9WUoBazEHwkCU4Tn
         MZMl4Hd5E8vTPOeHaxOdXNszxaLjOHLaJVbYPCBV/Wmbd2/SNIvwuhYhrS2xQ22HTBMm
         k9k7fFgxVt60lqnmeFPzTy/XZusc0hqBsII38NmEMI3w7ODncYsRPoSPUt9ZQ6jXaOkq
         wbpRvy+f5GFDY5MSIukXBp+MvwbO8JRh//iqLYN163qk9rKoFRdZ9ShLICuEbP6skuMO
         pPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935663; x=1748540463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AREwvIMnafR9fBYm24HMP34qjXwZ6Z/MvmlQ3SqUVM=;
        b=SLDaTPNPSbl51eB96UxWM/J7LnGu1XhjkIEdp87LFEms+4qWn/wNjIXuEiOml9wSa1
         PRhBjEMQxcQHqQmHtRIjXjdZwvoz2LrdUz37FPVML+7MLrs76su/440PVzvo9MwbOSl8
         bmTNiOslyoxwO1TvKIZwwXb5a/OkRfyeMxCpVlI2LQwYTfFy0CbY6Fv606xVAW+xZtAR
         qLpvUc2PnFJNWGXTiikQVK7DJrIVVbHKdhJPvMAeFIaxKwSFCpMklCEGK7PbOgHcxlvO
         h5WvfxiskrpMzehmXhCAOyEWfx0+l9/tPZ5US51Ld7SeN4qHcSOWMJCiZtHcBq8HfOiU
         3Pcg==
X-Forwarded-Encrypted: i=1; AJvYcCUaIAuyRxLezPuYV4U9Mgp/wH3IZycaa4V+UMusKPcknYdiKVUOs5b5EXQpOcFBGpas7+VJy2yeFFuJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyhrKge5m8s3GdSQuiNnVBdGl9scIqPH6XKCCkOcW/+MdAhVbQV
	RGCqNeGQYjGwpXp+zs4jNojjYkC01hwhnMLXxhlZDT/OjUkxKY2z0B031f21JZ4T5JQ=
X-Gm-Gg: ASbGncvJa2BVOSNaziTWRVZ9UdQ88SNH9j4lfuvO0gUhoZZ7oi5/pkBaAEJVDgC7/zq
	Z2L8P54feoIasOQd5HyQ1o4ps2NU5XS/75s2oH1NMD9P8tRXu2lXpkWjtMw4tWXmWopJwI8/qcz
	e2n+xxIFCUz5DWtEj7UVcF11Tn/THic/zX3sHLM9guz6r1MTO5PFmAnHVbLi9JsAypL1W1lIdnr
	xofIkSqQMsZsqPNwLM0tBCQTUwhEa1JL0I7Nx81hL2mc4CYzxNH4HL+OUDT+GI6wdOlsG+8DIsT
	ivTxI6akQTqQd4xzE7oWvdOJIKkRzOOSrSRGlGss8GiOl2CXWDiPtIv2YmiJPC4pZrXvxg==
X-Google-Smtp-Source: AGHT+IGKpp/jGjOIVUHY8XjuY48OF99YoOra8vEXZ4Ydaxkp7motsd9YRvQ4u8xDNDp2mm41mmFl5g==
X-Received: by 2002:a5d:5f56:0:b0:3a3:6282:693c with SMTP id ffacd0b85a97d-3a362826b2amr22786983f8f.42.1747935662835;
        Thu, 22 May 2025 10:41:02 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:58 +0100
Subject: [PATCH v3 08/12] arm64: dts: qcom: sm4250: add description of
 soundwire and dmic pins
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
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
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2

Adds data and clock pins description (their active state) of
soundwire masters and onboard DMIC.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index cd8c8e59976e5dc4b48d0e14566cf142895711d5..723391ba9aa21d84ba2dda23932c20bd048fbe80 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -37,10 +37,36 @@ &cpu7 {
 	compatible = "qcom,kryo240";
 };
 
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+};
+
 &lpass_tlmm {
 	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
 	gpio-ranges = <&lpass_tlmm 0 0 27>;
 
+	lpass_dmic01_active: lpass-dmic01-active-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "dmic01_clk";
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio7";
+			function = "dmic01_data";
+			drive-strength = <8>;
+			input-enable;
+		};
+	};
+
 	lpi_i2s2_active: lpi-i2s2-active-state {
 		sck-pins {
 			pins = "gpio10";
@@ -74,4 +100,40 @@ ext-mclk1-pins {
 			output-high;
 		};
 	};
+
+	lpass_tx_swr_active: lpass-tx-swr-active-state {
+		clk-pins {
+			pins = "gpio0";
+			function = "swr_tx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio1", "gpio2";
+			function = "swr_tx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
+
+	lpass_rx_swr_active: lpass-rx-swr-active-state {
+		clk-pins {
+			pins = "gpio3";
+			function = "swr_rx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio4", "gpio5";
+			function = "swr_rx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
 };

-- 
2.47.2


