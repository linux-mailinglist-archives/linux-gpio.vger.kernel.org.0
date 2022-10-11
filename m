Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CEB5FB92E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiJKR0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiJKR0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:26:12 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A49326CB
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:10 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id a18so6033958qko.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj+DQUBx9p1ZkV1G/l0ToLX1GpfKvmkaoqt6UhSbFaI=;
        b=xS55TPqkaybNrjlmgRJUvOtSdDNlOSGBv2yIMaLxiBShzsEcoXLNcXMdIqGHvNSEI2
         YP+8nff+pDkq9GjbeD+cZxoRArb5mqh9b6UZvdZgcvsfBKjciz3Tu55YlAZ7Kw/AWtWN
         KFC4ri22RwErGb4hkRnWmk5nGiGCUXs4KxLcvuqjGVZ/WTlv9UC8n2d+duEbrCvepF9Z
         e/7Qte/tAcgkxPO9AKqbU0MuexT5jGPrgolnMhOBJ8CrESd9U4f8NWt4z/3Yq3vQRILk
         Ps3tTmLc2HqeAkBa2NgIhYPoKF4x/zA/7MtOZiKpGpgneInURTvjYJgJIKIY5Z7/sBxI
         er+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj+DQUBx9p1ZkV1G/l0ToLX1GpfKvmkaoqt6UhSbFaI=;
        b=Urwi+uXJwiIZe+6Sq7EqLDjivSAK9kNuzUal7hGbCs4iChkfbRHgIyZsZAbd8hm5eE
         GMwj1pNh5bFvoteSPApmZ4+0eVHF9QSx1K0GiwNxmHvRVBlZV41Cuf+RAuquui0iBVxj
         /bzxCZrJZ2AuT1PFltn9EkXestWeYqSTdFZqqKhmejQcR5tP+mV9Ex4nrdWoI3nCxMid
         7LKeOF9AkiOsu9eV4T79SfNDSBzZ36qQYzE2W9M7Om50kkd+XnYy84e8Ttr3O5Nn/X8i
         nY5Hca4P98yaf0HKbS9sg0udxLzJe+3p5zQ4xbDoDkKTLrLroi42pgZZZ+mskBmA/bdL
         qCww==
X-Gm-Message-State: ACrzQf1D26IoPS1uxZxTTra5X8yUE5i0U7JxTUij57CHmp/wbpKiHg9l
        WgJeVxGs7NJ4uHD+tG0vY+dfXA==
X-Google-Smtp-Source: AMsMyM5ebtGxmLprbksayOjZRpFvVBmTbztcNjZ5z+Qyh1W9SStFnlwu0CnC8ItAOeB+jWlRHVUrqw==
X-Received: by 2002:a05:620a:444a:b0:6ce:9917:ea1e with SMTP id w10-20020a05620a444a00b006ce9917ea1emr17340363qkp.399.1665509169681;
        Tue, 11 Oct 2022 10:26:09 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:09 -0700 (PDT)
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
Subject: [PATCH v2 03/34] dt-bindings: pinctrl: qcom,sc8180x: drop ref to pinctrl.yaml
Date:   Tue, 11 Oct 2022 13:23:27 -0400
Message-Id: <20221011172358.69043-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 .../devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index b98eeba2c530..62d0ea7bbc62 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   SC8180X platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

