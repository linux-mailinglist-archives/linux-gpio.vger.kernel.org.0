Return-Path: <linux-gpio+bounces-22158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FAAE7CA8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7591C24693
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EF32D1F72;
	Wed, 25 Jun 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4D5wxwNW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E402BEFEA
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843104; cv=none; b=YK4dAvssnCsfy2JCW3oEEX0a7JNPWmOBQ5yZ1GnCR/JH4ghMsu0UzuOLLgRG7WSaMZktB+3X5E/olPbKRt+uVjcF1Lv8/Z/jhpt1pXRqjLqm++LmM9fhki+XGeoNb+vD3pqbXB/WQ6KrKgxUSCQi360CnBYHRFU2XKaoNQm/3CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843104; c=relaxed/simple;
	bh=5o4DwhEuzb0pZeAz4ygBSx9BKxTK6B7CFL6Pbp9UvHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUdBKd/8n8JrSos4u0EP2M4z5CHtvYFaVLgUY8j2vjXmRlfK4p5VDpX3SL/cPcd7KlYDqC1QJxB/3gglVS8gd+lVLzEVpY6S/fV0bBpEvTr6z9i7s3If9OaqWaz4+DTnI4i3MqlIVBaNHLNNlgLb3MR4mYJFLXcLMUfGVHXeuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4D5wxwNW; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso11565397a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843100; x=1751447900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sxsJ8fLdh34TSstwWUME6Yys/TR6ScHGZgu8ZZNgAU=;
        b=4D5wxwNWufVkiHSwx52xvtXpTC/nk0K+UeWH9Z1DRIQDaM3oFUCDUjARVoyxgqBlVS
         JOvlIdEyK3Z+xOAqe22J2kTQZt5cwuBohSlybnoki8c3ui0HOLLlNMt3rE7pfXaMdB3T
         ly7KVTKorqcl/yz7lrmS+ce9/NT1pOiA5/DmFxkOt84zBE9uA1RcvYCVeYW3IWpFglpW
         7vNwp73xSwwTYZiQX33TGasnPSW8xHvo3Xts6nxB9eJhdSmWT5HOI7Q8pwlN/XdbDwI9
         kaRYRdDwjAGrwO5rUqvtC4zHICU/jYRuSW5dqjfPBOq977ZGKrYGT8W5zYrQjvHUCUwX
         MNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843100; x=1751447900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sxsJ8fLdh34TSstwWUME6Yys/TR6ScHGZgu8ZZNgAU=;
        b=CNeqb37BSlXpw8C3TwZLXk3crrchV+V/cgMVkwbPpiCRpHEBKIxcAYlxoCq9MeS0d5
         t7CW50uXi6hzghBCPPzQXIWk1B+JvTmi5/HRxcIlSDcKdP//OHDnme4GhDmxIFqNT3Kl
         UIWO6k/BmBB4SXXi/hRyeeqyYP7FePLBIQDOSVw1nwcQkxazCBlcuwU8jkg6XeZDYSe/
         M5OV1sdeclQhhXIFBzDJoaMUV8N5Mw6R5tmI8qaJPl70L4p5DWlupS8G5sXB9Pv1hW18
         iNXqRu+Jc/LioCBl4FqgHfITEVJKtqSyCUmpmOm5i7nmD/IlK7/iqH/9HEmoiEIvUL0T
         PEYw==
X-Forwarded-Encrypted: i=1; AJvYcCURUvZ+5MHdm/UqJxiOtIhsnxZSGmT8Q6VafTdpko7XGsFMnm+rl3ULJmkB25zmnO6gjSREaVKWXUVq@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfovAXA4+edAdQJti8adX2zp7Up30cHKIFcbxScRronoTy0Lg
	S1nUR1wEpjkTGsJoordimoh1Rcis/uZjRDfe72hrVzzbAZKN1UTJb+gbNcgVt42QWaU=
X-Gm-Gg: ASbGncv8l06hSBa58cHc0jcTi6fl2ZwRN8x1irYDq/hX14Q8r8wlO+8VIV6474KdLgP
	nnlXkhjFaTnf5TMjiAex1LKJSxL82aH9+r9FYCxBOldQM4J0chToJKl++T6PGcXyOACG00UjS7l
	MKq4Y8ose/1v8NQKDPqzcriEerYSaxzPxcTFl/4Gg+raaoP4X9qSXz1afJSZkbSWHIkEDpyyIhf
	A19UgC5odhajqF4Th2edi9d7Yn2zmhUyFSv8BUOspo0GcLLgcF0H2TgszoCqIDEZ2KVGG5naP1A
	RM2QI01ytyWurirQzaSurGyZV7n/VKxeN1D3BVCEDTBNogEG3J41YbccEH0wtvJ64Mg46WAjbMt
	6OE3mFveQxXdQ6u1r422hua+cH0sZWJNC
X-Google-Smtp-Source: AGHT+IEP66kc+zZDdWg7Icad9MqZ3w7YASShODOYdGAZ2tanUn2oS/uFbju3FQ9gBmHRuPLclDgo0A==
X-Received: by 2002:a17:907:7ba2:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-ae0be8601a5mr252590566b.16.1750843099212;
        Wed, 25 Jun 2025 02:18:19 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:05 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: Add PMIV0104 PMIC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1937;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5o4DwhEuzb0pZeAz4ygBSx9BKxTK6B7CFL6Pbp9UvHM=;
 b=8RGv708E31vt2d2JuAXjtINii0ZlMIcFpJA4UhzxKcT4R83TlDqC2QyLDV+ZFI3Qpsv66fo/J
 /ndG8Yo/44SAolhMeh6g32cHxm0sRZ9Q3TA6mqQS24au9n8K9zKJpzW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with SM7635 devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..04d929db76f409c49c47ef0147a3de568006973a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmiv0104-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmiv0104_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmic@PMIV0104_SID {
+		compatible = "qcom,pmiv0104", "qcom,spmi-pmic";
+		reg = <PMIV0104_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmiv0104_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMIV0104_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmiv0104_gpios: gpio@8800 {
+			compatible = "qcom,pmiv0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmiv0104_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmiv0104_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pmiv0104-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.50.0


