Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CE84535B3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238158AbhKPP1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbhKPP1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:27:07 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9957FC061570
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 07:24:09 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a9so12110990wrr.8
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 07:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Hb8StdvkhuwqjYrqbshLfc0V2nPtAGB1TlClikG+/W4=;
        b=kpgkmj9vddqDwV3u7YsBA/AtAr3+HZscJ0U59XnhXILqqXkV64ZffvqX45ZJM2lnO8
         qtI9eArOnpdLw6XqRwz/P0mRsg5xp1a77F3i2Hd79L4kkpcIog4OTcxX1/X/0EYSgGDG
         4EeixZwH5SoQbaEcFQkYB4rJXtBHfgjLwLAVDENd2BJggEyOziuhDqdthgybHXWMvhUO
         Nbfpojd2GbCqySHHbBzOE9++E3uAWfg696bahtCUuXhO+oMqYBpwGLFV7rMpyPOzUWQx
         o7KqNUpP+Zr5luZK9wPx1uXxsrMIB9JFWh4dMoufywtAGW37+DQCFo5LUoH8Aixc5Vjl
         UeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Hb8StdvkhuwqjYrqbshLfc0V2nPtAGB1TlClikG+/W4=;
        b=LaUbOPo7BcKwV7zr0EiIMKAwZRszBHqSGNdyRTXtUjx6BVvKadN6fRiv+N9HLfxal6
         /MuBW/c1Vz3u855u6AN4zxNRdesHQ1hvevcSb6QfKhF5oarV2opuXNd4DPwOsAeh4W2L
         HrAbxgHFd8u0IAOgnhEd6ejwfdEiLVGEnE9LU+bX2Z7XahSZE5TOtIqsLATmdDkwo6T/
         emY9kg1grWWA/leOOBn7rUaIBX6l3k3/yf2PuHi66lGIBfEFyV3qn4UIuK0M999YrcaL
         LALDEZZp7kG1aB7R0kXXrRsfQjDbS0XS+oQ/kDl9Al0LKzd1iTejCawruwXrRfm9EKwj
         dfhA==
X-Gm-Message-State: AOAM533xp0T1YtIWQkTj03SaPc7STmBXvFuCeaFVQOn93sZ0WdJgCndb
        V9fDgRRcGxsdyUFoUsI70S1MqY6RZSOYPQxR
X-Google-Smtp-Source: ABdhPJyx9E3jDaIaXCPSmT4h//ywS47dRwiYotz2zbdJMKuGHIZfXaLDRQeruZg/yFH8qRjzzTaEJg==
X-Received: by 2002:a05:6000:252:: with SMTP id m18mr10258797wrz.117.1637076248101;
        Tue, 16 Nov 2021 07:24:08 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id u23sm18847352wru.21.2021.11.16.07.24.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 07:24:07 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        shawn.guo@linaro.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/2] pinctrl: spmi-gpio: Add support for PM2250
Date:   Tue, 16 Nov 2021 16:35:14 +0100
Message-Id: <1637076915-3280-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PM2250, commonly combined with QCM2290, provides ten SPMI GPIOs.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 5283d5e..a1a8a48 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1141,6 +1141,7 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id pmic_gpio_of_match[] = {
+	{ .compatible = "qcom,pm2250-gpio", .data = (void *) 10 },
 	/* pm660 has 13 GPIOs with holes on 1, 5, 6, 7, 8 and 10 */
 	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
 	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
-- 
2.7.4

