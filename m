Return-Path: <linux-gpio+bounces-17966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8908A70376
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 15:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66F453BD2C1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 14:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5AF25A359;
	Tue, 25 Mar 2025 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rcUlCT2d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AFA259C90
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912015; cv=none; b=XGeMNz7xmsWCevF0lb0na9fP46Vv4MZSLEhhpk1H3h9o8hMsORhVfDjTlYXiyXw9fZoNUhYxREHiqtCH4iMt4+u4rLePQGR6pSajttTy80euyhd8JBtsJ8bP9ZTxP7dicH+0f4ELIonzvoxJlSgpzELqhkqt6bDvLXWTno8eS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912015; c=relaxed/simple;
	bh=nJ76qnpAiA1hIrK3TfkbYTYfWRCX/J8sNAMB6mmLa10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJPZh/aUufurvwUiF3BSViCcAJ5p/GGQq5d9FmQzItAmN1Euz82WrT13ZN5AiCo/E6AF8JptS3aEOJ7LSaj6yVyuJ2wsankhlTNsge8eqyPxzJ8c9N8rQVLCEBj9lbH30DpuXNxIyjouX2n0nD0EGtgOGw4cwq+tHVpg8Nisdls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rcUlCT2d; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 42A9A403F7
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742911999;
	bh=ruY4mx+ycuBPq+bKcBygbtDAkYa1zJT+mxxboy0e/q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=rcUlCT2dFVZ+4HeiYFAIm07G3TOlpGtKv8q4WqzRom+aZhSdY0hShWYe+THsaz0yb
	 jocWf2d36qtKjT+bzn/94Fpc9hLf11Tj/9VDvp/zL9i1Xm+Sk2REpIY0GM2yVsN+v1
	 INWseXESGCu83xTrq0s8+1nqY7+faEkT3tpL8KvC3y/xS6TQNj3/sdZzGPlGTcvRXb
	 MINFspTdgJVT7X8SN4t9JbkoaZ+V7s+Sa6UNs3MOnVvVWt7e26w6C9x0WcmZQlkiHt
	 L5SogMZLOAiXtFn85J8js/kTO/cpZQjMi6q1PNRhWJn7D3T15zxfx/p9NRJMyH049l
	 N7UxEyEDYwkJw==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso2894685f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 07:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911997; x=1743516797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruY4mx+ycuBPq+bKcBygbtDAkYa1zJT+mxxboy0e/q8=;
        b=aREQ9CCum64P3Wy0S0mesP4FsTpP98Z+FIR09yB/QeRX/ws5W6d6sld21KAYB4TSns
         1U3xvX2TUP1/k2WBiUognrYJ9wwqyhmGXCDBFvTmr41ECebCGOQrR5GL3pSxJSgKULVL
         /NZFyGHttmfzVgmmvlE/PRk03N704PKuYWP55XiT+HpUkf1C79eK5jF+f7ZBDyn8w9Il
         VLQrR0ofuzIsCnDwa+hHqc+Mmcn9yv4BQy4XLCwe7t3PQjdX33GTQC4h08KAkmbQoMwY
         y00BmgwLDw1AVCyuI1h2g4K+15Y0pH5zu+GMF6e+pVfWVlsnbTiiavMTsozQTCYQkzmp
         I8XA==
X-Forwarded-Encrypted: i=1; AJvYcCVdLMhHiDr0rQMTHmHVh7Op9SSrlx00LubKvBMGFmsjBRKgpMaMiohONABzAt9zHG/eK4sn8giaO0v7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy665rfNyDlFSH54e/7Lc1jrVcnWolkhUwmO+mNfeDVOj9dS6yZ
	xdIclzM8vRa/g2lm/YbnhFn4Ry7GBOB/vpJv8M0+1D16QEr+WB8QxXaN5x6RsjiqNs8ChFJqUeM
	rsqzx7slq1XBZvi0GAZ68/dUCkLLV3H82ODDkN3u0gS6LgCUDPArrgd8+yvQGhzFbWicHf2l2us
	8=
X-Gm-Gg: ASbGncvOl34SXrL9Fm/J9QSsiURCl2AluEhMJIJCywxmbNEahL+qbJLxcFWeF90raya
	n8f+i8RsrjuSM7OTyg2gPjfXCkAx1OZPa0LgoPllqn4P4dzXTAmbF//2DJ+Zu74r/DHZpYbl/BD
	blMbWpHpEjVkWEFltsZ+KGg6dTbkiTbeJ+NniC526jiILkrVwSA7QhRcAH/gUOAnqQu8j45TnPa
	2xJp4zOToxF7WUFH0RFVB6RxB6toYdRF9ojq5V7d7PQqKSMOvLPEtZluRAhO1jr4ed17HaYXgyt
	ZgnRTJ0OhPqHms+qJSXsjn6n3uqWcw==
X-Received: by 2002:a05:6000:1a8d:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-3997f8f9d54mr13315754f8f.4.1742911997508;
        Tue, 25 Mar 2025 07:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIxyJ37OZghcxQ+a/pWrQYrdFkF1ltdT3GNn4+fygXg02/lhRChSV9UcnQAQLd+3Joudp+Ag==
X-Received: by 2002:a05:6000:1a8d:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-3997f8f9d54mr13315703f8f.4.1742911997011;
        Tue, 25 Mar 2025 07:13:17 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:16 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 3/4] riscv: dts: Add EIC7700 pin controller node
Date: Tue, 25 Mar 2025 15:13:05 +0100
Message-ID: <20250325141311.758787-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for the pin controller on the ESWIN EIC7700 SoC and gpio-ranges
properties mapping GPIOs to pins.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 9cef940f07e4..7226647919b7 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -312,6 +312,13 @@ porta: gpio-port@0 {
 					<324>, <325>, <326>, <327>, <328>, <329>, <330>,
 					<331>, <332>, <333>, <334>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl  0 12  1>,
+					      <&pinctrl  1 14 12>,
+					      <&pinctrl 13  1  4>,
+					      <&pinctrl 17 32  1>,
+					      <&pinctrl 18 40  5>,
+					      <&pinctrl 23 51  7>,
+					      <&pinctrl 30 68  2>;
 				ngpios = <32>;
 				#gpio-cells = <2>;
 			};
@@ -320,6 +327,9 @@ portb: gpio-port@1 {
 				compatible = "snps,dw-apb-gpio-port";
 				reg = <1>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl  0 70  3>,
+					      <&pinctrl  3 79  7>,
+					      <&pinctrl 10 89 22>;
 				ngpios = <32>;
 				#gpio-cells = <2>;
 			};
@@ -328,6 +338,7 @@ portc: gpio-port@2 {
 				compatible = "snps,dw-apb-gpio-port";
 				reg = <2>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl 0 111 32>;
 				ngpios = <32>;
 				#gpio-cells = <2>;
 			};
@@ -336,9 +347,15 @@ portd: gpio-port@3 {
 				compatible = "snps,dw-apb-gpio-port";
 				reg = <3>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl 0 143 16>;
 				ngpios = <16>;
 				#gpio-cells = <2>;
 			};
 		};
+
+		pinctrl: pinctrl@51600080 {
+			compatible = "eswin,eic7700-pinctrl";
+			reg = <0x0 0x51600080 0x0 0xff80>;
+		};
 	};
 };
-- 
2.43.0


