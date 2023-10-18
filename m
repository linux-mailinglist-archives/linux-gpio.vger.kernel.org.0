Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41E7CE07D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 16:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjJRO56 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 10:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235251AbjJRO56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 10:57:58 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA388F7
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 07:57:55 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53d82bea507so11966649a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697641074; x=1698245874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ru2R7zuvY45hV9RylJTA2u/cUA8xp2Mn6s4hLcqrWjk=;
        b=XlGFl4slyc37E0A9PVGSExMMi0jnmIava72qbqtsGfGEbxf2iljWLNXVJRE4qH23v1
         tZqXwWHtYNLzhdYz4uNgoDW93Fs38cawcvQODXSmresAURRI2XKnhRQy4qe7zX8dxxvA
         wkc+H5FdfP+d6KIGHK3MOXKGuVjoTELdB0YoCIk+mKz5sPoTkTW8dvE5MIcGjvFgJBYG
         dfwcO/paVbQO5Fq4UJt0Jrj9MpFSCyDkFA0/8lTeG3o4tFPPomgnbTlyE+BwCOc+25V0
         ycPOsJLqxBs4tBTRJrrDJ89l3DmFPxgk9PvW2KNZ/twN1uruI/khSZAZgD88iiNOq4Rj
         FjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697641074; x=1698245874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ru2R7zuvY45hV9RylJTA2u/cUA8xp2Mn6s4hLcqrWjk=;
        b=ushHS++jpfoZcG/+adjelQnmnMWBBZMouvNE314617MohW/m2Ab4yP2aOBAHSLv4iw
         xlk01c2ED2VJGey2ZUyZA+DrszxFcS6WodcbhumhPcOhb2yoTbdWN9L22s+O+M3gPegF
         Kecfewewtu0hlx5+4OWXutHQ8IJBiZSakpBTU4z2GXHGJYV12D6a6tzgDhxaQfD9ueN5
         7zoaD2hsnWyZOWIAMNAt9pfxOQwZc8+jfhhyIBgh5BxjzKD8HTqXAZONVqa+OBuO//HA
         Z2ITMQSYJqh19zcGOQb8XQUcQMJMOHrlzoG5VQua7n2P5CzFlp3fZ8C5bhz2TuiYnHzd
         to9Q==
X-Gm-Message-State: AOJu0Yy7J04J1L/Yq4cGPnmy3sPEIB1ZdlwY41JCB1ybd7Ex6ffoA5pK
        pQfH/i67g6zvAbTEgfcGTD2bNALm+qV8qNALsYk=
X-Google-Smtp-Source: AGHT+IF3KKzONpdhTXHuqkIwWMJvt0YLy7is0f4aGGbq4QIrdEF6b1TfFbNUCBYfaeYF9w08njGe7Q==
X-Received: by 2002:a50:a446:0:b0:53e:10a1:21d with SMTP id v6-20020a50a446000000b0053e10a1021dmr4191660edb.35.1697641074233;
        Wed, 18 Oct 2023 07:57:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id t29-20020a50ab5d000000b0053ed70ebd7csm2983570edc.31.2023.10.18.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 07:57:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,sa8775p-tlmm: add missing wakeup-parent
Date:   Wed, 18 Oct 2023 16:57:50 +0200
Message-Id: <20231018145750.429385-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add missing wakeup-parent property, already used by DTS to indicate that
pins are wakeup capable:

  sa8775p-ride.dtb: pinctrl@f000000: 'wakeup-parent' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index e119a226a4b1..2173c5255638 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -28,6 +28,7 @@ properties:
   gpio-controller: true
   "#gpio-cells": true
   gpio-ranges: true
+  wakeup-parent: true
 
   gpio-reserved-ranges:
     minItems: 1
-- 
2.34.1

