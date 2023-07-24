Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2BC875EBB5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 08:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjGXGi0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 02:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjGXGiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 02:38:25 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439B910D;
        Sun, 23 Jul 2023 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690180681; x=1721716681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qo77yFF1+Xe4+ux9WT9zH/pvobHjGv17l93nkcfgwNc=;
  b=hXyO8TR7QuH2gwyjCM4mGLZjEb6SmqGKVymBzozMlBY0iXdAQExVf6BW
   9YNl7yZJ6uOnSIzvAlWcH/rNqQIjWm6m0hprn+95+1bk4XD2ecuTAlBTz
   DAiwLQ62NnqE7XogkzIjHzTd6yndYed2+gGgTZtQ5PX3nVinI92Kaav40
   pzZ5a0Z5bTJgLRaA4byUwmzK05HWp5rXqag/sFek1sTIb+V2YGeHjL+0S
   vwashBXEhDmkYB80+AIraNSnM/qJWmh6InyWRjzcTZLYuLRKN3oaRjERL
   05WL6Hhw2a7Qb6zW6G3yuXJ048DLyYysSHuVo2+jlheQhAtFuxHaRR8CX
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32070465"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 08:35:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 56C1B280084;
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
Subject: [PATCH v2 2/2] dt-bindings: leds: Add gpio-line-names to PCA9532 GPIO
Date:   Mon, 24 Jul 2023 08:35:20 +0200
Message-Id: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
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
pca9532 supports up to 16 GPIOs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Add min/maxItems

 Documentation/devicetree/bindings/leds/nxp,pca953x.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
index edf6f55df685..9610bca57dd5 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
@@ -29,6 +29,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 16
+
   '#gpio-cells':
     const: 2
 
-- 
2.34.1

