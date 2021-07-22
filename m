Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFBC3D2163
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 11:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhGVJQp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 05:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbhGVJQl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jul 2021 05:16:41 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886E8C061796
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jul 2021 02:56:58 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p9so5386348pjl.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jul 2021 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=muwPPr/wH77yClDsFJrEFYw3n7hGXGW3QcFllPO0brU=;
        b=n8ZC3AZw3jP2jJueB1RZMhR02tbalhWqKiFDjPykAogWMoM9xPPXZM/xXeT557iwV0
         zVxjo56XtoyPTXZ8dHUIGdZ0e5o9LsL9RZXeAHrIsa3vKQpuXZTfjQpIO2O74KzhGXSm
         ajmmB8uQiV8rYR/qUCw0LT+ue+IV0Jr8gpbssPKe7T01IU0QGDZ03V5pN2baNV47YW7g
         we02jklbUjKouKrsyHOvmp1DoGkFk5u6Yv14EDlWYZShNBF4I/Wd2BFKJu7eLZNtofoz
         5KeXpmJQBYvo7SWgXVkWNZVIaMsfLwqptLsh2DasM30eBzw+YOEAF2Z2hNOmnn0HwkuL
         v79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=muwPPr/wH77yClDsFJrEFYw3n7hGXGW3QcFllPO0brU=;
        b=KBeiGcLJ8zIdDh2ul4yOWu79zDcIqW7eIStCmHSpd455toyG9KxeBYMYhneeZQ6hOW
         S9CY5VwuGLj+AwqfgLNpQq0csikQGNL8Nu4gy3Oi5g3lIO9Sr7+j3y1qN012jpMZfGKM
         8cJOBauiDqpvS3iLOIag8gXYrD1oAvuPBtG19WqKgF2kBTbU9RuFcQ4lpVgeV14DfVzU
         S1DbjU//9X6CBe7uwLkMpJFA2FYK8+LHU0TcAKt0pI84tqATnezH8nA2Xub/UmtbXNGz
         cmMRNLN3ZJXFrj2ZW42RTOxdMhKccRtDcpnFGhVrOuwe64WPPbPOjvBWqnL3hHs40ORt
         M10A==
X-Gm-Message-State: AOAM531/37MoDrMYl3YmozO9GJ/CcCfYrPX6hy8HmLNC7TkVINZ9yT+X
        F0LagpQ9CaN4CEm48rJlD1uaLA==
X-Google-Smtp-Source: ABdhPJyZN5CR9UcyY2gk0+/KtibNuktSAXGwPI2GxUo8LHTNu/01LbQ0OoVZsKSNKgm+Cc7KitP/dg==
X-Received: by 2002:a63:4d09:: with SMTP id a9mr40115746pgb.278.1626947817936;
        Thu, 22 Jul 2021 02:56:57 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id u21sm29458630pfh.163.2021.07.22.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 02:56:57 -0700 (PDT)
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
        linux-gpio@vger.kernel.org
Subject: [PATCH V2 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
Date:   Thu, 22 Jul 2021 15:26:41 +0530
Message-Id: <3257b21c1179b11a5c62a95e138735f2443c90aa.1626947324.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1626947324.git.viresh.kumar@linaro.org>
References: <cover.1626947324.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds binding for virtio GPIO controller, it is based on
virtio-device bindings.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../devicetree/bindings/gpio/gpio-virtio.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
new file mode 100644
index 000000000000..96108cfb7a08
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
@@ -0,0 +1,60 @@
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
+  - $ref: /schemas/gpio/gpio.yaml#
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+description:
+  Virtio GPIO controller, see /schemas/virtio/virtio-device.yaml for more
+  details.
+
+properties:
+  $nodename:
+    pattern: '^gpio-virtio(-[a-z0-9]+)?$'
+
+  compatible:
+    const: virtio,29
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
+        gpio: gpio-virtio {
+            compatible = "virtio,29";
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

