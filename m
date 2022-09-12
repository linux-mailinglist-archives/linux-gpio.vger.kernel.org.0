Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 161B35B5452
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiILGVH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiILGUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:20:13 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49FB2A25D
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:48 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r12so7771073ljg.10
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ecN/gYWUwSiweisrF7KuYwKYJSjUztD/7vYHklQvBvk=;
        b=IlYDGyr7po16zCLurzL0boVCWpIe2vQrGdxG+n1Dkwb59cE5qATQprDA9UG/pjEjbw
         ic/0lzmV+44/3QvRGjNPtiPoxjzMFCKBJXYnfjj02xAn4CXb+jyAcLDOUZDwEjVoIBec
         34oR1ovQ34/8UMdrKNYgTwpy1BDwEzdd3xfZpiVcDZ8Q/0r0KBPBPHjAxT3KyZVRi65k
         kDRJ5pDZwqeUnOl4q7dhX+PjXR21GDTorw34XLj46rehoGnqUP8EY2yuT3BmhM54I71b
         /QkJeO1yf0RTr8JTBbjMkxCuXeW32D8gBkhHgSYCfQxFLYk06Qa2LGVuHt4X/9CaeDB3
         KmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ecN/gYWUwSiweisrF7KuYwKYJSjUztD/7vYHklQvBvk=;
        b=gY8GGI3u3XYA58hcSK/Ght19ZUd4mX9T3SnWWOk2cR+7BXPgyQBu7dh29Y1o3RluJN
         ARQQxJnQRLw98/P5aA7vLtjcF/Xmqb3sUGIWjeGxnMI6xmyZELs07Hqd+cGaTQ7j3UlY
         KHyFiL8Se2lzGYS5wGUlyHnUZmSs2zaKbC+FH0Q9y5HSGqEdfTZVXaLNCYV5yp9GScUq
         KYddMxaHCso/3D5ZdMWQaPCZJGq/mcvLRTXlh68u0JYh3/r1rrVu7hIPYJPmtvI4naLs
         T20Dcb8KXmiXt6zrzQWGdFnEm/N9hXmPwhY4HMNxDGhaHogEXEL4Zzdnd+lW211Wwhhz
         0m3g==
X-Gm-Message-State: ACgBeo3muE9RR1Bc+0a00HVE0Vcl8r8Q7wby2A7OzAhS/IfObuY9GjPu
        vmiuoFkbWwHv5+Z411yTUqV0Og==
X-Google-Smtp-Source: AA6agR5WeLK4jOC+RH7LR6VxQ2wxUntjRu8GCITTJXfjC05e3A87axkbjrtO+q4v9lFP6N/4UE+QUA==
X-Received: by 2002:a05:651c:551:b0:261:dc64:8027 with SMTP id q17-20020a05651c055100b00261dc648027mr7888259ljp.272.1662963506450;
        Sun, 11 Sep 2022 23:18:26 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 25/40] dt-bindings: pinctrl: qcom,sc7280-pinctrl: add gpio-line-names
Date:   Mon, 12 Sep 2022 08:17:31 +0200
Message-Id: <20220912061746.6311-26-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

Add common gpio-line-names property (used on SC7280 Herobrine boards).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index b12e738cabfa..463f2e95e237 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -42,6 +42,9 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-line-names:
+    maxItems: 174
+
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
-- 
2.34.1

