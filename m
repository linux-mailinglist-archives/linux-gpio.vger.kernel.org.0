Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02BBC616694
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 16:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbiKBPzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 11:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbiKBPzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 11:55:03 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9842934E
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 08:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q5ifmNZigSkK/DIN6ifuG6KAV4UaKwlaKQfa8uQpd2A=; b=o6J2ufXMULqCXdw8DDGRsk8lzT
        euC1OIadsh2ViXT9Lcy4uhhqNAI9vEK/I9JEosEix5Q/m453RtKclSEpu0ClZr8bve9hkMXblo4EE
        i7/6tDYXaA3eBLnsZ+JiZ6RdxyQOC9pChyUNqGNMkuT6ovwO8Ng5gv1oq+fbqszc7DyHY1vcwo/Fp
        X0jNJot4rGmUo4PE/EZ9Udm8dNz8BhJbIzGt8m2rmIez2sy9sUVpqRteYk9Rov7+ufhgypxKjB3SI
        wOWBjh1Kw/yOFoDRjQ2VoMGX3uTRjjAmpF4xsFDOjxNe7AvRX1W5rgiHS0618hZQ0l0ifbgLuHIZe
        SnIix5MA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35080)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oqG4l-0005EC-O2; Wed, 02 Nov 2022 15:54:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oqG4i-0007Wl-V2; Wed, 02 Nov 2022 15:54:45 +0000
Date:   Wed, 2 Nov 2022 15:54:44 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Lee Jones <lee@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Y2KSxJJHmceIFmNn@shell.armlinux.org.uk>
References: <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <a92ca9ac-fbc8-a25f-4865-5bc7adb206e2@marcan.st>
 <Y1+LzpEvVj7xswqb@google.com>
 <dcd692aa-1525-4fc5-5198-37f803725c4f@marcan.st>
 <Y1+VdnmMUfIKTwWF@google.com>
 <4faa5e4c-b43b-12e4-2259-c2595bd55b97@marcan.st>
 <Y2AEgIfURNhCgimr@google.com>
 <Y2AjUz9eGa/GLY5s@shell.armlinux.org.uk>
 <Y2Js1ZhIlr9dimHw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2Js1ZhIlr9dimHw@google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lee,

One of the things we discussed on IRC was moving the shim to a header
file. Moving code into functions in a header file requires the
functions to be marked "static inline", and when I mentioned that
you seemed to be rather surprised.

They need to be static to give them compilation-unit scope so two
different users of them don't expose the functions to each other,
creating a linker error. They also need to be "inline" so the
compiler knows that they're supposed to be shim-style functions and
avoids the compiler warning that static functions aren't being used.

Most can be moved out, but we end up with one rather large function
which feels way too bulky to move into a header file, that being
apple_smc_find_first_key_index().

So, this is what it looks like moving everything except that function,
and it means we need somewhere for that function to live outside of a
header file. This raises the question whether there really is much
point to moving the shim out.

If we do manage to move the shim out, we're left with the shim
initialisation and the MFD bits left in smc_core.c, and we've already
established that oving the MFD bits isn't what you're after. So, we
could move that initialisation and MFD bits to smc_rtkit.c... but then
what happens when the next backend comes along (which will be for Intel
based MACs), we would need to duplicate that code in another backend.

To me, making this change just feels wrong - not just mildly wrong -
because it exposes things that consumers of the SMC API offered by the
core shouldn't really know about, such as the contents of struct
apple_smc and struct apple_smc_backend_ops. I'm really not sure doing
this results in an improvement. Here's the changes on top of this
patch set anyway.

From what I understand that you want for MFD, you want a single .c file
that is a device driver itself, which then talks directly to MFD with
nothing else inbetween.

The only way I can think of achieving that is to essentially move the
contents of smc_rtkit.c into smc_core.c, and when it comes to merging
the Intel SMC support, that also has to go into smc_core.c as well -
which means we end up with a lot of dead code and #ifdef's in that .c
file - which is not nice.

 drivers/platform/apple/smc.h      |  24 +++---
 drivers/platform/apple/smc_core.c | 127 ----------------------------
 include/linux/mfd/macsmc.h        | 136 +++++++++++++++++++++++++++---
 3 files changed, 138 insertions(+), 149 deletions(-)

diff --git a/drivers/platform/apple/smc.h b/drivers/platform/apple/smc.h
index 8ae51887b2c5..fa86411d5044 100644
--- a/drivers/platform/apple/smc.h
+++ b/drivers/platform/apple/smc.h
@@ -7,22 +7,24 @@
 #ifndef _SMC_H
 #define _SMC_H
 
