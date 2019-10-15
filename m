Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A875AD7DCC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 19:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbfJORav (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 13:30:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36599 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbfJORau (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 13:30:50 -0400
Received: by mail-pl1-f193.google.com with SMTP id j11so9917288plk.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2019 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y09+A5UHDqq1M123Rs3HINM2fRslFLIQNP0UXzIqt20=;
        b=eZ82YhwtUAOVg9G2zs0bTyLwRz0ch+7l+1a7/7Qr+2qWB2PvexBHVq2rpE2mMUHlE8
         69cksLWwsICq8VYOOQVEcdkVSUZEj4lz/IJvdKN457KBXh3QXdfO3GrvWb1TJLALJOr7
         Ti6ewei0hf0hy8j0YxESEUn/79rKNQhTOW3CIQqgecONAFnQi8Ca93kMujRzNa5FRabu
         VmGvXYPdukV8FLvCNlhMf6xWyncyMH3VzgfomB4vjvpoljfVhoaKenw9WH6NVry7t6gv
         11DUYl30BqMBJnyqE933rTCr2o40uTZdERufP80A3wjxXssozn3ngkvUuHnXlmWDteTd
         bqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y09+A5UHDqq1M123Rs3HINM2fRslFLIQNP0UXzIqt20=;
        b=F6J5Pmd2lRDsuYvJwzahGrwf9bjfkUMmFB4IPGuZi8Wi+MqoXiLS3Vxz3NlOS0zPdL
         2yPa7fKBETVzNlgiSdNRDXx1BJq8razSJSgHvfo3qRejYRud0R2ZVM9dBatKAJ+AegBJ
         at1oTtQDWFDLqyQ/8jjCKLniN379Lo1e6w6IiRUdknPl+9wZr+xy3W5m1ryzP3LZB9f0
         +ZEepSN1QI4g92uu1x0K2gmEg/yWPRiOE2Sm2k4AG0sMr2OF0iHPZD0+2KIdjq19ZiR0
         u2ZOz5axiMLccmIu1+LrwNB41mUALUMM9AQLMYf26T8GmdhDIbIzNryHLQxQaX2k6dvf
         SgUQ==
X-Gm-Message-State: APjAAAUwMDkn5fzJIaTBrljiCToXfzVCs0GG3CwPLHd9YSN91XcBp+Tk
        0PtO00TBp1Iqq7bMvN3Qn3n1
X-Google-Smtp-Source: APXvYqyj7mfRTh0xkfAngm7OG4b0vGrpS0e0L3DDC4u4rStgGqFdkBEqt48b4cgFsQSkTewOxbjULA==
X-Received: by 2002:a17:902:d698:: with SMTP id v24mr36554507ply.89.1571160649769;
        Tue, 15 Oct 2019 10:30:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6003:7cb8:25e8:2c45:fab2:b0c7])
        by smtp.gmail.com with ESMTPSA id w11sm28033563pfd.116.2019.10.15.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:30:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/4] ARM: dts: Add RDA8810PL GPIO controllers
Date:   Tue, 15 Oct 2019 23:00:24 +0530
Message-Id: <20191015173026.9962-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
References: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
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

