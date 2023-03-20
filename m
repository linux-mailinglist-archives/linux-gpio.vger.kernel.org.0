Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94416C1A81
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 16:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbjCTP55 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 11:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbjCTP5a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 11:57:30 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C25F13DD6
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:48:59 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id j2so10808536wrh.9
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFagH7Wy467yArlN8PfToUzWlF73GJmp8tPyB6uSnJQ=;
        b=vnmRwAYvwZyssqyU9wLZpzq8nIWxTaGZXQlRnxm1fXwsQ593+tpR2tkU5vE+7zlbAi
         sGVK89/px4tfIjb4mW5gn7a8lG1okwSze+/7lk2aiCQHFlsNLiJfKacOCf7MajHNFg7Q
         y0+j2bA79u8J++dxDeOTkWVqhzKZgZ56OUu+oLm2PHYxPHEh/YtbW6/dexC3w5NbdxZR
         NF14xScb1aSpHH7lf8/bd4OZ0+ln98QhkaT/XYx99aw2YHw1n0mBS/q5N0xi1qECW5JQ
         btClEg8KgYN4BunpWAvboGjvLVvN2fksb7DF6OssZ0h2ayAmnPJ+97lnhxnwkjNUsq7c
         4WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFagH7Wy467yArlN8PfToUzWlF73GJmp8tPyB6uSnJQ=;
        b=OfVYKiVr1DhQIeUI4doLO73O41bHu7fd6E4Ho9xTMmaQLIC5bixHXNCpEdd33aYn7r
         e14ChnmizO37DN31iy4GJnhEPvIWLsdGTuELhkyGfvHyz9wZ8btMqN4UcQ4wfINsjhqC
         yFo55gFCp08M18Nm/B8L4CffSE+X1zFtpv0B0Q3d7pqm4o+cKYoB6Zo9P4Tya8A6A6A8
         WAtJabMVkNdFHBs/KwxM5njxRJNPgWEfzF+rx0u7ryuh512oAMzMX9Q8XqA73kyLonuX
         XwP9E6jYYvbgM5eRQoOOb/FFhBsNMHx32qNpKPC4LXlAqCQulzEBIYWLGE9U+Fd2Odv2
         NtHQ==
X-Gm-Message-State: AO0yUKWF+yOx2IPJtnXjP8COlxXF9ncnQtglAq4MhZFv0pxP35/gBCWM
        lK415mBTCO+dttvJweyEGDPSPQ==
X-Google-Smtp-Source: AK7set8VjWoOGZp5xF04nkSq+DWMPKhBwqP/Ha8x+7e4jjE+1/rOXUm2nzJZNtKSqaXjPHP6a1dHRw==
X-Received: by 2002:adf:e4d2:0:b0:2c7:fc61:12d4 with SMTP id v18-20020adfe4d2000000b002c7fc6112d4mr13373767wrm.47.1679327333782;
        Mon, 20 Mar 2023 08:48:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:48:53 -0700 (PDT)
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
        Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/15] dt-bindings: interrupt-controller: qcom-pdc: add compatible for sa8775p
Date:   Mon, 20 Mar 2023 16:48:29 +0100
Message-Id: <20230320154841.327908-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a compatible for the Power Domain Controller on SA8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 94791e261c42..25c4662a0280 100644
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
-- 
2.37.2

