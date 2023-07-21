Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4877F75C26C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 11:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjGUJG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 05:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGUJG0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 05:06:26 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DF7E74;
        Fri, 21 Jul 2023 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689930384; x=1721466384;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I75kCCDlibaMONLjfxO4Q2JWzzPAojEBILnYVxUnPFI=;
  b=CfpYCLIWPJOr70ruO3KSmBLYP/LZIiLOoh0pD/g3Gv/eXQnKMYye3ZYx
   m3oeaT0znQ7LHQiX8HKLLGeXzVNVWO+WBEARKufg3udA2Ul0wQ96VkLf2
   9sUA2dhN/x4lahzQN9HLjQFjPl43jTp/xPVqIdeHecOhiuxkpxdc2mdNc
   21eC2GmAptri6x534ZlYYXYgOjTrpF9iluyjFoeijdaGeXTsTLmWYysRO
   gCiLgO29T6LuirFE63QRtAeYlAxJHJX2DicMzO9VmurHttOt4coO82G8/
   8mbeFKfNNtJKLBlNxg97E/1Bf+Smws2h2qjg09eCZftfltcUaUYYLq3Zq
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,220,1684792800"; 
   d="scan'208";a="32049643"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2023 11:06:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6E89D280078;
        Fri, 21 Jul 2023 11:06:22 +0200 (CEST)
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
Subject: [PATCH 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE GPIO
Date:   Fri, 21 Jul 2023 11:06:16 +0200
Message-Id: <20230721090618.1211081-1-alexander.stein@ew.tq-group.com>
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

This is a gpio-controller, so gpio-line-names should be allowed as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
index 22c0cae73425..b226a8892f8a 100644
--- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
@@ -27,6 +27,7 @@ properties:
     const: 2
 
   gpio-controller: true
+  gpio-line-names: true
 
   interrupt-controller: true
 
-- 
2.34.1

