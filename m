Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF1F6CA4C3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 14:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbjC0Mxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 08:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbjC0MxZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 08:53:25 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354B2DB
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so1996888wmq.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udYbZm1m1VpupjdQEcpfeGKjOurhLuzykwsyJjMKXIk=;
        b=RsQGzl7OHi2W0OP34tO8lUlCs6kyyTmB3+ioHEoQRD4OTsU8OusSkEhedH83ipEIIO
         frYlYyRvk8Ce5Pu2INcRcwmuRsR7IY1fpqsyw4/Ia7VG6JUWKvr/EnDingWhZWABwlhE
         hxKBm6ao3E3jbCdTNtmQKyns+dD8kEMgXV5HWZSioIzrExIJLf+pI5h1EcHFjs31ML4d
         TQyN11OcbsyPN8ULWqtPUdcF836t2NVdWDD70bqqrV729BDYnnD6ogRUeRhx5FlUOzNs
         G+4AKknCL3m2KZYm//z4f/iV8fF1/wgvkgiHzaMJtCSWo1BB1tSCAa4FlBT3o5pJW47y
         UzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udYbZm1m1VpupjdQEcpfeGKjOurhLuzykwsyJjMKXIk=;
        b=emsXgzXXPMQ0qz9tp8Aygz34UqwqiVdlG9/2ZSSB5+yOrzdi2Tv+VD6V6nNYoQOzpJ
         e8sYBLdnZBh6hHqj7mKpuhrH595mmHg0cy+GvXj+2h6DCGvLfQd54iXtwpZIs3/q9ISs
         SAbxMh0S30slbXvA0zFQO8JTRLJIKfFGe0MaVldEAzU/DDjH1oWVQszt6Iy13eh60STJ
         9s9dogs7Vrm9TtSsFLvmkRClZgZwGw6nar1EPiSKUC6JprTB+FyZqPfThD8SJqdmhcdh
         kOQ4CWh4iavyqpImFYo19Rb+2oV0U63TChasTbSOzXUhPVruSrPj+DMT9fiUCl5Fr5WU
         aZjw==
X-Gm-Message-State: AO0yUKXO5Ej74JfCXMKdZEPD46L/DfCM4znXRXEOY1dvUWFef6IE4+vz
        7HtQDcweZEq/Gsh58E1dnlQ1Pg==
X-Google-Smtp-Source: AK7set/YgufuGHSoEVNDvZZGESM+gcNFehbuv1z0NGtrsonwEybP0BFqUGzQ6MrFHjBv6qR+dmm87Q==
X-Received: by 2002:a7b:c8c4:0:b0:3ed:b590:96e6 with SMTP id f4-20020a7bc8c4000000b003edb59096e6mr9213319wml.4.1679921602633;
        Mon, 27 Mar 2023 05:53:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 03/18] dt-bindings: interrupt-controller: qcom-pdc: add compatible for sa8775p
Date:   Mon, 27 Mar 2023 14:53:01 +0200
Message-Id: <20230327125316.210812-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a compatible for the Power Domain Controller on SA8775p platforms.
Increase the number of PDC pin mappings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 94791e261c42..641ff32e4a6c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sa8775p-pdc
           - qcom,sc7180-pdc
           - qcom,sc7280-pdc
           - qcom,sc8280xp-pdc
@@ -53,7 +54,7 @@ properties:
   qcom,pdc-ranges:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
     minItems: 1
-    maxItems: 32 # no hard limit
+    maxItems: 38 # no hard limit
     items:
       items:
         - description: starting PDC port
-- 
2.37.2

