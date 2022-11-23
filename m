Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE11636333
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 16:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236549AbiKWPU0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 10:20:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238722AbiKWPUP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 10:20:15 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA38922FF
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 07:20:11 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id z4so15293301wrr.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN2/QtlLjs6UFWl8nj+yt8+0EJtSW1V4HYBBliOcWZU=;
        b=vASi9wIAwi7NyOC+JAIYezcqoYjpHTurwdRxp58vNKtT/4omMKwrmGjE4iTV4anhri
         OJ3CM7aGpLB27L5O5GqxOED2u/yexkYN4wsEXNzjZuzMkTFQu59j9vq/w736GI7M5chL
         8y/1Wa0MNkKXH5jGV/k/4bfpeya3yHS2n2kzJTV8UY6znWO40gXSj8DkTQ+QzvbTWKJ+
         R/YQToWISv9XZzJjG4lBeIAdS03dghBBllawSeVm4JvqFp9iFvh7jg8/OjotIGeMNHzJ
         OLnH40F1wkeq0asTs4sNHdU+cXlN25BQcNHxdb3ASAmiGVw7FZBmO0zwp4sx5CCT3Fp6
         d49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN2/QtlLjs6UFWl8nj+yt8+0EJtSW1V4HYBBliOcWZU=;
        b=Deb06ZJ7WXKPLqHvi10cmQbUoV0QyV/MCwtWUP+eipUSfJxwSWlfJNsLBk4OVTq+mi
         J006x3LKPM1GY6sGWmn6WkWQUzQphARoqVLspsNKlL4ZxxBdcTLGeZZQtowR5QsMgJc+
         wa8IqBK284keLPzkDNg2ZqWVSsz7iu324jBBs19pmGrhR4+S3IGza8Gl5q17uORCJCxm
         LcTqEc8pn76f2iWkrObW1C/d0s8xyG3rwFgyIYLyJp/UAE2rt2SwR1WDnOjH8pTgLrXM
         VNcPvrlAKwrN33vIkWOPXjhSAzGVZMEueo3LJWQ0kwsVwt1h0Pnsv/9pZrVR5HV6fzAo
         IulA==
X-Gm-Message-State: ANoB5pnx+RrRuU6tB0R4s8W8Hcu4JDEOk+1QGeDi1bZbmaIEEXkJjf77
        33AR7TcrQpw+KOSOl+prvU/7NQ==
X-Google-Smtp-Source: AA0mqf682lXAmgko7RMtxcHSFtApXR2SzqfBO+7Ao5r3yKfKG1PzE/P+1F7t9fIu2vjjipJtd/QXCQ==
X-Received: by 2002:a5d:52d0:0:b0:241:c340:d1ea with SMTP id r16-20020a5d52d0000000b00241c340d1eamr10748919wrv.434.1669216809572;
        Wed, 23 Nov 2022 07:20:09 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l10-20020adff48a000000b002366ded5864sm16764914wro.116.2022.11.23.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:20:09 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 3/4] pinctrl: qcom: add support for i2c specific pull feature
Date:   Wed, 23 Nov 2022 17:20:00 +0200
Message-Id: <20221123152001.694546-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123152001.694546-1-abel.vesa@linaro.org>
References: <20221123152001.694546-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Neil Armstrong <neil.armstrong@linaro.org>

Add support for the new i2c_pull property introduced for SM8550 setting
a I2C specific pull mode on I2C able pins.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v1:
 * Added my missing Signed-off-by tag

 drivers/pinctrl/qcom/pinctrl-msm.c | 20 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 8fbb953c4bbe..f92082c1c805 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -83,6 +83,12 @@ struct msm_pinctrl {
 	u32 phys_base[MAX_NR_TILES];
 };
 
+#define PIN_CONFIG_QCOM_I2C_PULL	(PIN_CONFIG_END + 1)
+
+static const struct pinconf_generic_params msm_pinconf_custom_bindings[] = {
+	{"qcom,i2c-pull", PIN_CONFIG_END + 1, 0},
+};
+
 #define MSM_ACCESSOR(name) \
 static u32 msm_readl_##name(struct msm_pinctrl *pctrl, \
 			    const struct msm_pingroup *g) \
@@ -324,6 +330,12 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 		*bit = g->oe_bit;
 		*mask = 1;
 		break;
+	case PIN_CONFIG_QCOM_I2C_PULL:
+		if (g->i2c_pull_bit == 0)
+			return -EOPNOTSUPP;
+		*bit = g->i2c_pull_bit;
+		*mask = 1;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
@@ -415,6 +427,9 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		arg = 1;
 		break;
+	case PIN_CONFIG_QCOM_I2C_PULL:
+		arg = 1;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
@@ -498,6 +513,9 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 			/* disable output */
 			arg = 0;
 			break;
+		case PIN_CONFIG_QCOM_I2C_PULL:
+			arg = 1;
+			break;
 		default:
 			dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
 				param);
@@ -1495,6 +1513,8 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->desc.name = dev_name(&pdev->dev);
 	pctrl->desc.pins = pctrl->soc->pins;
 	pctrl->desc.npins = pctrl->soc->npins;
+	pctrl->desc.custom_params = msm_pinconf_custom_bindings;
+	pctrl->desc.num_custom_params = ARRAY_SIZE(msm_pinconf_custom_bindings);
 
 	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
 	if (IS_ERR(pctrl->pctrl)) {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 05a1209bf9ae..985eceda2517 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -80,6 +80,7 @@ struct msm_pingroup {
 
 	unsigned pull_bit:5;
 	unsigned drv_bit:5;
+	unsigned i2c_pull_bit:5;
 
 	unsigned od_bit:5;
 	unsigned egpio_enable:5;
-- 
2.34.1

