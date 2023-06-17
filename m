Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568DD734079
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jun 2023 13:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbjFQLSV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jun 2023 07:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjFQLST (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jun 2023 07:18:19 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22641FF3
        for <linux-gpio@vger.kernel.org>; Sat, 17 Jun 2023 04:18:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-982a99fda0dso230498066b.1
        for <linux-gpio@vger.kernel.org>; Sat, 17 Jun 2023 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687000693; x=1689592693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWAbg6BOF2nzE2I56RfPp2+x9gJUvp4uCgmjbp/7H+A=;
        b=ARHmcEYC3adamnFDzjiuas+r/2hjAFU+HZRxNGinwYAqs5goOO/wZ2gRxJYiHD5TAb
         HY9vO9cMRCGJjPW1+87zDuCvdwm+nsy0qNW3VaJz2x15ddiRTZRCpmXtYQJ5VPCGbJmB
         3e3c0W9/eM+if1olKzXMSwyEE7OHpjtj19r90TgORX5ohkfzspkTx/dO5GLwYsGR60B7
         s16rW+e9KDenBwiJ2ize1K31oBrQw5eGhmqZHaQbEbKc7FgaABcDweWLTNUz3drqih35
         E2kwTtUCgJy/SSAWD5+bPWUrufEqpjTG+hNJf9J/w6SAHO23YWpgdxaA3R2Sjv2vzOaC
         n7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687000693; x=1689592693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWAbg6BOF2nzE2I56RfPp2+x9gJUvp4uCgmjbp/7H+A=;
        b=bWflmAqsTUleJ6nl5M2QsB1UevbkJPcVyG/R5KzkjxFpfQJteI8GPYXsfXGwVSWjLD
         k/XoAx31hdJ3aAFivMBiEpCCodEJq2Ny0hUndx7Q9B4iLFg75dntwSGW2q6eAD+x1yZI
         3+RJEG2ru7wLdA2pSOrMNroyHQtIcStPdEWYTbreFFw0clDXl17Yw63VdZflF0tkWh5C
         lqy/OLAwaN9ysBPtr86dwHA5SXKkHVuVZcSpIPqkM/YGf+KkjT7dq1DL5JJwA7B1sZH2
         /tSAXw5INN843e2g95lgCI0vlggdTBcZ1GARrrl5ZLqBhsRQYlAxGoGmJuEmN9fzgnNu
         MEbw==
X-Gm-Message-State: AC+VfDxJBPT+jfdAthpa+NCkE3lTEpoIhtyfrQu5z2/nIpGQHHGEniRx
        WI8i53W5Pso3Dl8O0TVkhPnzJg==
X-Google-Smtp-Source: ACHHUZ4qmMOhdxySg3FMwhU5HEqjuFWtlrAY047yKgdyCSe7/cq+Y9GrLJnX74LxW7X/nfZWhrczdQ==
X-Received: by 2002:a17:906:4793:b0:978:8937:19ba with SMTP id cw19-20020a170906479300b00978893719bamr4293294ejc.44.1687000693382;
        Sat, 17 Jun 2023 04:18:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e17-20020a1709067e1100b00982cac5fbbbsm2653275ejr.62.2023.06.17.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 04:18:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,sdx65-tlmm: add pcie_clkreq function
Date:   Sat, 17 Jun 2023 13:18:09 +0200
Message-Id: <20230617111809.129232-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DTS and driver already support pcie_clkreq function for a pin.  Add it
to fix dtbs_check warning:

  qcom-sdx65-mtp.dtb: pinctrl@f100000: pcie-ep-clkreq-default-state: 'oneOf' conditional failed, one must be fixed:
    'bias-disable', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
    'pcie_clkreq' is not one of ['blsp_uart1', 'blsp_spi1', ... 'gpio']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
index 2ef793ae4038..27319782d94b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
@@ -85,7 +85,7 @@ $defs:
                 qdss_tracectl_a, dac_calib13, qdss_traceclk_a, dac_calib14,
                 dac_calib15, hdmi_rcv, dac_calib16, hdmi_cec, pwr_modem,
                 dac_calib17, hdmi_ddc, pwr_nav, dac_calib18, pwr_crypto,
-                dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0,
+                dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0, pcie_clkreq,
                 dac_calib22, dac_calib23, dac_calib24, tsif1_sync, dac_calib25,
                 sd_write, tsif1_error, blsp_spi2, blsp_uart2, blsp_uim2,
                 qdss_cti, blsp_i2c2, blsp_spi3, blsp_uart3, blsp_uim3, blsp_i2c3,
-- 
2.34.1

