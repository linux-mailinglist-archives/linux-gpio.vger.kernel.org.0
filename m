Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E12582EBA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 19:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241639AbiG0RQj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 13:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241653AbiG0RPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 13:15:55 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCC27823E
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 09:43:01 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id v21so1851118ljh.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tfmeNJmvtz7gaWiNehJRaGBYlsaQKFkN13/Ktjs1O4=;
        b=pv47+NLr60QYIZhHvV0JM43fXrCZu2tNV8hC8pycJDtdzGMGjqoeq5iVKQ31xXQPJI
         ETgqgrwvOJzaQ7get4X4xmIZERmv25rk+FDwMxQyA3kCIRjKUzg9mX7kB83Nc/sLKgw5
         rdFGQAAD8bBYzucr/gR2l0K0LXW0HgyxDHnFFIEWbNFUayaQvzPgdD3r6X0R0mGFu1XE
         xlcc9Qy/3cu3pD7jJkGOhgLvDaqeRx1yfDvpcAy4tf5QhK7Yw8uVzAmA8HWpGp+xwnqf
         nBX+mPZfiGq84uynJdgua3z/yF+Y7RCjlTCG+M6/sLcMAz84AH+LDPQRO8Pi117ABgh2
         9ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tfmeNJmvtz7gaWiNehJRaGBYlsaQKFkN13/Ktjs1O4=;
        b=FIMKfjZ/fZGYYGMXi1HqyxWqQbdpDQ8c8QOcG7vfeFreGA5xUVauNTHM3tn+ZaUJ5Q
         l0NZkdDii12srsD/3T4UQ1kKkqRs6c1pbuLN6d2fgcKSAGAiXcgWgVdxlDyqVvsLfrTz
         +4y13d1SNFJtwvmxz70UPxDCXgZLkZyUz4YbdGHjXhONS7VyAaLnXaqj6CpW++kC0VTx
         DkrBzimv/cPfJ6Kz2DrjlGNcfCwpp/f3c9QgppPINozzW5wQe7tOl5UVnpODM4i0GgON
         GAjj56xhf16Yyi6wquPar6UKNtrupPkJxmMX/l6WggJ70AxqN+0kUktzWSEfKB37acFb
         v5Dw==
X-Gm-Message-State: AJIora+qfS1zL3y+OHDjUNdeNsyyUd/gdFXsaLEL+0G7dy4edwTangHB
        Ekus8px4EKKy26lOAnVWdUC8NA==
X-Google-Smtp-Source: AGRyM1uvf+IxxwmBWWpBSNonkVO56XBc21x+QKfARTNbktO6Yzp3QSgilfse3r4MQAhLEHYTp0OohQ==
X-Received: by 2002:a2e:bd89:0:b0:25a:86c8:93ca with SMTP id o9-20020a2ebd89000000b0025a86c893camr7423468ljq.419.1658940179711;
        Wed, 27 Jul 2022 09:42:59 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id a5-20020a056512390500b00477c5940bbasm2295612lfu.265.2022.07.27.09.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 09:42:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: gpio: fairchild,74hc595: use spi-peripheral-props.yaml
Date:   Wed, 27 Jul 2022 18:42:51 +0200
Message-Id: <20220727164251.385683-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Instead of listing directly properties typical for SPI peripherals,
reference the spi-peripheral-props.yaml schema.  This allows using all
properties typical for SPI-connected devices, even these which device
bindings author did not tried yet.

Remove the spi-* properties which now come via spi-peripheral-props.yaml
schema, except for the cases when device schema adds some constraints
like maximum frequency.

While changing additionalProperties->unevaluatedProperties, put it in
typical place, just before example DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Technically, this depends on [1] merged to SPI tree, if we want to
preserve existing behavior of not allowing SPI CPHA and CPOL in each of
schemas in this patch.

If this patch comes independently via different tree, the SPI CPHA and
CPOL will be allowed for brief period of time, before [1] is merged.
This will not have negative impact, just DT schema checks will be
loosened for that period.

[1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index a99e7842ca17..c0ad70e66f76 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -33,8 +33,6 @@ properties:
     description: GPIO connected to the OE (Output Enable) pin.
     maxItems: 1
 
-  spi-max-frequency: true
-
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object
@@ -59,7 +57,10 @@ required:
   - '#gpio-cells'
   - registers-number
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

