Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4DA5E6C6A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 21:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbiIVT50 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 15:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbiIVT5N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 15:57:13 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF72110CA65
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:08 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f14so16473031lfg.5
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MnJiqKj/e0bK6O8HCkffXBhhqIr/MLQ5+XtNrwDGU98=;
        b=Ld6UrZ2WvTW9uIl+6BjlF1IuBIIFiwde5YvP2eZTR/yhNMjs6Wl6ibHS+fz2WFkowo
         kw3z/8VqxItyyXD4etJHBjsIpfz93GK7Npx6esi9aAGwNdiUf9fgxNTI6lcGV7+WTr86
         TWS1HQ3rdF+7i9NWH5/3/Nerkp2uRlVTnV0jzc2l+vU8azNukkTFOgXKXySEmU2328R/
         fD2a4srWJkp4K8nj90B+CdOoQMqoldg4SfBt+DfsfINQvXUeGYA08FbfBXvLaG4WuWmJ
         lE3FmXc2uuuzfCnfV54MiJWKUp/5CI4z/oBivW0wRnIl6bnitivBmzriSXEQwuZL1JoB
         d+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MnJiqKj/e0bK6O8HCkffXBhhqIr/MLQ5+XtNrwDGU98=;
        b=u+ieU0xMO8Cm1OMkfGVrtQYx37sW10ifJ6QW02pMgst1Nudy0TDOGyvkbYhDlIryto
         bQJKvkFb6AmGXTtjdZi2pcce3NY9VLDJXpiJ7688hogQ4ndgOgXADou9ULpXh+DYGndi
         bZCXPOENF5BQvJuUZZhq0MbMg4iyxFysM6XJ2E6tHSDAkHqm6F8Mjd089iAApV9nXDch
         NZ6UIl8V9PKfzq2I1Fz2GjI7GDWuqrDEPxXBqWPfWs65yVCvt1vmwZO68xtnOudQ+ys5
         d1C+7rzehHqhlQsZ1PE+HccmB6Pl7tPinnfgURYGk73l2aYVIjlEewBetgK/7FBfjPPT
         94kQ==
X-Gm-Message-State: ACrzQf1AaQ9z3gBE7e6ow0Y+nBMeM3m2D6Cb1KMx6EjeL5ePcGcSMu5a
        nAzFyyJNqcgEozW3aNCr7xkE0Q==
X-Google-Smtp-Source: AMsMyM5Q7W16iXPI8jA3/nPDy35YnHEIlNe3uS13TbNOLPBTDNgmdH7+jkIlrcghKlaw7kGs82Kj4A==
X-Received: by 2002:a05:6512:489:b0:49f:4da0:a023 with SMTP id v9-20020a056512048900b0049f4da0a023mr2029897lfq.599.1663876626876;
        Thu, 22 Sep 2022 12:57:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:57:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/12] dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: add bias-bus-hold and input-enable
Date:   Thu, 22 Sep 2022 21:56:47 +0200
Message-Id: <20220922195651.345369-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

The existing SC7280 LPASS pin controller nodes use bias-bus-hold and
input-enable, so allow them.  Squash also blank lines for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 9640d1110fdd..2427da7c20d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -96,13 +96,11 @@ $defs:
             3: Reserved (No adjustments)
 
       bias-pull-down: true
-
       bias-pull-up: true
-
+      bias-bus-hold: true
       bias-disable: true
-
+      input-enable: true
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

