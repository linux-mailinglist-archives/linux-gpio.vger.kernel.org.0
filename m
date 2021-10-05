Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F95A422B5F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 16:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235410AbhJEOph (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 10:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235404AbhJEOpg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 10:45:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5041C061760
        for <linux-gpio@vger.kernel.org>; Tue,  5 Oct 2021 07:43:45 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r19so4586073lfe.10
        for <linux-gpio@vger.kernel.org>; Tue, 05 Oct 2021 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B1tfgMXD/HCZM2/dbxQ/czHnewIDG6QY34tUjSKvwfk=;
        b=gYMmIoDKpse0c+Q7qiqYg0+v2B6gXr+jAadavabR39m5gESeZJUwbgjlZKbl9rXu85
         MJW2pDk0YzmMdVwPcE3DJ+Z2dFsaJUUHQhn2tTQHo4ba+l+Mr9zelFXfSgUDTefNGDQx
         hPad9cjhlSy++u+uZj0R0mb3S/gy7lMtnJxVjn35KWSbQLUUNH/qRKg0QEBaFqxHmHEb
         vp5T5K5+aTw4rbAQJXqb27/hiNGbAYh0X8ZJzkCM+1bj5L2io9cOe6Unshd/UFe+gZ+t
         wv2oiZ0cnDDlpaRqoWEhjGVI+OUZgPyoyaAsrDrcFWdK8KOtkdUL5PSkvYMV5O6ZaFjA
         w6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B1tfgMXD/HCZM2/dbxQ/czHnewIDG6QY34tUjSKvwfk=;
        b=Ac96JDFCqGa3gqWFNMDe6+89DjFjANt7BNTNwfAmfoT/+CIC8a7TxgSKAd9GFRnEE/
         MhwajVE+lx8ba8AcSyvcyilmDAFaY4Z26Ru4FopaZ1xZvEV4kQfhSDv3VGe/T58Dgd+X
         69a8jRilpvFkzbZ6ptHB3pGWUJKi/BVWQMVW7Wy4AE/8sAE9nyE0h9hf6FuIIjdUpybz
         lO4mGubM4DJrby3UQ0pizPQQrekgF38pyKv/S/3zQONEi0BEWd+tMZqy7vOotFQhrqdB
         20KClLkV3lAhdWuq0dLDBFxPRy7RyUPPPkv5t9hPmIy6CFcLBSjF0h1ZBq2YLhV1c57T
         Wd6Q==
X-Gm-Message-State: AOAM531d8H9baz+RUzODQlK3DmICmzvW0Ido7UUITE7+1yIMaytlvcPd
        iiRjcMLoo5btYTWBYQoazrYw/Q==
X-Google-Smtp-Source: ABdhPJwws2xT8ilsz3njHET6lQt5qrDD8SnEtkklCVzJIH8fqpGNJgoOvlOMTj6CDBI2zxIrCDb5Dg==
X-Received: by 2002:a2e:140f:: with SMTP id u15mr22045377ljd.361.1633445017098;
        Tue, 05 Oct 2021 07:43:37 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm1987173ljc.120.2021.10.05.07.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:43:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/6] pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
Date:   Tue,  5 Oct 2021 17:43:26 +0300
Message-Id: <20211005144329.2405315-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
References: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The probing of this driver calls platform_irq_count, which will
setup all of the IRQs that are configured in device tree. In
preparation for converting this driver to be a hierarchical IRQ
chip, hardcode the IRQ count based on the hardware type so that all
the IRQs are not configured immediately and are configured on an
as-needed basis later in the boot process.

This change will also allow for the removal of the interrupts property
later in this patch series once the hierarchical IRQ chip support is in.

This patch also removes the generic qcom,ssbi-mpp OF match since we
don't know the number of pins. All of the existing upstream bindings
already include the more-specific binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 92e7f2602847..a90cada1d657 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -733,13 +733,12 @@ static int pm8xxx_pin_populate(struct pm8xxx_mpp *pctrl,
 }
 
 static const struct of_device_id pm8xxx_mpp_of_match[] = {
-	{ .compatible = "qcom,pm8018-mpp" },
-	{ .compatible = "qcom,pm8038-mpp" },
-	{ .compatible = "qcom,pm8058-mpp" },
-	{ .compatible = "qcom,pm8917-mpp" },
-	{ .compatible = "qcom,pm8821-mpp" },
-	{ .compatible = "qcom,pm8921-mpp" },
-	{ .compatible = "qcom,ssbi-mpp" },
+	{ .compatible = "qcom,pm8018-mpp", .data = (void *) 6 },
+	{ .compatible = "qcom,pm8038-mpp", .data = (void *) 6 },
+	{ .compatible = "qcom,pm8058-mpp", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8821-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8917-mpp", .data = (void *) 10 },
+	{ .compatible = "qcom,pm8921-mpp", .data = (void *) 12 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_mpp_of_match);
@@ -750,19 +749,14 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
 	struct pinctrl_pin_desc *pins;
 	struct pm8xxx_mpp *pctrl;
 	int ret;
-	int i, npins;
+	int i;
 
 	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
 
 	pctrl->dev = &pdev->dev;
-	npins = platform_irq_count(pdev);
-	if (!npins)
-		return -EINVAL;
-	if (npins < 0)
-		return npins;
-	pctrl->npins = npins;
+	pctrl->npins = (uintptr_t) device_get_match_data(&pdev->dev);
 
 	pctrl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!pctrl->regmap) {
-- 
2.30.2

