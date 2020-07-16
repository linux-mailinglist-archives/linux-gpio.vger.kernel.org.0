Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04744222D91
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgGPVQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:16:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgGPVQt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 17:16:49 -0400
Received: from embeddedor (unknown [201.162.240.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48DF720760;
        Thu, 16 Jul 2020 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594934209;
        bh=8VD2+aiY77GJqGWBooe1O36nHfabIoRq7MZJbjlehuY=;
        h=Date:From:To:Cc:Subject:From;
        b=D3fi9UQFPjePmFvXTssBTYmVIslmFyAvPO9ZmGrfJNPnBoT8S3Dh/37zZyk3o93/n
         5htJuIY8AFIfy27Fjc/yxl026+hl+KO6u8lVw8wb5nJRGH+ALCi6Z+NC7Bp9OknnCq
         CixBS0SX9fCY/CBu+EmbyhWFbCkBcW71qbiLzD9M=
Date:   Thu, 16 Jul 2020 16:22:13 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] pinctrl: qcom: spmi-gpio: Use fallthrough
 pseudo-keyword
Message-ID: <20200716212213.GA17623@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 66cbcfe7950e..17441388ce8f 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -794,13 +794,13 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	switch (subtype) {
 	case PMIC_GPIO_SUBTYPE_GPIO_4CH:
 		pad->have_buffer = true;
-		/* Fall through */
+		fallthrough;
 	case PMIC_GPIO_SUBTYPE_GPIOC_4CH:
 		pad->num_sources = 4;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_8CH:
 		pad->have_buffer = true;
-		/* Fall through */
+		fallthrough;
 	case PMIC_GPIO_SUBTYPE_GPIOC_8CH:
 		pad->num_sources = 8;
 		break;
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 338a15d08629..b5949f766a7a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -346,7 +346,7 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
 				return -EINVAL;
 			}
 			pin->pull_up_strength = arg;
-			/* FALLTHROUGH */
+			fallthrough;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			pin->bias = pin->pull_up_strength;
 			banks |= BIT(2);
-- 
2.27.0

