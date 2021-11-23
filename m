Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8DD45AA3E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 18:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239289AbhKWRp1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 12:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238958AbhKWRp0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 12:45:26 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9A7C061574;
        Tue, 23 Nov 2021 09:42:18 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id v15so12821601ljc.0;
        Tue, 23 Nov 2021 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klioHbiKDOj23wJ2ag02+ri9HjhHB0e0XDitPdnTUKE=;
        b=jqu3l7OMPjegIvzh95GLnRoNekIQeM70R2xijFnWweilxN0ALne43+QG+msvzf/71m
         lvThgOSIm2mVPbAAAHB7egFiHnQ+GQf//xc5yY0SYNEpnQ6e0yNnHXYubDJXVf5sdaYK
         9exeSd+ShN56wnRH/hueQeKlMAikBeGJ9OQBjo5raFS4wguzx8zPIiK9/cY8xYhbLHZU
         Fh8CiAoVN8DRNF02wxwAzup4QNlRQDZyy2hkxlrgJR5sGND3KZTnutwhliv0rmVjY0XK
         ueQJxQC/BG0m0xT9RV27ZvhxaV8rSzESBDvS96fqY3PQqXbBOyZpcBqzJDxMUqJ4eX/A
         7C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klioHbiKDOj23wJ2ag02+ri9HjhHB0e0XDitPdnTUKE=;
        b=bpV/5sOM3ynrvAPYtcAZ5DplQI7heL2tasuFVS6XISYaOtX79WyEckZM6u3xvyaR21
         EzndaVwNviCMAYhKj2ireKvj3oI4oozg+YR3SUz1NLlB3MNt3vJG0Gn6ZJ47w1nT5Qei
         l6cc7BCXj0UIEKBMOp7Tq67HMBm70eHpYzwxWoWjiqn7hUOsJQul05eeIZcqPplZZIxV
         gwCUXjfPL5jciBfmonzteRTovPKlhh/juebkYp4jWzr40tjQPI3gsjEvsgxFcPkfRdvJ
         SqNiVMxwOpaDAaEajVzZ9hnLxvmqykvuXU/C7Nk37RRQFo2E12pVV/h0Z0Kd7nzRLMle
         Lb3Q==
X-Gm-Message-State: AOAM533aCRNMAO5pW3KQ8zaNp4AZJSNLeKrTewmhnJ+J05708s0Vxxgh
        QqDTIRF2qniNdT9U6rlJ+38=
X-Google-Smtp-Source: ABdhPJwU6PsiQz2y0XovRimIF2l/X+gdP6soUOaF2IniBdFEDST5rjRdPc+qy8hEqPk/KJRw6ZBu6w==
X-Received: by 2002:a2e:781a:: with SMTP id t26mr7379120ljc.90.1637689336549;
        Tue, 23 Nov 2021 09:42:16 -0800 (PST)
Received: from localhost.localdomain (public-gprs375115.centertel.pl. [37.47.96.140])
        by smtp.googlemail.com with ESMTPSA id l12sm1349371lfk.212.2021.11.23.09.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 09:42:16 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH 1/4] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
Date:   Tue, 23 Nov 2021 18:41:27 +0100
Message-Id: <20211123174127.2261-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pm8226 SPMI GPIOs. The PMIC features
8 GPIOs, with no holes inbetween.

Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 5283d5e9e8bc..0f0102f38cbb 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1159,6 +1159,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmc8180c-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8226-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
-- 
2.34.0

