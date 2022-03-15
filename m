Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B3E4D9671
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 09:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346071AbiCOIil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 04:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346023AbiCOIik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 04:38:40 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9204CD6B
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 01:37:28 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3CE03444EC
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 08:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647333447;
        bh=a/yCpRvnE6Z0Iz/Nht25pLJ43i4AcmeLmedZOOdutnQ=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=RysRV3qCQuWyil6V1WX6XYlQy2abOMUQBA/p6QPOqiTaDrs5zVBR5NIUtq7FwD5po
         M3TzkAq9OmQwr0jFEie+aGVOeXiRzLKKasHvPsCU6n0zXlJuhjqs5yiuKdJBPaq38D
         WpSzxi+xDovdieWro7d1woKe6NpSMR0qxzYOzsD8RuvrzAQs+HydpJkDb2c6rdMYHt
         qe++8JHu+tWNGJwiHfbkC5FSuxRg6XKCHhlGKAK4m+0xPHsOmxn67JDVYoDYfzkYSo
         R+lBjQCq2qhMsGwjFTCEUGKFXrji4b+dav7xxLNWwuHW6WHQ3fbrJwFt9S+pJbxjsJ
         14ZfEqYR61T7w==
Received: by mail-ej1-f70.google.com with SMTP id q22-20020a1709064cd600b006db14922f93so9276685ejt.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 01:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a/yCpRvnE6Z0Iz/Nht25pLJ43i4AcmeLmedZOOdutnQ=;
        b=n16OEusF1hcaMq0L33zdrNnPmhHXUXLkhhAm2QgC+fBxkEv2mdZMWGaA6h3ExHSb6/
         McWfCVnMAzb7lMvnn1uvfjyY3GxG7FrkZ+Hy4MYOT6Y3LmPtai8VCnPGELBCm3ZVEmdW
         zvv8nlByPgAm12/qfpzZK2YsT6HVeHxpL05rGg2HRAycrbBASY8IHv2xr98eQRSDP4ne
         4uHwedNVT/ol0Eivl4UFG3voN17e32M7+2Ykw9IwNSkqTJzhnOblWyA5MvAUb0sAwAS1
         6R2ZaeSk/Gql8xBOq0jfqaS5XllQVTUvrNRhT4yL/7gmoJ8Tl+lwrnurFXGKy8/VIS/c
         oM5Q==
X-Gm-Message-State: AOAM533BuzHVNwjLtqpvj3uYctDx91gt6bFvK2tZA67zA5dtPdHm6Ss3
        JJgdHDJemKSJVykQ8vmw4q6gDcDKp3Qj08spEaukdOWZZavLEtCuacwNQ0N76d2tChS0rJ9+0Yu
        n1/4hIW8TYgSI2Fh2XmHqDmukudutS7IuvFYxz6Q=
X-Received: by 2002:a17:906:1e13:b0:6ce:e50c:2a9c with SMTP id g19-20020a1709061e1300b006cee50c2a9cmr21749820ejj.546.1647333446720;
        Tue, 15 Mar 2022 01:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSHI6Ry/hduxOpl8gsEANgJryT4xs7CGUJPM2MaHtTRnWQG3YdIg+DOsX6nwfAP8ncwCqK5w==
X-Received: by 2002:a17:906:1e13:b0:6ce:e50c:2a9c with SMTP id g19-20020a1709061e1300b006cee50c2a9cmr21749807ejj.546.1647333446523;
        Tue, 15 Mar 2022 01:37:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id h22-20020a1709062dd600b006dac66b8076sm7739964eji.95.2022.03.15.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 01:37:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] dt-bindings: gpio: add common consumer GPIO lines
Date:   Tue, 15 Mar 2022 09:37:23 +0100
Message-Id: <20220315083723.97822-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Typical GPIO lines like enable, powerdown, reset or wakeup are not
documented as common, which leads to new variations of these (e.g.
pwdn-gpios).  Add a common schema which serves also as a documentation
for preferred naming.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/gpio/gpio-consumer-common.yaml   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml b/Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml
new file mode 100644
index 000000000000..098dc913f9e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-consumer-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common GPIO lines
+
+maintainers:
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+# do not select this schema for GPIO hogs
+select:
+  properties:
+    gpio-hog: false
+
+properties:
+  enable-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  reset-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  powerdown-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  pwdn-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Use powerdown-gpios
+    deprecated: true
+
+  wakeup-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+additionalProperties: true
-- 
2.32.0

