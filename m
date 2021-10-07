Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62447425EBE
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 23:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241393AbhJGV1V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 17:27:21 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58962 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241332AbhJGV1U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:20 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 05359C91C6;
        Thu,  7 Oct 2021 21:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641925; bh=Dnqi2pXbnY/JNzz6QlVr9FCTaGk42dEDlrk2dXM7fDo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=erO7v6gELfmyQo7hR8h1fUL/ksea5eKHrKTp+YpRXkN/dLnpGJzVAYkpTe4MsndeO
         9vA5qm2WDS36Y4wQZ5l20dvQ2bNlfVlIX9ymveqvFRKw8KOPwJFMrVqHrMYNeqTJTt
         3x3J2wPYzSzl/KbxxGc8LoUVx8jBXJ5Bierk1oCc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] pinctrl: qcom: spmi-gpio: Add compatible for PM6350
Date:   Thu,  7 Oct 2021 23:24:32 +0200
Message-Id: <20211007212444.328034-6-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO controller in the pm6350 PMIC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 98bf0e2a2a8d..55a9227a87fd 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1110,6 +1110,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm6350-gpio", .data = (void *) 9 },
 	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
-- 
2.33.0

