Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B782472992E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 14:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239375AbjFIMLR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 08:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239673AbjFIMLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 08:11:11 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7D4359A;
        Fri,  9 Jun 2023 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686312651; x=1717848651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EqPA2k/fZFgvjfVAkEiqA2avtyIUigdprMjWSFRFNO8=;
  b=YUOmgiGONs8rMe4zvfrArrHAbuBw5zQKkC68sVgFzaxalbCEhAGweU5I
   xNuoTmvR6l4LFimTitYzKUIGDVzR4kdi8gSKpSv6vboqb9mGSilZ/jm9E
   HccS8doyUO7ZW0FeNlRQhqZxKRoWigQf6aR8pSWQySLCSfgCD3cB7cch/
   BB5qOi/KevmkWkuCTU6diCK4EUXQQ+twYycPSX1S/l4BIWkifvaSKg+o1
   717/S8d7fQaWjRZf9juf0TZMxbvC03LBadYwx+xvSrsbnUDCgx2bggU59
   853/7kQDgYm6mhR1vufaT11rYb4S23jEGBmGyQk16M0GHaR6wrYa17yEn
   g==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681164000"; 
   d="scan'208";a="31365070"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Jun 2023 14:10:48 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 09 Jun 2023 14:10:48 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 09 Jun 2023 14:10:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686312648; x=1717848648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EqPA2k/fZFgvjfVAkEiqA2avtyIUigdprMjWSFRFNO8=;
  b=lZwa7Z1n59OOM02ehTx7hgscaQv2Vd/XJnBv6PSalWT94EauMbA7wHmQ
   SjtgpuS9x6r5am8iIyaLmpoYyIl5hdjAMRitRgcmFZYFhIKlrK3CTKA54
   PjNDLHzEoAuHeBKbv3ctiT7yFcTIMwdz6xuH9TItTCEw6oXF7ScamzA16
   XvrAgXN5z2/EQ3qawGg22nGoMW6VEZPxT9tWvwmAx33ehOXYzIDXol54b
   RKZvBMTElO85vA3CmwSplQT0ccyS/olbBgmo6zxcf7bO5PZZH75pkFWFI
   +Icf1hzNa5T4+e7+doHGCZwD4CXTts+nJ/LeN8QNw9957udxDYV7ha9gR
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681164000"; 
   d="scan'208";a="31365069"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Jun 2023 14:10:48 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6F962280087;
        Fri,  9 Jun 2023 14:10:48 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: gpio: gpio-vf610: Add parsing of hogs
Date:   Fri,  9 Jun 2023 14:10:44 +0200
Message-Id: <20230609121044.586214-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow parsing GPIO controller children nodes with GPIO hogs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This implements the same as commit dfb49cc231a48 ("dt-bindings: gpio:
fsl-imx-gpio: Add parsing of hogs") and reuses the commit message as
well.

 .../devicetree/bindings/gpio/gpio-vf610.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index d2c39dba56add..41b4bb1bca11d 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -61,6 +61,23 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name: true
+
+    required:
+      - gpio-hog
+      - gpios
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
2.34.1

