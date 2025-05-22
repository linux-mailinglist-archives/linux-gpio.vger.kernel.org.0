Return-Path: <linux-gpio+bounces-20496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8D8AC1272
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88A4E189C3F3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3657329B773;
	Thu, 22 May 2025 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vh6eOja6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFCD29AB17
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935671; cv=none; b=tZ2Rj8KF1xJJTW7air0bG483Xh/gxjhXpnvmbxIBTV/HKCgp+vu57cc+m36jD9Aubhn2BS/tkTGJEi1YT49MrZvnDyMgJdBGKHL2hr0SeY/gWk156N4fdc5Nq2C5alDVTaQ0N2DkuvdWPUscQlVgh07ObzQMbel3q1SCsFLsG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935671; c=relaxed/simple;
	bh=KEPTMakCA32PkhOCrneqwQED+KPaxi3ID2lG6vlGRmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HL6c6rhoKA3anHIfL48JEGcozhhUdcYrDkIDjutEy/GhbcpNyPNZC1C2YyWWN7bj1+EKjIP6EE4nt8Pvr0f92p3D6rd3dBzBLDX9BbxxEANEbhwr8M/tjXdgIF1eyindcywxQv9NFaj6q9mHMw689Xyw0mFvbdmtM7GaQW5syus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vh6eOja6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2898913f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935665; x=1748540465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6zBILNgMTTruPAKW6TCbU3LqqO81pSI/MBmJZg4XxA=;
        b=vh6eOja6Pyx0N1mL7J5ArhNCbPg6RCcMCYbJEoiyyjvPI9cheM9vyZ2jmrBvBqKikP
         4zssXMDJ+pe4wiqXvYAws8tfKAix/8J23/l/urxF8Zf/Darxu+wQH6rpNkhzJy/buiZu
         PKndfdpYUHmCf42fQ1Za8OQ3eWbmc99/aDe1j1P/lTfYy5HS5GFC8lIkxafRw/RKX6ox
         h20bB29XG58Qy7LSzhzOaw4PVY1FpOPODj5AfYxzMo6hPTstKZEDP1ODIQ3f5CJy1tf8
         D4snMholPimtH+GOu8+BKka2vI8iDtkW9XR5hwd83+GD+a8siEEO2MR9KzHKxDNdQSGa
         ueeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935665; x=1748540465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6zBILNgMTTruPAKW6TCbU3LqqO81pSI/MBmJZg4XxA=;
        b=eV36nEAuTT+RGE8/yA1nzppExS7lKJuY14DjcaQfXzlceonbEOBjborWsvoYYixde9
         Qnh8GPfl4VxlNHPn3Zo0yFUJFp4UQ7PDT5t1/zfu2MnTZa44T9bd3eyu4NtgyFWxSO0u
         2EUAq/JcEquZ59G2q4geL4r+sNNOgPRkQQKNVc/PTdgBPhaYvszxEEIxGcpZg3MgubHB
         wrz7ZG9KiNEspp0J9uhm7wrKcdiUYoy+dOs1ShbTEGRV8NS7JeHXVJ8La7ZCKHnjymaE
         PEvWUI8ko+AJ4fSGW+55jBBb0KSevPNbJEq/MCg3n1c8gSCeCZLPWMpsWi9ZTXjmP40b
         TczA==
X-Forwarded-Encrypted: i=1; AJvYcCWPnYnrMTblOtXCoQU6U4aQq7UTcM+I3svTZoQXagaeUtyjRq+Y0KvdG7sMaDeOfFXBo0v2XKGEkLJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUNvpwh5fzIzRMdy3nTPN4gV5mE/cZcIHIX+Dg3Ux1q0tY4MG
	RVVvuE3lbZ1peZQwBveol+Llg/fLmyvXY186VA81GKisAFAoMeFzWXl8/gTYnwnY6G7ZBnEIbyD
	IiXIS
X-Gm-Gg: ASbGncu2aOin+Ylr0j0whfowJdugNUXCBt1fp4jiczZ+5zDrX4B/naG/nRFc122fbzb
	o4UbKrfwkBul+micJb2NbnIztJax2Au8fPUJ8ejpNAGk6wgFcltr+V0DGByNRCLHKVVm9Plxmj8
	/yiM61sdy3LDx+IEqVHsUmMyYGhPhoIqWsMajDtjWgPUoDNtsoLYKSH8BmZoMW3IolldtbTfHut
	s7iEAdaaTXlYhqupH5VXHSHw/nWzwKK0EQLeD5Rqb8EXVZF8egLp5enUBNfVo7a6oUT9vYQU6a2
	fjlqVAtRjZO2o++J9BJwW8o2bBr9gc5WbV0ow+REse555XjpdncmWI6pRTm+OONLSuJczg==
X-Google-Smtp-Source: AGHT+IEF5HaUFQwCelNdRVlj1OZcIfPLTd/t+FpobYKsjTVhFlb/PhZuoCsEx3xvOKWYBUnoGfdrcw==
X-Received: by 2002:a05:6000:184d:b0:3a0:b84c:52b4 with SMTP id ffacd0b85a97d-3a35c809250mr25368671f8f.10.1747935665397;
        Thu, 22 May 2025 10:41:05 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:41:00 +0100
Subject: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
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

One WSA881X amplifier is connected on QRB4210 RB2 board
hence only mono speaker is supported. This amplifier is set
to work in analog mode only. Also add required powerdown
pin/gpio.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -270,6 +270,24 @@ zap-shader {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	wsa881x: amplifier@f {
+		compatible = "qcom,wsa8815";
+		reg = <0x0f>;
+		pinctrl-0 = <&wsa_en_active>;
+		pinctrl-names = "default";
+		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "SpkrMono";
+		#sound-dai-cells = <0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
 		drive-strength = <16>;
 		output-high;
 	};
+
+	wsa_en_active: wsa-en-active-state {
+		pins = "gpio106";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart3 {

-- 
2.47.2


