Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE728601D18
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbiJQXCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiJQXBy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:01:54 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B60C80BFA
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:19 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id x13so7655164qkg.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMNScuoSuEMPiNHi+5Y8YkXsd1atUOjn7L6LUFfL2LI=;
        b=T5kQ4xI+7mFotfutNCWBVXuDKdVbU3n/2dkKxu+UmMP24lcjtCjOp01EYkvNd5H6cm
         GOc+24uSDvmMtY5GE4OwYdKVSuoeK+g14Z5HBZS6bvTKEd44j2cyvcVduYdbI9jYxV5S
         LhUcibs9cT6pg6HCY3NHZzbB6Sz//D1u9yAV6z4EXjtEUtEElcb6WBZ/pxYQzh+SUtbv
         7HGO8OT0cUZJedkOJRREts4qrr4B/XWFcCrLrjaZb47aHu+NBnHvNcwzaIQCSs8rP2fC
         5TWiWqYTm1QU1UyF0tkRdqhHieTBGHARAH29oOXRr17+PydZw61e9AZe0cgpXm64zY5d
         B2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMNScuoSuEMPiNHi+5Y8YkXsd1atUOjn7L6LUFfL2LI=;
        b=wVBjMi4Imk77JAYH9m8BantwPK9QKv8ka+lyU5+3huEfVlx79rMtCOAMp0kAlZZtKW
         ZEUg9nSuM8r7pS+7L3oqz64wPImnNXUMIozRaA1OsP/yv6hbkILJJr5k5XWmyDg5yZOL
         ZrTXgyU/hgeKkhLXdFfZXIJEz7woUQq5XAW2OCraj09HfklCTJEZ+9f2vReNF6B/nNaC
         Gg1Vu6czP1HxLzwH2xnpqWWr8HPbkRfXgSghzBeQzip8stp3UnRppzOsvoSYi99KzVSG
         04U2KcVuGrQEAYCAtKcOsUaGQexvNQics+Bdeo9/g7GJ0Jk2FSFUKAwDjvXBpJ8MD0KY
         DWSQ==
X-Gm-Message-State: ACrzQf0lYvh8Ur0++PDA0MM4jLOtYVm4uAiJm6jMSLl/FQPP1wKWLDlH
        r+DwSTNAd4Hc3IF5qdeStXeZaQ==
X-Google-Smtp-Source: AMsMyM4fc38XnezLTbPN1tjYP9n0KbNPCX2ihLNTJo/jj7HlKrT5HV+BlkhDe0bEZFEUnhatRA5pyQ==
X-Received: by 2002:a05:620a:28ce:b0:6cf:933c:40d3 with SMTP id l14-20020a05620a28ce00b006cf933c40d3mr9196699qkp.258.1666047661610;
        Mon, 17 Oct 2022 16:01:01 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 13/33] dt-bindings: pinctrl: qcom,sm8350: drop ref to pinctrl.yaml
Date:   Mon, 17 Oct 2022 18:59:52 -0400
Message-Id: <20221017230012.47878-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index 6ae5571f60da..1c0186050dcc 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM8350 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

