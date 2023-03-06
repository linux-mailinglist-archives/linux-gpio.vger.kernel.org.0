Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2682D6AC00C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 14:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbjCFNAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 08:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjCFNAI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:00:08 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39962B2A0
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 05:00:06 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id c3so10265423qtc.8
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678107605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/feQdxSWBBHDGGbMHYFUMUP4pSJHbah0Lsh8WVSth1E=;
        b=MJlh4tfyyKgAKN/WywdmSPVx2i9YYBtlw1lDs+tCbaKGCfgVwdNu8gP9bNIX78rxYK
         EEDYQYim2P75mxUXRtCYVb/psF9mtg8Z/ojb/rxZAkhV0hwwDsFA70pSmGYIberWYC73
         9GfDt20kCTDtDYjyO/vFp5piZqPCrgjxeJAFkCILQaPvZpH9W5vDKnBT2kTp6EUbZJCI
         k3SmmgfUw/0fTw/XIJtRfL3NMwPdJ19i5Bk3TldTKJAxdQB5wOeDWkOfDD7ExKJBeJLr
         edV/re9ovlaPJSN7peWbVUF61xUFnsmKqro9EQG9OG2Sg+bb/jWKSsp0Oq1+nbzzZb+K
         N8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678107605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/feQdxSWBBHDGGbMHYFUMUP4pSJHbah0Lsh8WVSth1E=;
        b=C9WEmNzkYwiWwn70u/tCsfiXoXJ8eO/lbi+wzVml4M2loT3k584iI0K1a/r7g8FpmO
         AbVwvH4nmyAYM5GHjkXPZ2+uVbQL/sq8UeFNv8Fr0d8ptovmT6cNRRVEjYTf7xKqodoB
         y52J+dgSLtAtj4ki4jbMDRuLd7QdH0okasygghAqmtazL3sll23+kxgFG1gPJi8s+k4z
         zJkqsMNtd0ggfA1bW8F6THuGVGKkkJ3bbbl01wy8CHNbtysXpXXbNz7md7xaV7g07syc
         +vt+E1sqJgdpTtS5SwD7OtPFDuRXaD5/+BKLCPTivVzDPYbCYWV4KOU7OaF7mDfhE5/L
         pj7A==
X-Gm-Message-State: AO0yUKV9uFWb2sSFn8lfL6XFj6I1XhSQGIIKM9jRQH8KvWn3gtErXjTm
        GvQPF4fcMbv90EgJELUXZoIQMA==
X-Google-Smtp-Source: AK7set9vDYfHo8E94vvRMn2AlgMgYjMyPUf5DYnTI/WfgWna/1kf1WgVpvmlYDNgAKzQ47krkmkkbA==
X-Received: by 2002:a05:622a:1981:b0:3bf:da2e:8c74 with SMTP id u1-20020a05622a198100b003bfda2e8c74mr18968335qtc.25.1678107605475;
        Mon, 06 Mar 2023 05:00:05 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id w19-20020ac843d3000000b003bfbf3afe51sm7419187qtn.93.2023.03.06.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:00:05 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, andriy.shevchenko@linux.intel.com,
        William Breathitt Gray <william.gray@linaro.org>,
        techsupport@winsystems.com, pdemetrotion@winsystems.com,
        quarium@gmail.com, jhentges@accesio.com, jay.dolan@accesio.com
Subject: [PATCH v4 1/3] regmap: Pass irq_drv_data as a parameter for set_type_config()
Date:   Mon,  6 Mar 2023 07:59:51 -0500
Message-Id: <ea1533c747c462755c6dbb8d5dc80fa29bbc96d0.1678106722.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678106722.git.william.gray@linaro.org>
References: <cover.1678106722.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow the struct regmap_irq_chip set_type_config() callback to access
irq_drv_data by passing it as a parameter.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
Changes in v4: none
Changes in v3:
 - Drop map from set_type_config() parameter list; regmap can be passed
   by irq_drv_data instead
Changes in v2: none

 drivers/base/regmap/regmap-irq.c | 8 +++++---
 include/linux/regmap.h           | 6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 8c903b8c9714..e489b235b36b 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -329,8 +329,8 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 	}
 
 	if (d->chip->set_type_config) {
-		ret = d->chip->set_type_config(d->config_buf, type,
-					       irq_data, reg);
+		ret = d->chip->set_type_config(d->config_buf, type, irq_data,
+					       reg, d->chip->irq_drv_data);
 		if (ret)
 			return ret;
 	}
@@ -651,13 +651,15 @@ EXPORT_SYMBOL_GPL(regmap_irq_get_irq_reg_linear);
  * @type: The requested IRQ type.
  * @irq_data: The IRQ being configured.
  * @idx: Index of the irq's config registers within each array `buf[i]`
+ * @irq_drv_data: Driver specific IRQ data
  *
  * This is a &struct regmap_irq_chip->set_type_config callback suitable for
  * chips with one config register. Register values are updated according to
  * the &struct regmap_irq_type data associated with an IRQ.
  */
 int regmap_irq_set_type_config_simple(unsigned int **buf, unsigned int type,
-				      const struct regmap_irq *irq_data, int idx)
+				      const struct regmap_irq *irq_data,
+				      int idx, void *irq_drv_data)
 {
 	const struct regmap_irq_type *t = &irq_data->type;
 
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 4d10790adeb0..fb92d0ac13af 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1650,7 +1650,8 @@ struct regmap_irq_chip {
 	int (*set_type_virt)(unsigned int **buf, unsigned int type,
 			     unsigned long hwirq, int reg);
 	int (*set_type_config)(unsigned int **buf, unsigned int type,
-			       const struct regmap_irq *irq_data, int idx);
+			       const struct regmap_irq *irq_data, int idx,
+			       void *irq_drv_data);
 	unsigned int (*get_irq_reg)(struct regmap_irq_chip_data *data,
 				    unsigned int base, int index);
 	void *irq_drv_data;
@@ -1659,7 +1660,8 @@ struct regmap_irq_chip {
 unsigned int regmap_irq_get_irq_reg_linear(struct regmap_irq_chip_data *data,
 					   unsigned int base, int index);
 int regmap_irq_set_type_config_simple(unsigned int **buf, unsigned int type,
-				      const struct regmap_irq *irq_data, int idx);
+				      const struct regmap_irq *irq_data,
+				      int idx, void *irq_drv_data);
 
 int regmap_add_irq_chip(struct regmap *map, int irq, int irq_flags,
 			int irq_base, const struct regmap_irq_chip *chip,
-- 
2.39.2

