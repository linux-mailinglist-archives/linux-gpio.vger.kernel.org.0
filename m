Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499F14C5812
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Feb 2022 21:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiBZUqt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Feb 2022 15:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiBZUqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Feb 2022 15:46:48 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6A61B608C
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 12:46:13 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id s25so12067243lji.5
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 12:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fB+OZLfvgDpUQQF1878n43I7nv5zvL0CtIPizWamqPI=;
        b=Z3WflidTytckb+SsTephLYiK2rrz+GYDHh3GUA/NrVWx9vZ8TWvxrUyveBpo08VxCD
         4pEDl+vfA+tiXGhbR3rE6+C5++8MvgLHQvhJJbQA4ihkblg5MwncsZ+G899B1Ds5+mZY
         qAu+YtOzp7xWoXF9Zw889iAvNe68+L8ar49I+FHNH0Dr0/PsCV+mekV7NdsWb7YFvc3Q
         PynnJ5RZAZAfoM//Fo9ROvCP8+prIBZEWztfm4UL6ymNRogQT0DfwAhTRTH0EBmJzO7D
         WK5jAKH0pJ6RT01O1b9967+aHfnIkIS1M4s5kUAzlhguGgHVvkY+z4qSXyN8Sy8KEHKz
         rFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fB+OZLfvgDpUQQF1878n43I7nv5zvL0CtIPizWamqPI=;
        b=sY6uYMs7/+9F+kQCM+AkDDFrxTylZr28UcTwfhEnBmLihsvYukzH+UDeFB8zni7fRY
         y+0Pd7iVyN9C55KDJHDGlKZxQoDOAyQHatEI1kLOZY0C7iiGRQeOTNDv2tVgZbvoarzC
         7mxhqeZjsq1XFT7J/KUHPQxrmdADrIZ32SEeWBn0SwNXjahsz4/WlX2aLw3lU2YWSTwd
         2p/CWGLP8P0GQ4c/GD9ZicgzPMZkLtA341RtByNuzv3mEjSLc2B5xeD5m0lMW7IPyeHX
         ka9NyJZiOAcEKw9sXWRIyhlqBTJwzfoq9dLQv/+cnJI9UeUXlIG4ZBFLmIyI1qs1vIT2
         0IkQ==
X-Gm-Message-State: AOAM531u/b/i/AEl7dDvORV1DTpdPFXmdOkpAAxrDDDiyv5urfh3bCRx
        4SvXK6XW5m/yhejjJY+9mxBv42jyg7KXvw==
X-Google-Smtp-Source: ABdhPJzriKU5W9gi5cfzzUlON6ozJsbPkLYk0bzzJDUVyfj2FNe97YkfmDzmTTJnPU0zu54i1+xroA==
X-Received: by 2002:a2e:9d46:0:b0:246:1605:7802 with SMTP id y6-20020a2e9d46000000b0024616057802mr9609463ljj.264.1645908372051;
        Sat, 26 Feb 2022 12:46:12 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a10-20020a05651c210a00b00245f4dc7282sm661802ljq.112.2022.02.26.12.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:46:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: qcom-pmic-gpio: Add support for pm8450
Date:   Sat, 26 Feb 2022 23:46:11 +0300
Message-Id: <20220226204611.1824379-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

PM8450 provides 4 GPIOs. Add a compatible entry for this GPIO block.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f2eac3b05d67..4fbf8d3938ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1164,6 +1164,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
+	{ .compatible = "qcom,pm8450-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
-- 
2.30.2

