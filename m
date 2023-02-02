Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C800687AAF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 11:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbjBBKrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 05:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbjBBKrA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 05:47:00 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C2D7307B
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 02:46:35 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3381816wms.5
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 02:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH+iUmIlo2XKkyypu6pZsAFZkWM7iFUcewJRIDKO1d4=;
        b=wL1mi3PJRBi0JykWqBs6uvHs4StZ96TvImYGdlkUyygehMQK5Ew6RCwrDNljcmthjp
         V7S4+mUldPNvsbgW3e1PELzIooLUCoyM7MOzQC1PgSFfMa+ZU14PGLfBdxdumFjtdY+w
         OO3ptxXTFCZaDWhUY5ps36PHFJaQhA493DSUbntA4c4gGU/8OmAraVqZMcxcz3MU+VJ0
         c6MSfy+9B6BXjOx7TXE+fPDNSg+5WATwAPVUt/pwTDE9DFRBhmQY4WAj0IiKvVmE/oZt
         PapBE8NC2ZB34UGMhiGJh0LW9hYzleUb/wXxHBtA00Q1n9ll188NwMvqxg8qqmGQfBun
         b6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH+iUmIlo2XKkyypu6pZsAFZkWM7iFUcewJRIDKO1d4=;
        b=y6HLtLT/fB94AHJ5xAyMAopYcQT3nsbefpOVZD3i4oKZBOjAXF8XnkwsufK85TpiHT
         xN2Hzx7lr3eMn3J1zXiO95WZcOGizL2BDtWzWDEy5Gy4BDn68E9YnH6g1qw2rC7IVgE6
         LiPZuh9F5cWrenbxchrNoY13vr5jvsMZhXRFXqgpuzfk5CjHaWfwQ8gvMhltNQc6SVEE
         4Drd1ilqg1rEaImML16Oct9by+YpFkilAWhixmNLI8Wx9tu6+TuVeRF1BNtmPV/vdgF5
         BTbHf5DYuwp3aglHwnaLVX775w0Hd/yk/nOqTMGG2aaks8qu3COI0WiDTKXA9QlJFZYI
         p3UA==
X-Gm-Message-State: AO0yUKUpxvJmzsaSg5fwQyoOL8iLtieGELvGEC4whtPQ9wUkxwjzPvhd
        Qe6M6OAXKNX0PZjTZWMpGlq8lQ==
X-Google-Smtp-Source: AK7set+DPcoQAfOZKyz4/fAgZq6BofJpqytIft8M3kbK42qOQwVj1yb8qVQ3qUHaSEtZMJyRX+ln7A==
X-Received: by 2002:a05:600c:4f46:b0:3dc:557f:6124 with SMTP id m6-20020a05600c4f4600b003dc557f6124mr5436204wmq.5.1675334757642;
        Thu, 02 Feb 2023 02:45:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a05600c181800b003dc3f195abesm4307329wmp.39.2023.02.02.02.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:45:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/10] dt-bindings: pinctrl: qcom,msm8953: correct GPIO name pattern
Date:   Thu,  2 Feb 2023 11:44:46 +0100
Message-Id: <20230202104452.299048-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
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

The MSM8953 TLMM pin controller has GPIOs 0-141, so narrow the pattern.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index 6bcd52080801..ce219827ccc8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -53,7 +53,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-3][0-9]|14[01])$"
             - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk,
                       sdc2_cmd, sdc2_data, qdsd_clk, qdsd_cmd, qdsd_data0,
                       qdsd_data1, qdsd_data2, qdsd_data3 ]
-- 
2.34.1

