Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF5C368EC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 03:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfFFBCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 21:02:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:47001 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbfFFBCy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 21:02:54 -0400
Received: by mail-pf1-f193.google.com with SMTP id y11so360909pfm.13
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2019 18:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CVfY2rC28TUuJiq3uH1wJEhWN7/kC8yOQdwb0MYva/0=;
        b=p3A3rKuHCefXZWN7fWg4nX9E9dn1cL6KkVkiCyfgemW5z+YDAhDOOzLE2Wt6m3AywB
         PPWMt5gnn/3cS9b7n/IXqu8mD7tivfsbbGAs0NR1j1euURvrjyAtcN4QZi7A1zWxGAiV
         gpW2Anv4nHlPa0Z3Ft+nrox4RKEBmzlDe/09UkdUe8lfykT+C+KtqejLv/AlZdNxkt5G
         V0WX9bxKce6MZXbfnI4TbzUmgHfGxEspgmrh1PHamE+fBA1nkxZZ5ZetzV4VZEQAAydg
         oGtS0ZFd59yPQU/2+Q3okeTDPCVMUbDg3+PSBxlm9T0qVZNZ05tfFoIikARM3Tc2NUpp
         zq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CVfY2rC28TUuJiq3uH1wJEhWN7/kC8yOQdwb0MYva/0=;
        b=hvztJwFoElEH2iiztoRg9GxaLpuAUs63n8fyR7RimTfucGZ5Ae5/dqIu76eqMbgiwe
         2EuhxyflowZJLaWbPJEjuN7UA3V609PEM4+uzGoTKODucWZ3dP+jsaw1RZbK/wYBMXLZ
         JTeem2SqZMtCZq6jfXPW4aToS6DF8uGU1xPuoykg4KdGH8CqGSYe7LoTdR4z4d2eOpJK
         +7/pEhpgL4AG1NGV3LYxowrujDqmzSu85zB7oZmOkT8pAO9o3XeaLjYUdFt0xr/qX9Ji
         NkDOsdlQSUFVTKORcLZRgFIZrGVGXISOSzqUM1hPlI9eHbQOFmcGurKMN90uIzJOBotl
         ecuA==
X-Gm-Message-State: APjAAAVrGs06lAMLYYJu7vBA2c0QBavQbcfLrKGfdv82IzCz6zNyt8f1
        askhaPGKbXwT+f8FYLA3fRptjA==
X-Google-Smtp-Source: APXvYqyCypg6oVvwk6Ue9xlyaT78SEVJA7D+c9VA4Krrku8TKMD49Au/WSck38jKYsQVj/zgTSIYMg==
X-Received: by 2002:a62:ce07:: with SMTP id y7mr22987027pfg.12.1559782974090;
        Wed, 05 Jun 2019 18:02:54 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 144sm170856pfy.54.2019.06.05.18.02.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 18:02:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: qcom: sdm845: Expose ufs_reset as gpio
Date:   Wed,  5 Jun 2019 18:02:47 -0700
Message-Id: <20190606010249.3538-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190606010249.3538-1-bjorn.andersson@linaro.org>
References: <20190606010249.3538-1-bjorn.andersson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ufs_reset pin is expected to be wired to the reset pin of the
primary UFS memory but is pretty much just a general purpose output pinr

Reorder the pins and expose it as gpio 150, so that the UFS driver can
toggle it.

Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt         |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c                | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
index 321bdb9be0d2..7462e3743c68 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
@@ -79,7 +79,7 @@ to specify in a pin configuration subnode:
 		      gpio0-gpio149
 		        Supports mux, bias and drive-strength
 
-		      sdc2_clk, sdc2_cmd, sdc2_data
+		      sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset
 		        Supports bias and drive-strength
 
 - function:
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index c97f20fca5fd..e4e5acade086 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -420,10 +420,10 @@ DECLARE_MSM_GPIO_PINS(147);
 DECLARE_MSM_GPIO_PINS(148);
 DECLARE_MSM_GPIO_PINS(149);
 
-static const unsigned int sdc2_clk_pins[] = { 150 };
-static const unsigned int sdc2_cmd_pins[] = { 151 };
-static const unsigned int sdc2_data_pins[] = { 152 };
-static const unsigned int ufs_reset_pins[] = { 153 };
+static const unsigned int ufs_reset_pins[] = { 150 };
+static const unsigned int sdc2_clk_pins[] = { 151 };
+static const unsigned int sdc2_cmd_pins[] = { 152 };
+static const unsigned int sdc2_data_pins[] = { 153 };
 
 enum sdm845_functions {
 	msm_mux_gpio,
@@ -1271,10 +1271,10 @@ static const struct msm_pingroup sdm845_groups[] = {
 	PINGROUP(147, NORTH, _, _, _, _, _, _, _, _, _, _),
 	PINGROUP(148, NORTH, _, _, _, _, _, _, _, _, _, _),
 	PINGROUP(149, NORTH, _, _, _, _, _, _, _, _, _, _),
+	UFS_RESET(ufs_reset, 0x99f000),
 	SDC_QDSD_PINGROUP(sdc2_clk, 0x99a000, 14, 6),
 	SDC_QDSD_PINGROUP(sdc2_cmd, 0x99a000, 11, 3),
 	SDC_QDSD_PINGROUP(sdc2_data, 0x99a000, 9, 0),
-	UFS_RESET(ufs_reset, 0x99f000),
 };
 
 static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
@@ -1284,7 +1284,7 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.nfunctions = ARRAY_SIZE(sdm845_functions),
 	.groups = sdm845_groups,
 	.ngroups = ARRAY_SIZE(sdm845_groups),
-	.ngpios = 150,
+	.ngpios = 151,
 };
 
 static int sdm845_pinctrl_probe(struct platform_device *pdev)
-- 
2.18.0

