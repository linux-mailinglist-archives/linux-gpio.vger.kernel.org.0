Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4082135C6
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2020 10:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgGCIGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jul 2020 04:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgGCIGz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jul 2020 04:06:55 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3A1C08C5C1;
        Fri,  3 Jul 2020 01:06:55 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u185so11643554pfu.1;
        Fri, 03 Jul 2020 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KzYeuqUkyTDh7fzvEVkgIq6/obYg1i0Dt2vBEnuFZjU=;
        b=GVD7ZwMnK09FCqJvedc6dj0YJ+fTsbJaWHK2Uy/Lthr2LzCIB3DaC7qXC5Oqvls3FQ
         edvUFwf2DUrdaiANWudreblCoJFkvDvZNtS6IErhGXeBB/Nj8dvT4+FkwTENQTc3M+MW
         EjYbZreSM2fzJTB4GhwxPPQCjtGMNpiOYhKRCVI36ZwaTeoNttfll2vyO4uITUTM4tfX
         lHIK/EZ7/wANiKtFZ3MC3NrSY3SZJ/XL3gKquJgeFDhcuiq99sFIN1Z2PB+AnMP8s2cd
         bH8r+okIQ8n3RVJaNqKCp1ceFfjNGY6bTspKg7IomCRqk4E04oZO+vbbn88pY9k91Jzq
         KjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KzYeuqUkyTDh7fzvEVkgIq6/obYg1i0Dt2vBEnuFZjU=;
        b=KJNQH+GlLZZKDRRZFENCYBsZyf3f/MXyvPiVAN24C0xUkmr+1LYl+v3Ad/byqgFE97
         oWNLrjiMpzJMNwrkTecIwWmxgPLoE1XyFsvOD05pC5w9I0ym4J8I8VFmP8Oq32DJ/dcF
         zpGKt7TQ221JqhtMZ9eWv5o86ZFW9ud28rGgPQ76kUHsB8bH39FdjwMTYmlOMVGZSDX5
         //75YmmXARWki9jkNqpK5A2UGgrMv6N2Q7HQT5eMdAPG8G/hnQhr2RDwc8W+NelXf+q1
         vrwWVJk/iU1uk+ZQY6cypzDVntvL2OHj2o7xyQjPYL3F+aYW700aY6cU5BLoyivr5S75
         aeWA==
X-Gm-Message-State: AOAM532qJhjUbdSYp/KGRNgdelIDiZK6EDuMz1KKl+1bty4S7g4BiiXC
        Xp0znteNr40HPzmkR0Lckt4EuXzp
X-Google-Smtp-Source: ABdhPJyog1n/10dz8f1tgErG2o8JNzlWodvORXe9exYsr/fsxMBhrQ6I+vShW0pUyEIDdfV2pnP01A==
X-Received: by 2002:a63:db18:: with SMTP id e24mr24014892pgg.192.1593763615188;
        Fri, 03 Jul 2020 01:06:55 -0700 (PDT)
Received: from brian-ubuntu.lan ([2601:647:5800:8d47:15f1:d2b6:764f:b105])
        by smtp.gmail.com with ESMTPSA id x10sm11080992pfp.80.2020.07.03.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 01:06:54 -0700 (PDT)
From:   Brian Norris <computersforpeace@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.or>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jaiganesh Narayanan <njaigane@codeaurora.org>,
        Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/2] pinctrl: qcom: ipq4019: add open drain support
Date:   Fri,  3 Jul 2020 01:06:45 -0700
Message-Id: <20200703080646.23233-1-computersforpeace@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jaiganesh Narayanan <njaigane@codeaurora.org>

Signed-off-by: Jaiganesh Narayanan <njaigane@codeaurora.org>
[ Brian: adapted from from the Chromium OS kernel used on IPQ4019-based
  WiFi APs. ]
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c     | 13 +++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h     |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index 8bdb5bd393d2..63915cb210ff 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -254,6 +254,7 @@ DECLARE_QCA_GPIO_PINS(99);
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.od_bit = 12,			\
 		.oe_bit = 9,			\
 		.in_bit = 0,			\
 		.out_bit = 1,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83b7d64bc4c1..dac0404dadf4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -233,6 +233,10 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 		*bit = g->pull_bit;
 		*mask = 3;
 		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		*bit = g->od_bit;
+		*mask = 1;
+		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		*bit = g->drv_bit;
 		*mask = 7;
@@ -310,6 +314,12 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 		if (!arg)
 			return -EINVAL;
 		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		/* Pin is not open-drain */
+		if (!arg)
+			return -EINVAL;
+		arg = 1;
+		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		arg = msm_regval_to_drive(arg);
 		break;
@@ -382,6 +392,9 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 			else
 				arg = MSM_PULL_UP;
 			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			arg = 1;
+			break;
 		case PIN_CONFIG_DRIVE_STRENGTH:
 			/* Check for invalid values */
 			if (arg > 16 || arg < 2 || (arg % 2) != 0)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 9452da18a78b..dc7f8c84744b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -38,6 +38,7 @@ struct msm_function {
  * @mux_bit:              Offset in @ctl_reg for the pinmux function selection.
  * @pull_bit:             Offset in @ctl_reg for the bias configuration.
  * @drv_bit:              Offset in @ctl_reg for the drive strength configuration.
+ * @od_bit:               Offset in @ctl_reg for controlling open drain.
  * @oe_bit:               Offset in @ctl_reg for controlling output enable.
  * @in_bit:               Offset in @io_reg for the input bit value.
  * @out_bit:              Offset in @io_reg for the output bit value.
@@ -75,6 +76,7 @@ struct msm_pingroup {
 	unsigned pull_bit:5;
 	unsigned drv_bit:5;
 
+	unsigned od_bit:5;
 	unsigned oe_bit:5;
 	unsigned in_bit:5;
 	unsigned out_bit:5;
-- 
2.17.1

