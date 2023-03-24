Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72FA86C7A04
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 09:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjCXIle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 04:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjCXIld (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 04:41:33 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7307320A35
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 01:41:31 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id cn12so4905395edb.4
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679647290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qKxYNXZ9eHTtJMVzM82IFy1ZfYeyHo24UX4/jj8J0vg=;
        b=kk5HtABnn5CNziEd/v+xSZlemVkOLRPoG6I2hvVCXKOXwnkXJPXcUb0Ve7gBTCcfRJ
         7xrAPksf0pAY1yRhsrtiq589Lf8myv2QtpFWIytfC8j1nmsQsCh9pT4f6PjVs1C547nx
         GO/tL4XEzbeWHEj1NmtSTPEW13+croi5sgRokLh3/evQnhhD6KbqOH9mM9SJoKHymp0v
         GhWh6CKtzqT/tQjLDQerKcrznVZzvwQR9XtJPL6H/FyK6GwMKt8imm5MCrrRSZehTwK+
         MSi/hsYRjiBULZhNJ8rm52md2WJawZPgfEQAG89XJIYRITGj2sGDTbau/tkAwE5Uddj1
         DFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKxYNXZ9eHTtJMVzM82IFy1ZfYeyHo24UX4/jj8J0vg=;
        b=3oig0Uoj3GjuV6Hxfm83fBg9Rs00uIy1uC0ROGCEz9DtQz0dI24WxGMuo5k8Jwaob6
         hzGKjET/r2gR2lIraOTtgwUbzoEUxwP47MMFp+Jd3IDsCX4vyrY5p8KdeJptpjY6RdCs
         JMP6H0awkN8eajv6SvMqjzAdHyo0lspMydIMD12GX3cZm/sEnq2aDHzKQiAng6SUythE
         0slwbFD9g49nAzJj4imwKBus7CYWJj8dhQyZjSbwVbe6Lh17bkZswe8iCaC659vNcy+m
         qcP1we/KxPoS7bMLz6aTv8w7cfMgd9XmhaB7jW7S07VmkMbsq/ey5onHCz8XTYg2DCsl
         4AfQ==
X-Gm-Message-State: AAQBX9fOoLg9BliMP0Ud3TfDwF1PWDXE/eyHtC+Pp0CYQlpVFcJ1+0eY
        wfJWJvgJKCwc/AQdxoJ5+qm+tw==
X-Google-Smtp-Source: AKy350ai1hGJUdWv5AuStbzO8s918lkqS+DUjEbLx6cM/VEYzEvuynYhgcBLqUsfPvWFwGGEarki4Q==
X-Received: by 2002:a17:907:3fa3:b0:93d:425a:b935 with SMTP id hr35-20020a1709073fa300b0093d425ab935mr2493419ejc.25.1679647289984;
        Fri, 24 Mar 2023 01:41:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id o12-20020a170906358c00b0093b6d1db84asm3552002ejb.120.2023.03.24.01.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 01:41:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,sm8550-lpass-lpi: allow input-enabled and bias-bus-hold
Date:   Fri, 24 Mar 2023 09:41:27 +0100
Message-Id: <20230324084127.29362-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add missing common pin configuration properties: input-enabled and
bias-bus-hold.

Fixes: 268e97ccc311 ("dt-bindings: pinctrl: qcom,sm8550-lpass-lpi-pinctrl: add SM8550 LPASS")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Linus, please take it directly.
---
 .../bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml
index 691bf60abb8c..ef9743246849 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml
@@ -96,9 +96,11 @@ $defs:
           2: Lower Slew rate (slower edges)
           3: Reserved (No adjustments)
 
+      bias-bus-hold: true
       bias-pull-down: true
       bias-pull-up: true
       bias-disable: true
+      input-enable: true
       output-high: true
       output-low: true
 
-- 
2.34.1

