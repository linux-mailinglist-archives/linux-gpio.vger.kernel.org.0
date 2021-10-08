Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6224272B8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 22:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243252AbhJHVBq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 17:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhJHVBp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 17:01:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C05C061570;
        Fri,  8 Oct 2021 13:59:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x27so44031196lfa.9;
        Fri, 08 Oct 2021 13:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6pTcByQPk5Jf2+mJih/NpHnbUxpeLWoOcWY2ExgN9Aw=;
        b=i3nHaoe93M3T/HU0xnUMzZ+BMy6zPba+L7Om/Im25bwyH3YhYSXA/ShlLNzc2BMW4K
         10qI0Iu/CXtbDopIGbfPRniuTTPKILnrcDfhYThlb+bY8QPWbOpEDUpEt7JgvtG52BEa
         NJGTuPwVyVr0okWHe1UEcNqhk0cIdPcAEZNnpLvKasYN9yQ1H2r1QlnrYyyinsnygCt9
         PosQgyuuBRElNNpGjc5tkNx7eEe6TJHEDocOfKmpINW1NFzao2lg9V6YE+qOx3K3DrFb
         u8gsqqA6V11YBKrSc7zzHhPPMNqezjD4VSz8h7lJSkDJllP0AB7u/9fArfPj44pwtOVm
         xiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6pTcByQPk5Jf2+mJih/NpHnbUxpeLWoOcWY2ExgN9Aw=;
        b=C4+EoSxuCdOocdDIY2Y5FtNlb9h4+Qks6YwBCpXcMr4XgQvqLQO5JxAsEFWxh24upn
         CtreGDs3CDH2l2SsZgX+WHYsJCVl/VZQ3W2LSaBf37SbBo238YCVmVDS+ny+WwG4dPG7
         JUwfyowGcoGiS2xhPqY2/wwO1USL6+oZVy9nuQfIrF9bzHxtvlB6EMmL+yGXdJzVm+GW
         wlwlFKqrO8m/ed7vM/XDAP59Oy8sCiXQsHeZ/y2HoyY8+p7bpXBNcs1fLGp/AzP+Jf0a
         z2xV4857o556HQOUo1tSBr+awRhA+X+iKQJ45iJlZYSyEj7hpJlQeDV4jSv9tLQWT+Ai
         fadA==
X-Gm-Message-State: AOAM530SRMYl7aXxqXq9qG9iA0yjObtGrzxWGeuLoK9eVfO05xWXo+IT
        V21IJCF/HBT90Vvh4OT4G3M=
X-Google-Smtp-Source: ABdhPJyrTs63HimQZUhqm4OXO/Oh+DXx7zCmgQZ2/AAGX5aHiHCm7vEGO+JHPJ1JY/x8RK51VRp/LQ==
X-Received: by 2002:ac2:58c4:: with SMTP id u4mr12458913lfo.534.1633726788089;
        Fri, 08 Oct 2021 13:59:48 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id a21sm31862lfg.194.2021.10.08.13.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:59:47 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 linux-pinctrl 2/3] dt-bindings: pinctrl: brcm,ns-pinmux: drop unneeded CRU from example
Date:   Fri,  8 Oct 2021 22:59:37 +0200
Message-Id: <20211008205938.29925-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211008205938.29925-1-zajec5@gmail.com>
References: <20211008205938.29925-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

There is no need to include CRU in example of this binding. It wasn't
complete / correct anyway. The proper binding can be find in the
mfd/brcm,cru.yaml .

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V3: Add this patch to fix dtschema/dtc warning/error
---
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
index 78600a8fe403..fc39e3e9f71c 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -77,21 +77,13 @@ additionalProperties: false
 
 examples:
   - |
-    cru@1800c100 {
-        compatible = "simple-bus";
-        reg = <0x1800c100 0x1a4>;
-        ranges;
-        #address-cells = <1>;
-        #size-cells = <1>;
-
-        pin-controller@1c0 {
-            compatible = "brcm,bcm4708-pinmux";
-            reg = <0x1c0 0x24>;
-            reg-names = "cru_gpio_control";
-
-            spi-pins {
-                function = "spi";
-                groups = "spi_grp";
-            };
+    pin-controller@1800c1c0 {
+        compatible = "brcm,bcm4708-pinmux";
+        reg = <0x1800c1c0 0x24>;
+        reg-names = "cru_gpio_control";
+
+        spi-pins {
+            function = "spi";
+            groups = "spi_grp";
         };
     };
-- 
2.26.2

