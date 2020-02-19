Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464B2164D30
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 19:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgBSSAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 13:00:12 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37088 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgBSSAL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 13:00:11 -0500
Received: by mail-wm1-f65.google.com with SMTP id a6so1673128wme.2;
        Wed, 19 Feb 2020 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wh9nIcj0w2M3FqQot+njucHn0Ra0ZI6Wx7pQ2i4JMoY=;
        b=HUJdLC5hopKYknC4eZLjSnebhG/JcwdeTl3Xb5S6oKAqHmzxMjL00GkwJpHWhibfAS
         5X//CwXj0lCgW2hszTgKl1wgOgNJqU8yRvBb+K0UPYC2XWghy31Ob/rzOxrm5SPIBZgK
         rZuMJtRzlwEG2e/EsEforx/60C+nVb4BIjE1/zxhyyk7dcmoOLx9twQ2+dLv3ovAUDZk
         XTwGCDrxKvTgivsXyU007uY7gNFao085ZI1nJZKNTuNOn+BEQ+voSgqF7LFwBn8ppgdB
         4TsIaF/O4RLjAiLWr6jLtI7SonSaeqXpValX1FqtQZ8Iam46oaCY+aW4dsCFXLXdKeXL
         LULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wh9nIcj0w2M3FqQot+njucHn0Ra0ZI6Wx7pQ2i4JMoY=;
        b=IwC/eeUgLD5uQHjmTzv9ELcN96yipgasmp0tfjcJLFTdAx+fKKxFa/okm0jttOuJgI
         Vjb1S02I53Het5C4aQVjbq8EjFwRybGR1buLCYfWcRdhLNd+F+RlwQ4aqPFmvbr3Zw8I
         xX5LXu2b5NHDUzHFTucF6ZaRB/p6X2HhlDT9lTA0v54ABgvS3MX4pXkJf2gqWZz2yp9X
         1q7v2AOHMtHgIfk69m6u2dAvFlDlp6LP/fynxaD6ZUEZWnkdvkV+/9qFKsv5L5t5BSXW
         cdIhR+RocnGPZeDpys9z0hD5O2vKb9p81G48SE816eDkzZ//56MfraP3xiRstisdTVHL
         y+vg==
X-Gm-Message-State: APjAAAXUL8NiCVdBQqTJxaMKhGgKGO+mcGN+vggzf3V4l+zYRNDMpQjO
        O10gVCpFOxNolce3+m+j4S0=
X-Google-Smtp-Source: APXvYqwWSiOJ5tvblLJlOInc5jk1+KI712XO9RsPsQ8tcWz2r4+JQJ9HYITKEe0Hd1mulV68sNDT6Q==
X-Received: by 2002:a1c:7915:: with SMTP id l21mr10859413wme.112.1582135209882;
        Wed, 19 Feb 2020 10:00:09 -0800 (PST)
Received: from Ansuel-XPS.localdomain ([5.170.105.173])
        by smtp.googlemail.com with ESMTPSA id v5sm674946wrv.86.2020.02.19.10.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 10:00:09 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Ram Chandra Jangir <rjangir@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ipq8064: pinctrl: Fixed missing RGMII pincontrol definitions
Date:   Wed, 19 Feb 2020 18:59:39 +0100
Message-Id: <20200219175940.744-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add missing gpio definition for mdio and rgmii2.

Signed-off-by: Ram Chandra Jangir <rjangir@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq8064.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index c2fb1ddf2f22..ac717ee38416 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -299,7 +299,7 @@ static const char * const gpio_groups[] = {
 };
 
 static const char * const mdio_groups[] = {
-	"gpio0", "gpio1", "gpio10", "gpio11",
+	"gpio0", "gpio1", "gpio2", "gpio10", "gpio11", "gpio66",
 };
 
 static const char * const mi2s_groups[] = {
@@ -403,8 +403,8 @@ static const char * const usb2_hsic_groups[] = {
 };
 
 static const char * const rgmii2_groups[] = {
-	"gpio27", "gpio28", "gpio29", "gpio30", "gpio31", "gpio32",
-	"gpio51", "gpio52", "gpio59", "gpio60", "gpio61", "gpio62",
+	"gpio2", "gpio27", "gpio28", "gpio29", "gpio30", "gpio31", "gpio32",
+	"gpio51", "gpio52", "gpio59", "gpio60", "gpio61", "gpio62", "gpio66",
 };
 
 static const char * const sata_groups[] = {
@@ -539,7 +539,7 @@ static const struct msm_function ipq8064_functions[] = {
 static const struct msm_pingroup ipq8064_groups[] = {
 	PINGROUP(0, mdio, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(1, mdio, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(2, gsbi5_spi_cs3, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(2, gsbi5_spi_cs3, rgmii2, mdio, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(3, pcie1_rst, pcie1_prsnt, pdm, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(4, pcie1_pwren_n, pcie1_pwren, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(5, pcie1_clk_req, pcie1_pwrflt, NA, NA, NA, NA, NA, NA, NA, NA),
@@ -603,7 +603,7 @@ static const struct msm_pingroup ipq8064_groups[] = {
 	PINGROUP(63, pcie3_rst, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(64, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(65, pcie3_clk_req, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(66, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(66, rgmii2, mdio, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(67, usb2_hsic, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(68, usb2_hsic, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	SDC_PINGROUP(sdc3_clk, 0x204a, 14, 6),
-- 
2.25.0

