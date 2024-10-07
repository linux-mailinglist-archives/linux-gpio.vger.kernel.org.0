Return-Path: <linux-gpio+bounces-10960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85172992C26
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09CD71F23526
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B631D5CF2;
	Mon,  7 Oct 2024 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eXWgJ8Wu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF41D6193
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304806; cv=none; b=M/FNF6zpQkJmg4pIa+JrSiBFVLBJFKD+7iF+Fa+1xWxflh8oVQymN7qyb+IN87FnDEgUwWyMFM0OA2hl9Fw2ujHUC8ULofcsZ54LmeuAq6FyUYQVE92XmqEtWSnJuCfDE8cfDfvjUCxj5P3CTPIv5d1UDNFHc1Z9vzPX+R2AhA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304806; c=relaxed/simple;
	bh=ZEPzPLsXrcChWumoZ7SBiHMsSOTvRa3Wuhep1haX83c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7lU3ZI01kDSUomSpUpmQV9JFaPckmRLlaP9QaLrV8bpheYD6h1gNWffyJHugbNkWEeKC1NAB/CdZnJ3DpI2SzlIbLn0zsHUFIc5yuHQXNhXeEcYpB3yNwEm4Ni0xz3SfItcECtBhvfSZKN7SNfqc2zYjlAl4UHv3mqeGfCCZIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eXWgJ8Wu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c882864d3aso4959100a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 05:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728304801; x=1728909601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7GLnpdk3kpJmE9r4o2PWhEgiezo/nwd6A/PFeKxkMs=;
        b=eXWgJ8Wu4/VpFTXBJ1CM9XxLbRpV1g7E3GjjpLf1vNQX6h1z+scbMxa4e3SaI2Lg8I
         Qi6xRh+LkS7KFLwDkK9zmsMtiXoHOQVgksIVcyqy6CTAxorHksjD7euzhk5QKIPSJbQ3
         jCSDy/RcRl4wQoQiu3X+FNyXBKIIy/aaEjZpF00z0Tka9AXCAQwTsLJru9PTNyIxta08
         0/Xo/IHJvZ0Gf4UEsoaKRfLuS+EPyF9+5eix51dSJxwtGJwZHIdINNHScQF3gWqgkyWK
         H46AQdeyLjgyp/JSOaR3Z42aZTPadmQVMLdp6GDJxD2QoQR1QAWkCpqr9Nystpnl6bGG
         K0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728304801; x=1728909601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7GLnpdk3kpJmE9r4o2PWhEgiezo/nwd6A/PFeKxkMs=;
        b=VBmE3Bhf+raD1ozoerX8Bkl7YvE4jVIV85+KU3cBBeWACoKOmVL5ILps84DHA2xGnf
         tXmOAmn1Y3Lsjx4I0vK6ZoInzwh0nO9z4jeyr4cVX+/+vXCpTpxGbEdQSbOlVDi/efGF
         bQdrXlZ3dRACengQwqyEcGJ9R4PC38cu66uzuX1gaHOwrLwIoMVmH3jv2ytEaZsmeRDI
         2irK+LZsqvuOaW/PWhiPqeCgh5msWD4KZjJUm1z8P9b8X35JBYOXv3NcMt9SbDXJl5ML
         Mmz7r9LjWSijw7JBI5am02Zj9AOpxpvSjYxUFjcqHNf2gNO518BweUkWJjlFZAxfVsS8
         1YHg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ShhDMGxMQJw1ajTC2wHMsgRv/tFVvuxUsYICekBby5uaY3D9k3RLL5c/7dA20yUe7gp3r+0LtEFg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/0VRU1s8MYwbQny6hn3SxZLzI7f1iTPqe7u1tEyKk4C4TCnF
	p5BRbGO0O7Ab0TvP0sw1WPXlCbx2K//NXAzf5esGdkPt2jFaejE3ED90xXTjfPM=
X-Google-Smtp-Source: AGHT+IFy0cMxJsF82yiNQcbJa9lSxuSDCs6OgxcKY5EqxFvjMZSr8FG4F668oRvYtnMpyYp5B4Dw5w==
X-Received: by 2002:a17:907:6d17:b0:a8d:2d2e:90e6 with SMTP id a640c23a62f3a-a991c00fb55mr1305844266b.60.1728304800909;
        Mon, 07 Oct 2024 05:40:00 -0700 (PDT)
