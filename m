Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF19E5FB954
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiJKR1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiJKR0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:26:40 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B30A5B7AF
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:23 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id z18so9385766qvn.6
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG23OJFESle1WZ+e8plo2f6zcFDst368T6AYWK8+kd8=;
        b=vjCqEPYYGHsANzBJ7JuNAsWUe7brEZK99OFoWT451dehatP0ejn26MyTERi4ORM5aM
         +b6XmKMCxdSF1QZGutqA9rg7jU6FVndhSAGT/TBQZWRrb2DnZczL+s2th59hLefQuqpG
         +JuHzOTzRAp0I929v3JAoG/i1JX/Mj5yVW+nsBxCeUSyNz/wnYMhNcJHYySBFTcVxwWg
         nScHufaZTSi2m2l4nXADJTWzcMqCPwO4tRkeeV1ASNFOtRelSGHq0ZGVn7J165FpufHE
         H1rM5UAa5cMBUg7iGzRPH5xcmtT4XLNgRqMh9UcKsLgqkWhA4bi+PZtrnIN39P9HFzms
         K2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZG23OJFESle1WZ+e8plo2f6zcFDst368T6AYWK8+kd8=;
        b=SeZjawdT4q33xzHQ6mmHhpCaLcJAFHcVlAjR+bmnjJRotMyAfSUbQNQG0jTXviAsLQ
         o7RPJnjg6tUTgwrISaHOi2sMqc9rhGqh6oeonZI266ffPVaAXSUWWWfL3K3sOus+B48I
         i/czRUTtQaFl6ouLk/3TrjfYilGc/YYdI6bhRLqYGjgE1za668a+1902QVPgW5pDQMxt
         y6NouA2vV620VaXIQEEPDNOyOsOEwlcS+IjOgx8arQhv0kTSChHMwIg8ftkqHHXvF9e8
         4S4c2hMv948gmoWhfGqIf4bucXuk+LDAka/9RSYCjmemi2nIs/3XHqXLpId1MdP5AsIm
         tH0A==
X-Gm-Message-State: ACrzQf1hAJB6eJkBoozRhHljHEDJAr3IhkbBsP7UrXfDX0SS5+ylBogM
        tCTPxkIs613yu1NQkQ13xNp7rg==
X-Google-Smtp-Source: AMsMyM40+YR8KtkvaTkbFMkLL6gpxyvfHnGF7EAA239uwmdpxrQA23vZ6KH2mR3Nrf9qwj+pbQXhAQ==
X-Received: by 2002:ad4:5dea:0:b0:4b2:e813:7c35 with SMTP id jn10-20020ad45dea000000b004b2e8137c35mr18897288qvb.74.1665509181934;
        Tue, 11 Oct 2022 10:26:21 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:21 -0700 (PDT)
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
Subject: [PATCH v2 11/34] dt-bindings: pinctrl: qcom,sm6375-tlmm: drop ref to pinctrl.yaml
Date:   Tue, 11 Oct 2022 13:23:35 -0400
Message-Id: <20221011172358.69043-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 025faf87d147..8320e5ff17b9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM6375 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

