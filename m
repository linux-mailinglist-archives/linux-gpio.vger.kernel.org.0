Return-Path: <linux-gpio+bounces-23321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F899B06611
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52ABD18867CD
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3F92BE7BE;
	Tue, 15 Jul 2025 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q7t4PlQc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69529B777
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604211; cv=none; b=KPtLWDppIhzXJf0g4WOvNn26XMA1HIHafXdwZi75jH11AHruhf2mmTdgkRk7eztQuCkqHaWFfbq+j7TzVXkn42iNJYT4KbJ9qoppphpF87evAnyDEXq5Ebaivk5Ql9x23MYJ/nJw/p8fExtf/wt3hrjRVSpm/vs2xwcom2znWWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604211; c=relaxed/simple;
	bh=9aA8HrNIa5OHvnUfZs+zgOJXdv8zsB5+X3ZSMKyPOMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp3x1zIvRVVro21yMUqhzqLcA2UknM+cr63C/xy3E+xAQz5MVtRRyQ6ZwrKyJ9UjUKO1xuR5Ec4A2eVNXHqxXj0xq2Ld2C15RbOeiglcrIgehl35Uzb52EWacR7K3Ku8Fai6g9QdJ8r1LTuEibE+RQP7m8Rs4t9BQiyIKdzyGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q7t4PlQc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so1003946366b.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604208; x=1753209008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pldi7JVw2aEIgElZ31BLSbydsDKsk3LLrjeHsOvc8cM=;
        b=Q7t4PlQcPjVGFH23Xx/6ctzzij4AzhxRprozNI6Mc3JWyGPW9QlEvxVdOGB6JAV/D2
         YRGhxKR0jN6cp56H+3hdhR3BXg/26DtJiw5cTJ8SwO+ZVCLjvyQLG70YqaQheYDOxEys
         4lp84JhwumZFCcL6XAYA2V+z7bLNSejlBSQppDfjtp9ggoZXuIO04gZ9pWEmM7UW8hXx
         sdNuCLLwZiB7NY4YoCgt7rH7b01xiB2B5k+IrUlFnfsm1pmqh6nxhvZ4jUP/3hE1ztAA
         72MQ7ZLQQmCtHGLPgz9rDsUdnsJsTMIKT4hWEqRxayHiaIzq64rBS8TeGuAOAvvgFtUH
         j6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604208; x=1753209008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pldi7JVw2aEIgElZ31BLSbydsDKsk3LLrjeHsOvc8cM=;
        b=AszZqYWiITlM8PkVgaIlkJrcQaY8/lAVbt3bwqMHe8fkGOBhukXYxlqmdAFibQtSfr
         +se7MWiuZLThm04x2qlgNDBpRMLaKkYjrmZid5ppSAyFZGm9/r7cJj4ccOuaEHUlm0da
         MRFDMO9mgyN6DNzEcXYsVuc9ZNfF3KX77SkiTAmPoUOYXwrH/OhLe12K7usYjyISwgMQ
         FbjpQF2zNn7mONkvSvwi4TceiqjQPRb62scQp+oSZJNJ/QTrBiIorrmsyQdCY853VT5P
         qBGbm3b/vbelMl06YFrYSUe9cJC6x1fxqR8VJyZWpsTHNTzpPn2p68owrIbN3p4Wlv0X
         +cjg==
X-Forwarded-Encrypted: i=1; AJvYcCWAR2Yshi1YcGq2rZI6rWFi5WepxX46Kug+mWHEgZ7/jGrr8zllGGpEz9XTi6gvmOZb3bebuMyT2q+n@vger.kernel.org
X-Gm-Message-State: AOJu0YwHcV8wEuIF1h5VyntBCq17E1HPmjSaQfgn2LK6lJUxzWojsX9K
	LvMTjCTjKeIYx5NisP2x5fzjIMyOO7tZPhkY4TKtUpmAj+JK8R677gTcBExbAr/KStgph6hPPEB
	x2F9Luvo=
X-Gm-Gg: ASbGnctO/lkVrJUXBbK0ZLXYzkfoh0PrQOTO8pLEnLXCJGmw67ky668pwJSkpJRUfXX
	10tBnDVGFEh53y2j2r2Hg2n8fNqxaQTMvPhMx8CTUUSpx949qQ+BbQ4Wu8Gwq2NyccbaQ6y91UM
	2Ux8V3ny40WbhOE2GdZV4dQiFUtTy641mVI9Xm6GoyWXI1Be/mbtXYMArqYUNKTpWu9CF5x+hd+
	xhudIN9xo/ske+s48Y/DgfKMRvD7MSVIYXbG/nNhJAjgJRJHYtEhvy1a39mj9yfoFxACZ2yH2Jy
	7IhSnUtkJwW3B4ex/fY1LleJHLYID4T0q1soVPzzxWL2/xzy1X9IqMOlrEkkoQuKR0Iwn4zdz3Q
	IdLpoma7SX/mCWTobcQYJnQBhjWUbF73mNMEc6zkpVWbag7Yona0A/IOL8EzCdlSYyE7K
X-Google-Smtp-Source: AGHT+IGwUYqsRHmstWDhORzwnIbfYu8/EL/YZzSOmEaELMDVJJ2PSbd1BP9+YofZivfAxklhwn5W3w==
X-Received: by 2002:a17:907:9487:b0:ade:4121:8d3d with SMTP id a640c23a62f3a-ae9c9967a03mr50070366b.12.1752604207855;
        Tue, 15 Jul 2025 11:30:07 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df594sm1041872466b.159.2025.07.15.11.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 4/7] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Date: Tue, 15 Jul 2025 20:31:41 +0200
Message-ID: <f39560d1954120a5530c6b9dca0d6727a8872bd1.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add GPIO and related interrupt controller nodes and wire one
of the lines to power button.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 21 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 12 +++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6091a1ff365c..f0883c903527 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "bcm2712.dtsi"
 
 / {
@@ -29,6 +30,20 @@ memory@0 {
 		reg = <0 0 0 0x28000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwr_button_default>;
+		status = "okay";
+
+		power_button: power-button {
+			label = "pwr_button";
+			linux,code = <KEY_POWER>;
+			gpios = <&gio 20 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+
 	sd_io_1v8_reg: sd-io-1v8-reg {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-sd-io";
@@ -58,6 +73,12 @@ emmc_sd_default: emmc-sd-default-state {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
 	};
+
+	pwr_button_default: pwr-button-default-state {
+		function = "gpio";
+		pins = "gpio20";
+		bias-pull-up;
+	};
 };
 
 &pinctrl_aon {
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 8a517261841d..f70ec8d3dc4d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -248,6 +248,18 @@ pinctrl: pinctrl@7d504100 {
 			reg = <0x7d504100 0x30>;
 		};
 
+		gio: gpio@7d508500 {
+			compatible = "brcm,bcm7445-gpio", "brcm,brcmstb-gpio";
+			reg = <0x7d508500 0x40>;
+			interrupt-parent = <&main_irq>;
+			interrupts = <0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			brcm,gpio-bank-widths = <32 22>;
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


