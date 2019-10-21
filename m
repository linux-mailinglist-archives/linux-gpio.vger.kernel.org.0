Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62FCDDE4C0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 08:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfJUGoh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 02:44:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34375 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbfJUGoh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 02:44:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id k7so6135668pll.1
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 23:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y09+A5UHDqq1M123Rs3HINM2fRslFLIQNP0UXzIqt20=;
        b=sH0DWc/9J+xztx+v2+sYpW4kmEmR2Klhj5Gi0lkv9oWDCKWpeN4HReH5VgoPdMnqPk
         owKBe9GYpPO6zuCw0HbO2cstyfFua0nPZyKeiJcr5+bgkHCpnLzL/cmInNJhuY1SD6F1
         EHRH+YFFpf9yiDZDGNwTsaMZhMhaS9d6gwL3rQKMBBww/9Xx/tlXLCAJAM0CbVVC8h4Y
         w12LPhCvOssAhXfSsFjQB7R1ppj2HWxmq3x3uiXEbZEB3vKbtgHIuGumpEC1XhwxMEwR
         qR5hI4rcnEtBxoha6aA7PKICz1cGMmtsXOiEgrSi0DlAyG7Ai1Px1V9zaMlIfLJppcPr
         eKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y09+A5UHDqq1M123Rs3HINM2fRslFLIQNP0UXzIqt20=;
        b=eX6uOm0xRekAyZN5AdkMJDzvAFwM5hD1uPha2ufw+k88LaSqqVJ9sKRe7c9vHE8MZB
         QAQweybq+n0yUTjLc64G8Bt85/iarVnQNow3UTeSbeQUWARk0/95eMqL52pp0f5W3Ize
         JBn+qFH2c+ypkAj9IGofiehofNX2JnmCMX3l/DvpwCIrlThpO+IpSUK0EaAtXm3O89kl
         rjloGqGYaxGiWSExPiLQxi0JNQ3wg0VNA6Afv3zgf+0Glujq4XudhDW4+SM78A0mnlUi
         Y4fABwaaaUo+MEziPaTIjwQLZ0khwJXQIE5iJDJRPSdcc8TcLrjoQoXl7p5LLelrEWJb
         erdw==
X-Gm-Message-State: APjAAAUV3e8rAE2rj8bSMmQalbn+uPJfg8WupCUfu6OpyZjPJ81VO+NT
        qILR4X1VNPAvfYUz2DZNPSYY
X-Google-Smtp-Source: APXvYqxPhLkcBeLz4GhQJY9kMAw0mTGSMhjl28NPa7yczQYGjEFA5o8+rFn/oYcTZP67N76WzNr99Q==
X-Received: by 2002:a17:902:8505:: with SMTP id bj5mr13002459plb.296.1571640275358;
        Sun, 20 Oct 2019 23:44:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:700f:8db6:2442:890f:ac37:8127])
        by smtp.gmail.com with ESMTPSA id d4sm13156624pjs.9.2019.10.20.23.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 23:44:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/4] ARM: dts: Add RDA8810PL GPIO controllers
Date:   Mon, 21 Oct 2019 12:14:11 +0530
Message-Id: <20191021064413.19840-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
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

