Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96849734BCC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 08:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjFSGjQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 02:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjFSGjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 02:39:13 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF2B102;
        Sun, 18 Jun 2023 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1687156752; x=1718692752;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fUkVHkKZ1SlYspf4wL2JjzZTHzbRul4i8BRFPye+n6k=;
  b=GYtNCdBitepvL5C2CU0iNcTi48j8Ppnv+xtiTE1jhVOziVuGFg698n7S
   D1wUKMI68I7qmyIqEv/q5Wnz5ozHHt7HYg1d7joHxoyiUoOL0H/zzPxHS
   tMuFT9bHWN3APyAbCXA/EkgqQOvLTo3gVy5eO7SRbs8esTT6mWEzcLMSM
   VXF1mL0tlZcVLKy7Ok27YwH/G4+ZHtk5GmgLTbuJfJ3TsvoyczD9AKj01
   NKiDmsJKi/Wl9IQ7hbdL9o6IJW4pgKtL3SNyNMYGvd49nc7zVnzGDhaJ7
   azwPBaPByMF0pGqg2+4tCMa+hD7N/WR6iWtK/gLsEYYISL3AmL6CCCxp4
   w==;
X-IronPort-AV: E=Sophos;i="6.00,254,1681164000"; 
   d="scan'208";a="31480823"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jun 2023 08:39:10 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DB7A128007C;
        Mon, 19 Jun 2023 08:39:09 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: gpio: gpio-vf610: Add parsing of hogs
Date:   Mon, 19 Jun 2023 08:39:07 +0200
Message-Id: <20230619063907.128561-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow parsing GPIO controller children nodes with GPIO hogs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Narrow the pattern
* Remove properties covered by generic dt-schema

 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index d2c39dba56add..7c2d152e86170 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -61,6 +61,13 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg
-- 
2.34.1

