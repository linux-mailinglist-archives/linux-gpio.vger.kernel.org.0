Return-Path: <linux-gpio+bounces-29994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7ECE7E47
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F31CF3029D2F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 18:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6482F33D6CD;
	Mon, 29 Dec 2025 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="zriXdG88"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79933C1B0
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033641; cv=none; b=oQ1QxMc6jZ2/26wJT/w1WsaJu6UVA8516oXIDzo5Yt5PM3+MMOfEP4DGT2bWCtYtrwRrhNCqoSlAFCQBlPJaBgRftr7kmWGN6RPefT8SVMdCRnUVVwOhZj50rFv1+cCc38oRWy2IxUZgimmL4JxfFfxaUq3rOePemQo9OlYwfPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033641; c=relaxed/simple;
	bh=Z8OJ5bdxrmCLAokdEoL8lVJhhIUEVgrT5u6lQIEOB74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEHl74gTAMaNU/FwUiGMtFLjpqaHPuxAjazJ/QrDohixkoRPtRUsMRiPLCTvRZzhcsrfamW6igVDLYI1VW66mmnDUbkwNBIWd2GPSaYGDlb/P1hyXXSCJc2HXVG3OOuun+cKhfg8PAPB7IHb7cwDYvkq64DE1NMQKPZe22wHMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=zriXdG88; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47796a837c7so60064825e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033636; x=1767638436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2nPBwlmLC+wGQo+kGghgS2CarqCL9CUUT5DieeAoVE=;
        b=zriXdG88QoOcQsYbK/ainLz4uYpAXqPirBhe/Vii0V6qvwil0Wg9iMzV7JfKNMHnfY
         dOPQ5h0U9oqLLDhfnBPo76emrgl7VN5I7XiMirXA6WtFwqttaCA6IEXvOk/3+SrWHIir
         biWX58bGKQU8zUL+zDBVhPxJLVqCimzFdWc24GLdfOVOqPoVhRz77gvJT2+nEtRkwvRi
         NM7T4JaV/zNmzjfh8mIoWL9MDE1HOOdxcNXaraBE8+IxgI7dHfGszq1UEb+ewN/SwY15
         RS2g2496f/S6rgf9PdF2LVDU5DtEiJnA3MC93CkS8Q+JUn9j4Uxm6GAHKe3advLwW1zc
         bNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033636; x=1767638436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H2nPBwlmLC+wGQo+kGghgS2CarqCL9CUUT5DieeAoVE=;
        b=ldOHwcTOLc6LbTDTBvjG1zsGo2aZYDkRcVmH/FPGq5bpIwNPPfKEKFIn6Vsy/t6grN
         HZFiO5oir9xM4ANrnaeMf4kcBTgiZ8oZGYx3dj5yksJOfJSXLXSqufQnWD79bJD/jLEa
         0VD7zQ3TnRUqXytv6kpjolg1LSSa5mUB48Yju4+h/1i6A/9PuNuBhHTAe1q/HEIrpVtc
         iURHqY0dKBqvdI416vYQ+1dnhC0ib3Q/dnpla+yFqTL2VQH3B5Cd1AyVkXgXMfkCh14/
         6BOG6Kwu6pMuTM86f4beVMqWZ1KyjGUGXczE1imEUQZPq27GBeVdPDVFnGVTqSChDWUO
         SvXA==
X-Forwarded-Encrypted: i=1; AJvYcCUro8kYq6FQ+C9BJp+w7fOyA17TFoqOhpPzwYju82WtvYZ1+5bM1UwGeCTxi4Riop8A5yVbiKNBnuUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCNh+wOa1+t70tdxiORENKy3BjEKCjD4tzd4t65HnF4FL3KXe
	8/Fd6Ou4BJzgZCrVdONBQjtyHelJOHmNQTodjdJjSCeOQj2F1Q9VrSNYTaivL/xCi1Y=
X-Gm-Gg: AY/fxX71Fz/kWNVs18NTCjfptHsQtwGUbqj3UfVoG+F4PJgI67zkvYSb7wDUIrDRhtJ
	Qz+cy76JTgAm3dWt8aPJz4scJWMfnAx2z1KAtiLDsuokYyd/9PwawnACw1WC9boaQthg53AM4Bu
	EkjNsWfpsheleRhsPRQx7uyot49/cOI3LGRWkXB3PIY875eaTva3QFN0XJxbc8E9YSv7zLuTetA
	V5V1raXWLoaCXeCUrPVc2NuclDoWNhZ5zdCPGuWi+p1iPbOQ34oBhQ4IHoPu+ipCE9vwEIlFBuY
	7ckNdm09/oqJyAXrrkAVPueETw6mSzJOwX+quR/ucXkxlFA7c8tSEmYVsGoLTUB7w2sJGNRCKQz
	o+An9ghkLU35eBFA7Xictm3a1KKFC5wdoC02kMQ2oOICACFJ7iWSZ68LkBAY98LO6zN0g1KWYlV
	xl0WfiULqSmmNCmMxLhuXAyHDFITymHqfDOQzwrX1OvPZyA7XenSsIrZhE4fjGEUmqUUuCsLEMl
	tYm7e6pBP1Wv/pSFA0t0e1DHCqdd4u5pECFNXc=
X-Google-Smtp-Source: AGHT+IGJqflA/fWcbFGlt7I8QSG/W3Ym/AA8gFbH72KL6IAeQS+P/elQOb7uOHAEgNrEusVQwY5q5w==
X-Received: by 2002:a05:600c:3b87:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47d1953b7b0mr395881215e9.8.1767033636235;
        Mon, 29 Dec 2025 10:40:36 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:35 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 12/15] arm64: dts: microchip: add LAN969x clock header file
Date: Mon, 29 Dec 2025 19:37:53 +0100
Message-ID: <20251229184004.571837-13-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses hardware clock indexes, so document theses in a header to make
them humanly readable.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v4:
* Move clock indexes from dt-bindings to a DTS header

Changes in v2:
* Rename file to microchip,lan9691.h

 arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h

diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/boot/dts/microchip/clk-lan9691.h
new file mode 100644
index 000000000000..f0006a603747
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DTS_CLK_LAN9691_H
+#define _DTS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0


