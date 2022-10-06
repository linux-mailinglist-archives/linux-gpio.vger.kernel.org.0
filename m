Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7C85F66CA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbiJFMtw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbiJFMsq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:48:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E391A487A
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j4so2646001lfk.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cKMxoMSocSsO5VsZPFdHg2+mLP+XhcRFB9IKCKyblKI=;
        b=udKGXSMNCILdZsLC/F6BntSUgRFtqbHMlOe953QCkb/JLcAGDdYK1YS4kmq2AiVFdb
         5COU9yc/EvpzaevV6oAnCycR+INq6ZISFcxZvB3NhZpw5m9lJxcAir4GR1mTYEGwZr0H
         Zpwo4qN1Z8IAiJlb4D1FXBTSLqAkVFd2bGeAL7wvtVN2TZpUa1w+1kZrDaEYRxsK/GzQ
         OC3gi1u5BbvLbmOBVIwaM6CMAwXCFnmU9S8P3iJcIDMi5/DkQPTbRPOBVUxV9h+WSoes
         5lfAFho+BiZLI7Ocom3MBqywq0jBOIfy+egDtzW3D/8lhUTkU6yQlfZdpuXF9i8Z1hZ7
         P3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cKMxoMSocSsO5VsZPFdHg2+mLP+XhcRFB9IKCKyblKI=;
        b=CH2bJVlvga8NWIl2v0eX3XHu8w4yh6th2kVfJMPoyHUWHa30YGdpSS6zhKam2nLRg0
         f4t0oxmiQB9TacsShfd6f9Tdl4np3DoL4MQR3dBPDk9fLfn6v3q0txTHb+z7OloT433T
         a0jWjt9W23+LKxx/HJOgw5Avdb/PKrVMANTPEn77p7lGnVViI/o/krd3c8GggwWNsxsx
         T+aaMYXXVD1XTLvcBgfkfzUiQ48rYjYu4tz7YHbRIo8mShUQpy68ApMqdfPOhr1UGl+L
         IdD9ph1ZCrDv+l2R4wDhT2QKozZqec0yD+En7yhF5mU3AGixZRh0Eu4Rr8Be2+r/mUAq
         Vpzw==
X-Gm-Message-State: ACrzQf2v4EmNIyUIhWBQ4nwlhhRSB1+rf+8AM24JMlNyhYDyIFTcX0ZF
        jL2xRmlIXPSKt1IQU2w7VwORjQ==
X-Google-Smtp-Source: AMsMyM6Jx6AgIqzDgCQx6Wf9jbP5Ky52KZuyn5QoRnizbXI78+nvIUwxPXEXksx+Ucg8TPkRlBpi3Q==
X-Received: by 2002:ac2:4db2:0:b0:4a2:260e:6404 with SMTP id h18-20020ac24db2000000b004a2260e6404mr1878065lfe.484.1665060449543;
        Thu, 06 Oct 2022 05:47:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 24/34] dt-bindings: pinctrl: qcom,mdm9607: do not require function on non-GPIOs
Date:   Thu,  6 Oct 2022 14:46:49 +0200
Message-Id: <20221006124659.217540-25-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index f7bd4be1739e..57a4fed55de7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -115,7 +115,6 @@ patternProperties:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
-- 
2.34.1

