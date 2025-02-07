Return-Path: <linux-gpio+bounces-15586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AFA2CF89
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 22:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF55F3ADDCF
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4AF1C6FE7;
	Fri,  7 Feb 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F5QKiU3U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682851B040E
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 21:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963861; cv=none; b=cD96hbZwqlNZXoUM7pmp4Bk6KxI0DTLgUwoJPHFrvKMLBlzwuAPcwvo3/rrrnnz3ORtKbc8uKG2/QHGpx2BiYPOJmgi9TTmOX8FyGZiNd2b0aJN0Nud1oaU6GvATVqPQDUGfIUhn4FAG4v3caYdNMaNpc56VL8X6EMI8O4Fz/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963861; c=relaxed/simple;
	bh=+6oiqaaJJZBSTgJt7cr/nz+zlZDyPJcdPJJ1tqADoQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgZyRkfE+w8tkEf+guknFzMf1DKNy3eYkXeCxWGo3GZMBRXcRXHHxRIhwfi222GUYtZ6Z/4EXtt4FKfNWdlbwyO188k0opq+GIvzDBZ7cWcJPZXUx6jivsFSMC3BfsUS/T04YU23Woz1F7Ezeu1Ai49rIwrV7G3dVSzgzXr1pyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F5QKiU3U; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso6895012a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 13:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963858; x=1739568658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40fBozq6c0TkdqArUgdBEkwINdlhv9dUFzf9IoId2GU=;
        b=F5QKiU3UT7/cd5et8D7VUZK1rN0vOTTH+KnRPXmuHkvZ9e4tbJtxjgYGWHxiCqvhkD
         LhIux0zrLvLiDkfPO0t+Cl6ER8whQ4FPcOkV8d7j8kp+JLQEF5dI7vCCd5YuPvRMjy0Z
         HWHTs4QN99+vn9ESFYbUKv3cdH4OkgX6X3XtGCqAb9XTBFGvcg3TYubkPEic1OtRP5SD
         qbPXnxszwaRvbrOiYEOtUwUBqKgQM5/H3X0VC+85paDeAPg4LppLkB9A1RMqRwEyNm79
         8SF7Jb6jz+Qf61ONzmCjEs9OSQKXUjSGoMADOysnAF3+phhPU3TnLtw+Dfd5sud0Inip
         L7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963858; x=1739568658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40fBozq6c0TkdqArUgdBEkwINdlhv9dUFzf9IoId2GU=;
        b=IuS8aHQ/rCKqC4v+VS7bqHu7Jm/Gxi9SMvofktmmnphU5ABGvlQMrMmd70RQCb1bKc
         yZGKTA38Zt60N5YsBKPGWN2P85EQXPeeKOlq5SMB+SEcRkPyYrTT6NjAiUnpKa1msNTp
         HxpMiwHboG1RRKwngs3hLmcIBqAEp+ARAkrXu0BOWKexLWWheo4j+L8iePc5W+8oyBmo
         UxjwA2sWpwJRXLSMmsFHBGMSw99E4zgV9wCPB4oFaCiMQYwbUnr5ZE2Ys7xP2E1M6b4M
         tZKAZA9xUg6hmtx360dC558/r2Pv2BYtfXLzFujeVdHt+F6d3ekX7CBVVceShr4CtNR3
         WT4A==
X-Forwarded-Encrypted: i=1; AJvYcCXDAFemh09ywAYBfk28o4FMBsUznNMk0Pg2w0I+FIILJJDm8Tok3snXAO72ZXfbnuT0PJeZTN6RZH/r@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsWv8AWH9PYnnHhdaYr0yGpsLX5RVABmzfwbZ1/FuACl5RKFJ
	zJGEhdlWHjbDftMUm2zUvh0Ex8DkFwXKyj/yRtZahmsR8ZSAbmpOCu8LIT9FcCE=
X-Gm-Gg: ASbGncuqv5Ov9W5wCou31HAjm6BkG8KTrb65WLUqnZyIxU0KetVCBtMlBMkmSkusAgS
	Ii67kdPG1Kg6AJaA5PmaPNO4TxzW03OvXngQRXlzpSKM5XtHneFv+p42A7eO1NWudVFfenjgWM2
	m2NCKxrRh7utcMFDLpeAPWNyUAiRxnzeTwWS8vNi+qQi0f6pR6WUabvMQgVnjqntPhOtEv7igWA
	YB8fawJYyiS8Y9u2lra4SBALyiYUeAQZUq4IO0+tVCV+eBc3nAvCFHoRn5UGmzKGfY8ou+wb7lT
	J2AnyEdIiOCQ7jJHsdrw7QnzdRBJRTTVzilHREAXxEcsuCODaNX02OMkbAc=
