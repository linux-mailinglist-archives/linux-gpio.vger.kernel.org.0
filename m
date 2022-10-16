Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0147600249
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiJPRXi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbiJPRXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:23:01 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B963F307
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:48 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id s3so6534720qtn.12
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvT/AFVSeeIj/3tM0r6mtFFVLLSfMhXJVOyRyP169tg=;
        b=Qp0pv3C9a5b5eDb14EjoD7hKgcCQstjZAN6ordCCl+Ea2cIZcB55Fc1ICU/51c62co
         IEBd/oB8bRNkAmJaSFHAfQVIKEEQtGJGe7SieE6wGT+rbJBmgsA9Tv4RDgwKMuycgpri
         KXlG8+mWGzctOL9t69yNnfBK/vtmddg+yk1VzI33cAJk+sn3P5gKXW5jQp23LJxyfseP
         tsbDzPeFexmok4IFN1aA4VUOh/91YjArU1pcfPSkU96WxFIvu73Q61rwIn1F5j65lgh/
         vq7hiQS+/145/MN3xHR3HfsVLYW9pT3XfXCcUEAIei0VPv222GUhpIvr6NBbcJT/6TUz
         UsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvT/AFVSeeIj/3tM0r6mtFFVLLSfMhXJVOyRyP169tg=;
        b=52FILhnc2ZLvk8eMa4/IxNUnJW0Q12gvoM/nMxpWwwK4fH9E8QalJIMhSRWRycLqep
         oQ65+nyi+Dng5nbizVtOqTnJ9nh9TgIQaXb5X4b1DlxqStXkhHXXqbgqZFhY4g65BPoF
         jX+/k4dgQO9DbU8iQWV0yCddynEfCpaQmdL9SPIIISH4Sr+cCj2LYpbbxZC4z+3IJI7A
         OHZxOY83FV9L7L4ZzAiHl2KkASWPMo4uVuA8pjXcoiCHc/lXJi3KzN8WCyho4njy0wlz
         HuRwI/fXOYaczXOl70kntZl4844bGhwr6EZzVcbSeTljeR8TUYvbKL57Jz1MJPSObZCs
         zmWQ==
X-Gm-Message-State: ACrzQf2UOzcIzazc7uTC20XtYFlmKQ7YsYO0Ho8HjsMxjLKvH0ZZsl7E
        H/FqiTAbzxbeLcXVa+Y5GsjnqA==
X-Google-Smtp-Source: AMsMyM4mQKBAy9M9CYBBoYoLTWWK7gEgb/xrlDC2Z16WSFfcrbbj61XfDKKQWALw6P3e7omjtbH9cQ==
X-Received: by 2002:a05:622a:392:b0:39c:e5a2:6d18 with SMTP id j18-20020a05622a039200b0039ce5a26d18mr3315184qtx.245.1665940967183;
        Sun, 16 Oct 2022 10:22:47 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 11/17] dt-bindings: pinctrl: qcom,sm8250: add gpio-reserved-ranges and gpio-line-names
Date:   Sun, 16 Oct 2022 13:22:06 -0400
Message-Id: <20221016172212.49105-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

Document common GPIO properties (gpio-reserved-ranges and
gpio-line-names), already used on qrb5165-rb5 board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index c44d02d28bc9..d7d8e5d3b659 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -49,6 +49,13 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 180
+
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
-- 
2.34.1

