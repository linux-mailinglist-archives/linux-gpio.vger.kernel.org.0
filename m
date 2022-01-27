Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEDC49EB49
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jan 2022 20:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239788AbiA0TqV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jan 2022 14:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235496AbiA0TqS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jan 2022 14:46:18 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4464EC06173B
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jan 2022 11:46:18 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a13so6665970wrh.9
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jan 2022 11:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=engleder-embedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTQLwKbcOfCpl69jctdP/i+1vLMGaSRzKXBbPhXN1/I=;
        b=wr/ZPwI/XbHrzU54kyHj1ZFl8YGCpCtKSIFrmfpygsNrI84ns4t1gC5gRIeJhIi0Q6
         q70CH3Mt6dQtwCEMHOclX+W8WvjUvHOiFGfUKm/0a87bPKm4kQF8qE89fn/QQNZjwgAN
         jLN6/o7XprMXMhq7olvCuGWoI6RYKP4u0DGm1KsWs+fg7kgAsKsBqSqUtNW17CmauFm3
         6Pv1DuuXCfHPKvJm/3Zm1xBAhX5lcD2e/ho9crGXzKBYQxFzi6RjnJz5Krqg50kOOZfx
         Gxqv5hWvzhCTvAtxqL+2n+PR0P8i/BVDi1q0DsxcBlGSWANbcio57pyuia7+8In5OMAG
         KjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTQLwKbcOfCpl69jctdP/i+1vLMGaSRzKXBbPhXN1/I=;
        b=wxpApKaBy5vcudbvGQeNeGkc2ArNdYdyVjDGQ3EPdOs05N6BSAo7NZLPeD3A4dd2OI
         GRwX6oGyeg1/ynb+4gsZ026yuFyz+sskSA0wuzZHJCF6xuveVRfn9L40h4cKGvOXARxP
         tptBR2sVheDacrySA/MYtAqXI1mnwdNGJH44/qbcFWo/RmsNQq+I796sF/kJdB5Nfd1T
         xOzuxoe6OQeRQ2+5KaUcEMKkNN8yl9QnXhF1Fjwlt2v2jCr8LQoFxRt6kOp7DzW48U6t
         Y06i9NJ1Bt2MxNExM+zivcFfIHw1NET75KA5C8mGqkUl4BVCO+3WQj42ZeXa/SBOB+dT
         Ncag==
X-Gm-Message-State: AOAM533YoPeZXHlivLUyNJ53VivW7whVxtSK82khxMem5NY80rF+eFrn
        lheqm42a4PJPxbCPwMt0FGj9Ww==
X-Google-Smtp-Source: ABdhPJxs/gFo4n6gj/9hf/bpvavujHnl7FmrWvwLkgmEv18+sTQpKpTxSxLTSK0E+b+LTEIEQNlWOg==
X-Received: by 2002:adf:f60f:: with SMTP id t15mr4143519wrp.33.1643312776825;
        Thu, 27 Jan 2022 11:46:16 -0800 (PST)
Received: from hornet.engleder.at ([2001:871:23a:8366:6e3b:e5ff:fe2c:34c1])
        by smtp.gmail.com with ESMTPSA id r2sm4428532wrz.99.2022.01.27.11.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 11:46:16 -0800 (PST)
From:   Gerhard Engleder <gerhard@engleder-embedded.com>
To:     andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        michal.simek@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: [PATCH] Revert "pinctrl: zynqmp: Unify pin naming"
Date:   Thu, 27 Jan 2022 20:46:02 +0100
Message-Id: <20220127194602.21987-1-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Gerhard Engleder <gerhard@engleder-embedded.com>

This reverts commit 54784ff24971ed5bd3f1056edce998148709d0a7.

This patch changes the pin names from "MIO%d" to "MIO-%d", but all dts
in arch/arm64/boot/dts/xilinx still use the old name. As a result my
ZCU104 has no output on serial terminal and is not reachable over
network.

Signed-off-by: Gerhard Engleder <gerhard@engleder-embedded.com>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 42da6bd399ee..e14012209992 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -809,7 +809,6 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
 					   unsigned int *npins)
 {
 	struct pinctrl_pin_desc *pins, *pin;
-	char **pin_names;
 	int ret;
 	int i;
 
@@ -821,14 +820,13 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
 	if (!pins)
 		return -ENOMEM;
 
-	pin_names = devm_kasprintf_strarray(dev, ZYNQMP_PIN_PREFIX, *npins);
-	if (IS_ERR(pin_names))
-		return PTR_ERR(pin_names);
-
 	for (i = 0; i < *npins; i++) {
 		pin = &pins[i];
 		pin->number = i;
-		pin->name = pin_names[i];
+		pin->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+					   ZYNQMP_PIN_PREFIX, i);
+		if (!pin->name)
+			return -ENOMEM;
 	}
 
 	*zynqmp_pins = pins;
-- 
2.20.1

