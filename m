Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F49CEAD89
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 11:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfJaKfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 06:35:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45205 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbfJaKfR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 06:35:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id q13so5620847wrs.12;
        Thu, 31 Oct 2019 03:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xU7iugvf6qEPqyOc9waXCFBgcxvDJtxyqVJmOgzbwBQ=;
        b=TNO4lzkh/SvQgGzuc+imosoMuP/K9oqscWjs2ljnxp9mi+GU1UxMK8KPXxQ04TsBQ6
         tNWNv3WDhcup9dCyvDEf6Y/xw4vnQBX2znwVVsk8V40lfDjl8jAM/OA3IGUeroMqhgHn
         Fmii4Zb8El5o6fwK6j8QPQC08jV0F9wKcqX+1lSuZscnuSoMlEdGJyoLKRLHnVdUSjjA
         oTznYQL3IHrif6Jm+IaURLGhq/52xYCRsIDg0OOf0BcMJC6G48/hj+8MPoPo3/mcA2Jx
         BaSSlTlN01fZkWM9uFqBG7edOp39GFQCFV41YZrNKI2cnmPzRu7XGqXJ07/m5Ngt7v/s
         sksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xU7iugvf6qEPqyOc9waXCFBgcxvDJtxyqVJmOgzbwBQ=;
        b=OndZuVbb36YunLdUGBlmcjPjvFmULXYQUhiWMcugh5n4Vj5MhHium1bPh7yKGplcsf
         1I8LGEA2yP+TK2wX79oqH6zmzIlCW4UC9+Y6A6kLlu0Xq225P/PAJeg8C9wp7+EO3iE/
         9CNNiXHr3QlIOo59iUHWz5g4YFBEVOlqXeNFXJ6wuQjuHw8Ma5dIhTO9iO66vo6ZpeAT
         te0TWqAPH3GZVo+Q5OlKvmLaixvoeGxkrAhFB/WCRxZitvthfCCBruVOM2GHligFvWV0
         LJQeUebU7FO3iCRJ2JTFGEuwuZRHIJBmKcxbKM1DBLFhhggFtgv2vFtCxWMIrj3Y7iL1
         MhiA==
X-Gm-Message-State: APjAAAVSecc2anSvSn0bJDFUmcs+sRxABP48awI1gkZ8YiSD9DbSjqVW
        HPRlukP+mGWJlQsq37Fxpdwbyfic/P8=
X-Google-Smtp-Source: APXvYqxmnNjrZgkKwFvo74vWmDIlSLOFq01+RIk+NypCtJA6vPDeWkHKDkk2D5ONgpxImoF6UUgrPw==
X-Received: by 2002:a05:6000:4c:: with SMTP id k12mr5134504wrx.100.1572518114790;
        Thu, 31 Oct 2019 03:35:14 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id o15sm3414687wrv.76.2019.10.31.03.35.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:35:14 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, bjorn.andersson@linaro.org,
        agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: pinctrl: qcom-pmic-mpp: Add support for PM/PMI8950
Date:   Thu, 31 Oct 2019 11:35:07 +0100
Message-Id: <20191031103507.30678-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031103507.30678-1-kholk11@gmail.com>
References: <20191031103507.30678-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Document the bindings for PM8950 and PMI8950 PMIC MPPs.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
index 2ab95bc26066..448d36a85730 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
@@ -16,6 +16,8 @@ of PMIC's from Qualcomm.
 		    "qcom,pm8917-mpp",
 		    "qcom,pm8921-mpp",
 		    "qcom,pm8941-mpp",
+		    "qcom,pm8950-mpp",
+		    "qcom,pmi8950-mpp",
 		    "qcom,pm8994-mpp",
 		    "qcom,pma8084-mpp",
 
@@ -80,6 +82,8 @@ to specify in a pin configuration subnode:
 		    mpp1-mpp4 for pm8841
 		    mpp1-mpp4 for pm8916
 		    mpp1-mpp8 for pm8941
+		    mpp1-mpp4 for pm8950
+		    mpp1-mpp4 for pmi8950
 		    mpp1-mpp4 for pma8084
 
 - function:
-- 
2.21.0

