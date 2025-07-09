Return-Path: <linux-gpio+bounces-22997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F790AFE82A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCE911C46D45
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CFB2DCF6E;
	Wed,  9 Jul 2025 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u+xMDE7L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9872DA740
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061614; cv=none; b=lynVA6tnS88xUf0ucB1PcDIV84y+R3Q1AwoTjLzcC9jvIR9/zR3Bwulnq8LDHTwzYlt6oGiGEdYvre/f732Y7y6gwTbAhTpq8oFLVw/mclfMXXbFHAyafsxKmx2O2wrjkbM1vNMJ4WtsuoWrgBvEVt0mQ9IDtylgRvC63Y4vizk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061614; c=relaxed/simple;
	bh=hC4XiUyCXvfKUfUdujggOXgHdLNV4lf1H8qLCscQ3Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1o8JcPnU8sGnVFCp8HWVau4iGnsYeg1UjlPHoIefpd00d/a1VG6K9Z4+yJQaUIdHD188v6w/0wudyJ3RrGmaUIlgQuBirgslkfgZccDyU+hR59JxzdqNvs/FqeZN22hUAqIjxCvVFxUKDCOwmfANp0mWgVdP8LP0YhA84pBUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u+xMDE7L; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3a604b43bso862231966b.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061609; x=1752666409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bpa1qe4qe1U2tW+ccEjSHAObelYY5h6LZZSGvF+pGw=;
        b=u+xMDE7L0X3yoC4TxKZQvTud3oIy5LyXnoSeMEHz+v+9PjCqZnmkMHCSi4NTmBXxbU
         6Z3GE2APvlyDmqvoIzH8ohA/qOxz1FBCAJz7yN637L4WAnSUImeL87RqZ0GnuX2mdT6v
         AhPov5DkFGPPHXsQCRWiRajKyz0W+x7ZuXSCZUMSBIMvUaGUScJ6CG9xToal7gE8+k9p
         5h+oAm72VIWgQnwS31O+AS1ezIYUudUNO03QVY2vROv4tyaPpHIKxUcLl3Q3FML6BFdY
         LVlh0Q5za5gdLYYTXY5uyc5ZqFpmF65ma+J70yQi8yW2qlOx4gHC24JySM+UTeQGNcSr
         8ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061609; x=1752666409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bpa1qe4qe1U2tW+ccEjSHAObelYY5h6LZZSGvF+pGw=;
        b=PzG2gdDIbAnWDhUG/GhAX4WRtVGcHFy2wXr+PqNwMPofipdi7PCg/hnL5Rd8ZfTZRm
         3zzOP9BwWir3Zxf6TnyyRcMKna9X+jQytjiDCxlH7E08wT/365rNRhKRp2DQQhHtMl+l
         MdeoXsayJnHkQ5pfqBdSw/0B46ThCjzGdkCBk/D8n7hc3LNkm6qG1dfpzNH3W+xpdDBK
         lWqQLipWpBwiJ3OVXRkDFYEuCQwtm12Nr/axIQjS4yqUyE/3f3qpzSq1pcuH69XF8hVB
         C1xoO6oBiqWIA78XrCEXMR4ibzTIipI22Yw4bH7drTRm5i6BSeDSYDggLghMwMJE+h3q
         7i9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJCoVjEADPJuQxwhbhqn+BEe2CCk4bJ6RgkczrqMQ/csdbBWx+csB8UAT/73CTmevW6kTrT0R4v55f@vger.kernel.org
X-Gm-Message-State: AOJu0Yys2l+xxIlFb74YpUsxTGDLecvDJUZi8H38n1ytwS2TN5dTA+Xq
	QxFafQmBbwd/q94m8H0EtUiga6bYxuevtsbU5dW8TZ5QR10wW3guFPzBIRw1DHDQQrc=
X-Gm-Gg: ASbGnctAFBqdSdLBZUFxkvZoC/OUJFBd+F5TQuwm56ClBYv3s5KYc6Vr7IBs4FvS1oU
	X/p60cNm8l+AKz/mtjqwLgocF30YUPGnlelgzvJ7n0HpgE6PO0fBJ/8hMy8NTsVSTsWzuYdoKlQ
	DVoNk6uAAotngGskWjpE73isZZfP5UAC/5ZuADLzPSsL8V+aFIPbY0VNjANl0xVQoE+9hVWj6Xk
	MH16EZoACdcfGL3E1p8o3+XgYTmV14+IgKdS5bWLM8G7yPd+dIgASaklopgamUL0PNp3DDvTqnQ
	6R0S4wFSXf04mj3fRSni3HP9IKZvvyv1lD1YhO23ITZgTHA/HHywkcCvm8PoeChFBGl4i2PVwQ+
	pimdCB33qWUZtvnsQEBrVh2p3LnOAhy08
X-Google-Smtp-Source: AGHT+IEa3VxKGGtmpJqSqUpaGE5jivuUSxb7qkbnXKu41EclZPptdV4vVLyJP7ntg8X8h5wcm0ceXQ==
X-Received: by 2002:a17:907:c283:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae6cf5c0132mr248175366b.16.1752061609399;
        Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:36 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: Add PM7550 PMIC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=2089;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=hC4XiUyCXvfKUfUdujggOXgHdLNV4lf1H8qLCscQ3Zg=;
 b=h+IOj2hBQ3I6W+a+vQJaatA2VbxLX/L6dXEb4kRe5+aHbi3nsUWGLE9ZKVDSnGLxp5qWzVFcG
 c3PpiaHPXufAZcvursiA5Rs+k8oJGNcZ1iri5Kab6VB9Dbrbl1zMCRE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with Milos SoC-based devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7550.dtsi | 67 ++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550.dtsi b/arch/arm64/boot/dts/qcom/pm7550.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b886c2397fe735edc92f2c3f307eb4d206961f11
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550.dtsi
@@ -0,0 +1,67 @@
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
+		pm7550_thermal: pm7550-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
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
+	pm7550: pmic@1 {
+		compatible = "qcom,pm7550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550_gpios: gpio@8800 {
+			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550_flash: led-controller@ee00 {
+			compatible = "qcom,pm7550-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.50.0


