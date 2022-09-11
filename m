Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E805B4DE7
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiIKLNW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiIKLND (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:13:03 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644D533A25
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x10so7398654ljq.4
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ShPxgoMmuatqdGQWqNcZcpEJgDBD4NgqwMQX8EaKFn0=;
        b=DHP+jlt/E508Xv9iSxNq/GTHVPkKnFhmT4qxAzzHSJDH/cXXAve7zIzeb0/DykHttt
         hvrGvHRxd+VN/E/pd3aIB8uIT22M/f69/zEVkK1b0ix5hWpCfccUlvADMrwNRhpsFzqw
         8FaaZTtA+ZAaJtvEGOTTEoNbQqo3Pozh5Qt3GwBZSNDlJ6PNznxSeU16KqNL7S5aLsgt
         Jcf6zeaCTuoFwYAXzPdDJxM8/2W7ncJCVblarYhbXXpFhN9kijV3l8e54jI4iKhp/unc
         PeoQeAG++TPRyMsqpuWGiSJQ2ri9vmMiImHrnlmQLRC0m3RAG3wDuKdwQTpQPYWfRK4T
         fivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ShPxgoMmuatqdGQWqNcZcpEJgDBD4NgqwMQX8EaKFn0=;
        b=q+NV8hJsUQuHT7NxfpnJyNdzdSgT8vnpXV1E7Xk0Gd+j9HATYndI7Uw5NCONiTstOe
         ZI1Vnk/DjsEL4gRyTcsprBSr3lx4KnvNhSBphkWZEbpJe5J+Xl8xchCIPbf8f3d6VWas
         t/w04J3JQuo43K4Yyf44GOcgdS5k4I9R+YjdDHN3DDl0jB6y8AS+3YBdzlNNTVumaaNz
         yMQyx3BaSzx8QDCISq8QEEDnyuoHIG33cXLEIGiupql+bO1ZBOsiytzU7EC03jef4EAv
         WrkCQMyLGGO6NQsbSAuT8CDAA6udSPnr30xUrmTKQ2MgRlXfw/6jR/1XBo6WcnnEtD4m
         NONg==
X-Gm-Message-State: ACgBeo0dtjW4ECiKA9HGcIYVU5jNzTNryc4NIVB2KpGcJtFAR2+eIVsz
        45PvaLutx8NQrH6vzHtgoCPMxA==
X-Google-Smtp-Source: AA6agR571Fj41lyHAFhyGUDDlkIECF++W//6UfXv4X11c7ukU2cevSz0vIUMWA77oDUddJAiiQE5ew==
X-Received: by 2002:a2e:7309:0:b0:26b:df01:9f03 with SMTP id o9-20020a2e7309000000b0026bdf019f03mr3905831ljc.221.1662894742330;
        Sun, 11 Sep 2022 04:12:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 14/40] dt-bindings: pinctrl: qcom,sm8250-pinctrl: reference tlmm common pins
Date:   Sun, 11 Sep 2022 13:11:34 +0200
Message-Id: <20220911111200.199182-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each subnode configuring pins (so the final -pins or pinconf) should
reference common TLMM pin definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index 12bdc2e67c4d..bccc83f22aae 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -112,6 +112,7 @@ patternProperties:
         - pins
 
       allOf:
+        - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
         - if:
             properties:
               pins:
-- 
2.34.1

