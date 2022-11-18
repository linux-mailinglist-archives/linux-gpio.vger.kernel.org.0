Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A4062EF27
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 09:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241369AbiKRIYv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 03:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241387AbiKRIYt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 03:24:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956D6682BB
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:24:43 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d9so8073069wrm.13
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2nzUnquKhTHdxUFFZNgy9G2jhcrS0mBp0qXvalRQRg=;
        b=tA1pJFtDp9WQT25hGIrKQMzytVC8SbeOX4gPydZDOU9DPo5CydhhVVgQ1Wp3nTbqGx
         VtKcR0AcaCPwhclVCbXq2aI1tmMxJcVLLpYTIT16dOvoWMmG3Uc8WLd+22NLy/E19hLh
         Kfe0QSu7l/d/djVFeqZBxLuCPkfpvuvDTXMN/LaI38fkjykH/WR8MVvkCA/8buVW0n1C
         62I/v0AwPcTtgCKyYp+nj9xkI0hYnjJm4ojKC8m5VVwjQpru3jk/pr8MHeHyWNswBNmJ
         NuliWmQYitW7Ry3XLrX8PmdYFXvsOrQ5ADVIcXNstmRWD7GM/0CSIT8t0rYlTpNIaHto
         BHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2nzUnquKhTHdxUFFZNgy9G2jhcrS0mBp0qXvalRQRg=;
        b=YmnpaKEed3Lqcdx0MhiIJXNRnTVEDwnVSMnM8ImAMryT4TvG3DPDoFuVWKkJPGXwxh
         3BZs5raZjGwhQUm7oPbARDAQDfoX+G7z5rp1YphZZLLIAob13B3hrhGK5p/Cq8TfHXoR
         Kb1HJhy2OYZej8wZ0ouc6NxlI0wuQXf7OjZaY5VVDcxwNQp+/xJxo+CX+tgb2WT5slAw
         6ot0a1V+moofq8OxcoKX7muzyp88Cv32gIukaMcLHGVwFsBQipFITCabyM6gGZOx94p3
         TWP5ttj9uTiJahHyYQRelF0jDdrQ2fBWMMMQGKqR4N5KK6LtabcJhU9af8OvoUaSBvUh
         ekaw==
X-Gm-Message-State: ANoB5pnO1nwBnaxFCpbBY1Ov6rkBOs45EohEUVwTfEAp4Bo241gl1pgD
        i57lI92kwzuD/t3R4cQYnnfYXQ==
X-Google-Smtp-Source: AA0mqf4ZXi/mYLf02FtNh3xitKcNZa5Y25pifzZMcCHDJQZE9wLp/SoI9ptrmLYvglEM5DcHtZXIcg==
X-Received: by 2002:a5d:58d7:0:b0:230:e4e7:b191 with SMTP id o23-20020a5d58d7000000b00230e4e7b191mr3476268wrf.158.1668759882115;
        Fri, 18 Nov 2022 00:24:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b003cffd3c3d6csm4070084wmq.12.2022.11.18.00.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:24:41 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 09:24:38 +0100
Subject: [PATCH v2 1/3] dt-bindings: mfd: qcom,spmi-pmic: document pm8550, pm8550b,
 pm8550ve, pm8550vs, pmk8550, pm8010 & pmr735d
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-spmi-v2-1-b839bf2d558a@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document compatible for the pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550.
pm8010 & pmr735d SPMI PMICs

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index c8362efd4345..8c9b042b4f30 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,pm8004
           - qcom,pm8005
           - qcom,pm8009
+          - qcom,pm8010
           - qcom,pm8019
           - qcom,pm8028
           - qcom,pm8110
@@ -54,6 +55,10 @@ properties:
           - qcom,pm8350
           - qcom,pm8350b
           - qcom,pm8350c
+          - qcom,pm8550
+          - qcom,pm8550b
+          - qcom,pm8550ve
+          - qcom,pm8550vs
           - qcom,pm8841
           - qcom,pm8909
           - qcom,pm8916
@@ -70,10 +75,12 @@ properties:
           - qcom,pmi8998
           - qcom,pmk8002
           - qcom,pmk8350
+          - qcom,pmk8550
           - qcom,pmm8155au
           - qcom,pmp8074
           - qcom,pmr735a
           - qcom,pmr735b
+          - qcom,pmr735d
           - qcom,pms405
           - qcom,pmx55
           - qcom,pmx65

-- 
b4 0.10.1
