Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE105B4DF5
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiIKLOB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiIKLNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:13:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68C03C161
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f11so10349706lfa.6
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RY4LaWL+dRkOu6EloL5DY96DFt8TJE+sYnYh5l+nQqI=;
        b=idUywnLAj7qxOrZIs0y5P2qUJwo0mP+QB9qcQnsR25Xf1Pt9trvXVvE3H/OeMNITEW
         YBCVfrdbhxludiG67ik0J8RtwbWONK2FKdvPUP7u9AAhDk2B7u1yak1Znk3vYNcs9Pe3
         IMObQU4bmjAq5aa/FKxNNAY29dZFdSNPXq+RcWuGNXUfb8bKhIp0qy37x8thE3WzjhCr
         vFYQRMlU9JBdxN44ntITPoiZRmNYlCOyoxZQA8SyxTpp1khTfy3hHgpmz6OqKd9sC7Wl
         wrjNMdBNN9djnWzC8pG81IBPhgdX7enTN35X30FNT1Em6l7xw5iZfOMsQDDoN9yu4GiU
         23Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RY4LaWL+dRkOu6EloL5DY96DFt8TJE+sYnYh5l+nQqI=;
        b=AF4UwzBfE0RITCjrec5S3RXXwgcClXEgY7rfiZtmJUBLttdH4b0wggE3EVMtmJEJGF
         Ooh4gw9FbEZJRKMBFaxz9vO1POuZ0vXwzTFYJFgG6kt27/dl3IFkYkJ+VifGGkcNUfDn
         L3OvG02d8HE1wdAyzlAuMPwhwadBJYHLLTb98BtNGTvw1p1GrAOPTVpz4LXv/GvVJiKD
         pDTBF/hYi96T2aprNi41mM1K1gmv/nPQQJxs6cJsR1lCKVV2qY9Ul0QOqQfO+BAvAnJ7
         Ecqyq8T8pjCXrp6Mrtxeok36Rg+EYlr5eF2At1EWdwXfTzLABFmrQxHx2C83Ff5zuvBE
         +djQ==
X-Gm-Message-State: ACgBeo0nSBHWi53rvSHn268RK7PqFAFUAPQ5FUzAfDtSZqwnxqzrbbYF
        lCFI0DxnDoLt11qp5ACL9cT22A==
X-Google-Smtp-Source: AA6agR4LjjyJAjqMv6SGvaFJ69Y9MD+1lhdnDHmZCFNZPkBz6UXWDkwXWa7lr35f1RBe+jQnRvFqyQ==
X-Received: by 2002:a05:6512:401d:b0:496:9971:78c5 with SMTP id br29-20020a056512401d00b00496997178c5mr6813980lfb.337.1662894754898;
        Sun, 11 Sep 2022 04:12:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:34 -0700 (PDT)
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
Subject: [PATCH 23/40] dt-bindings: pinctrl: qcom,sc7280-pinctrl: correct number of GPIOs
Date:   Sun, 11 Sep 2022 13:11:43 +0200
Message-Id: <20220911111200.199182-24-krzysztof.kozlowski@linaro.org>
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

There are 182 GPIOs on SC7280.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 2d228164357c..f948a7f30f6a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-4])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|18[0-2])$"
             - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk,
                       sdc2_cmd, sdc2_data, ufs_reset ]
         minItems: 1
-- 
2.34.1

