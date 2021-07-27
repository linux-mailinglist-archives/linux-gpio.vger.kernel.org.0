Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344DC3D6DFF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 07:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbhG0FYV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 01:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbhG0FYS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 01:24:18 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF87C061760
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 22:24:18 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e14so14512420plh.8
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 22:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ruqu7XRyeoHO5d3dL3cpXjWaNCM/mJSqSGYC+47F2jM=;
        b=OK5Eq5EaYOj7pmvubgA/5zHGMhwmsXjjVac7YqdjIyrJAuYnBWil+CUwlP04n+LrdT
         f5NKctWjool1sMCzalGRQvx6uWxHQeH0ophl0ANynHrmCxpgHGRQmAxEqwdIo+eT4KDQ
         WLDPo8iG6MTUXW1jAcwHZu0N2HmZNkGgfXq6CU1BwTjN11zZVyUjStSvUvZHsjxeBlmH
         NWp7U7o5qADjx99jjJCRKdgiwdXKD5RvwtZaDletZ4v0zzsCbg511OuTR4OoWLgk30Jq
         NfULFuLm1p74l06sdwm4e0TV5w1i1+ZVtfOSnHu/Y25TVbNzI1Zx4Y0bF3t2WzRxEdHx
         fNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ruqu7XRyeoHO5d3dL3cpXjWaNCM/mJSqSGYC+47F2jM=;
        b=A7TFj0b4s4GEtvZekwCWJHpKAGkO7VIGyJEdxdVuZWyRXbfsPQE/6ahHi++o/FW/+1
         p7mLfSXgmuOagChfVs41JeFcAeccSk8BS0fZdNlBXhD9CNHkh1KbGG1jndVIbC/mCL11
         dRF7dzzmOYCOnW2T2tw8UFaqx6VYAL+X3u3egmJ6TXTpNncNwiBXef41NeLFgmFTuJeW
         Hw7aG8lNDYaTCalY+FAKhPs/HkyvGnnkNYq5vS+qIxgBa2748tQb3gGx3uDWHvgNTfPQ
         iT3sUHWyttZDBpii9dZ8Wv8fJtZHDskxzSHhwE4gKvFLsKKoLqb2BEFvQijL4toElPS1
         sLKg==
X-Gm-Message-State: AOAM530QbF/gdEPVtpg/zvo8gfkic4sHOBngF88l+cdVacyrGNLx/Nlh
        RKB4o0ia7BsM5OApYXuVAvr3xg==
X-Google-Smtp-Source: ABdhPJxlr8ST+l2zqQmOHJ0yxqdkfMipSP8p24NTpOJ3+QodP4SrF5kCmLao8p6wsWQn0kOydjR5og==
X-Received: by 2002:a17:90b:ec5:: with SMTP id gz5mr5361661pjb.77.1627363457626;
        Mon, 26 Jul 2021 22:24:17 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id c23sm1929324pfo.174.2021.07.26.22.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 22:24:11 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org
Subject: [PATCH V4 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
Date:   Tue, 27 Jul 2021 10:53:50 +0530
Message-Id: <acf7402ef4aabc0ad6295c32846f2bef1cd9b56a.1627362340.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1627362340.git.viresh.kumar@linaro.org>
References: <cover.1627362340.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds binding for virtio GPIO controller, it is based on
virtio-device bindings.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../devicetree/bindings/gpio/gpio-virtio.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
new file mode 100644
index 000000000000..601d85754577
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio GPIO controller
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+allOf:
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+description:
+  Virtio GPIO controller, see /schemas/virtio/virtio-device.yaml for more
+  details.
+
+properties:
+  $nodename:
+    const: gpio
+
+  compatible:
+    const: virtio,device29
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        gpio {
+            compatible = "virtio,device29";
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
+
+...
-- 
2.31.1.272.g89b43f80a514

