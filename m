Return-Path: <linux-gpio+bounces-27519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D4C00B9A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 138784E5A49
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECF230E0CE;
	Thu, 23 Oct 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="JyzJJslw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B1E30DEAD
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218960; cv=none; b=tUrvFz/WxW+mOxLp+D1XEExhoXKaearStqOvqoWSFjbbUvz6/O6fl/eoODGIpD146SwutJQXOBRRJrx69HenyYV5PKHJkv62p8lNlBpzplCKP/7JLfYTsk3VFdo6RE93xs+Uch5ff3NIAS3GrGSxbiHMsu4FRhHPBBRqiCEzsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218960; c=relaxed/simple;
	bh=x8UThgThW8sgU+bTtRpNm6v4HS71/1MoGY1+mjSdEZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvuTCNiGVovFYGtYyMD1LstItMwxF6Q6/Gb6Kkz/AvkFo/rLeMqisk7dPXCs1AX7CjBmVkdLPlbs2GDPVWKtmXhLu9MkB0OjdnRaphQRELHeR/ZFLFsyLWnTwanafd23nCmnHW/CEoD1m1OkATNmizkqlopB8K+B2/1izkH7Ils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=JyzJJslw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3ee18913c0so152630366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761218956; x=1761823756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VcPDDfMA6ig8zCBApRX9ed3uOSim2Fm642DnrpLTL8=;
        b=JyzJJslw+1ZNKt2ExU5pTZPdI2BWRyNk0FmNliGwXcQbs6MGFWly/WbcwaMCucE11l
         mQ86woddhnaUHUDo6Iq+QqaRGf1SrtaMDg5St+v8K9HnACA2rO/sQ3DVsXm7YQ4yTUWt
         TXaJcnzfG/NmMS3rhWWj7xOV54ja9X0jmfPZywEQTLiEERSodj6dKFwPfeWb+c8PLuPv
         oaypWf+EnKMybZee/xolU2g4Y3fA0iqiBs2Txii5oqHeJD8ToN7gJPCKfk35qruxsUsz
         NfJ3mEeE7Fmz+e9UjYVj8A3b/nYcdBjaUbutCMnlDPYmj39cwWVYie7MTaoLX38BUifp
         lwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218956; x=1761823756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VcPDDfMA6ig8zCBApRX9ed3uOSim2Fm642DnrpLTL8=;
        b=OyoIb4BAIoGB5N/28Aepv+nLULsvNpelaDGsaPuM2En73aqU3ff0u9YRYxc4YlVdyd
         1SFpkd1qineLpZrVEq1x11TJtp9qjpXZZpCw1SgxWwEar7nAzYoS0DFkx3kRMgVKeTDp
         ISuxhy6TkAZwxhcIBsawa51tot6ttCB1Lbw4UeKW/ZFSNsgkPLi72wxEKo2MCAX8AEHe
         OH+RDhRuzbSFLuJF0Au7n04N22SlxR3pEDr1ksy4faZS7MQCLb8i6rdQ031Uwn86ucmY
         Tr3+swWmrYikEjJEAtiLy0HurfbrBOrRS+B8SkrwoePXxVh1qAW1v8cDsFKJ/nUaLCsP
         zyEw==
X-Forwarded-Encrypted: i=1; AJvYcCU9aT2tdQOWiPNsPTDG3e4J4UGhSg2V+jIh3CXMSVsCotYsRu6MCl09hqIwCuc6s9Htf9tKoiSsBhJA@vger.kernel.org
X-Gm-Message-State: AOJu0Yybgp4c5ZzvQVgiokrt2H/PqOMGGpWG/TCqZoxpcAKGiNH9aLhZ
	trAUcJljfCLnRU+phfwmR2rPHJZwjlDNIA9heKRJrKAu6wPFIeBBCgAwVZK+sx9tOu4=
X-Gm-Gg: ASbGncsA7MEC45lfJSsoTiVOTbKs/+7ZJ+wu254zpMb3IPw/ZmYTLpaUizNFbxTWCnL
	zeB5eYIp4OmLeojb2PnRLbf5KnU6lu0XBdgrr9a8tuBwe2/n0YszAL/PxOsvNfMfKSj/LVsmMM4
	qGm1PSpndtVtRIz6qGvxGcoeUaSZNTntQrw+nMfc3BBDIACOtZsPAFtHfgGdz4H7Dk2WqJpnpRs
	wbRfBpXGNe2f16+ODkJ6JrlPWw1Xj8A1RULGzyEr92c1bpKlml/mye06TUGEg5bVbsnCFaN1Xh0
	WhNIq+jLKMA4nXfVylOYoLAcT8EI6ut0Z998kN7jrv/IRW3KsqP5bQg5Rv1CtU+URfMOTPtsyWB
	HUs4jJWtGX5DffNXQ1dfpbCMKje3KQ5A1Lz9b4voEeRTmE7VwauQbUYWCJt4yMxWeA8IlF37n7R
	1JvRg0gdlEd7ZIW13YKib3lzb4ETBle6YAs2Qawi6C8+u9CO3ScW/Qho6w
X-Google-Smtp-Source: AGHT+IGx1IekfgAK1nsvkYIbewkd7/Kp9LHUEp2UQobF//6DrQaUqt2l8HG+IxLZVRXH/rfq8SBPxQ==
X-Received: by 2002:a17:907:3daa:b0:b50:d6a7:d6b2 with SMTP id a640c23a62f3a-b647443b9e9mr3287099266b.32.1761218956516;
        Thu, 23 Oct 2025 04:29:16 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb328esm1439098a12.5.2025.10.23.04.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:29:02 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: Add PMIV0104 PMIC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251023-sm7635-pmiv0104-v3-2-27f1c417376d@fairphone.com>
References: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
In-Reply-To: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761218951; l=2204;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=x8UThgThW8sgU+bTtRpNm6v4HS71/1MoGY1+mjSdEZc=;
 b=w6EEnHkhKTsqJFMyAkXpi9sGxV4XUKIWR9ijRcHthZK0m2PNY1je19oM6FvpfkHthQ15P+ZXg
 xiGwrDZfbmVCtvl3U6DaVeuqEeQJF0qj7BqGR0Cfgv8YkioiGcUqQqU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. on devices with the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
new file mode 100644
index 000000000000..85ee8911d93e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
@@ -0,0 +1,73 @@
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
+
+				trip2 {
+					/*
+					 * Current Linux driver currently only supports up to
+					 * 125°C, should be updated to 145°C once available.
+					 */
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
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
2.51.1


