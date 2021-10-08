Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746354261FB
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241462AbhJHB1v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbhJHB1q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEABC0617AD
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b20so32912277lfv.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KFilYJCf+KpWxQtdiRPdV9UvPSg+EjF5wR3x+/r1PaM=;
        b=b8Kp3IwxAUvtNck1lwmE1eCa2D0sGIsH53MbErRUDrC2x71IDEeSO3vr05y1QVRK4N
         XakZEvxTVTCJoW6tMZBIYBX/OG+JhezlK5lWV5NOdoQHGX0+rTsfhWvBNBnaVCuW9AyW
         Zz7ecnwkpFi50/0o52sev5frAGtUqJVwgnOltDFcGy8uO1SJyMd4kfeG1+IcmeaP7Umw
         XGa+so+3NFhLAaR8YhR6IxjuVSBBRKOw6zjWJnPgHtdJ5cIqNZJLYcPv0WZprgJAD6R5
         +6R0XY03fdtOtAGn7S0VZZBkahD0uahB29LjDZlkHKfMFmERBxl4Zx4rsrZ8IpToiGg9
         5MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFilYJCf+KpWxQtdiRPdV9UvPSg+EjF5wR3x+/r1PaM=;
        b=5P7tBrS3xVSrDwLXHg47hk9i9irx59Dr3wRzBEe4V1xTt9oNBnghXE3tNKD29AV4QS
         7Oel3LSLcMs+gidik8+hT8KyCUDs2r47/2k2VFDuEl7+HlmTfwtIPpDSwsdnyhgZCoPP
         YlZnmHSHQ15UAKXevlwve6HLI3WdMAPfNgtynDVcbUIhthkBejZo7spL4idTYYZxjRGK
         eBhlZ0I0y2Q6H36/4jd+ugpF9z5Tuk51DlG1DUgzPD0sBjBEGIGrV1z/OcsJzpou/wx2
         YaT/pEcAOV8B7Dvql47rZIakZOm5hLK0kD2ETdNSwaRYJfUs6AJWF6K7wD8D6++iCXd3
         oy0Q==
X-Gm-Message-State: AOAM530j5ye9skCHeAPjkL6UTep0GNtik35XsnpgNvYf61sBJ4kONJlD
        4PMVc2a+b+sJJuRDRS+WcxjEWA==
X-Google-Smtp-Source: ABdhPJxOJu2O2CcCiy90VFNaP0Nc8PeIaVHfboDJZJSdT8OBJFAdj/N6EY6pIN9ZkS0YixLqBwRILA==
X-Received: by 2002:a2e:5702:: with SMTP id l2mr373823ljb.370.1633656344600;
        Thu, 07 Oct 2021 18:25:44 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 25/25] arm64: dts: qcom: pm8994: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:24 +0300
Message-Id: <20211008012524.481877-26-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that the pmic-mpp is a proper hierarchical IRQ chip, add interrupt
controller properties ('interrupt-controller' and '#interrupt-cells').
The interrupts property is no longer needed so remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8994.dtsi | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 88a9d19b60ac..5ab46117d737 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -124,14 +124,8 @@ pm8994_mpps: mpps@a000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8994_mpps 0 0 8>;
-			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
-				     <0 0xa1 0 IRQ_TYPE_NONE>,
-				     <0 0xa2 0 IRQ_TYPE_NONE>,
-				     <0 0xa3 0 IRQ_TYPE_NONE>,
-				     <0 0xa4 0 IRQ_TYPE_NONE>,
-				     <0 0xa5 0 IRQ_TYPE_NONE>,
-				     <0 0xa6 0 IRQ_TYPE_NONE>,
-				     <0 0xa7 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
-- 
2.30.2