X-Google-Smtp-Source: AGHT+IHdgQJ7DwynP053GuIeTr8ET1fqfbj4b4w2jAvtUK8o6z4D6NWZ0Lj9wjRmGi2DVjCyZAY3SQ==
X-Received: by 2002:a05:6402:278e:b0:5de:5a85:2f1f with SMTP id 4fb4d7f45d1cf-5de5a853144mr824186a12.7.1738963857569;
        Fri, 07 Feb 2025 13:30:57 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b80fa5sm3198428a12.34.2025.02.07.13.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:30:57 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 01/11] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Fri,  7 Feb 2025 22:31:41 +0100
Message-ID: <915c345d51f7743ea0eeaa814249fc366c0757e9.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the clock generator found in RP1 multi
function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..19af5eccb8cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 clock generator
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
+  VIDEO), and each PLL output can be programmed through dividers to generate
+  the clocks to drive the sub-peripherals embedded inside the chipset.
+
+  Link to datasheet:
+  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-clocks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      The available clocks are defined in
+      include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clocks@c040018000 {
+            compatible = "raspberrypi,rp1-clocks";
+            reg = <0xc0 0x40018000 0x0 0x10038>;
+            #clock-cells = <1>;
+            clocks = <&clk_rp1_xosc>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..266569c1edd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19748,6 +19748,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	include/dt-bindings/clock/rp1.h
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
new file mode 100644
index 000000000000..248efb895f35
--- /dev/null
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2021 Raspberry Pi Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+#define __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+
+#define RP1_PLL_SYS_CORE		0
+#define RP1_PLL_AUDIO_CORE		1
+#define RP1_PLL_VIDEO_CORE		2
+
+#define RP1_PLL_SYS			3
+#define RP1_PLL_AUDIO			4
+#define RP1_PLL_VIDEO			5
+
+#define RP1_PLL_SYS_PRI_PH		6
+#define RP1_PLL_SYS_SEC_PH		7
+#define RP1_PLL_AUDIO_PRI_PH		8
+
+#define RP1_PLL_SYS_SEC			9
+#define RP1_PLL_AUDIO_SEC		10
+#define RP1_PLL_VIDEO_SEC		11
+
+#define RP1_CLK_SYS			12
+#define RP1_CLK_SLOW_SYS		13
+#define RP1_CLK_DMA			14
+#define RP1_CLK_UART			15
+#define RP1_CLK_ETH			16
+#define RP1_CLK_PWM0			17
+#define RP1_CLK_PWM1			18
+#define RP1_CLK_AUDIO_IN		19
+#define RP1_CLK_AUDIO_OUT		20
+#define RP1_CLK_I2S			21
+#define RP1_CLK_MIPI0_CFG		22
+#define RP1_CLK_MIPI1_CFG		23
+#define RP1_CLK_PCIE_AUX		24
+#define RP1_CLK_USBH0_MICROFRAME	25
+#define RP1_CLK_USBH1_MICROFRAME	26
+#define RP1_CLK_USBH0_SUSPEND		27
+#define RP1_CLK_USBH1_SUSPEND		28
+#define RP1_CLK_ETH_TSU			29
+#define RP1_CLK_ADC			30
+#define RP1_CLK_SDIO_TIMER		31
+#define RP1_CLK_SDIO_ALT_SRC		32
+#define RP1_CLK_GP0			33
+#define RP1_CLK_GP1			34
+#define RP1_CLK_GP2			35
+#define RP1_CLK_GP3			36
+#define RP1_CLK_GP4			37
+#define RP1_CLK_GP5			38
+#define RP1_CLK_VEC			39
+#define RP1_CLK_DPI			40
+#define RP1_CLK_MIPI0_DPI		41
+#define RP1_CLK_MIPI1_DPI		42
+
+/* Extra PLL output channels - RP1B0 only */
+#define RP1_PLL_VIDEO_PRI_PH		43
+#define RP1_PLL_AUDIO_TERN		44
+
+#endif
-- 
2.35.3


