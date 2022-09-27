Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9025EC803
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 17:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbiI0PgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 11:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbiI0Pfd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 11:35:33 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F860DF7E
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:35:13 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l12so11331282ljg.9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EalEz9AV2V0m5q+BMPo2gblVIc4RaNqnpRQA+ia4FNc=;
        b=E0i5PYEN24O+6dgL9ngxmJEGTGs47BaRui5U8vGwlpdKMIngJr2/XH4ZAXfdA2FyZQ
         QCug4TFZuaVXHHivO8BVAiDmo65MMrpC3ftNNeLDKvi+M6GIGoMa3+2osjcYrZr9+bsm
         yemvCSFXbYCo+l/Gh14xz9ng6qHw14g3an3w7r3kOK72aCLTkrLJEG0iRRSH84REC76L
         SyIj0zYDeINJwq5f+8k4qCsuDUMDktB5LP6772PCtyvpWN7rJm9IVIbJ4/K1o16ry/0M
         mvDBHfcsL52pLZR8VIervMuU4hAlgyQCAnQhrHmoxc2kPgSx6eXWhgx8KFVw7KzfD8bQ
         jTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EalEz9AV2V0m5q+BMPo2gblVIc4RaNqnpRQA+ia4FNc=;
        b=v2oLaKm1Q5WVstCEl8WBdLLVfX9NOA8YrkUpA7wXnhFfCv9ZCIf+991I0clXaFM0tQ
         VR0l+64RnwccUpbmBgxYgi/leBhujCwjMLRr7NvDNzBC6SiofJp9Ex6XWI0n06KDiadn
         /dpG9UuvwwTH8GaPJz4GWc+/Taq9HxeqmcCIs5AGjtGvfRgnkTcpXqn11+rU/rVshYJZ
         vt6BxFZt0YsBgDb3qjZ16ZgzyYG/+w498qEbhfTfWF3q4DyX+DJP5q5vpRMVGWNbqnVT
         ac4Uc3uiDct+UBOuhAgqaXaD2cw/ew0AwYW9dVT1q59nAs8H3ldNPYv6NxXB1ISsBQtX
         VWYQ==
X-Gm-Message-State: ACrzQf2FoNEFFot3EhfIhB6j9LhOUDGVTDal4afjnzSB7ho2kNSFme1K
        x02zOJQ9kVLWd1dwxo0IUnVzuu5ntbRwqA==
X-Google-Smtp-Source: AMsMyM4hs1yEXSuiLsujg/XbJUM5EFTVyJx5Cxs22w2sTyb14cMgxbDCc+qifhsud/W44L8RZT7Mzg==
X-Received: by 2002:a2e:9c1a:0:b0:26b:2bf7:9154 with SMTP id s26-20020a2e9c1a000000b0026b2bf79154mr9419060lji.417.1664292912811;
        Tue, 27 Sep 2022 08:35:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:35:11 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 11/12] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add bias-bus-hold
Date:   Tue, 27 Sep 2022 17:34:28 +0200
Message-Id: <20220927153429.55365-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
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

The existing SC7280 LPASS pin controller nodes use bias-bus-hold, so
allow it.  Squash also blank lines for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index a8a48b684692..bd54c92287d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -91,13 +91,10 @@ $defs:
             3: Reserved (No adjustments)
 
       bias-pull-down: true
-
       bias-pull-up: true
-
+      bias-bus-hold: true
       bias-disable: true
-
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

