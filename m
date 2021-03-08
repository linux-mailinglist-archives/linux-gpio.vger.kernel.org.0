Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0493C3313C4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCHQtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:49:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:51974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230075AbhCHQtA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 11:49:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 194DD6518D;
        Mon,  8 Mar 2021 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615222140;
        bh=sZCMfZxoIn+wvZELS1q/HTcvsK5IrpgordzCJsx1YJI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JPqx/IcbtMp3hvw/qzD2d+DBgFlTkTYz2gqiMYhyWyKq8KP9XcMEtIrnRr2PftCVc
         ZqviDuQJpGtn0zRrmB8JbvZq5sMGDD+g4HE6V2iIkyRNjRnm94jcMYWLbp6hqlD1UK
         vc2UZg7L45stLtGyEmNFPuqRDRSNMCq3haubtbFi/B365bvwEf/pNfxC2lJbp1KbEI
         h90VXOPhfOBkurcgT4ynz+bFadfgk3TxN4Y4ndMOm0Ju+tn3OBoGyDTNRVuLsTOFrB
         J3CPEkuHexK9yrxdbbLOzmJCkDzp1DnTEf3nSkSuY5xi0++fCTo9v90OdY6ItThZ/K
         9d26Hfvyy/s8Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add support for PM8350 and friends
Date:   Mon,  8 Mar 2021 22:18:45 +0530
Message-Id: <20210308164845.3210393-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308164845.3210393-1-vkoul@kernel.org>
References: <20210308164845.3210393-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
PMR735B GPIO support to the Qualcomm PMIC GPIO driver.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 9801c717e311..c2b9f2e152bb 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1127,6 +1127,12 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
+	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
+	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
 	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
-- 
2.26.2

