Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4AC3A7867
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 09:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhFOHwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 03:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhFOHvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 03:51:53 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B428C0613A3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:49 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id o88-20020a17090a0a61b029016eeb2adf66so1086738pjo.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bLfug41KVgS8QwhKgdDpf17Gh2yCuqzm2B1HR6V7kSQ=;
        b=irDRlDL7X1yLJIf1BNnCEPedzyb5KPte5tkIyfJkfWNJN69SIKa94Efr0HsO37IV/U
         blB152fy1QW0f451J5TGwaxeWzUTqSNkBmj90sZQ7f72k0oXkmOPFqhu0NcmwP+EXpe8
         EA/9hYjZlNg3aP7wRG11vH5t1fNTLA+oVuyTdVTdKoAbE8NnxOFt7FpzqpZzdreEmBRi
         6h1wMKu78Phw7YXuEgdZOHCnFpHmKVc/xlcvZpQC2xVf9EzLEsUPp5jHRMTXOS25X0FR
         ys9umdHBoPunSVp/jyA8ebQ/MoSM5cW7lNw5vb+5l/HVYQ+CfFdzCBr/yRBuUGjCMXji
         Ur4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bLfug41KVgS8QwhKgdDpf17Gh2yCuqzm2B1HR6V7kSQ=;
        b=XocZouTg88+VtmZjVsMY4D/7tqpOAHTBtwMmvw8cpHTMSA8RDOnAbfooexQNFmq9r/
         5TmH687acNn79B5FQ2KUh8WSTjO/MkiPx+I30u63P/+byiYDuTwk6qQHb4Q1ZxoBd+0X
         yp2zAFgzJeMSMclcWE1LLymAZAjymHlowAr6smK2j6FmnAhI1eR/lvfM2UgiVAyEf0pp
         83yK0KS3fNCU74ZRGKiCV79lb7dE3jsJTzSPZk1Ah9paeGcjm/xZgUsvfsOZezqg+SVh
         OU44h8D/0kkP3cYpAR9DoeCW340Etm/j/LcFpxm8P5igEzOOBy+lE786w8mVF3gpYstZ
         To2Q==
X-Gm-Message-State: AOAM531NqDPJq025iLdfPBa7DQoR05iXF2t1Q20rlRmMD/2MJ8LdQiJ8
        f7k8g90gPhUthXnuh6aXAippyQ==
X-Google-Smtp-Source: ABdhPJw+k0l+t8wDSvmtX9WX1CS+pgbRdSl4Z0t2W3TIHUWvl+hjzatDZSYOZZikTbO1rLP/DOH5PQ==
X-Received: by 2002:a17:90b:3ec3:: with SMTP id rm3mr24186956pjb.105.1623743389143;
        Tue, 15 Jun 2021 00:49:49 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:48 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 07/10] pinctrl: qcom/pinctrl-spmi-gpio: Add compatible for pmic-gpio on SA8155p-adp
Date:   Tue, 15 Jun 2021 13:15:40 +0530
Message-Id: <20210615074543.26700-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SA8155p-adp PMIC (PMM8155AU) exposes 10 GPIOs.

Add support for the same in the pinctrl driver.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 00870da0c94e..f886c683e2bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1127,6 +1127,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
-- 
2.31.1

