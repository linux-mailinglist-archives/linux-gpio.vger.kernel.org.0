Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFA8557F62
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 18:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbiFWQI3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 12:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiFWQIU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 12:08:20 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6897024BCC;
        Thu, 23 Jun 2022 09:08:07 -0700 (PDT)
Received: from jupiter.universe (unknown [95.33.159.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E8ADA66017E7;
        Thu, 23 Jun 2022 17:08:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656000486;
        bh=q9J33uYPMktafJTb3YVjGjiU6bVVAfRG+db8e8nmGWQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mBy7YqTN+y0phIUnivdmJNn1dKIayjp5GUlSvaXQASq8DDB1kyBW5YCTft3DcLwzC
         +xo4ilHmK6cNPoQOqG5GwE4BG7bAHITJt0/o/tQLuVsMEiv+1h/EvQ9Xsu+Xv6ET/i
         pbQxIA/RnzbRZe6UPc6RO88D5WGc1xmlF5Sfrom05ZrAGs3/OUrLMYZgNupIFlLaDV
         A+FjJmhrTS/ZiivTiqnB+zeJl0qdeOEklmm5LOwecGxcGFDDU2odlBQ8ijb7gLzweJ
         EUV9Sa3CBKdNXgREil09hpfUDOEgNX6Q1RRytOY4B908EyP0hueJMr37AxtthxhUrP
         zGKO3n4oDG0sg==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 9E59A480125; Thu, 23 Jun 2022 18:08:03 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: gpio: rockchip: add gpio-ranges
Date:   Thu, 23 Jun 2022 18:08:00 +0200
Message-Id: <20220623160801.240779-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623160801.240779-1-sebastian.reichel@collabora.com>
References: <20220623160801.240779-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow usage of gpio-ranges with the rockchip gpio controller. The driver
already had support for this since it has been added to the mainline kernel
in the first place.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d4e42c2b995b..affd823c881d 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -27,6 +27,8 @@ properties:
       - description: APB interface clock source
       - description: GPIO debounce reference clock source
 
+  gpio-ranges: true
+
   gpio-controller: true
 
   gpio-line-names: true
-- 
2.35.1

