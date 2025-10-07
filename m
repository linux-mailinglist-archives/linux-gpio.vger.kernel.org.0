Return-Path: <linux-gpio+bounces-26852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05859BC0029
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 04:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F7C3C35F5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 02:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CAB221714;
	Tue,  7 Oct 2025 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQba29WX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB8621D3E8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802633; cv=none; b=XkG1A0S+BNyh/FO3FvNY483sUZINbiU0MBYtU9XDdJuhVGwPb9rPhYasnC+mycjIekqGNDYaaYYuzW+CsGzAiBA/dENCQU3dUEEEWYs6Of2wnbdUPWx/U1yfny1vPCsViAjwTSHTHIL8clI8vnZOa6d3b6aiyW9ap2/KWoIR5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802633; c=relaxed/simple;
	bh=ViBe2WMm7kQxPxeRuekDdL8WZHiA1GXGLJT0PDfx7w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6orCUHDzlRDqgbZ6nIQkCC6HVj73p+yFLoNv/+Jgwf1t6p/yP9VSIwVY4RCas+4Q6jN6OxAUtuOs9i8evUEKhEarl35/swZUOiw8NQ3Ka3W6REfGrYNCqOldFxhDnWCoxKUK6J7xLKkrOL3J7NKsIcRAAe9YCbCiD61mn8pljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQba29WX; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57a604fecb4so7335261e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802629; x=1760407429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ysY18u2zKYmywl9mq+ndQhWk6KHVBYX5HfqkCVFIYg=;
        b=dQba29WXjmFucH7DB6LsQxcSWRfLBU4ysxtH8pJ3y3TLKDlOKCq4AiHFjjTs7O+kjd
         lQaROupmoSSA6TrszH5HeQ5MYJZdvRFWIt3kkIr3JmOV5u/5CPN0bRnGCUEcvN83/UlP
         uo7IjvukruYtoGtz8Mp15T+PNFSRabSLI2+rqmUw/7GmLRuqmf/bvNrc4jrUBjZopJHJ
         epPDJOOtJFOIIpjqbyTEW/bFlQeBtPLiZ/O7nxkXe/ooqs4VdruEY8+tz2Ov8CR4mp1p
         cPAFDIOT29DHok2hJE/cpS4lcHmCBUjSd/sF+ro9q51ol5i52g9V+ZvwtWzTuxXyGA1A
         Fgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802629; x=1760407429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ysY18u2zKYmywl9mq+ndQhWk6KHVBYX5HfqkCVFIYg=;
        b=Rg6BpewKGu0uXkp6+8u4V2YVmjAe3/DJR7DvBoS4X6QGDbfdle/9Wl7GzigZNwBOLg
         JX0/edFsJZlw9RlLj0Z+QL1EeOP81zT984CACt2R3Qd96fZFLHCB+DhX+hF1aEOu/cnH
         8NhYOidjZWqNpMCK7qtQ2uCU1dPgLs6V26XXuCLCjPeaOmooMO1uiZ8VsaXs3ApkrmNn
         fSmr5iiGACorU7I5V1/XBdrw3djYliBugh5d4i0VbechZZ12Wf8roVS+kU3RVfsZE0zW
         uhuJ3pbFSSMGHmGKsltxvsoP6QcFeWBVNX6rEEmPeoSs9ZnWRBty1JEwcw5Vfxfpi1uX
         p1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWvdcJUTfbfZN1nQgGi6PgkHPwyIx9xj1oYJHbGlluN16F6R6zSg02KTaKXPx5T4c/3EwNDB+Sf/J66@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCtN5Xz074AASY8wuUZZ1c2cArtWgDm2qh82wqzp31sj7wwPp
	VWfSg3mBZoyLeqHgETztreKvNJY660EWkdq8wAxYLmMGMwrrU0AbND2ItXgTbP4tbI0=
X-Gm-Gg: ASbGnctjdooqQ8r+npfnSIOMyHlG2PGq24ga84iRJPW9s50yT4GdWcRXXckeY/Luo5b
	c9kO3y1iUpBWnmloZznULNS+PpR4g6p6VjqpXq9s45KDYX6YvS4HYZIYv0bmgdu3xKXIEbkBLOj
	e17Fcj5EdotLFNKP+0TaTuYJQIceO8dMeSeu48rnc8JmZ00/rDMLnzvQbzbNUKyys8Fq3ex2Fqr
	Q6vMz+ic8LOr9zcEUQ4Yjarl+mx3DFoK7Ei/FicOPt+CdW4Ecy8G4wpCyYwI3OfSNAwufApjUsV
	XgPKuy0oj2FT78wJchJ2hsKAa4uEx8YWDHCky4O7NJupSVIkPTgU1VmjUVKh04C9zxFEGAcw7iA
	j5xpt3CRb9VoumakD4BROtHpg+i24g3lNBa87TtYNOS1VcBttkMVSphpP7GV4fU45k/8=
X-Google-Smtp-Source: AGHT+IHIQAFDlaxnS/YPLaaZASPGtjzqUskbAEsgwJPrLjmMvYfFHi4ayVxMDpBzxLLkErDPJhx74Q==
X-Received: by 2002:a2e:a987:0:b0:36d:4996:1c4d with SMTP id 38308e7fff4ca-374c36c4b2amr40767031fa.9.1759802629528;
        Mon, 06 Oct 2025 19:03:49 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:48 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:32 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-4-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add sound node and aDSP-related pieces to enable HDMI+I2S audio playback
support on Qualcomm QR2210 RB1 board. That is the only sound output
supported for now.

The audio playback is verified using the following commands:
amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 67ba508e92ba1f0ef3bcf8b248eae125de059869..4ab5d3379ed22b43675284af40eb7f9304fbe1ef 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -188,6 +188,53 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	sound {
+		compatible = "qcom,qrb2210-rb1-sndcard", "qcom,qrb2210-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB1-WSA8815-Speakers-DMIC0";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hdmi-i2s-dai-link {
+			link-name = "HDMI/I2S Playback";
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+	};
 };
 
 &cpu_pd0 {
@@ -323,6 +370,14 @@ &pm4125_vbus {
 	status = "okay";
 };
 
+/* SECONDARY I2S uses 1 I2S SD Line for audio on LT9611UXC HDMI Bridge */
+&q6afedai {
+	dai@18 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.47.3


