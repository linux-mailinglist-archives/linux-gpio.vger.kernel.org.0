Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BFE4261F8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbhJHB1t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241580AbhJHB1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:45 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7859CC0617A4
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m3so32596981lfu.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eRXNWHuPd38vN0RWOcJ4q4RHGL96UR0p/zcT0YWhKTU=;
        b=sXE/eokBQnk60sMw5lWBy7jhROc6GuZGLiOdTuXJ6YRADlfelKLdAijTh9GVCPCPh9
         X5f2UvW6CMDzqkGyBaA9E/pTjKqxOqXMaBnJxiqkNzCbxnSv/Qi90sD6fjN01SjI6Ldc
         qsMqDtoHT8VswmMd01z3Fds+in+YbSjA7wV9WQ54W+GQTebOsi+sPuVkd8A+cJPmOk+P
         Y73mGGD7ec2z/tQZ7Y37BZL0qtVEdH/yZSRVbt0SipTEeINgPdG4bejlX52XxBhvGfaQ
         0fKpH7N6iTh9+0L9LmgAHaxtjhwUI6zEYcLsu5Jc/cLnGF+RbHn7MoRLSBQkMFcNorgA
         NIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eRXNWHuPd38vN0RWOcJ4q4RHGL96UR0p/zcT0YWhKTU=;
        b=sjaw99PQqw6A0gU8MVgn325Fd+NMX6H574X1F0EYvq2VG9W56/Sew310t1DNdW0s9l
         LfktU0AjhDr7KxGUWTLphL5+wHNv9tVVbBkLe13rZtS70HsYigfEgshxMrGl26stpX6S
         2nR3ho1949FEY52u70abRt91Bp0HbwkgP2qEdO8pOGFmsgl8EoNBUV7QVF0gMwnJ2PGu
         blFL/T2Vy2zwfynePcvUBtM0vdUNTcs1R9PgRYg0j4O2DCoKagXfNg8dZhQ9lj9N4SF8
         +NU4WpcwVNMaDXRHENGrM/mnoVqRFkeycfG+6FXF5bQ5HkX+IQWWqEVC/6ve88gFeplD
         BPhg==
X-Gm-Message-State: AOAM531FIJMatrabYKnbK5mqjL5h/eiS3u7ucM1mwucbFVE57QqMcu64
        F48+WvdDIcIk2T9WpzinWKTUjQ==
X-Google-Smtp-Source: ABdhPJzdwYYOHak+ok2LG8aFPMRytg1r0MqaPHeikvw5/pVuEW0puGgbKabv9hmR2usFiGg0yJHryQ==
X-Received: by 2002:ac2:54a6:: with SMTP id w6mr7407261lfk.61.1633656343905;
        Thu, 07 Oct 2021 18:25:43 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 24/25] arm64: dts: qcom: pm8916: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:23 +0300
Message-Id: <20211008012524.481877-25-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 7d9e25dd9e3a..55a386d05809 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -96,10 +96,8 @@ pm8916_mpps: mpps@a000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8916_mpps 0 0 4>;
-			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
-				     <0 0xa1 0 IRQ_TYPE_NONE>,
-				     <0 0xa2 0 IRQ_TYPE_NONE>,
-				     <0 0xa3 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		pm8916_gpios: gpios@c000 {
-- 
2.30.2

