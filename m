Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313382AE774
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 05:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgKKEgX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 23:36:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:53304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgKKEgW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 23:36:22 -0500
Received: from localhost.localdomain (unknown [122.179.121.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39576206F1;
        Wed, 11 Nov 2020 04:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605069382;
        bh=NlRCvFMJxj3vy4pv5YqhpHYWFTILGbvdawvP8q3lqPc=;
        h=From:To:Cc:Subject:Date:From;
        b=nVRr6p/MmEqo9M9qGaElfY/pzxxEUbHjvdckQO4LuhixhloHaOEVKsi9UknVhOPgC
         dKjLoIb46pKXyqs0wo6/YN/jEqVnYllxCz4mHDsdilxKIvc5q50nASL+5IJOpVCdc1
         tx2LsUOb12JMEcoCy/6i9rPr7oYKwStTz/9KGrXU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: sdx55: update kconfig dependency
Date:   Wed, 11 Nov 2020 10:06:10 +0530
Message-Id: <20201111043610.177168-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit be117ca32261 ("pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a
dependency rather then a selected config") moved the qcom pinctrl drivers
to have PINCTRL_MSM as dependency rather then a selected config, so do
this change for SDX55 pinctrl driver as well.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 8bdf878fe970..dcc046a921cc 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -232,7 +232,7 @@ config PINCTRL_SDM845
 config PINCTRL_SDX55
 	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
-- 
2.26.2

