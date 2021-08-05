Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24C53E1EC8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 00:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhHEWev (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 18:34:51 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:44935 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbhHEWev (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 18:34:51 -0400
X-Greylist: delayed 481 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Aug 2021 18:34:50 EDT
Received: from localhost.localdomain (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id CA9B33F3FD;
        Fri,  6 Aug 2021 00:26:29 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8019 support
Date:   Fri,  6 Aug 2021 00:26:24 +0200
Message-Id: <20210805222625.40236-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for pm8019 pmic GPIO support to the
Qualcomm PMIC GPIO binding.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 161216daf463..4875e039ceaa 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -9,6 +9,7 @@ PMIC's from Qualcomm.
 	Definition: must be one of:
 		    "qcom,pm8005-gpio"
 		    "qcom,pm8018-gpio"
+		    "qcom,pm8019-gpio"
 		    "qcom,pm8038-gpio"
 		    "qcom,pm8058-gpio"
 		    "qcom,pm8916-gpio"
-- 
2.32.0

