Return-Path: <linux-gpio+bounces-13388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605FE9E0056
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 054D41645F0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE442010EE;
	Mon,  2 Dec 2024 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LRdeVSCA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFBD1FDE32
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138348; cv=none; b=sUOitc1ljtCoF9XA1XoLJRXRSrD7d2wdAcgeXl4SoKcLLEAthDuVJFQN6cjE9wrsCwEDhmbYNHBXYr+yc/9xVT7gC9HdrHastGLmocXjyP14OJnPMD/T4h4XBPv69RQHTA6hbpEGhkSmV+abuv+G1W9vgIiadanQngUREXcw/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138348; c=relaxed/simple;
	bh=eLVVhfnyMIbO184s+FRnyqaburk4vHa6mrusOYiCVoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wihe9M3qE29e1QYGIqthEADTzYniHL7z9nnjgPlTaKu5AFCGod77TO+LBOjHqadwHB9lRJB4/yXZunRukkulezN9DaRQq2gXseypCddb8sa4Y4JMG7XbRGnXF5ld351i5GuYWoHEXmKERY9HzX9Y/mJe3Ajl8HozKielocml7yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LRdeVSCA; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso5232045a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138344; x=1733743144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oL+ODcQasvCBAzRTJ+DvIqFD3YhC5IBkuyemaByobY=;
        b=LRdeVSCAk/vPoxHN2kjE3J2yj/Qut07Gp61fgd1bPW1xEYsazb+lxZEeCMWJnttWJ3
         rKRqI0HcLdKt84Xj/lE63ozLClgRs1q7seeSpLD9dI/3yW1Mvde2HMiReFeWebH2w9S6
         Q/A+aZ2ucXcnIw/dW4ddlbXKPwdZE1H9LDpVEgGpuBWEtTd+w+8G+p8lsENyjZ3UMyfP
         0IT+PTPBbJe5UxGdjxl95uFmjqTjKShJcksVcvOK8RAcbd6TkrVtLEScFDISx/OkmWh8
         xx3g/r3iXWBTyTpdiirti6eHdwHUXpL1W6kFDsnx6JU9uWYPT16mUkOiLHG8WGStwOe6
         DmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138344; x=1733743144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oL+ODcQasvCBAzRTJ+DvIqFD3YhC5IBkuyemaByobY=;
        b=b7VtneBTFSGwiREJhBrKyYB5LWCdijIHEsPryTjfwqKRtsquWumzfjYkfF7D507VQI
         iF72hTK58ziQJrzjI0di/CyRdaQXhaZMDS5XLqeZa2xAoGeII3xjwqmx1iV3kS4haaLS
         pp120oi6QcbksBkuf6I+OaABQZwguFzg9BoMVoxHb6NseMt+ZRLGqjxX8E/F3WYUJIRC
         eCHwFYgmQZ9RxOv6E/9DzvileBXbP/r9D1vnWucCtKY294pJl++p1qAL5gWFGqAS4Pxe
         Bo+uJPLjVjLGTWFg0caMMIaR9NKu9r3Gpl+8MHq26Y8pBjR8IwGKHAYA/fS0mpJqDrra
         Qfaw==
X-Forwarded-Encrypted: i=1; AJvYcCXguAFRJ2Vh9kDmJBzNzVUFwp4JKhdiuA8yMH9WYIL/yPzCApj5JmyZwGbsWBe8NF5Ro9NGe2KEc0pT@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGrto2uaTE0Kpx5TaSWPg3uN/sKxBqtzmo8prIEuCapBC+SYR
	uyUJS8GZeEkT+ZTJuudswft3x5PP9LU0X+EofhwCXFWpF1JW5w9o9Fi74w3ErV0=
X-Gm-Gg: ASbGnctDddpTiFwUnaskzGMOcQvpKEzq/xFXHOyO/q+mH3QuSmtFZX7eT6yIEnW5zS4
	Xd8rK7KVvA7WVlKS9RDXi5OuJNuVLQ4g/kFTKuZbNx/gskU4Pr2HrLe1xgM9PmriILyoxdZzWPK
	AHXnGjvQuWZ3rJ0SWLsdoOFvIqDJQC3vXxyzPlJaWG26jtUnxx/vNPFzPRTc/Nw5fKU+A7LlUOQ
	zBLrDgpWfeS9AX+dx9sxI8+ccigEkjaOLBcyS7i75t5YSL8NGlWKOADQy0/UzreGUNTg8bp3MP4
	nxO6S56FaoIfIld3NFoW
X-Google-Smtp-Source: AGHT+IHtIcH1oLweHV8YznREJnuaQOPUm7+a4+L7iVE0THklniXlBnqwHW6mfiPwrEhcyxczO3bFdw==
X-Received: by 2002:a05:6402:3484:b0:5cf:5ff9:2a24 with SMTP id 4fb4d7f45d1cf-5d080c68f70mr23382319a12.32.1733138344280;
        Mon, 02 Dec 2024 03:19:04 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097d9f5fdsm4910998a12.15.2024.12.02.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:03 -0800 (PST)
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
Subject: [PATCH v5 01/10] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Mon,  2 Dec 2024 12:19:25 +0100
Message-ID: <ae94e78443099cb6c48528ac8b18daaaae41419a.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
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
---
 .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..b2670cf7403a
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
+  VIDEO), and each PLL output can be programmed though dividers to generate
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
index 1e930c7a58b1..8ced4ed32c00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19574,6 +19574,12 @@ S:	Maintained
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


