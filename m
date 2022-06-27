Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B2255D026
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbiF0J0d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 05:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233702AbiF0J0c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 05:26:32 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73859615D
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 02:26:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id bn8so10276596ljb.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 02:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMvAwLwwACy8RvtqlZhZ2F0/rOmqauHwSNA64UzApRk=;
        b=lJV0G/n/1JUmAQ7Dcji4ljaqSVJbTe67RiVChS8+U8EUdE5p0P+M4rabhPdU/ilVUE
         0FFel8eraDIf5QNoWS6reQQKCv5Xa6WDg03kS1GKSaAqoWReyczpHsozBbbc8ORdpbmY
         x7R4f2zIux0iL8M66thtTTznSoFy92rlLMhJtQYrrsN/EP7F9lxgcmiBLGZjJpv8gzSZ
         ZIRLMOs/FhRLmigNgzyr+EOHz2HRkMjhQFRXmXX9E8FSIrazAmzyfCmEsHlCPubSlmlc
         GtSewk49dF9rijlaztVJrCLghsBo9t6EKYw96X6GcaoplMHo26+AcwsvRq9EUh4IHsWj
         JVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMvAwLwwACy8RvtqlZhZ2F0/rOmqauHwSNA64UzApRk=;
        b=lnujOwsuH4nVTfq7+wA1b7+J7ig6zkzFfrN/3l//+JdbDujEwzKb3AmikbAcQ4WwmJ
         qyNKXuZXflI6cRsUtEigqshABcNspxMf7AR9cLWwFRfL23GiIXGE+9mhzdlAtEhF/NC7
         JNa7yLJGeoMnrOMmwCfeEZcOXmlt8w9FG8XXV6DipKcfSPW9UNdGPEO9SfHDOBt6EaPE
         kQqN2xnDqI9Zj4Nxjfxvmhf0R5eXCcyGHByW4kNVkv8Vlp3gRwmjq/gmr3A144xkFKP7
         is2m5PvWUvMmiOgUWOf1yIQ8XDEAMdn2Hm0kRNXkLtT5XX7knB5/nPgIhTTO8jH9VYi8
         WzHg==
X-Gm-Message-State: AJIora/o4uvWjAAtWNucxOAqYBzVRmGphs1s+kj/s3LVRxoy16hV2jod
        FeHsTdZONg3rATXn4dH0iDczDgzraH3zNg==
X-Google-Smtp-Source: AGRyM1tCRQWFyspcIBPAeW8CCBI+4aRAMGwp4Xanf2y2EiE16drmsIWSbCdZlNbZXuBRmUxu/+WBCA==
X-Received: by 2002:a2e:a807:0:b0:25a:673b:5ae8 with SMTP id l7-20020a2ea807000000b0025a673b5ae8mr6036692ljq.68.1656321989404;
        Mon, 27 Jun 2022 02:26:29 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m16-20020ac24250000000b00478fe690207sm1719226lfl.286.2022.06.27.02.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:26:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] pinctrl: qcom: sc7280: Fix compile bug
Date:   Mon, 27 Jun 2022 11:24:25 +0200
Message-Id: <20220627092425.98730-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The idea was right but the code was breaking in next.
I assume some unstaged commit was involed. Fix it up.

Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Fixes: 36fe26843d6d ("pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index b3d4244a5266..b5d1b996c454 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -388,7 +388,8 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	data->is_clk_optional = of_property_read_bool(np, "qcom,adsp-bypass-mode");
+	data->is_clk_optional = of_property_read_bool(dev->of_node,
+						      "qcom,adsp-bypass-mode");
 
 	pctrl->clks[0].id = "core";
 	pctrl->clks[1].id = "audio";
-- 
2.36.1

