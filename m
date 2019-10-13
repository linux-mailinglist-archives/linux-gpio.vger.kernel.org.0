Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25EF4D55E2
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2019 13:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbfJMLlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Oct 2019 07:41:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45156 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729032AbfJMLlE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Oct 2019 07:41:04 -0400
Received: by mail-pl1-f195.google.com with SMTP id u12so6683682pls.12
        for <linux-gpio@vger.kernel.org>; Sun, 13 Oct 2019 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y09+A5UHDqq1M123Rs3HINM2fRslFLIQNP0UXzIqt20=;
        b=gqSE/9m1WqiSfPyiKe+uvZTMgyIT5zlJH42apXag/biHxc9GIV81bnsZ3Fr8lz7Wsx
         xd5JIWwp1jilXTBbCipYBf7D/W6o55IbdGPZavbhPIsfGpcYPMBMs+aHJECVP4kALRDN
         DVIpLQZoBLwwXx/8NUmpJIbSNfMTxmh43tmIyUKgUM8obNRiG1VvDt7bGaQWilaLR4q8
         5U7on+Ggi6Nv1E5TkIFQUo9yNGCoxrz4SkuJcP3UQC6zXcdbVci/TYDfBkjOPRGQHthx
         O7AO93ORY4+tHliWnzDgGVqmwz/6FqKAH2XRnwGq6/J4Ch5mLjCFiFutT6vmzgNMsV6s
         e6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y09+A5UHDqq1M123Rs3HINM2fRslFLIQNP0UXzIqt20=;
        b=IOPfNPjv6anJXnvB+CheMdtZtyQkDaAFWw7cOxJlM7D+YpDSgrzU0xQjGAPhr4zaYc
         Rr6Q/RC+guY0AoPnzjYA1l3KuZrSCwKldujqvvNWUp4LaJtmZ7viBP4Kqj0saDcbxi2O
         a0lVJs/+nwNW3rFGnsHVUqw5gb8GznaLkcwiERXxXYbwj64YpU9JWMufiGJvn5ODVYMR
         N60xzgxDPGe74tvDmky7u3nILWaknZvYgEM1bUKEKw5ehr1zOFyOY/BqWF0uySCKfFwM
         CjugqnYqfU/oL4l9Jp3dNNPP0oyGsEw6azOA3Rc0TAks12pzqNv7iIfhT6nHVk7SOQYq
         iWyg==
X-Gm-Message-State: APjAAAURNe/HspeM5k8YIV1pjkSMTMCzTogg7b/oauI+siy5NsFJ4bQH
        mboIrHg4QMWn3sM8ZAidRLYY
X-Google-Smtp-Source: APXvYqxz9k+DMvIUPCBwWUddd5f06EFaB/GjufHLZCPyjpKBcQULbaK6QhY4YAryLH4GfR4WTHA9oQ==
X-Received: by 2002:a17:902:aa91:: with SMTP id d17mr24312402plr.69.1570966863648;
        Sun, 13 Oct 2019 04:41:03 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8e:4f53:b957:652b:7622:f311])
        by smtp.gmail.com with ESMTPSA id g12sm23165736pfb.97.2019.10.13.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 04:41:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/4] ARM: dts: Add RDA8810PL GPIO controllers
Date:   Sun, 13 Oct 2019 17:10:36 +0530
Message-Id: <20191013114037.9845-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org>
References: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add GPIO controllers for RDA8810PL SoC. There are 4 GPIO controllers
in this SoC with maximum of 32 gpios. Except GPIOC, all controllers
are capable of generating edge/level interrupts from first 8 lines.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/rda8810pl.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/rda8810pl.dtsi b/arch/arm/boot/dts/rda8810pl.dtsi
index 19cde895bf65..f30d6ece49fb 100644
--- a/arch/arm/boot/dts/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/rda8810pl.dtsi
@@ -33,6 +33,21 @@
 		ranges;
 	};
 
+	modem@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10000000 0xfffffff>;
+
+		gpioc@1a08000 {
+			compatible = "rda,8810pl-gpio";
+			reg = <0x1a08000 0x1000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+		};
+	};
+
 	apb@20800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -60,6 +75,39 @@
 				     <17 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hwtimer", "ostimer";
 		};
+
+		gpioa@30000 {
+			compatible = "rda,8810pl-gpio";
+			reg = <0x30000 0x1000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpiob@31000 {
+			compatible = "rda,8810pl-gpio";
+			reg = <0x31000 0x1000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpiod@32000 {
+			compatible = "rda,8810pl-gpio";
+			reg = <0x32000 0x1000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 
 	apb@20a00000 {
-- 
2.17.1

