Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9F43701671
	for <lists+linux-gpio@lfdr.de>; Sat, 13 May 2023 13:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbjEMLfS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 May 2023 07:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbjEMLfR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 May 2023 07:35:17 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645DA2D5A
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 04:35:16 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96622bca286so1645921366b.1
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 04:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683977715; x=1686569715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gDDSj6C0iIDbdK2gCsgCH6oSrIVkgIPorcUz+pCF2M=;
        b=DJCUrHtWoQlHbLsTckrqlgS3zL5vQPCjA4208XdyecCvZN+KBOIj8fbOC5whqqr4Y5
         PQq8GIvilNdIU9GW0eqAQuskvvDKpaIj44E2QBHhcPivqz8wUB7D38F0nD8MBMSuyebf
         VcQnxX4rLZzvYuDF2E8jrYbqD4rzndFcc1LBQ477Vdi6Bb38WRdBHgPU010T88QKgKr4
         FGpbkMQ5ScMpbuxI5Z7YY+izVjQAfsEOCxRkolUS9Svre27x6ActHFNMt+7P13wlz/Ka
         Fp2pS2an93fKt8cVpZIGPP1RK8XLOgqnhVJB3I37f4kvFACDPw+vW+hOmuIdy/1aYXvO
         dLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683977715; x=1686569715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gDDSj6C0iIDbdK2gCsgCH6oSrIVkgIPorcUz+pCF2M=;
        b=HvUc2USbI0MLprIPmrXM919LgffuI6N4k5QP1C8iOak9FKvQAm4kgZIVGvDy+GiYeZ
         wGA/sc9eihMNR8qF17DjrVcX27k2oTfOhrqZNs98ljfEa5pDo/m7WyC5cWmSFefBLNOf
         EKBMQ4hStgaijfO/FHRk3mDczL0yWXZK24Jbvj6kXhDNBzfrU5Hut7eo0ygA2/2EIqKe
         DCm5JvTU30AqsgKN9b4TJFffmE6DoqldesN8cC3WW57/cRU4TJ8bnehMFebYrQG2BCJI
         ZR1khsBcy8UIC0WehqN6G0ejPFVhyNRFI3a17/YVKSDxY4VH1VuQlbFi0mqITuDTXVpN
         i+PQ==
X-Gm-Message-State: AC+VfDx0kivUBeaWfIRDFJwds4PSwfvIirRwFcp6/RvVIUSprWqJaM6X
        Z2MGUrwi9GhwxbJSP2JDjEANwbcGoaaBXkGisB5oGg==
X-Google-Smtp-Source: ACHHUZ6D8HfzS/Rgo6Fy8omZ0KRIXeWqKhnd8YQKYPgn6ARSnxHxXzvt+Htcit348UpAH52nZzVqSA==
X-Received: by 2002:a17:907:3e1b:b0:967:3963:dab8 with SMTP id hp27-20020a1709073e1b00b009673963dab8mr19583104ejc.7.1683977714867;
        Sat, 13 May 2023 04:35:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3aa:fd4:f432:676b])
        by smtp.gmail.com with ESMTPSA id z4-20020a17090655c400b009660449b9a3sm6681416ejp.25.2023.05.13.04.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 04:35:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: qcom: sc8180x: gracefully handle missing IO memory resource
Date:   Sat, 13 May 2023 13:35:10 +0200
Message-Id: <20230513113510.177666-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If device was probed with incorrect DT or ACPI tables, the IO memory
resource would be missing and driver would derefernce NULL pointer in
sc8180x_pinctrl_add_tile_resources().  Add simplep check if IO memory
resource was provided to silence Smatch warning:

  drivers/pinctrl/qcom/pinctrl-sc8180x.c:1664 sc8180x_pinctrl_add_tile_resources() error: potentially dereferencing uninitialized 'mres'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index 704a99d2f93c..2fabec096aae 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1630,7 +1630,8 @@ static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
 static int sc8180x_pinctrl_add_tile_resources(struct platform_device *pdev)
 {
 	int nres_num = pdev->num_resources + ARRAY_SIZE(sc8180x_tiles) - 1;
-	struct resource *mres, *nres, *res;
+	struct resource *mres = NULL;
+	struct resource *nres, *res;
 	int i, ret;
 
 	/*
@@ -1657,6 +1658,9 @@ static int sc8180x_pinctrl_add_tile_resources(struct platform_device *pdev)
 			*res++ = *r;
 	}
 
+	if (!mres)
+		return -EINVAL;
+
 	/* Append tile memory resources */
 	for (i = 0; i < ARRAY_SIZE(sc8180x_tiles); i++, res++) {
 		const struct tile_info *info = &sc8180x_tile_info[i];
-- 
2.34.1

