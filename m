Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25ADE3B6BC9
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 02:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhF2Amb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 20:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhF2Amb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jun 2021 20:42:31 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11037C061767
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 17:40:05 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so20862559otl.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6u2RG+sSlQSg+vc0Yj3ZZoGIOveJe7hDDIdJuTdPGM=;
        b=V7kB/DTMK3LIspUUD1BmuRSiNMAFWbl/cBxbK8vYtvWpknYr2jZxiezDpkU72ZqF5k
         O1Ecv5duSmcx8T4oheVkiSi8ooNi05+LnksmjSpCHyeIto8ZLMa9DMdGce/6/FuVU8y7
         mEJIHhOLgSpkJWf8M6qgELcafcQUnrPK/nzSLlq4LN5D/Sb9ivmP6B8+ZKrXqJ01QP12
         4ZLPo+Xbbw/bdcd99VLGQuWL/PpHXc8aMa7Jg4gqB+FP9YfT8kquduBkSsFGnTuNwC8z
         erocY2F9DV9i3QnpXfCC5aCtVc3ZdhlLw8xCCUxahG4grVseNIjApmrsnWysZzUNJaEL
         C7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6u2RG+sSlQSg+vc0Yj3ZZoGIOveJe7hDDIdJuTdPGM=;
        b=efx1gOZjk6Xj12mOBWk0eCxST3EICob4NRNQGr6uKsgvc4zgzVlzZZA/7GFej4g6jH
         Yo0Bx6LpI/brhonfBPguWcbkOL8av8+U/25pL8ikFRSRy3QDzmkxQqAsCSFuIzW7SYEI
         SzVkRIM+/Ar7JOHCbBtASwoEtk8i+vU5DgSxmmeG6JI8UUHOI64zZGuovgu4FH41il23
         DpxrCL52L7D4aWLjiN6eP38l+Uhxyq3LxlMjmIbhTzVG2OfOKB2qZB1De1dOp65yQkNr
         yo2nD3XqjkayCdzddkzzH9t7jfKHZJlRAOntcW8c57BzZonLPj1oaw8MbRd6c0jiHNeX
         51vg==
X-Gm-Message-State: AOAM532Scd7vt/6KI+l8OlKxWmqtNeVI1oiJheS/I16NAXPpgwMmjnpB
        Nls/3X9AK1q8VYqNgm5eG4kn9g==
X-Google-Smtp-Source: ABdhPJxspl+N2dD5PBNJ3IIY9QGvG1iX57PP0YC/Ke4tIoOF5jmqOC0AlSIrVBSZ5i/lB7SrqYu6uw==
X-Received: by 2002:a9d:68d1:: with SMTP id i17mr1990775oto.227.1624927204360;
        Mon, 28 Jun 2021 17:40:04 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7sm1860832oia.42.2021.06.28.17.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 17:40:04 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: spmi-gpio: Add pmc8180 & pmc8180c
Date:   Mon, 28 Jun 2021 17:38:51 -0700
Message-Id: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SC8180x platform comes with PMC8180 and PMC8180c, add support for
the GPIO controller in these PMICs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 161216daf463..412613c80e9e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -30,6 +30,8 @@ PMIC's from Qualcomm.
 		    "qcom,pm8350-gpio"
 		    "qcom,pm8350b-gpio"
 		    "qcom,pm8350c-gpio"
+		    "qcom,pmc8180-gpio"
+		    "qcom,pmc8180c-gpio"
 		    "qcom,pmk8350-gpio"
 		    "qcom,pm7325-gpio"
 		    "qcom,pmr735a-gpio"
@@ -120,6 +122,8 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio10 for pm8350
 		    gpio1-gpio8 for pm8350b
 		    gpio1-gpio9 for pm8350c
+		    gpio1-gpio10 for pmc8180
+		    gpio1-gpio12 for pmc8180c
 		    gpio1-gpio4 for pmk8350
 		    gpio1-gpio10 for pm7325
 		    gpio1-gpio4 for pmr735a
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index a89d24a040af..9251fb5153e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1123,10 +1123,12 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pmc8180-gpio", .data = (void *) 10 },
 	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
 	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pmc8180c-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
-- 
2.29.2

