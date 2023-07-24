Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30CAD75EBAD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 08:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjGXGiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 02:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjGXGiD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 02:38:03 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14550FF;
        Sun, 23 Jul 2023 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690180650; x=1721716650;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KqbSBiDcrHAR8fQdVT4U9PsbKtkp15GMOhqyIA5N/YU=;
  b=VXCte17VQuHPQJqQ4BcC9/donpkcK6MLfZGTcc8Z5kwM+MSwvH7XNCyj
   11QvSpYSariViYgEnPNLopVoZWkgsv4j6gs8AP3GFkXlsQnHfo/0pcRcb
   rPZ7EzqskaSHR97iqVYDx4ydncbqfGvE1KNCfGi4dAqBFPCd24tgeHZ0i
   eZWSgMMzpwnscI40LF9OruBlLRDDR6UJzI3GGYEfd3yXN+FVOH9C3TuRe
   b0t0GwR0XM7LJc/TrQqtt8qPe6HJb31L62VriDFyuSpxwyy+BXIH4K4jI
   7QKx6mnfmO4tKxm+j357ROLvpK8xl1TI4PO4bEa2vOIE3ZzXboCd8ZGBJ
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32070464"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 08:35:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 109D6280078;
        Mon, 24 Jul 2023 08:35:22 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE GPIO
Date:   Mon, 24 Jul 2023 08:35:19 +0200
Message-Id: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
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

This is a gpio-controller, so gpio-line-names should be allowed as well.
stmpe2403 supports up to 24 GPIOs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Add min/maxItems

 Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
index 22c0cae73425..4555f1644a4d 100644
--- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
@@ -28,6 +28,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 24
+
   interrupt-controller: true
 
   st,norequest-mask:
-- 
2.34.1