+#include <linux/device.h>
 #include <linux/mfd/macsmc.h>
 
-struct apple_smc_backend_ops {
-	int (*read_key)(void *cookie, smc_key key, void *buf, size_t size);
-	int (*write_key)(void *cookie, smc_key key, void *buf, size_t size);
-	int (*write_key_atomic)(void *cookie, smc_key key, void *buf, size_t size);
-	int (*rw_key)(void *cookie, smc_key key, void *wbuf, size_t wsize,
-		      void *rbuf, size_t rsize);
-	int (*get_key_by_index)(void *cookie, int index, smc_key *key);
-	int (*get_key_info)(void *cookie, smc_key key, struct apple_smc_key_info *info);
-};
+static inline void apple_smc_event_received(struct apple_smc *smc,
+					    uint32_t event)
+{
+	dev_dbg(smc->dev, "Event: 0x%08x\n", event);
+
+	blocking_notifier_call_chain(&smc->event_handlers, event, NULL);
+}
+
+static inline void *apple_smc_get_cookie(struct apple_smc *smc)
+{
+	return smc->be_cookie;
+}
 
 struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops,
 				  void *cookie);
-void *apple_smc_get_cookie(struct apple_smc *smc);
 int apple_smc_remove(struct apple_smc *smc);
-void apple_smc_event_received(struct apple_smc *smc, uint32_t event);
 
 #endif
diff --git a/drivers/platform/apple/smc_core.c b/drivers/platform/apple/smc_core.c
index 148a3f8173d3..0902d2f811f4 100644
--- a/drivers/platform/apple/smc_core.c
+++ b/drivers/platform/apple/smc_core.c
@@ -6,25 +6,8 @@
 
 #include <linux/device.h>
 #include <linux/mfd/core.h>
-#include <linux/mutex.h>
-#include <linux/notifier.h>
 #include "smc.h"
 
