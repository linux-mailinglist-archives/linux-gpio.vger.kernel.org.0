Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400C86CA4D7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 14:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbjC0MyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 08:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbjC0Mxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 08:53:34 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7913A96
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso4929178wmo.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xRNDjKLu/qtHRgpSQobAlJCFssXXVfJ8ZXiT2IEFPU=;
        b=IGJ7x6LMqYy2xPCFznuh/97PN1dopTfYFhclM9m2+RF6fG9yg8aSNF8q/trVWbUOMN
         mup87wZUkjuuAxddhu7NC0JO7KvU35JU6hRKNzpOlFAyivNc2/dUyXkb3dLBFaUjVORA
         vyA9WXMqHOf4c1kY3Z7HMQwaKpuJaZ+6eOxMUQY8TqIVuCHdYka93GARDw9rMIfElhX0
         57ycsayS16FZ6N2sNxdprRzpVt5iS+46vjMGVAP5CIYZAjnqMiungG7zlNXCH4Y7MnPK
         Imt9KMsxFjFeWNgFxUgz3X167azws58exgkri5+Jp45wKyqLydM3hGUn1/HtvLI/MnmF
         BzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xRNDjKLu/qtHRgpSQobAlJCFssXXVfJ8ZXiT2IEFPU=;
        b=k24vtsRQ9GNOKaK4GKA1hHvCgC7OuYNlbOqoZ6eg8HLmIBtcVYYinEU0hB2WVQU3Xo
         y1huFJvw2oPj9s/Ac0zM/JMHcHFEpbMle5zS6uHm0abgtwF2/qMJKt58u8HEj7tIND+W
         xQ9HtpXAn+z5jnEfNNStaAEY25GxwbN3bveWj/2cTup8Q/Imc+vq9cLNQIZgcGGDMWbR
         2fO25YQAABaZ41QajKntZwvhjBlDznrinRZ3bdyR25LQwJfYUWhLyW3U+H0zlLXFiAEx
         FiQZOCPJO2meHb+QBjRKJNkxKB/ObsINaXni+ZT5FouR6KIwy98RhSRk9ZZ66jxo7l7K
         SdmQ==
X-Gm-Message-State: AO0yUKV5Q5TiC7IKbCsldbTqXyvN4FdniUWjeTqGcbYCPSVJF/74+oRx
        3JV5om5UHgp/HUi+NsrND9AQqw==
X-Google-Smtp-Source: AK7set+5C8SZf0ST4xmzWXeDD00I7k4aiJuQh68bC4C2H95tf9XATKY6zmlgWL8Pvsf+2kMZvBZgaQ==
X-Received: by 2002:a05:600c:b4d:b0:3ed:62c0:c6c4 with SMTP id k13-20020a05600c0b4d00b003ed62c0c6c4mr8789753wmr.17.1679921610709;
        Mon, 27 Mar 2023 05:53:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 12/18] dt-bindings: pinctrl: qcom,pmic-gpio: add compatible for pmm8654au-gpio
Date:   Mon, 27 Mar 2023 14:53:10 +0200
Message-Id: <20230327125316.210812-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new compatible for the GPIO controller on the pm8654au PMIC. It
has 12 pins with no holes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index db505fdeac86..512378a2d4fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
           - qcom,pmm8155au-gpio
+          - qcom,pmm8654au-gpio
           - qcom,pmp8074-gpio
           - qcom,pmr735a-gpio
           - qcom,pmr735b-gpio
@@ -439,6 +440,7 @@ $defs:
                  - gpio1-gpio4 for pmk8350
                  - gpio1-gpio6 for pmk8550
                  - gpio1-gpio10 for pmm8155au
+                 - gpio1-gpio12 for pmm8654au
                  - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)
                  - gpio1-gpio4 for pmr735a
                  - gpio1-gpio4 for pmr735b
-- 
2.37.2

