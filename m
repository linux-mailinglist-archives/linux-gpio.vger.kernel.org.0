Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00293B7228
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 14:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhF2MhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 08:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhF2MhO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jun 2021 08:37:14 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7120C061767
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 05:34:46 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id m17so10817180plx.7
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoxmMGMX6APkhsw6SVYeGJ+YIxw2LxE4cfQgI08dndw=;
        b=S+RqgRpL6UqG8/NOfPsFmX1mn34qTwzQW1mQaf884NbfIdMcM6kIJAeNUtdya1pko5
         zRMzE5qg4EC9PpW5iiZMMJDrroILu+tTRuWjRvvKvNkDQ2mxHow/N6ZMvr28pI674nUA
         o8vnNFSHpq3nP9qJQGNK90ivAbwdRTF+2EkhO+KbXQWboaiuV3pCDCT4vccqXbtbzEws
         AFtnyMiEEVYzESmoII1uxecSQAhdikSggVQe5YM1FYlTjlrXg3dEeVRFj7E89GJWAEw0
         UXuQH3uT6SZrTFT72FpUsw9nsaFmRfaaKG7q+LRnkosFBcp9yliWfvllFr2tB85zhShM
         kzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoxmMGMX6APkhsw6SVYeGJ+YIxw2LxE4cfQgI08dndw=;
        b=pOeA+Iqb+kXBFOtMq9jPl0Tk1uCX+TYv6O5YB9C3/EWU0Oe8Hc6kG/Z5nO+0HjLRAH
         7OPsrRWT4lof421cMiX/lkgxnFQCw8/BPB9ge+DLTEnqCRpTbg0Fzk0hO6WmEajSlDi9
         Iz7cCIbhA9SdSnGo6ELDO/5bkJpACs6YIGzf60RV0JN4/CBrq/9yKHFcGv6n+PLPLGDC
         9W/Fc2t5hE8DJMzERDpvI2ytMdlcu0syLoy27jQpEaKE0MBEAXRb8aBKU9mgQSOoawlp
         xRSfJxv2luX5PzkL6uZMXz/RXJ+bRuv2RwWvNoHFKDGr+r+hsNQWECHB+Tc6ktjPre8m
         swFA==
X-Gm-Message-State: AOAM530b4yS9Hn3qaQtQ7QtSECAncMuCaqCHu+ZZO+/Uz89BDKkU7X31
        Y/GgIQ2YhpE5BCBa/S+wvKs9xQ==
X-Google-Smtp-Source: ABdhPJxN5b9kWRb8alrTMFBu8a6+hr0xMyi0Dj3xF7L/aB035UbGVfm7naiLBxg0UJCvumqkvoG8hQ==
X-Received: by 2002:a17:902:446:b029:120:1fd:adbf with SMTP id 64-20020a1709020446b029012001fdadbfmr27976253ple.52.1624970086450;
        Tue, 29 Jun 2021 05:34:46 -0700 (PDT)
Received: from localhost.name ([182.69.252.226])
        by smtp.gmail.com with ESMTPSA id 143sm16176692pfx.46.2021.06.29.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 05:34:46 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 4/4] pinctrl: qcom/pinctrl-spmi-gpio: Add compatible for pmic-gpio on SA8155p-adp
Date:   Tue, 29 Jun 2021 18:04:07 +0530
Message-Id: <20210629123407.82561-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
References: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SA8155p-adp PMIC (PMM8155AU) exposes 10 GPIOs.

Add support for the same in the pinctrl driver.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 5246ea09c295..bbea3499178e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1133,6 +1133,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
 	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
-- 
2.31.1

