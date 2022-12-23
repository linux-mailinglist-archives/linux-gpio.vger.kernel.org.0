Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3026550EE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Dec 2022 14:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbiLWNXA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Dec 2022 08:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiLWNWb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Dec 2022 08:22:31 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C848E3B43D
        for <linux-gpio@vger.kernel.org>; Fri, 23 Dec 2022 05:22:29 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id x11so7147731lfn.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Dec 2022 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6UFd13R6Y3nRjWmOYfEUEYwr3RHSLSlK5KmovROW+wg=;
        b=u/faGFU/dq63PLohZuY0isag+/7idaZDuxbTspxUk6YtAFY2GWTlPAZqm75ILpK9Pb
         OMRTAn276rxvqU0JwfcsN+W8riljL6rqNGHgcWtwe2hwnv0C5AUUqRtxVp4R5vqJQTH4
         LRNoSqbgf21e5Zajc/slCiANRYkq82oowgMd/7ExUJCcmIXBEHHmEmWFu+4rdeAD5Ajl
         PCSjrX+umRD89R4LL5JgdEZs8ekEb5HUu35X6LFcaYGL8NIiKg5Hpexp0lPNNHyZKdr5
         g30kauwlojxqqQXNJk5Wy4SuVw6yxKxk0UZYEpqbb/xlT70AjpkJJfR+W0u637G+Kzkc
         4SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UFd13R6Y3nRjWmOYfEUEYwr3RHSLSlK5KmovROW+wg=;
        b=cLnSmZp65ETgopkKYlKfVLBJHwxnBa2o3Z7mzD+ZRcMcVmY09OslPPxQBhjfijIZdL
         r0TINBrimap+kRBUEdfc86PWYfTDnLSzY7azMRpX2MKYjRtHY4Q8ppb+mT0hvhzP+iiA
         b1clYw9PqV7cSZpmUpc9N/+6mdMLHCATjZI4KnI94AuLBLXc6GIVUf6w2qRX42+L7VyH
         aqcHfxglsVxYzAoeitqIyoRJaMRKlAyAFqIsTS37ibD2CnQ2vYmWbFDKoze06tt/avh6
         ryIegIsGv0TsbscEK8VzMnRhI6LrE952nT5+QHV+qSYCMShv3Un9KwgBGOLPIuIRDCa+
         zQUg==
X-Gm-Message-State: AFqh2krfpKPAyy+Az3FjuaXSe8kTBQhjpwqI/+lqJvzl0QYaMbzp012V
        wyEyYP7EcqMVOnB+L5AHbw8UKg==
X-Google-Smtp-Source: AMrXdXtVijvUo5nx/fITuIX7zwEhhlGwLEOdsekx/54h9z+U91rKnmLe6aXrCDwLOmUUR0cJ/7VK3g==
X-Received: by 2002:a05:6512:6d6:b0:4a4:68b9:609b with SMTP id u22-20020a05651206d600b004a468b9609bmr3207609lff.38.1671801748125;
        Fri, 23 Dec 2022 05:22:28 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n23-20020a05651203f700b0049462af8614sm526747lfq.145.2022.12.23.05.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 05:22:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,sm8450-tlmm: correct gpio-line-names size
Date:   Fri, 23 Dec 2022 14:22:26 +0100
Message-Id: <20221223132226.81340-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SM8450 has GPIOs from 0 to 209, so 210 in total:

  sm8450-sony-xperia-nagara-pdx223.dtb: pinctrl@f100000: gpio-line-names:
    ['NC', 'NC', 'NC', 'NC', 'WLC_I2C_SDA', 'WLC_I2C_SCL', ...
     'APPS_I2C_0_SDA', 'APPS_I2C_0_SCL', 'CCI_I2C3_SDA', 'CCI_I2C3_SCL'] is too long

Fixes: 9779ed30f92c ("dt-bindings: pinctrl: qcom,sm8450-pinctrl: add gpio-line-names")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
index 4a1d10d6c5e7..b5356d0f89f9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
@@ -32,7 +32,7 @@ properties:
     maxItems: 105
 
   gpio-line-names:
-    maxItems: 209
+    maxItems: 210
 
   "#gpio-cells": true
   gpio-ranges: true
-- 
2.34.1

