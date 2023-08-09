Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429107768E7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Aug 2023 21:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbjHITjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 15:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233989AbjHITjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 15:39:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97358210B
        for <linux-gpio@vger.kernel.org>; Wed,  9 Aug 2023 12:39:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe85fd3d27so183099e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Aug 2023 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691609954; x=1692214754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaJD50ZdNlLd8aAV2rJ5UObu1uOPthET0/BzYuBazXo=;
        b=IWEFDVYUNwwuG8brMaU6ojkleuncxUL14b8nv5klpLv0aLDUrWPtlSnVIYDSJgiUyP
         Y7MkRNePGKQwpxzdknXNDCYic6inj9kTR0jjd198/VYCl1Da9nuNIoB6ikRC3FiFGSCP
         mwfLMKBENi2vCXVKIaVlgAWsV58rcHm0cLGXC6mOOas9Pi+ZUYK9/GuSepaF0QrW1hpu
         joTNjdCUUc51wBiAR8MGiW6Xu3gBSkMo5syZRqQ8JRZ76mh7eIAutbAjpCGZbDN/ckXe
         mSAbuCkUoynSIi8BObS2duNI97T+Iz2r/QPQq138839rsynRl/OC6Hja5Gos9v89xbUQ
         yGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691609954; x=1692214754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaJD50ZdNlLd8aAV2rJ5UObu1uOPthET0/BzYuBazXo=;
        b=cMFzEcwzktmWqkwHXJmwaaPyYHU6wdZFnASIK+lbvpmwZRqAUm3Hj5j3qsy67vVw/6
         UR211v846WIeNz5YrhMBIN8/VzKJ7GepSJUvOXtU26UUFSHzjcXfWocSzL6g0Nz+Zdny
         KPf1ooNXu13lTItqlNdNzY6Q/GGQp5az7MrF6T8N5EF+piVDhD/VKfb0e9xBqCuhtc40
         VQlojN17fniQdCcH3SKp0wMle3zHPpgB4W2diF8PAJjsNf4oo47tk+xjIrGc3+WU+nAC
         WXbM18HuE/0PMIgVn8FfqJgiBSgnMd/U8t2PCoGxm4VqL/FBbrA24pPcVzNIdEee+2W+
         hlwQ==
X-Gm-Message-State: AOJu0Yxm+Moaz1HP9Q928BjQ7DWAIZiy+WPzzdLsbOplYocFMTjYDnIf
        kXYfigGFgZxV9qU8Lhf2JKQBGQ==
X-Google-Smtp-Source: AGHT+IH7AYhh/E2c+MwwbcvZIt5F8XEM6PaMiAiu8eHXkX1uA8IjiH3IUk6l8jMoCslLrqk7cDsLcQ==
X-Received: by 2002:a2e:9997:0:b0:2b6:e283:32cb with SMTP id w23-20020a2e9997000000b002b6e28332cbmr151913lji.23.1691609953946;
        Wed, 09 Aug 2023 12:39:13 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id x6-20020a2e9c86000000b002b9fe77d00dsm2885287lji.93.2023.08.09.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 12:39:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 09 Aug 2023 21:38:58 +0200
Subject: [PATCH 5/5] pinctrl: qcom: sdm660: Add MPM pin mappings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230809-topic-mpm_mappings-v1-5-5e17dd76b3c8@linaro.org>
References: <20230809-topic-mpm_mappings-v1-0-5e17dd76b3c8@linaro.org>
In-Reply-To: <20230809-topic-mpm_mappings-v1-0-5e17dd76b3c8@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691609947; l=1937;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0NrXmn7119mRGGGI3miqjrwIUUJ2pi2cRUPmNiZdlUk=;
 b=0m63GWmp2DcB0guuYRK14UZ6i2eeIvWiqemEA5UR5ObDtsNrUDFXirayo4EwRo+nZXWzFrlUV
 D1HumSCL5CgDapRA5NHEpxTgXllT7b+Y+e3TOCZzJHWWB4gM8csFhWA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pin <-> wakeirq mappings to allow for waking up the AP from sleep
through MPM-connected pins.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sdm660.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index c2e0d5c034ac..5deabe8ca581 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -1399,6 +1399,18 @@ static const struct msm_pingroup sdm660_groups[] = {
 	SDC_QDSD_PINGROUP(sdc1_rclk, 0x9a000, 15, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sdm660_mpm_map[] = {
+	{ 3, 1 }, { 4, 5 }, { 5, 9 }, { 6, 10 }, { 7, 66 }, { 8, 22 }, { 9, 25 }, { 10, 28 },
+	{ 11, 58 }, { 13, 41 }, { 14, 43 }, { 15, 40 }, { 16, 42 }, { 17, 46 }, { 18, 50 },
+	{ 19, 44 }, { 21, 56 }, { 22, 45 }, { 23, 68 }, { 24, 69 }, { 25, 70 }, { 26, 71 },
+	{ 27, 72 }, { 28, 73 }, { 29, 64 }, { 30, 2 }, { 31, 13 }, { 32, 111 }, { 33, 74 },
+	{ 34, 75 }, { 35, 76 }, { 36, 82 }, { 37, 17 }, { 38, 77 }, { 39, 47 }, { 40, 54 },
+	{ 41, 48 }, { 42, 101 }, { 43, 49 }, { 44, 51 }, { 45, 86 }, { 46, 90 }, { 47, 91 },
+	{ 48, 52 }, { 50, 55 }, { 51, 6 }, { 53, 65 }, { 55, 67 }, { 56, 83 }, { 57, 84 },
+	{ 58, 85 }, { 59, 87 }, { 63, 21 }, { 64, 78 }, { 65, 113 }, { 66, 60 }, { 67, 98 },
+	{ 68, 30 }, { 70, 31 }, { 71, 29 }, { 76, 107 }, { 83, 109 }, { 84, 103 }, { 85, 105 },
+};
+
 static const struct msm_pinctrl_soc_data sdm660_pinctrl = {
 	.pins = sdm660_pins,
 	.npins = ARRAY_SIZE(sdm660_pins),
@@ -1409,6 +1421,8 @@ static const struct msm_pinctrl_soc_data sdm660_pinctrl = {
 	.ngpios = 114,
 	.tiles = sdm660_tiles,
 	.ntiles = ARRAY_SIZE(sdm660_tiles),
+	.wakeirq_map = sdm660_mpm_map,
+	.nwakeirq_map = ARRAY_SIZE(sdm660_mpm_map),
 };
 
 static int sdm660_pinctrl_probe(struct platform_device *pdev)

-- 
2.41.0

