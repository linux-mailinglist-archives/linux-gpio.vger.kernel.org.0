Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF69D5A997B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 15:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiIANyn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 09:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbiIANym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 09:54:42 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1645120190
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zyU/s3SljPR5PhLbvgtX6PueXWeHUUBpW9mxXVc6RjY=; b=KJfq6mYKuSbYxdudTLedUx0mCt
        BunHdgABCzFEUZYVsP4LkpRi0N+fzdJGrx2X7nwO7FtlyMGvFpaECsfPnTYzNFAaiiLBKviYn72IN
        dpgC7ogcbz88KV6w8hNka2XIPXTbQe4wC4n27i5jiHZDKigY4kf0aTFYMX2w6o/OTx6kwG1Ppe9lP
        ULpFep7r2vbnMDkCYiVMmXMAVxutgs++7kaQy4vnkMuCUPVEhGW+iP4UFq0xlYu57WvhCqOdPlWBR
        WvAM0dhbIVvXw7ApRqve4EDd7SaAyceJZ5gQ5QEPEfpNGTPW03mD1BL3YXnaf3CqT1yFVFWY+ZXN1
        AgSBmT6g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50894 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oTkeR-0005wa-UV; Thu, 01 Sep 2022 14:54:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oTkeR-003t9R-BK; Thu, 01 Sep 2022 14:54:35 +0100
In-Reply-To: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 3/6] soc: apple: rtkit: Add apple_rtkit_poll
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oTkeR-003t9R-BK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 01 Sep 2022 14:54:35 +0100
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

