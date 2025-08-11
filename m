Return-Path: <linux-gpio+bounces-24204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4AB20D69
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F9F27A845C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725E82E11A6;
	Mon, 11 Aug 2025 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N4MZSGjr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1472E06EA
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925495; cv=none; b=DMFczlnEYChhsZDj256Yxyoke/AAHLyMVXWsr1OvlBUgFsIWtl1AStLBhjrMzOHDzhA7a2kUaZo8cUfj/wAzI9VsxAmtKx4hNbTeYMpogCpQvC7kN4Tpqe0qdPfTl/W36g0tjfaHIpp4GPzlZc9UgO+hoHZFMqTt6EMdgPQPOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925495; c=relaxed/simple;
	bh=CtH8XQtPGXolbBZdVmqnACGN9ZTA/rgd8EyPJEQl8lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kohhohEwVvjmlK26kBjgdMQiTB9n+YeWIZlGUjf4bd5RFnDlmWFp/WerriYN9dd55X23w+HjcgAwW/MoSR+VTG+dTlPrizqeQ++ZGB//Z/bdrfq8jRzCzcEBw7S4MGQ3OHKVdIygSiK4VJwEsqatxjG1YrtOqZBo/eAgolzEP5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N4MZSGjr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af93150f7c2so685411066b.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925491; x=1755530291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fng68D5ON4MtHXF/Xvnv7dtbGS53hmAqmZqCopjU5kA=;
        b=N4MZSGjrTHK1RyGCBMZEtLB+TkRTLLTvEuDZ75qEdazrdweMnCKR8CPiv8esZvZjmk
         4zP7hbEluUgfCcEjSg6lZoxaN8ZQxfaNKxMDQgGXw0pdDwxe3q1BGlDwNkx17JHQ3WAy
         6pm7gxigwRaDt0JAI3gcndlpQrQ7qvo64D4bHylJcFlncG5lXCQtChA2/BcDu1TqMbpt
         QqzDikoA3aBMFUIx9Wk5HKv6J0U+4/+LUZGiZAPuoZxbivzavar7MQZwQDW/pH0cqfK0
         OtJciwIOQC/mq8gPqK7x8AaIRhiEkV2AiNSWzhjmD4jzayYVaOUrysGHN6aUN8n9omGb
         i9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925491; x=1755530291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fng68D5ON4MtHXF/Xvnv7dtbGS53hmAqmZqCopjU5kA=;
        b=JCOAsgtu996Wl3aCfwqgS7Z/fRKPjca4/+EfkBsVICCTZKlXN/flgY4dppbYI0nh1a
         CmEbibymt+BfU6sSmh8BC5GO380PDF8oQS3nEMvxvtKc/ToXd6YMWjTm5Csge2bXKgds
         +KjmNXoIRWfvFuVIJWzjVSNmkOLxtZ4dzkcInS+Vze0nHnLj5/OAyHFzLFHwCkWrjBqD
         /DFnAupH4qSKxLgLkvImRT6bMSk20ejw+X1pXjmP/sn8GFx9lqifXafrgzYElXqgz0Oi
         tdHU7HFSt2gZrLjeK2xZZOmkfdBzfjalr7j95klS6/c/GGWAVSuxb/VcTEgidhCMTM+I
         ikcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8eUd1CXrV7T85onJerJk9fG7f4SDQAyM73cW96dqRGjzwJ3GEfDjW6cVL4+LBIFfnTC62VymlwOE8@vger.kernel.org
X-Gm-Message-State: AOJu0YycZO+62vkDUBkZrDnU0yTPm1Mzp0VocD4KKwLRiJGNEw30juHk
	rckl3HtJPV/MIzaWHHWJAh3bRpcDFU6jECSDXWFGJl7QrZrxWqGqqAqQCo59BB+aBI8=
X-Gm-Gg: ASbGncsd/nPgKcQsu/A2SnVzpPZ5/Dx1wO/3VgbfS7u8lRlP5ukIq+sm9G2k3tIsrm6
	Rq7SxJrHVpAfAtY2AKFm1Z3mOe+IfZgDODs3U+ThxurLLDZj1pUkUwcH9degksZKgjibQJAojY+
	lEz0d083QHwmDQTISkWESdVmAhsAlzbEpQofsvsXD5XaP6hFbTF19n9x/uH6uXh1y/i7y4DxLQ5
	FsqF7ZdqfeGMszVIOSTLlx6JjogWhFnaWYt4wP4smq74vTze/spNJNw9QtMP+LtJky1ThmvLO3n
	G2h5n4LFPWe8rwo8z4ehtb2jujYGPSBipsxcl4s3vmYwSUmVfVsbz/ZmDKd8zKH6CMFTWWTJezH
	ZADeAm6hqHVlBCGvRsj1jY/2pWZMkHG5sKWrxzpHwh1+8mFOvr7uTuaTvNp7gwWAQuQ==
X-Google-Smtp-Source: AGHT+IH258sr5DlmoIs2dXrt8URBUrKXF/WgpLPedlCY2bJF2kB5AZhyPhcJHZNSotah9gafIa5oGA==
X-Received: by 2002:a17:906:3687:b0:afa:97:55e9 with SMTP id a640c23a62f3a-afa00975734mr328441966b.36.1754925491486;
        Mon, 11 Aug 2025 08:18:11 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21ac0asm2033507666b.99.2025.08.11.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 6/6] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Mon, 11 Aug 2025 17:19:50 +0200
Message-ID: <c61b830b6f8f691aec9607b4707d3146bbd2ee84.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Ivan T. Ivanov" <iivanov@suse.de>

On RPi5 device Bluetooth chips is connected to UARTA
port. Add Bluetooth chips and related pin definitions.

With this and firmware already provided by distributions,
at least on openSUSE Tumbleweed, this is sufficient to make
Bluetooth operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 42 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 10 +++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 411b58c1dddf..04738bf281eb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -81,6 +81,11 @@ wl_on_reg: wl-on-reg {
 };
 
 &pinctrl {
+	bt_shutdown_default: bt-shutdown-default-state {
+		function = "gpio";
+		pins = "gpio29";
+	};
+
 	emmc_sd_default: emmc-sd-default-state {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
@@ -110,6 +115,29 @@ dat-pins {
 		};
 	};
 
+	uarta_24_default: uarta-24-default-state {
+		rts-pins {
+			function = "uart0";
+			pins = "gpio24";
+			bias-disable;
+		};
+		cts-pins {
+			function = "uart0";
+			pins = "gpio25";
+			bias-pull-up;
+		};
+		txd-pins {
+			function = "uart0";
+			pins = "gpio26";
+			bias-disable;
+		};
+		rxd-pins {
+			function = "uart0";
+			pins = "gpio27";
+			bias-pull-up;
+		};
+	};
+
 	wl_on_default: wl-on-default-state {
 		function = "gpio";
 		pins = "gpio28";
@@ -188,6 +216,20 @@ power: power {
 	};
 };
 
+/* uarta communicates with the BT module */
+&uarta {
+	uart-has-rtscts;
+	pinctrl-0 = <&uarta_24_default &bt_shutdown_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gio 29 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 871537366e96..1ed26a211ed5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -260,6 +260,16 @@ gio: gpio@7d508500 {
 			brcm,gpio-bank-widths = <32 22>;
 		};
 
+		uarta: serial@7d50c000 {
+			compatible = "brcm,bcm7271-uart";
+			reg = <0x7d50c000 0x20>;
+			reg-names = "uart";
+			clock-frequency = <96000000>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart";
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


