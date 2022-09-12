Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97CF35B5420
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiILGTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbiILGTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:19:05 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602B228E14
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u18so13147152lfo.8
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Kly+7x9ihf9PeM0EfSaLRyWHlTHThn1xyufL9SH1Mkk=;
        b=xeBmlterGWh/U+JS0vtsstUra2lrkbxnYk5rWcBKrHL4zZHPzQwCo9nYmNZQAxIkjK
         6VFwPt8WK+FDmuCPmaDTrSi1ZLDeY39eECCX7bA4uBCDju99EpmH9GHZJuUdVfQTOY9g
         sT7zpyYE/CEYlb7UaJpwNjWDztGJlj9V+9rOT4vd9Rzl8+YAt6iK/pMPYyvK2rm5O86E
         Fxp/Ilz3JM22N3n0rLe0+BwrnjqYZokpG6GDz8GqCNuBoItMuT2LEIPmKToRWTmYTJLw
         XghwlTnfKpgZ2bTtFXVg7wr7KExiMichaC3ZFk2KBN7DjD0vQ8othz01kg8g2mH68dB7
         1muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Kly+7x9ihf9PeM0EfSaLRyWHlTHThn1xyufL9SH1Mkk=;
        b=5w9QJAnD3wSUYkmMsPEnGE4JBQsCjdMsOqlJ3nwMIZGPp7PDb/NSPooBncA1IZ0POx
         KGbqGcB0TzbVBo/6QDqeO+E+iUuoKL4DheO8osEvUAxcXp2WFF3sWRHIDaFDAMqlWoPC
         aoqGRjPWhuUD2STHxxh/KiwPq/dY4qRrfEh6criYI7r4q/xuhRF5isVca37ffRhMAihg
         u2UGNDIdUPoZYeWqdtdw/Uc919If/8rOUVh538nNMa9sOP6pNa2mvN5dHDy7JeY3URWs
         t6/txaCNKyuHrhlb8KScIoKMM1JycHM7oQtOorNSDWH6TuVA9NOv7IAcLvlrCo0YKCgr
         NwwQ==
X-Gm-Message-State: ACgBeo1k8R3neBv9OAKv4/0CGihkoVCg3YYWRcFTwMTH2I+t6b8A8ON9
        +lodfx2pS+PZ6Om/CqruNVLUIQ==
X-Google-Smtp-Source: AA6agR7dtmvrVPKLZRJ5GpakNOHSirzshDenRP6aJbciJLYjckp97je3Um3P2uaRiKUxymcGijX+Vw==
X-Received: by 2002:a05:6512:a8c:b0:491:d4b8:47c9 with SMTP id m12-20020a0565120a8c00b00491d4b847c9mr8018352lfu.258.1662963509810;
        Sun, 11 Sep 2022 23:18:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:29 -0700 (PDT)
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
Subject: [PATCH v2 26/40] dt-bindings: pinctrl: qcom,sc7280-pinctrl: reference tlmm schema
Date:   Mon, 12 Sep 2022 08:17:32 +0200
Message-Id: <20220912061746.6311-27-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qualcomm TLMM pin controller bindings should reference generic TLMM
schema (which also pulls generic pinctrl schema).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 463f2e95e237..2ad79029d9b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -134,7 +134,7 @@ patternProperties:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

