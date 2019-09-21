Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFE0B9D51
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 12:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407503AbfIUKMX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Sep 2019 06:12:23 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35921 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407493AbfIUKMX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Sep 2019 06:12:23 -0400
Received: by mail-wm1-f68.google.com with SMTP id m18so4504579wmc.1;
        Sat, 21 Sep 2019 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tUjCC/EXUJuZebPXPZKEi20wA8SwVvz2RKCr1Q3uTaE=;
        b=szjP/6ovmMVhRwBh2+xqYXW/q33frxgj3+5yh+AbDxwOOPlfCR4l12mQt2X1IF8WLT
         36yvIGp+wCQZWl+VLnaQ2qL6Cs209XLJB405uj1pBgaloEjUkaHkcESD2ATJZxeRLsSz
         nm1rjQ7oaL2IOvrcP31sp5rdlPgGRZsr8SsQ63x/uY5UkyT66eqsSKzjimFnq4Wpx2sO
         BVCbjuwEYBUW1p2kqWTf/h4DbjkBDmS7oM54CyxpJmQvdzosq7tMQhv2HMpdcQDuKZon
         YDcxevNzng4yzdDn4lNwPxARYUGXpTJzyQWADP1awlnmAgSLetg7ih6LRqXDzvCWEQoc
         X+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tUjCC/EXUJuZebPXPZKEi20wA8SwVvz2RKCr1Q3uTaE=;
        b=mF+i4iAgE1NSVt5dnRRhoHOBqB7DUR17AJKIKtumzlmeUT6ndiRv2q707/JlAtg9lQ
         8rm1/PX2oeAdFjZs2PtvGRsFMJ0O+zCjjJnwVcqaXKI2ceDHOZPEiVEpm8WtalqFMQPV
         jvL+T/+BGBWXuiIvIn053T9+7SKzy+zpjO8g3Bbm7HH2k1RLwScM/Jn4F9quDnv580nn
         me1VtX/RvlG1uJQFHJ+ZI27tcGiBTKB3eWPgtgcpvZzQeoiOJ1KhSKkqsewX6dFEDg0Y
         RaVTdIltmvxu2Lx7XJu/a/tzNs0Oz182W3C26xasc+9cNUN1HLMLcpfnpmAaOAbyHbj0
         xZCg==
X-Gm-Message-State: APjAAAWDpo2dmdwus0wnEoQZOKVaAHPPYve3wZdBDbH/EulsnUOYkArj
        nIkUzxZbmYr0GamNige4SdluqF5aaOE=
X-Google-Smtp-Source: APXvYqxQjXbd23PMAU18UuXDx7hBrEM72i0FDBt9xkNz1wPSRyXL9Y4WOqMZ4UcRNN5YfGHXkqIqhw==
X-Received: by 2002:a1c:cb83:: with SMTP id b125mr6950042wmg.43.1569060740629;
        Sat, 21 Sep 2019 03:12:20 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id l1sm6129262wrb.1.2019.09.21.03.12.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:12:20 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 3/5] soc: qcom: smd-rpm: Add MSM8976 compatible
Date:   Sat, 21 Sep 2019 12:12:05 +0200
Message-Id: <20190921101207.65042-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921101207.65042-1-kholk11@gmail.com>
References: <20190921101207.65042-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Add a compatible for the RPM on the Qualcomm MSM8976 platform:
this is also valid for MSM8956 and their APQ variants.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
 drivers/soc/qcom/smd-rpm.c                                  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
index f3fa313963d5..616fddcd09fd 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
@@ -22,6 +22,7 @@ resources.
 		    "qcom,rpm-apq8084"
 		    "qcom,rpm-msm8916"
 		    "qcom,rpm-msm8974"
+		    "qcom,rpm-msm8976"
 		    "qcom,rpm-msm8998"
 		    "qcom,rpm-sdm660"
 		    "qcom,rpm-qcs404"
diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index fa9dd12b5e39..fe2199f6ce8f 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -217,6 +217,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-apq8084" },
 	{ .compatible = "qcom,rpm-msm8916" },
 	{ .compatible = "qcom,rpm-msm8974" },
+	{ .compatible = "qcom,rpm-msm8976" },
 	{ .compatible = "qcom,rpm-msm8996" },
 	{ .compatible = "qcom,rpm-msm8998" },
 	{ .compatible = "qcom,rpm-sdm660" },
-- 
2.21.0

