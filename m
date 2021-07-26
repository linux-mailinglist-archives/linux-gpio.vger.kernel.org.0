Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2963D52AA
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 06:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhGZELl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 00:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbhGZELk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 00:11:40 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E112C061764
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jul 2021 21:52:09 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso9525060pjq.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jul 2021 21:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=muwPPr/wH77yClDsFJrEFYw3n7hGXGW3QcFllPO0brU=;
        b=ycpwrBVDwGd3Ld3v1W5tGdLHkVB1bJPYN1wrP6W6KB0X3EJPQBADk6S/2yCJy6YoIb
         CMjXIMA7JeZJrWSHKQIeMbTDlKhkex5g3KPI99HW0FUzbflO2F8JG/DSxOvg3Vr9oMx5
         +3FJjFdZbbzEvubq3LP0cjPPk43QYpjvukKxiqn3TQZoyQF72iOSJYLR/+gT7+tNMxES
         EzOMkKRg48/0AcFriy2csYJHtgUtDVH+ZMJ5R5K4mDm5kuuPJ/b8B639fKzbd10hCmTD
         zwOyEwPH0mmxUadbtLGlt0JD1DI9QBKl8jEfeGZPXdE3CgVRdrJIRizl1hhyN4xs9QdV
         nwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=muwPPr/wH77yClDsFJrEFYw3n7hGXGW3QcFllPO0brU=;
        b=ZkiXcc7MeVp4GXJ8bnJ13TsBj3DzllzE+N2tRgU2W5hWBg1GLSiOFUP9IU/zOJicmP
         DzYZXvbKle9xlAZ9VxY/SnRrOf1Vwov106joGPyQ2PiZlWHrFr28oka6SxtLqjNE8DZd
         apxn/B5eED4cyx/TTWNugxZqz3Kf2KlYwyCRNKlJiM4aJGZHrwUDtqsMgYq+tT75BYbG
         ZgKmVl614IoyZTUU2JP8LxOyz8/fo4u4NtqZAmySeciPVwtyaO7BoinOY1Y/fXL0C6pG
         fxVUoKAwmC1BaL1tjJvhAgsU90aeMA/gLT+W8Hhlb7HVLfx+F9YFR4k1W/1HQT4pvQ0n
         NNKw==
X-Gm-Message-State: AOAM531f/Pg9qgawgCfNx/BZ0i/ez2gsgTcO9zK0njGNy6hY3H/ShG/c
        /ihbh2xGQY+y/RuFOiCboDIWSQ==
X-Google-Smtp-Source: ABdhPJywYWAbpqqkEOa/qttwkvPQCjhdQ454v7qZzG2V+o1+YfpG93FpHj+tl77I79vdxChXD9nrXA==
X-Received: by 2002:a17:902:9046:b029:12c:e88:429c with SMTP id w6-20020a1709029046b029012c0e88429cmr5300973plz.77.1627275128984;
        Sun, 25 Jul 2021 21:52:08 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id z5sm16448583pgz.77.2021.07.25.21.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 21:52:08 -0700 (PDT)
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
Subject: [PATCH V3 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
Date:   Mon, 26 Jul 2021 10:21:43 +0530
Message-Id: <605b87ce93b9a528810a5857984bfe6b913d5e73.1627273794.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1627273794.git.viresh.kumar@linaro.org>
References: <cover.1627273794.git.viresh.kumar@linaro.org>
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

