Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF19139BB9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 22:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgAMVhD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 16:37:03 -0500
Received: from mail-lj1-f169.google.com ([209.85.208.169]:36282 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbgAMVhC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 16:37:02 -0500
Received: by mail-lj1-f169.google.com with SMTP id r19so11854011ljg.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4tH4RESwV3sw+gRcy7WYIHq0RISW7JJMOa9j58Y6Sw=;
        b=YG5bIWrh/c/Ts6I+EkDqs3IX+Fp9Dv+b3/b33e2E2ng6TRjELhCmeNoa/BBYRZvO8B
         2kw5CDb37yHIrLi82AxRf27x+E45YvRrOC8cOn7Zg7Rds4e/GWaSDZvsHEYhnJq07UcD
         GXrr35oEavRiv9h6hsp9JUQshi4Irk3DBAMQe/IS/+3BD6uyZ7WUwiNacwG7fPySyo/X
         BT333ONH9qg1qdBh4anq9cCtVXVNo+lPjX50BBAXzecQyO6MvysYxMaogIDeJetd1CQX
         2cVdfePYI2yoql6B+T5EiM9C27qNiGc1SgNpwJRp+vubWbdAi/tCaX+baieRVnRWLTXC
         9Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4tH4RESwV3sw+gRcy7WYIHq0RISW7JJMOa9j58Y6Sw=;
        b=SVtvZpjBUr6SOi2uilu/RaZYGRu332hTzQ9XJKvPfC0Ty72/ydXkz/POBWdPFP4bEk
         rRiR0da0KC+AFBOLTtxZVgOHwPk3uEnUBA2ZTwdFE5CjBMpAl9HJOLYX1nCz5C1zn1hD
         kSvqbmR21KpdDgQrXEHj6p2lUWyo7jnlmERkkiwIHapjrEzOki00MY+dfI6oF0RrTsAj
         avEB8vAAby5lIYxt+T1xv8clVMByt5Hcv5c3T+86ihyYOvnteq6R7ldVUdJzCfh3Czc8
         lA7Rhybjy4pzIAoYZh3TxALW1kHmTYnPQvUfUT4Iu+uX7gU95yllNoKRSNNkVNKpy07m
         5okw==
X-Gm-Message-State: APjAAAXIcDoFhL3j1UqPMNOBxqnoIyAJDnvpUIip9bjJd+8we12Xjvr+
        Y+dmc92TsoxyhIDDkBZOG+pXKka/QCJwghBh
X-Google-Smtp-Source: APXvYqxq1ojuTxsiLo5pCleB/erlP38WlCE/hHetzllNlXQTsaJvjG8WmLJUsamM4D9WfMZoZnkw6g==
X-Received: by 2002:a2e:b4cb:: with SMTP id r11mr12201568ljm.68.1578951420658;
        Mon, 13 Jan 2020 13:37:00 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id r20sm6184498lfi.91.2020.01.13.13.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:36:59 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH] pinctrl: dt-bindings: Fix some errors in the lgm and pinmux schema
Date:   Mon, 13 Jan 2020 22:34:58 +0100
Message-Id: <20200113213458.74175-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes some problems that caused build errors in the
lgm-io schema file:

- No "bindings" infix in the schema id
- Move the allOf inclusion for pinconf and pinmux nodes into
  the patternProperties for the -pins node
- We want "groups" not "group" to be compulsory for a pinmux
  node blended with a pin config node.
- Fix the generic pinmux-schema to list "groups" rather than
  "group" for a pinmux node, this might have led to some confusion.

This is a first user of the generic schema so a bit of a bumpy
road.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Rahul Tanwar <rahul.tanwar@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This was applied directly to fix compile errors in -next
so please advice quickly if I added further bugs...
---
 .../devicetree/bindings/pinctrl/intel,lgm-io.yaml   | 13 ++++++-------
 .../devicetree/bindings/pinctrl/pinmux-node.yaml    |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
index a386fb520510..cd2b436350ef 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bindings/pinctrl/intel,lgm-io.yaml#
+$id: http://devicetree.org/schemas/pinctrl/intel,lgm-io.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Intel Lightning Mountain SoC pinmux & GPIO controller binding
@@ -13,10 +13,6 @@ description: |
   Pinmux & GPIO controller controls pin multiplexing & configuration including
   GPIO function selection & GPIO attributes configuration.
 
-allOf:
-  - $ref: pincfg-node.yaml#
-  - $ref: pinmux-node.yaml#
-
 properties:
   compatible:
     const: intel,lgm-io
@@ -28,13 +24,16 @@ properties:
 patternProperties:
   '-pins$':
     type: object
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
 
     properties:
       function: true
-      group: true
+      groups: true
       pins: true
       pinmux: true
       bias-pull-up: true
@@ -46,7 +45,7 @@ patternProperties:
 
     required:
       - function
-      - group
+      - groups
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
index 777623a57fd5..732d9075560b 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
@@ -114,7 +114,7 @@ properties:
       specific binding for the hardware defines whether the entries are integers
       or strings, and their meaning.
 
-  group:
+  groups:
     $ref: /schemas/types.yaml#/definitions/string-array
     description:
       the group to apply the properties to, if the driver supports
-- 
2.23.0

