Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEF378F477
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Aug 2023 23:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347545AbjHaVVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Aug 2023 17:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347538AbjHaVVc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2023 17:21:32 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F3DCD8
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2023 14:21:29 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ff8cf11b90so2492425e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2023 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693516887; x=1694121687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2STMuo5K4qFq5jgAxZCjN/B7yzobUMbdyNQ8KrypW4c=;
        b=OvklatLXNn3tSuO3FFDp1Kg/32EVYB8WmroIsGXESZNbG+Nu+KWmJlkO77mgdKCJ8w
         pdRKCSuTQZ2nnkWKhMQYYiXV+nZFQh10Xd2ojJD7WyhNudgz1Fi4FFBKXj4WmM3EPXYp
         W3V8zwE7lpvIkRyCLHAprIo8YNM0x3WRrkuCOGdvp2v0W8D0vm2CPq5W5LBmvaDe9/94
         Oal99HOYin+gyCfM/liyCGlL9UXPld2/OhBzECO+6nYYKVMq7EzLxWCXdX0aVb9IdJTV
         x5cnbMWrjZ7Y6aALwcrZ5dk1WDf390wHnwAjpv1FtTry5J4Eh8S1BcDNg3sLsZ2Nc66g
         NYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693516887; x=1694121687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2STMuo5K4qFq5jgAxZCjN/B7yzobUMbdyNQ8KrypW4c=;
        b=kuQyq8M4KYL2b0ANbV8O7Zyh6D/wJ3w2xjEf/zJJXjO1tN/PnJBmtLtBbw6HgFy/p4
         28vuCik51l37aLTnQlK4l1Tuv9oHr6Ze/U4O9hQy1TYmskII9PUQvwYMd4M99XWrPzi/
         Ygz9d9fMZB3VC4ojYfb5ERcuKX4IjMiXsQWKI8h/t0sNNlxU/HIpgc8JxeOFrgNZ+b8A
         0nqOtTHADkdMcBkDCOYe+2x9f2siWPuJn/4s1/b8ATEWBCSvV0VqF/QflYMwt/qxvr/Q
         AI97oljqClOeiNn/2ksSFnIlhQszM/ZNebthnhqutiL45DTS5+XjtuJQm+L8qoG6jGB3
         poDA==
X-Gm-Message-State: AOJu0Ywn1dku08/CgxxFF6ZHRGSgZyYRbRUUJ1hz6PN/r+M/II7FT2E9
        LUhxubGKQKEVAn11azWn+69sng==
X-Google-Smtp-Source: AGHT+IH5oCWzHqwNvMG+N+3PhajpCiw6c+Ce/Q0cFv3KqmAFkH4G6f7rbYNaiOmIXFVbypycZg0lAA==
X-Received: by 2002:a05:6512:34c4:b0:500:79f7:1738 with SMTP id w4-20020a05651234c400b0050079f71738mr287094lfr.17.1693516887595;
        Thu, 31 Aug 2023 14:21:27 -0700 (PDT)
Received: from [192.168.1.101] (abxh154.neoplus.adsl.tpnet.pl. [83.9.1.154])
        by smtp.gmail.com with ESMTPSA id eo4-20020a056512480400b004fbc0c7218bsm414866lfb.118.2023.08.31.14.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 14:21:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 31 Aug 2023 23:21:23 +0200
Subject: [PATCH v2 2/4] pinctrl: qcom: sm6115: Add MPM pin mappings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230809-topic-mpm_mappings-v2-2-4c2b4495e654@linaro.org>
References: <20230809-topic-mpm_mappings-v2-0-4c2b4495e654@linaro.org>
In-Reply-To: <20230809-topic-mpm_mappings-v2-0-4c2b4495e654@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693516884; l=1748;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=rE9bSf4wp2vzKQ+tQr4HglWzMe5L975B07F8Yc/C25Q=;
 b=7FZhf4tVSpwiLfhIftWHigm+xG+pKpKULLg/CylFRVdIS0lFIpD1gMQ07QYeVQFzg7Y07wU8N
 0vItGzr1lkCAcEmoksZBWP5wVLTKrsZ9pygvOkCwwt5VhvmoLJX73/q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pin <-> wakeirq mappings to allow for waking up the AP from sleep
through MPM-connected pins.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 2a06025f4885..4e91c75ad952 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -867,6 +867,16 @@ static const struct msm_pingroup sm6115_groups[] = {
 	[120] = SDC_QDSD_PINGROUP(sdc2_data, SOUTH, 0x73000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sm6115_mpm_map[] = {
+	{ 0, 84 }, { 3, 75 }, { 4, 16 }, { 6, 59 }, { 8, 63 }, { 11, 17 }, { 13, 18 },
+	{ 14, 51 }, { 17, 20 }, { 18, 52 }, { 19, 53 }, { 24, 6 }, { 25, 71 }, { 27, 73 },
+	{ 28, 41 }, { 31, 27 }, { 32, 54 }, { 33, 55 }, { 34, 56 }, { 35, 57 }, { 36, 58 },
+	{ 39, 28 }, { 46, 29 }, { 62, 60 }, { 63, 61 }, { 64, 62 }, { 65, 30 }, { 66, 31 },
+	{ 67, 32 }, { 69, 33 }, { 70, 34 }, { 72, 72 }, { 75, 35 }, { 79, 36 }, { 80, 21 },
+	{ 81, 38 }, { 83, 9 }, { 84, 39 }, { 85, 40 }, { 86, 19 }, { 87, 42 }, { 88, 43 },
+	{ 89, 45 }, { 91, 74 }, { 93, 46 }, { 94, 47 }, { 95, 48 }, { 96, 49 }, { 97, 50 },
+};
+
 static const struct msm_pinctrl_soc_data sm6115_tlmm = {
 	.pins = sm6115_pins,
 	.npins = ARRAY_SIZE(sm6115_pins),
@@ -877,6 +887,8 @@ static const struct msm_pinctrl_soc_data sm6115_tlmm = {
 	.ngpios = 114,
 	.tiles = sm6115_tiles,
 	.ntiles = ARRAY_SIZE(sm6115_tiles),
+	.wakeirq_map = sm6115_mpm_map,
+	.nwakeirq_map = ARRAY_SIZE(sm6115_mpm_map),
 };
 
 static int sm6115_tlmm_probe(struct platform_device *pdev)

-- 
2.42.0