-struct apple_smc {
-	struct device *dev;
-
-	void *be_cookie;
-	const struct apple_smc_backend_ops *be;
-
-	struct mutex mutex;
-
-	u32 key_count;
-	smc_key first_key;
-	smc_key last_key;
-
-	struct blocking_notifier_head event_handlers;
-};
-
 static const struct mfd_cell apple_smc_devs[] = {
 	{
 		.name = "macsmc-gpio",
@@ -44,85 +27,6 @@ static const struct mfd_cell apple_smc_devs[] = {
 	},
 };
 
-int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
-{
-	int ret;
-
-	mutex_lock(&smc->mutex);
-	ret = smc->be->read_key(smc->be_cookie, key, buf, size);
-	mutex_unlock(&smc->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL(apple_smc_read);
-
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
-{
-	int ret;
-
-	mutex_lock(&smc->mutex);
-	ret = smc->be->write_key(smc->be_cookie, key, buf, size);
-	mutex_unlock(&smc->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL(apple_smc_write);
-
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
-{
-	int ret;
-
-	/*
-	 * Will fail if SMC is busy. This is only used by SMC reboot/poweroff
-	 * final calls, so it doesn't really matter at that point.
-	 */
-	if (!mutex_trylock(&smc->mutex))
-		return -EBUSY;
-
-	ret = smc->be->write_key_atomic(smc->be_cookie, key, buf, size);
-	mutex_unlock(&smc->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL(apple_smc_write_atomic);
-
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
-		 void *rbuf, size_t rsize)
-{
-	int ret;
-
-	mutex_lock(&smc->mutex);
-	ret = smc->be->rw_key(smc->be_cookie, key, wbuf, wsize, rbuf, rsize);
-	mutex_unlock(&smc->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL(apple_smc_rw);
-
-int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key)
-{
-	int ret;
-
-	mutex_lock(&smc->mutex);
-	ret = smc->be->get_key_by_index(smc->be_cookie, index, key);
-	mutex_unlock(&smc->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL(apple_smc_get_key_by_index);
-
-int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info)
-{
-	int ret;
-
-	mutex_lock(&smc->mutex);
-	ret = smc->be->get_key_info(smc->be_cookie, key, info);
-	mutex_unlock(&smc->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL(apple_smc_get_key_info);
-
 int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key)
 {
 	int start = 0, count = smc->key_count;
@@ -158,37 +62,6 @@ int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key)
 }
 EXPORT_SYMBOL(apple_smc_find_first_key_index);
 
-int apple_smc_get_key_count(struct apple_smc *smc)
-{
-	return smc->key_count;
-}
-EXPORT_SYMBOL(apple_smc_get_key_count);
-
-void apple_smc_event_received(struct apple_smc *smc, uint32_t event)
-{
-	dev_dbg(smc->dev, "Event: 0x%08x\n", event);
-	blocking_notifier_call_chain(&smc->event_handlers, event, NULL);
-}
-EXPORT_SYMBOL(apple_smc_event_received);
-
-int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n)
-{
-	return blocking_notifier_chain_register(&smc->event_handlers, n);
-}
-EXPORT_SYMBOL(apple_smc_register_notifier);
-
-int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n)
-{
-	return blocking_notifier_chain_unregister(&smc->event_handlers, n);
-}
-EXPORT_SYMBOL(apple_smc_unregister_notifier);
-
-void *apple_smc_get_cookie(struct apple_smc *smc)
-{
-	return smc->be_cookie;
-}
-EXPORT_SYMBOL(apple_smc_get_cookie);
-
 struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops, void *cookie)
 {
 	struct apple_smc *smc;
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 39b4dc4ca881..147d6f957cb1 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -7,7 +7,10 @@
 #ifndef _LINUX_MFD_MACSMC_H
 #define _LINUX_MFD_MACSMC_H
 
-struct apple_smc;
+#include <linux/errno.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
 
 typedef u32 smc_key;
 
@@ -24,16 +27,118 @@ struct apple_smc_key_info {
 	u8 flags;
 };
 
-int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size);
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size);
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size);
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
-		 void *rbuf, size_t rsize);
+struct device;
+
+struct apple_smc_backend_ops {
+	int (*read_key)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*write_key)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*write_key_atomic)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*rw_key)(void *cookie, smc_key key, void *wbuf, size_t wsize,
+		      void *rbuf, size_t rsize);
+	int (*get_key_by_index)(void *cookie, int index, smc_key *key);
+	int (*get_key_info)(void *cookie, smc_key key, struct apple_smc_key_info *info);
+};
+
+struct apple_smc {
+	struct device *dev;
+
+	void *be_cookie;
+	const struct apple_smc_backend_ops *be;
+
+	struct mutex mutex;
+
+	u32 key_count;
+	smc_key first_key;
+	smc_key last_key;
+
+	struct blocking_notifier_head event_handlers;
+};
+
+static inline int apple_smc_read(struct apple_smc *smc, smc_key key,
+				 void *buf, size_t size)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->read_key(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+
+static inline int apple_smc_write(struct apple_smc *smc, smc_key key,
+				  void *buf, size_t size)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->write_key(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+
+static inline int apple_smc_write_atomic(struct apple_smc *smc, smc_key key,
+					 void *buf, size_t size)
+{
+	int ret;
+
+	/*
+	 * Will fail if SMC is busy. This is only used by SMC reboot/poweroff
+	 * final calls, so it shouldn't really matter at that point.
+	 */
+	if (!mutex_trylock(&smc->mutex))
+		return -EBUSY;
+
+	ret = smc->be->write_key_atomic(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+
+static inline int apple_smc_rw(struct apple_smc *smc, smc_key key,
+			       void *wbuf, size_t wsize,
+			       void *rbuf, size_t rsize)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->rw_key(smc->be_cookie, key, wbuf, wsize, rbuf, rsize);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+
+static inline int apple_smc_get_key_count(struct apple_smc *smc)
+{
+	return smc->key_count;
+}
+
+static inline int apple_smc_get_key_by_index(struct apple_smc *smc, int index,
+					     smc_key *key)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->get_key_by_index(smc->be_cookie, index, key);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+
+static inline int apple_smc_get_key_info(struct apple_smc *smc, smc_key key,
+					 struct apple_smc_key_info *info)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->get_key_info(smc->be_cookie, key, info);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
 
-int apple_smc_get_key_count(struct apple_smc *smc);
 int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key);
-int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key);
-int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info);
 
 static inline bool apple_smc_key_exists(struct apple_smc *smc, smc_key key)
 {
@@ -80,7 +185,16 @@ static inline int apple_smc_read_flag(struct apple_smc *smc, smc_key key)
 }
 #define apple_smc_write_flag apple_smc_write_u8
 
-int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n);
-int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n);
+static inline int apple_smc_register_notifier(struct apple_smc *smc,
+					      struct notifier_block *n)
+{
+	return blocking_notifier_chain_register(&smc->event_handlers, n);
+}
+
+static inline int apple_smc_unregister_notifier(struct apple_smc *smc,
+						struct notifier_block *n)
+{
+	return blocking_notifier_chain_unregister(&smc->event_handlers, n);
+}
 
 #endif
-- 
2.30.2



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
