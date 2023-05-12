Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A961700BE4
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 17:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241984AbjELPdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 11:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241990AbjELPdA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 11:33:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD4E8A60
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 08:32:39 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30789a4c537so5142715f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683905556; x=1686497556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdRjXwoE3aSQA5gXBX6EnGzJ4k23uXOffiYXMsRnd04=;
        b=xlPB94hVfrwAP/mRQrLn9uGgGz9detJ9DWZGhx1hIdhbqQCyXtocp+2KLR6Oa0Xvfo
         KZdPPFJ4NR0q+bezU+CpXTL4g0uhwLoeJyOsIw/Of0KWKq0TOUA3TOvQD2kKpa8909q8
         SBPk1MPHiT51IZxM/F670pM6lNEayPdMu6MA9gsv1g+wma3RPgL8Gez6+SdynsnUd8qp
         YvmoxA0xzOXZ0wc3oBBHWfLnAUR6fan2WljH1RiinqkvQa2hD+mXLAS+A7K7yH3QZseO
         X2IMIsxvuAWdcSYQnvRSyV1K9/cPpEXugXGLfSver/u17s5EHN5+E3Y8A17WdRsw8HZr
         zi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683905556; x=1686497556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdRjXwoE3aSQA5gXBX6EnGzJ4k23uXOffiYXMsRnd04=;
        b=FyOkSekoS+WXaRoZSbF2cu789OZ8GRK8vUiA2M4yYQVBi7tvQ8NyhCzXy5NwZuRHYE
         Q9Ti+0igo/fmuWjl6mKR1gGC4NgKBdGDfjy4yTVXc6l54JJCqXS6Sb5CEgLpLHEZhOuy
         JCZC8yttz35xmAK3qEx1vUQTIXLvEedMbi8dUJr3oRcV4fwveNuTR3RExHKuWCbhMAoL
         96nQDTS+Z0UjfRfWAdTY4DKBKULpD2Oj8KWYN0CsnKeiCx54RaeZj3llxZLkJJxBQ8Se
         SVXoKYsYt8c9BCFycZ4bZXSksFBcbmDh/G3MvtwmjehxAq0Q8fkiv+fh2uiDVxCKBgf7
         MRJA==
X-Gm-Message-State: AC+VfDzTMt72E7dsOX9uKmoa0ZF3alzwR10UMwCQoWRDWBF0AhJ/PZ3i
        W7JcosGIrEiw7/cpn9oXtma8xg==
X-Google-Smtp-Source: ACHHUZ4+TVYFirpywkjwvQlmpE6BN6sbv1BJPlU7VMtoyaA5BYkDpyoEx9z6K7EPZxOX7qmc3EbXXQ==
X-Received: by 2002:a5d:594e:0:b0:307:8691:1eae with SMTP id e14-20020a5d594e000000b0030786911eaemr14249014wri.20.1683905555624;
        Fri, 12 May 2023 08:32:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4c87:5cb4:6fba:6a65])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b003062675d4c9sm23636458wrn.39.2023.05.12.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 08:32:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] pinctrl: qcom: sa8775p: add the wakeirq map
Date:   Fri, 12 May 2023 17:32:32 +0200
Message-Id: <20230512153232.92450-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The SA8775P TLMM driver is missing the GPIO-to-wakeup-pin mapping. This
adds it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 2ae7cdca65d3..422d72ed1012 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1491,6 +1491,23 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[153] = SDC_QDSD_PINGROUP(sdc1_data, 0x199000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sa8775p_pdc_map[] = {
+	{ 0, 169 }, { 1, 174 }, { 2, 170 }, { 3, 175 }, { 4, 171 }, { 5, 173 },
+	{ 6, 172 }, { 7, 182 }, { 10, 220 }, { 11, 213 }, { 12, 221 },
+	{ 16, 230 }, { 19, 231 }, { 20, 232 }, { 23, 233 }, { 24, 234 },
+	{ 26, 223 }, { 27, 235 }, { 28, 209 }, { 29, 176 }, { 39, 200 },
+	{ 31, 201 }, { 32, 212 }, { 35, 177 }, { 36, 178 }, { 39, 184 },
+	{ 40, 185 }, { 41, 227 }, { 42, 186 }, { 43, 228 }, { 45, 187 },
+	{ 47, 188 }, { 48, 194 }, { 51, 195 }, { 52, 196 }, { 55, 197 },
+	{ 56, 198 }, { 57, 236 }, { 58, 192 }, { 59, 193 }, { 72, 179 },
+	{ 73, 180 }, { 74, 181 }, { 75, 202 }, { 76, 183 }, { 77, 189 },
+	{ 78, 190 }, { 79, 191 }, { 80, 199 }, { 83, 204 }, { 84, 205 },
+	{ 85, 229 }, { 86, 206 }, { 89, 207 }, { 91, 208 }, { 94, 214 },
+	{ 95, 215 }, { 96, 237 }, { 97, 216 }, { 98, 238 }, { 99, 217 },
+	{ 100, 239 }, { 105, 219 }, { 106, 210 }, { 107, 211 }, { 108, 222 },
+	{ 109, 203 }, { 145, 225 }, { 146, 226 },
+};
+
 static const struct msm_pinctrl_soc_data sa8775p_pinctrl = {
 	.pins = sa8775p_pins,
 	.npins = ARRAY_SIZE(sa8775p_pins),
@@ -1499,6 +1516,8 @@ static const struct msm_pinctrl_soc_data sa8775p_pinctrl = {
 	.groups = sa8775p_groups,
 	.ngroups = ARRAY_SIZE(sa8775p_groups),
 	.ngpios = 150,
+	.wakeirq_map = sa8775p_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sa8775p_pdc_map),
 };
 
 static int sa8775p_pinctrl_probe(struct platform_device *pdev)
-- 
2.39.2

