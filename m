Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FA02D8EAB
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388730AbgLMQSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404701AbgLMQSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:49 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1FDC0617B0;
        Sun, 13 Dec 2020 08:17:34 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id w5so10250900wrm.11;
        Sun, 13 Dec 2020 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/SjzDMsmOBxksRB2/nR67BPPBDrp7yLu8jvVQSPdRA=;
        b=RA9YPVDPP+Hlea2+CoCov3pCGvBJPPAI//vWwsri9yIDoXMxCPFwqlm6aDUA2tO5C2
         bbs/pBFtoOssukMSlk+7pNsbfJJEnm8M2sC0hWQs3hFZGgb5GTq3rlSIvtcp/dg+oo1G
         lchDa25ZOzl5UcvMKgN6pSH4FkRYFQER+22/5YbSv/PtsN4qAHnezkQHLWsEaOO8McL/
         CEHY0YkOqBdy9bBZMNVBFK6VthIvIC8paW39UGvpmOJVE1WOrgKrE8ZGuqdZTwFeyfXN
         um/36355ECTDo1cnex8yxgAPttwXkzCmXrLAHG7xZoIg8PBNJ0W7AP+rJkinQO5Nl7kh
         5iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/SjzDMsmOBxksRB2/nR67BPPBDrp7yLu8jvVQSPdRA=;
        b=WpWTUaKG1JIakM7NfNe70IrHIXyA8EsVnytfHIimjpyZEXW8OUmfafMVI7KHqqaqen
         nT6BK8M6YT/2nWA0+3eXqBoks2qfDzVH3WHBP70RvH1o8quKojQiSwZpSCGD18yBLbk9
         itxHi8mnYpuHqKGDMYXwfqbS08eAeriyHZmC8/NjB+UtDuTYVekU/ML9YTC2LOZddxeo
         BNZGFCUZRW3f8IUOkVBon6sKPbzfg6JjnLQ9NQxrlklqm0OdagANDwfrIs8MrfiYS4cS
         WnUGMp2ej1BnPWnno5NS90UnC39/4k1zO73TeNwe/Bwqjk/yl8DcSGOOqDqdzLTjsOI8
         PcIA==
X-Gm-Message-State: AOAM532fiNqI1JuMUlQqhe/fsmMLwxeqBaG831UXOLPWOKeZacEZlQEQ
        Kwf3XZzYDe3pbLN71YGXsD8=
X-Google-Smtp-Source: ABdhPJyJqmj0HNzc2fwOmoYbmupN0wZjJVWhHfjcFkpjkCTKKiJrRTgN6MXYcDkwVAPecugXOEcpeg==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr13108334wrv.37.1607876252873;
        Sun, 13 Dec 2020 08:17:32 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:32 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 8/8] staging: mt7621-dts: properly name pinctrl related nodes
Date:   Sun, 13 Dec 2020 17:17:21 +0100
Message-Id: <20201213161721.6514-9-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to the binding documentation pinctrl related nodes
must use '-pins$' and ''^(.*-)?pinmux$'' as names. Change all
of them to properly match them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 46 +++++++++++++-------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 5b9d3bf82cb1..f05b7dec703b 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -228,83 +228,83 @@ pinctrl: pinctrl {
 		state_default: pinctrl0 {
 		};
 
-		i2c_pins: i2c0 {
-			i2c0 {
+		i2c_pins: i2c0-pins {
+			pinmux {
 				groups = "i2c";
 				function = "i2c";
 			};
 		};
 
-		spi_pins: spi0 {
-			spi0 {
+		spi_pins: spi0-pins {
+			pinmux {
 				groups = "spi";
 				function = "spi";
 			};
 		};
 
-		uart1_pins: uart1 {
-			uart1 {
+		uart1_pins: uart1-pins {
+			pinmux {
 				groups = "uart1";
 				function = "uart1";
 			};
 		};
 
-		uart2_pins: uart2 {
-			uart2 {
+		uart2_pins: uart2-pins {
+			pinmux {
 				groups = "uart2";
 				function = "uart2";
 			};
 		};
 
-		uart3_pins: uart3 {
-			uart3 {
+		uart3_pins: uart3-pins {
+			pinmux {
 				groups = "uart3";
 				function = "uart3";
 			};
 		};
 
-		rgmii1_pins: rgmii1 {
-			rgmii1 {
+		rgmii1_pins: rgmii1-pins {
+			pinmux {
 				groups = "rgmii1";
 				function = "rgmii1";
 			};
 		};
 
-		rgmii2_pins: rgmii2 {
-			rgmii2 {
+		rgmii2_pins: rgmii2-pins {
+			pinmux {
 				groups = "rgmii2";
 				function = "rgmii2";
 			};
 		};
 
-		mdio_pins: mdio0 {
-			mdio0 {
+		mdio_pins: mdio0-pins {
+			pinmux {
 				groups = "mdio";
 				function = "mdio";
 			};
 		};
 
-		pcie_pins: pcie0 {
-			pcie0 {
+		pcie_pins: pcie0-pins {
+			pinmux {
 				groups = "pcie";
 				function = "gpio";
 			};
 		};
 
-		nand_pins: nand0 {
-			spi-nand {
+		nand_pins: nand0-pins {
+			spi-pinmux {
 				groups = "spi";
 				function = "nand1";
 			};
 
-			sdhci-nand {
+			sdhci-pinmux {
 				groups = "sdhci";
 				function = "nand2";
 			};
 		};
 
-		sdhci_pins: sdhci0 {
-			sdhci0 {
+		sdhci_pins: sdhci0-pins {
+			pinmux {
 				groups = "sdhci";
 				function = "sdhci";
 			};
-- 
2.25.1

