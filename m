Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4485E6C4F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 21:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbiIVT5H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 15:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbiIVT5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 15:57:04 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1297E1182
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:00 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h3so12315646lja.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cKA4NW51HmX1iOlLI2s+4bPotn+uzMKAoSGN+81aA/E=;
        b=xQ5w/oxHpXJz3BiA2vT7Mh1qLca80dtg01UlSXax4SDg0xPWJs+iFxG1f5JK/nHUrL
         hRQmBMdMOiq0o2C5EwDo7sv0+rhbBuzyvBC7kSF0rBvoD0ZZx7LLxY6qrODzoVKXksuc
         UxcvgQ8Dc7LS5SDYm5fd+L8R7rqiVAr7wOsrAkyFYYdTj492GGTmn6NMf/jb0M+k/0R6
         Alwjg+Knr6OmNngPqbzd2OEO8Soc4v9R/s2C6sIQ/XU4Qjn8dOu/fFCWrGV1P/Fj1Ws8
         YId1nU6H+0LZ5vTa2n4gj5rflMZ8rYAG9T9QSbFk17t+QSdr3MIkPX+XodFn/vjZDeBt
         8R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cKA4NW51HmX1iOlLI2s+4bPotn+uzMKAoSGN+81aA/E=;
        b=4HkgrlAfO2y0BKb74J0++5KvenIH8DpvtMQaYgs220TdyFsJIskiP6JXvMQVRmZ2OV
         TwDxEVXyeUrI/Q4+hjjuYetScLbp09kVQUD1ukDMfEPMyJNmV3nlm0M1SLY2MQZJed9/
         ACzKuSVsLEA7Sam9kXKwqcvQsVYVTW34Ko4IW0fNH7P9NVBwJprv2kFgzcSC+K5YkMwE
         C4sS8Wo4ICYlLfPXGnT1NGH+ETghJxPx6dWxMKU0B3aG5dlhaUy3/QYiB+BV0ytNBYDH
         sdSQ1zfNKrZSKfjrjzYop8yq8mfJJ+OR6Pr1KbCLpPxQ4+hldVpbHwEcTTRKTIBCp6Tc
         uoDw==
X-Gm-Message-State: ACrzQf3vnl+eCkiIyamHQ99Hvjp+NhpstR1OxMFZ8RfAn0UX0VjG5ELC
        QIFDAVtLzicB8GPxw3u3WilnqA==
X-Google-Smtp-Source: AMsMyM78T9nfkNUQ8Wol/jTBDIuK+g3P2ugRUw2h59RMiJh6IBKFK4Pv6FFC9CPvjVcwhKVwh5w1dQ==
X-Received: by 2002:a2e:a270:0:b0:26c:5ac6:c4a8 with SMTP id k16-20020a2ea270000000b0026c5ac6c4a8mr1677552ljm.442.1663876619073;
        Thu, 22 Sep 2022 12:56:59 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:56:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix gpio pattern
Date:   Thu, 22 Sep 2022 21:56:41 +0200
Message-Id: <20220922195651.345369-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

Fix double ']' in GPIO pattern to properly match "pins" property.
Otherwise schema for pins state is not applied.

Fixes: 4faa4e73011d ("dt-bindings: pinctrl: qcom: Add sm8450 lpass lpi pinctrl bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index 3694795ec793..c17cdff6174f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -58,7 +58,7 @@ patternProperties:
           List of gpio pins affected by the properties specified in this
           subnode.
         items:
-          pattern: "^gpio([0-9]|[1-2][0-9]])$"
+          pattern: "^gpio([0-9]|[1-2][0-9])$"
 
       function:
         enum: [ swr_tx_clk, swr_tx_data, swr_rx_clk, swr_rx_data,
-- 
2.34.1

