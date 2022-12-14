Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C6264C65F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 10:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237989AbiLNJyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 04:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238052AbiLNJx7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 04:53:59 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B409A2181A;
        Wed, 14 Dec 2022 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011630; x=1702547630;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uzrv+WiOez6VMoWeTrEv81RdOKyzlUHm5xaTwhW1dxU=;
  b=pKXCVJvkimNJ4n+eNmlCsXi+V5qpdTg+HR1UjQei7JO4kjXuyaqtU0xS
   5k2Ijj6iYjd/rlLqv3SL+oHPc+2dW9uNMSpJmaCilTqmxAulGP2fIYBjN
   YD3RAx2iJKGHSEDjXPgrt9XFZ5nOuJIT/A0S7h8ttYUXBgW7jDBzFB+tF
   zPUL2t9RWml7BR4aNohi2DtQyOVz9uL2a25/QPc4m/uRmZclzD1aZCUpH
   b9Zx2xFUpX58DZmIUfrborRX9gej2s1KCEpKYmj+HCwxtTCAG/NXRPFsH
   wWXsKvm8BTM2bBWPa0ZLIO6Tgwz9AGEq6qwecn8DeOuOE/yJxiXDbJIEL
   A==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943173"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Dec 2022 10:53:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 14 Dec 2022 10:53:48 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 14 Dec 2022 10:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011628; x=1702547628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uzrv+WiOez6VMoWeTrEv81RdOKyzlUHm5xaTwhW1dxU=;
  b=Dl6lmSZs9PrN3nWQlNi1ePNDfFNy3Ql7UvkcbmFjACcyoMlleQRSjHlc
   v+qFp9lbJhdhUrMrpI9GZS34lJykHr3YafDhheKqhaDi9ogqWp3bS/Mtj
   yP1VREi2jN2m53Bh6eFrtbbDKPPh7hPcdYQ0sFMAkKSiPb+mQd9EejXfM
   DJ2KttlZH0SnaNfQ3WCQo7em/9t6QV/UFM3znLaqoJ6PFxd9kcz6lNQem
   lZ4KsiDQNgda5VcIu0zpY4GiQKDtHeMsJ8kHJOHsPsloPTtmtQS0Vkja/
   XduIH5fYGsoPS/kHwZ6dKbzhJUKfRuwyD7zcjp5sTI7hXj4TvjwYT7Bez
   w==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943172"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Dec 2022 10:53:47 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AC2A3280071;
        Wed, 14 Dec 2022 10:53:47 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v2 0/3] gpio: Add gpio-delay support
Date:   Wed, 14 Dec 2022 10:53:39 +0100
Message-Id: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello everyone,

thanks for the feedback I've received. This is the reworked RFC for
adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.
Now the delays are neither specified as gpio-controller nor
consumer-specific properties.

v2 is a different approach than v1 in that it adds a new driver which will
simply forward setting the GPIO output of specified GPIOs in OF node.
The ramp-up/ramp-down delay can now be actually defined on consumer side,
see Patch 1 or 3 for examples.

Thanks a lot to the existing gpio-latch driver where I could learn/copy
from a lot for creating this driver!

Patch 1 is the new binding. I welcome improvements for the description,
if needed.

Patch 2 is the new driver. I'm open for a better name, if the current one
is too ambiguous.

Patch 3 is what I am actually using for testing. It is actually based
on a not-yet-commited patch, but the diff should be enough for
demonstration.

Alexander Stein (3):
  dt-bindings: gpio: Add gpio-delay binding document
  gpio: Add gpio delay driver
  [DNI] arm64: dts: mba8mx: Use gpio-delay for LVDS bridge

 .../devicetree/bindings/gpio/gpio-delay.yaml  |  75 ++++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |  14 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-delay.c                     | 164 ++++++++++++++++++
 5 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-delay.yaml
 create mode 100644 drivers/gpio/gpio-delay.c

-- 
2.34.1

