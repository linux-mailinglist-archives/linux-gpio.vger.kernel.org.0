Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D3178FA62
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 11:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235500AbjIAJCh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 05:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348664AbjIAJCg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 05:02:36 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79ECF10E5
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 02:02:33 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c93638322so355913566b.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693558952; x=1694163752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiS/H5TUL5AOig2sH8KG86ddQwR1scb+wSOQyhLNdQA=;
        b=H2hRiSvbTSU1Hh5oIuQ4n7N4eiWDuqWBYh1/6Jp8K4PNLF1uFBA3voAilSBXdT8HTl
         DPq4OBJuhDcQhmY/y72bqlddfPyzI5sT6o4/BMbPWWfYiRCYadEPkTQ9npelAkMhndoy
         bBsnwLfFG45I8tbgnzK9RDCu2LiRkEVK54rtnKztQzljpSQa1zdWgPd2bmgSqo9MyA8l
         kwGjX1yaZuiXNwyL2spaor8dQTRCiKoTIiZQnW3FTRbm1q/HR+n5mQ/7b08z+AsMf9gp
         sbvNeNoUQyoXcuGWXAAvAX8QUfYOVypXBQCBBRGxIp6M+3ALrKtSrXzMj3uGjuU0VswF
         oUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693558952; x=1694163752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiS/H5TUL5AOig2sH8KG86ddQwR1scb+wSOQyhLNdQA=;
        b=IbJGjUzGQaNY0f/kJ5vIol7Mr4ZbVxjITuU/mnkhYg1sQ+dfW4PokhnQM08NUsJjtt
         G610mj8ONV2l0rrv9FpsqUs70uIk4oddh7sNDcV8ixYMqJDZJogG5AKWEmwGs/KwSptz
         McpzerYokjNVeqnfP4YLgY219Pj4+bRq+/OCYkwnLzE8Se59z7V9DpCk+2i1ngXNa387
         BRTi5VWUDNEyqhp1pewOTbdFtCbXAZNOZMwWMqSWOhLJYFFhlgs/W4s214v8X40nq9qg
         waV0BBWvy9fqLFBukfz1Jr8d1Q9KII0GhwT6IRm6Qb0oSj6u8/86x4A1RwXNbz26YmpP
         qUJA==
X-Gm-Message-State: AOJu0Yxry4C5CCFlWLZsP/TgHvz3NKdZYcXuumqscpoXTADb4V1maJJj
        EAvVTzQ8w7tfxRjLyKj5Nqv8xg==
X-Google-Smtp-Source: AGHT+IFWRUPVQkPI2vEfzCIDh07QCEIl/O5hJOWzx26+H+fmjeDcIaE3b2/9SWZndIwnaYtLPLEJkQ==
X-Received: by 2002:a17:906:518d:b0:9a1:b33a:e464 with SMTP id y13-20020a170906518d00b009a1b33ae464mr2664419ejk.31.1693558951985;
        Fri, 01 Sep 2023 02:02:31 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id ov22-20020a170906fc1600b00992c92af6f4sm1753687ejb.144.2023.09.01.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 02:02:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] pinctrl: qcom: lpass-lpi: split slew rate set to separate function
Date:   Fri,  1 Sep 2023 11:02:23 +0200
Message-Id: <20230901090224.27770-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901090224.27770-1-krzysztof.kozlowski@linaro.org>
References: <20230901090224.27770-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Setting slew rate for each pin will grow with upcoming Qualcomm SoCs,
so split the code responsible for this into separate function for easier
readability and maintenance.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 53 +++++++++++++++---------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 0b2839d27fd6..e2df2193a802 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -186,6 +186,35 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
+				    const struct lpi_pingroup *g,
+				    unsigned int group, unsigned int slew)
+{
+	unsigned long sval;
+	int slew_offset;
+
+	if (slew > LPI_SLEW_RATE_MAX) {
+		dev_err(pctrl->dev, "invalid slew rate %u for pin: %d\n",
+			slew, group);
+		return -EINVAL;
+	}
+
+	slew_offset = g->slew_offset;
+	if (slew_offset == LPI_NO_SLEW)
+		return 0;
+
+	mutex_lock(&pctrl->lock);
+
+	sval = ioread32(pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
+	sval &= ~(LPI_SLEW_RATE_MASK << slew_offset);
+	sval |= slew << slew_offset;
+	iowrite32(sval, pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
+
+	mutex_unlock(&pctrl->lock);
+
+	return 0;
+}
+
 static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 			  unsigned long *configs, unsigned int nconfs)
 {
@@ -193,8 +222,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	unsigned int param, arg, pullup = LPI_GPIO_BIAS_DISABLE, strength = 2;
 	bool value, output_enabled = false;
 	const struct lpi_pingroup *g;
-	unsigned long sval;
-	int i, slew_offset;
+	int i, ret;
 	u32 val;
 
 	g = &pctrl->data->groups[group];
@@ -226,24 +254,9 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 			strength = arg;
 			break;
 		case PIN_CONFIG_SLEW_RATE:
-			if (arg > LPI_SLEW_RATE_MAX) {
-				dev_err(pctldev->dev, "invalid slew rate %u for pin: %d\n",
-					arg, group);
-				return -EINVAL;
-			}
-
-			slew_offset = g->slew_offset;
-			if (slew_offset == LPI_NO_SLEW)
-				break;
-
-			mutex_lock(&pctrl->lock);
-
-			sval = ioread32(pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
-			sval &= ~(LPI_SLEW_RATE_MASK << slew_offset);
-			sval |= arg << slew_offset;
-			iowrite32(sval, pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
-
-			mutex_unlock(&pctrl->lock);
+			ret = lpi_config_set_slew_rate(pctrl, g, group, arg);
+			if (ret)
+				return ret;
 			break;
 		default:
 			return -EINVAL;
-- 
2.34.1

