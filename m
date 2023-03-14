Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48D96BA270
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 23:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjCNW1P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 18:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjCNW1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 18:27:15 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3342471D
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 15:27:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m4so8967404lfj.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678832830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Au+ByXF+T/ttwdvk2E5GvB4Cm4Xo7Y50WRAwY8Nd3PI=;
        b=Q2LCGvyww4ehVH+wC1KTEGhgAoSUFH1ZX0i1aWgkZRmGHiNPGRfhYGDk3RyIeDNpp9
         HqGKE4iexBIR9tJGgeMLkaGUoyS7JJ50bgQGIiYWfo/CBSovpvVu7V2omFF8f4wXzXMX
         qWuwutohj4c+p4kY+5ebx5J8oSYxTuAho0cqgR2RWquDkXAZtil+fH4h6K2bme2gm+oy
         ddo6qCdr5O6fAm5nYoAZwhix/aT7bi080gRirmCrqERirzZ6ix72nm5oJoL0wsKyUXsQ
         B2aC9tjI3KsOKzVZbmFtZ79sTI7bLHREVQcojPVagmIe+pNSdD+MHMj0f230ySgOCp/0
         1GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678832830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au+ByXF+T/ttwdvk2E5GvB4Cm4Xo7Y50WRAwY8Nd3PI=;
        b=6c4Y9iwAXt4Aor0a0xeqtk2IK9N0SHc1iYYzYbgG436+FuT+38LYieRC6KiwfXg7l+
         smT9oEqZLNIzSdJz6c3kwPbLom5RQaV6usyLWJxvdO6dv+lPqRFHZ6ymOOMWFE2av4HV
         DTbV0lPqTpJI82J8VrfMZWVqs5iDw9WAebG1pSmdk3uyIZ4nJ50jHCLQ72YQtYCT0CLm
         Go/HDhXHk/Lt4V+juT3doiaWQxCAV6Vh28xpQLnofKWgSzfnFMH2CQ0utdtr4xpS2AWO
         CgHQh7FcbLvPfuSilfY+e3WifcJXvBHB7ZRChRP1iYURsyII8mv+IJnid8+D/KExkJiG
         D+KA==
X-Gm-Message-State: AO0yUKU/ti5tU/+D6ngybbkTDshrFhTZegVstVaidJIpObO6MaQa0ScZ
        OJsywVDMfx7rsJt2mXfkoC3qew==
X-Google-Smtp-Source: AK7set8LJmuI7xVqgISQ+Y68vWHmnkx+pjP/kmLyFsI2LuWzQ6PRiDvE6l2DC/c+HAJbShrMgoP7ow==
X-Received: by 2002:ac2:4a91:0:b0:4cb:4374:cc78 with SMTP id l17-20020ac24a91000000b004cb4374cc78mr1497320lfp.26.1678832830643;
        Tue, 14 Mar 2023 15:27:10 -0700 (PDT)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id c11-20020a19760b000000b004ab52b0bcf9sm562373lff.207.2023.03.14.15.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 15:27:10 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: qcom,qcm2290-tlmm: Allow input-enable
Date:   Tue, 14 Mar 2023 23:27:05 +0100
Message-Id: <20230314222705.2940258-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow the common input-enable. This was missed with the
initial submission.

Fixes: 5147022214db ("dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
index 6271fd15e0b6..032763649336 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
@@ -85,6 +85,7 @@ $defs:
       bias-pull-up: true
       bias-disable: true
       drive-strength: true
+      input-enable: true
       output-high: true
       output-low: true
 
-- 
2.39.2

