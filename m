Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10219422B57
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 16:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbhJEOpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 10:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbhJEOpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 10:45:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C59C061765
        for <linux-gpio@vger.kernel.org>; Tue,  5 Oct 2021 07:43:40 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j5so82272283lfg.8
        for <linux-gpio@vger.kernel.org>; Tue, 05 Oct 2021 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eb7cvTiXllNW2wJwYsGoR2tpvILpnhXsuAIehYc3HJU=;
        b=ViN3AXWf9Zcsb6/WPIK8EYFxRwaeVN7xS+ehn/nRG90cPZoHHFdxuQ1lZh6I09M9cL
         j8kJnjrwCgP2vIYhmWjvTn6awt2E9CzFKWx2tjBDD8/Zp8igQR2JYq0jAMw/hlM4ExEq
         YIBNScmU8dMxI1bva9AINi4bmqqUOoEzc8Dh0+JoKWhsMb3vS6bGAZmItuG39meAH8ix
         56XkP9KWsXdbH1AeVoLinAe838tYBw7ebvcpLdDUcG+dWT0Pl54ALgcoIET/U7UdB2UM
         bNg1amlEULaSbsG+Xw+CwqVeyySk4VrTvkWppGQqKM76zKnDrGtvdVehUnTHS9zZKkE4
         kQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eb7cvTiXllNW2wJwYsGoR2tpvILpnhXsuAIehYc3HJU=;
        b=cxozJWe3CUsRf5liqhVJUtor5HSYHutHxxXqgqNFZSISnuz4FnwzgGv0chivk+I23G
         ko6vAGorKXhqWnO4muEM6Ypr5ZV+xPZq6qyJwUA7Owt3WcXO2oaIDZvXbvMV364iMK8z
         bAfvRBeUlktsSPNt8zQ0cTd63f3blPhm2d5DeyCjy+K4Fcf16/sg3MgZv/CZxukvQGya
         UtMqjsbaopPVtmTYemob9jSUAAnd7VNwAbFLRuFsVoRitN1uFZwEB0ZpfZyUWqImEtJ3
         8OS3U92XlZSjRRU/xJ1C6V2vV5nzgT0dK9RbUL4yQvQe4AcorvbVlgjiMcayYOk0f7wG
         lfJw==
X-Gm-Message-State: AOAM532Kl7xtrRBCtf3YbhsAM6ENdsNizDdYQWco8k8XtPSQ596Xdm18
        LIIz3C/4kOPq3EN2PSYDVr1/nw==
X-Google-Smtp-Source: ABdhPJylKuhxFgyH5Vzh9Q50gFqyoCKEaaYNaHrg0W3hGYe42i8sVk1RERpXmdRvoqigA8cNuW89MA==
X-Received: by 2002:ac2:5e9c:: with SMTP id b28mr3863549lfq.468.1633445015822;
        Tue, 05 Oct 2021 07:43:35 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm1987173ljc.120.2021.10.05.07.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:43:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells
Date:   Tue,  5 Oct 2021 17:43:25 +0300
Message-Id: <20211005144329.2405315-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
References: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Stop specifying individual interrupts properties. Use #interrupt-cells
instead as we are switching qcom,spmi-mpp and qcom,ssbi-mpp to
hierarchical IRQ setup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
index 6066857b5964..8a01a9b22e07 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
@@ -40,12 +40,10 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    minItems: 1
-    maxItems: 12
-    description:
-      Must contain an array of encoded interrupt specifiers for
-      each available MPP
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
 
   gpio-controller: true
   gpio-line-names: true
@@ -67,6 +65,7 @@ required:
   - gpio-controller
   - '#gpio-cells'
   - gpio-ranges
+  - interrupt-controller
 
 patternProperties:
   '-state$':
@@ -163,7 +162,8 @@ examples:
       gpio-ranges = <&pm8841_mpp 0 0 4>;
       gpio-line-names = "VDD_PX_BIAS", "WLAN_LED_CTRL",
               "BT_LED_CTRL", "GPIO-F";
-      interrupts = <4 0xa0 0 0>, <4 0xa1 0 0>, <4 0xa2 0 0>, <4 0xa3 0 0>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
 
       pinctrl-names = "default";
       pinctrl-0 = <&pm8841_default>;
-- 
2.30.2

