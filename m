Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F95E721F7B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 09:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjFEHZ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 03:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbjFEHZW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 03:25:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01F698
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685949921; x=1717485921;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7ogy+u5MEFDEv6i2xU5Lgl9mTV2t6utYQR6f88rhVTQ=;
  b=plc+QBWDaGXWxmtJaEVlbRWCZSgFrannKX9LWL1Mo+Nz+MU25vbRfbL9
   8rcHXEzlOswIYdtOfjd5LHOHJNOZutlfIuYB+B0ZrnoqMZFS3BkEbui2y
   nL3TMvd8PUA+sfNYs8SbZS9qpeM8rXIn2/qLWbGD4PoNZhKa+uPwGX84J
   tHzvCCL+qwLcr1PIGddIcPsz7cdDUsM651dQ4CqwbHnGtFC68kCbTGTF9
   L4XcapKccP5feP7JtqCM4cAkcdHIQ6tFCModfrqUQZuYxucY1qGinFKii
   +X2gnxu2bJLNXhGhvZPFHXKEvjYhBGtblxVy0ThoUGXsIQ7cRf/2RLIai
   w==;
X-IronPort-AV: E=Sophos;i="6.00,217,1681164000"; 
   d="scan'208";a="31265845"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 Jun 2023 09:25:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 05 Jun 2023 09:25:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 05 Jun 2023 09:25:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685949918; x=1717485918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7ogy+u5MEFDEv6i2xU5Lgl9mTV2t6utYQR6f88rhVTQ=;
  b=oLNtXt7YpOaH4PujfYXHTkktId04h8G0+3QP3OBulVTfWpoOJ75WgsFy
   prBlCaW16jS7K6SKb6/UtI2AZY2MIfLvqmIVLIkLCcBXnJmXxxsZ0bOVo
   VjpCx9RKA9JYeRh7zTtFKY9x+vUuMbnOGj0oX4NlsrXapmmrUbTPNjC15
   4efOxUn1Y7XqaoPbTX4pf5AWu/DNJHLbdrtUfji7ZX2AmRCuFDtyOp4vS
   7LmKxOgMoGMooi1Lejo3XBhef/j8y3b1S82KlubH84pt4JKcz39HdSQkK
   VM1dFq0Bn3/x+x69YVMcD+wx9M22T9ALY7nltISrMu8vTtPIZzaHmxvnH
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,217,1681164000"; 
   d="scan'208";a="31265844"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Jun 2023 09:25:18 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AF5D6280086;
        Mon,  5 Jun 2023 09:25:18 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/1] gpio: Fix dependency for gpio-delay
Date:   Mon,  5 Jun 2023 09:25:18 +0200
Message-Id: <20230605072518.256568-1-alexander.stein@ew.tq-group.com>
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

This driver relies on OF_GPIO features, add a dependency to Kconfig.

Fixes: cf5dec80c4e2 ("gpio: Add gpio delay driver")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This was undetected on my machine as CONFIG_OF_GPIO was already enabled.

 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a1dac1345f60f..006abaedcae82 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1735,6 +1735,7 @@ config GPIO_AGGREGATOR
 
 config GPIO_DELAY
 	tristate "GPIO delay"
+	depends on OF_GPIO
 	help
 	  Say yes here to enable the GPIO delay, which provides a way to
 	  configure platform specific delays for GPIO ramp-up or ramp-down
-- 
2.34.1