Received: from localhost (host-87-21-212-62.retail.telecomitalia.it. [87.21.212.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9933db9c5bsm360605066b.162.2024.10.07.05.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:40:00 -0700 (PDT)
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
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
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
Subject: [PATCH v2 13/14] arm64: dts: Add DTS overlay for RP1 gpio line names
Date: Mon,  7 Oct 2024 14:39:56 +0200
Message-ID: <a29f2e534c2ea658fc7c1e61120476f4bd3c0585.1728300190.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1728300189.git.andrea.porta@suse.com>
References: <cover.1728300189.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This DT overlay contains the gpio-line-names property for
RaspberryPi 5.

It's intended to be loaded from userspace leveraging the RP1
driver interface through configfs, as follows:

cat rpi-rp1-gpios-5-b.dtbo > /sys/kernel/config/rp1-cfg/gpio_set_names

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS                                   |  1 +
 arch/arm64/boot/dts/broadcom/Makefile         |  3 +-
 .../boot/dts/broadcom/rpi-rp1-gpios-5-b.dtso  | 62 +++++++++++++++++++
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rpi-rp1-gpios-5-b.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index 032678fb2470..2b61d9a84dae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	arch/arm64/boot/dts/broadcom/rp1.dtso
+F:	arch/arm64/boot/dts/broadcom/rpi-rp1-gpios-5-b.dtso
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 92565e9781ad..d384937b0536 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -11,7 +11,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rpi-rp1-gpios-5-b.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rpi-rp1-gpios-5-b.dtso b/arch/arm64/boot/dts/broadcom/rpi-rp1-gpios-5-b.dtso
new file mode 100644
index 000000000000..76a243a71644
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rpi-rp1-gpios-5-b.dtso
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&rp1_gpio {
+	gpio-line-names =
+		"ID_SDA", // GPIO0
+		"ID_SCL", // GPIO1
+		"GPIO2", // GPIO2
+		"GPIO3", // GPIO3
+		"GPIO4", // GPIO4
+		"GPIO5", // GPIO5
+		"GPIO6", // GPIO6
+		"GPIO7", // GPIO7
+		"GPIO8", // GPIO8
+		"GPIO9", // GPIO9
+		"GPIO10", // GPIO10
+		"GPIO11", // GPIO11
+		"GPIO12", // GPIO12
+		"GPIO13", // GPIO13
+		"GPIO14", // GPIO14
+		"GPIO15", // GPIO15
+		"GPIO16", // GPIO16
+		"GPIO17", // GPIO17
+		"GPIO18", // GPIO18
+		"GPIO19", // GPIO19
+		"GPIO20", // GPIO20
+		"GPIO21", // GPIO21
+		"GPIO22", // GPIO22
+		"GPIO23", // GPIO23
+		"GPIO24", // GPIO24
+		"GPIO25", // GPIO25
+		"GPIO26", // GPIO26
+		"GPIO27", // GPIO27
+		"PCIE_RP1_WAKE", // GPIO28
+		"FAN_TACH", // GPIO29
+		"HOST_SDA", // GPIO30
+		"HOST_SCL", // GPIO31
+		"ETH_RST_N", // GPIO32
+		"", // GPIO33
+		"CD0_IO0_MICCLK", // GPIO34
+		"CD0_IO0_MICDAT0", // GPIO35
+		"RP1_PCIE_CLKREQ_N", // GPIO36
+		"", // GPIO37
+		"CD0_SDA", // GPIO38
+		"CD0_SCL", // GPIO39
+		"CD1_SDA", // GPIO40
+		"CD1_SCL", // GPIO41
+		"USB_VBUS_EN", // GPIO42
+		"USB_OC_N", // GPIO43
+		"RP1_STAT_LED", // GPIO44
+		"FAN_PWM", // GPIO45
+		"CD1_IO0_MICCLK", // GPIO46
+		"2712_WAKE", // GPIO47
+		"CD1_IO1_MICDAT1", // GPIO48
+		"EN_MAX_USB_CUR", // GPIO49
+		"", // GPIO50
+		"", // GPIO51
+		"", // GPIO52
+		""; // GPIO53
+};
-- 
2.35.3


