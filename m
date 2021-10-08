Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B4A4261E5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242021AbhJHB1o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236670AbhJHB1l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BA1C061779
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u18so32213587lfd.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NtooTKuWfsI0QCrRlrRKhhoPIOiA7SRZqluNA4mW06Y=;
        b=aWDxB0PYpCY15yhKsVmwv19eqWn2uKkjYNC+hE5Y+PDeZc7fwSQiGu3sbolIqy2ZEq
         ZsPvV82uihaE0zJtKej20IDyWT8qLXJ21oCCkNfobAzjxHmXyVVD9f2POwp64TsPKc2K
         urQng8pCPAyn2Q/a07tf+6xq6nMM/1WlaTdDjSighn1bxZqWjZBa2i+q8uX1F/HEXin3
         vbhZzfWeaShos8o0wiLnPIiDHgS3ebBNM2SljMyhuzcYFhzBaadgUJ0h5bimrIbI5AiY
         maicZ/6R/5AldxAi3fsOE+mEhu2mT0PoZsUaMRKnOz2SmzZ71Hk9V05wd/7GLxoA5HSP
         ip4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NtooTKuWfsI0QCrRlrRKhhoPIOiA7SRZqluNA4mW06Y=;
        b=Fk4/vcFlgcHqUMSz4oF8orJemFkdooxDloRH5DGheMfvxIqf3wGT2ICNjdRO4Jt7ol
         gmb34nsXAPTrCsgywIIj11dk1n0Mbxk6Ht1E+gh/4Gci5J3KjTAp3NL7j1Cu9ODawE5G
         0C/HRcT5WeC169ms6oc8wrYd5JUWadGlw/Ce4kSaXjm7cgEWocLUwvNa4Ag+t25AZHbf
         olACkwo5pmB3eC3q6BzJqIBjzyd9I6x//gdefPK2iQO8goU4h1sWfRkVebXK4lybXSkg
         OAjEwauKFyhFjqqAgW3kiQe9wI8M9+lPOPp5yzEt07cl1kTDFZUwOthxL+xr+JA33s12
         sgCg==
X-Gm-Message-State: AOAM533gdGqaGMEyvCF7rGt/WOYW2vmcLBf9RwfSPLhEZDgafLgtmzWO
        D1oLqeWyJkipMeUZYsQxSxDLuw==
X-Google-Smtp-Source: ABdhPJzntHd55qa6ke5V7eAsBc9OkPo8cs4GQcXbUGDmvvm1Us4jJr53MrgcGazf+fXbelVI+Jr/YQ==
X-Received: by 2002:a2e:a41c:: with SMTP id p28mr330737ljn.293.1633656339216;
        Thu, 07 Oct 2021 18:25:39 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 17/25] dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells
Date:   Fri,  8 Oct 2021 04:25:16 +0300
Message-Id: <20211008012524.481877-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
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
index 475733cabb02..35c846f59979 100644
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
@@ -164,7 +163,8 @@ examples:
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

