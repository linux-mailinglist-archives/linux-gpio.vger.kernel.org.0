Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836615AE94D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238247AbiIFNTq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239795AbiIFNTp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:19:45 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327411C117;
        Tue,  6 Sep 2022 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hJ3kLGkWuUBRmwOZ2cL0NRg2eHh7ETiNBBItZCgbIJM=; b=Sz3kuqigiSGDcjuCtnvwreNrvo
        D0BzxepT8Bhy/9g4Y4WHlnt3LBfcvU4eplSpOJW+b9itH5DHWqpbSlpp9V0rXR1u8pkX4PE7fVu6f
        htItWqkTGHa7em6gpXPNP+BUFFG60fKciXZT5gu4rSCCvZCxw+0p3K5svlsS07plHwQFMGa32GtK8
        vMY14VMnUnKZ1DTHi5if0IjR4C2GYBq1MdeyZ7k4UiqyAO0xg25RDKJ5KZ84dFXXk3wAEVpcNOVh+
        eyRkdNx79oKTB0Fmg7xHzbluz5u2Y8dJzaUkNRS8qYKB9ioGRrLuiv4c6uEMg6Sq+XzvMukQbv7tW
        o4gzoXlQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53694 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oVYUO-0003rN-3D; Tue, 06 Sep 2022 14:19:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oVYUN-005CmM-Dn; Tue, 06 Sep 2022 14:19:39 +0100
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 3/7] soc: apple: rtkit: Add apple_rtkit_poll
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUN-005CmM-Dn@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 06 Sep 2022 14:19:39 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hector Martin <marcan@marcan.st>

This allows a client to receive messages in atomic context, by polling.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Reviewed-by: Eric Curtin <ecurtin@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/soc/apple/rtkit.c       |  6 ++++++
 include/linux/soc/apple/rtkit.h | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index cf1129e9f76b..031ec4aa06d5 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -660,6 +660,12 @@ int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
 
+int apple_rtkit_poll(struct apple_rtkit *rtk)
+{
+	return mbox_client_peek_data(rtk->mbox_chan);
+}
+EXPORT_SYMBOL_GPL(apple_rtkit_poll);
+
 int apple_rtkit_start_ep(struct apple_rtkit *rtk, u8 endpoint)
 {
 	u64 msg;
diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
index 88eb832eac7b..c9cabb679cd1 100644
--- a/include/linux/soc/apple/rtkit.h
+++ b/include/linux/soc/apple/rtkit.h
@@ -152,4 +152,16 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
 int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
 				  unsigned long timeout, bool atomic);
 
+/*
+ * Process incoming messages in atomic context.
+ * This only guarantees that messages arrive as far as the recv_message_early
+ * callback; drivers expecting to handle incoming messages synchronously
+ * by calling this function must do it that way.
+ * Will return 1 if some data was processed, 0 if none was, or a
+ * negative error code on failure.
+ *
+ * @rtk:            RTKit reference
+ */
+int apple_rtkit_poll(struct apple_rtkit *rtk);
+
 #endif /* _LINUX_APPLE_RTKIT_H_ */
-- 
2.30.2

