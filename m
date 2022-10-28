Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEA8611621
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 17:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiJ1Pib (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 11:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbiJ1PiN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 11:38:13 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BAD219FE8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q1F6yR8dYAxI+UJJtikY1mCKGi7/pORbcF6uO/72aDc=; b=B2KR2ciuxIEhgq3ERqvr+IdMPB
        FrSvvzKNSyXEdVgVy+JYbdLI0Hdkx3gIIt8BZ6xY+DXTarWIfJ9/8u6dQFUxoq6lKiOKg4RnXNFg7
        wfim86HxozZh5E/PVv8yCm3N6UoODEeuG52qGrR8nxg3aFLAfTiqQ6wT1jbxsceBIPUSAaPC8qfwU
        m1b5E9ISh1Ulgc1mM9by1k7YNCCr/j0enaXE2OM6k58Y2AklQweB+OHHUQ4tLvZwrtrdudk8MTJoQ
        ovxs4YG2IjtqQIDHbc1xaEXP+Hi6j5ywZJes3/bElpjMDE0WkBS3omBNnbE7yyZkm8Qo1It6pZGw+
        LjaRYnlA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35008)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ooRPf-0008S0-2H; Fri, 28 Oct 2022 16:36:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ooRPc-0002fe-Lc; Fri, 28 Oct 2022 16:36:48 +0100
Date:   Fri, 28 Oct 2022 16:36:48 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Lee Jones <lee@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Y1v3EMP6pFZuo0QW@shell.armlinux.org.uk>
References: <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <Yx8D8mGCO+1sEaKG@shell.armlinux.org.uk>
 <Yx8QEkZcnL59qSUM@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yx8QEkZcnL59qSUM@google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2022 at 11:55:14AM +0100, Lee Jones wrote:
> > I'm guessing this series is now dead, and Hector needs to re-spin the
> > patch set according to your views. I'm guessing this is going to take
> > a major re-work of the patch series.
> > 
> > I suspect my attempt and trying to get this upstream has made things
> > more complicated, because I doubt Hector has updated his patch set
> > with the review comments that have been made so far... so this is
> > now quite a mess. I think, once this is sorted, the entire series
> > will need to be re-reviewed entirely afresh.
> 
> I have no insight into what Hector is doing, or plans to do.

It seems there's no plans by Hector to address this, so it comes down
to me.

So, guessing what you're after, would something like the following
work for you? I don't see *any* point in creating more yet more
platform devices unless we're on a mission to maximise wasted memory
resources (which this split will already be doing by creating two
small modules instead of one.)

Obviously, this is not an official patch yet, it's just to find out
what code structure you are looking for.

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 78c6d9d99c3f..8d4c0508a2c8 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -18,6 +18,8 @@ obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
 
+obj-$(CONFIG_APPLE_SMC)		+= apple-smc.o
+
 obj-$(CONFIG_HTC_PASIC3)	+= htc-pasic3.o
 obj-$(CONFIG_HTC_I2CPLD)	+= htc-i2cpld.o
 
diff --git a/drivers/mfd/apple-smc.c b/drivers/mfd/apple-smc.c
new file mode 100644
index 000000000000..bc59d1c5e13d
--- /dev/null
+++ b/drivers/mfd/apple-smc.c
@@ -0,0 +1,38 @@
+#include <linux/mfd/core.h>
+#include <linux/mfd/apple-smc.h>
+
+static const struct mfd_cell apple_smc_devs[] = {
+	{
+		.name = "macsmc-gpio",
+		.of_compatible = "apple,smc-gpio",
+	},
+	{
+		.name = "macsmc-hid",
+	},
+	{
+		.name = "macsmc-power",
+	},
+	{
+		.name = "macsmc-reboot",
+	},
+	{
+		.name = "macsmc-rtc",
+	},
+};
+
+int apple_smc_mfd_probe(struct device *dev)
+{
+	return mfd_add_devices(dev, -1, apple_smc_devs,
+			       ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
+}
+EXPORT_SYMBOL(apple_smc_mfd_probe);
+
+void apple_smc_mfd_remove(struct device *dev)
+{
+	mfd_remove_devices(dev);
+}
+EXPORT_SYMBOL(apple_smc_mfd_remove);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC MFD core");
diff --git a/drivers/platform/apple/smc_core.c b/drivers/platform/apple/smc_core.c
index 148a3f8173d3..d4a502835b27 100644
--- a/drivers/platform/apple/smc_core.c
+++ b/drivers/platform/apple/smc_core.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/device.h>
-#include <linux/mfd/core.h>
+#include <linux/mfd/apple-smc.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include "smc.h"
@@ -25,25 +25,6 @@ struct apple_smc {
 	struct blocking_notifier_head event_handlers;
 };
 
-static const struct mfd_cell apple_smc_devs[] = {
-	{
-		.name = "macsmc-gpio",
-		.of_compatible = "apple,smc-gpio",
-	},
-	{
-		.name = "macsmc-hid",
-	},
-	{
-		.name = "macsmc-power",
-	},
-	{
-		.name = "macsmc-reboot",
-	},
-	{
-		.name = "macsmc-rtc",
-	},
-};
-
 int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
 {
 	int ret;
@@ -226,7 +207,7 @@ struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_bac
 
 	dev_set_drvdata(dev, smc);
 
-	ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
+	ret = apple_smc_mfd_probe(dev);
 	if (ret)
 		return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));
 
@@ -236,7 +217,7 @@ EXPORT_SYMBOL(apple_smc_probe);
 
 int apple_smc_remove(struct apple_smc *smc)
 {
-	mfd_remove_devices(smc->dev);
+	apple_smc_mfd_remove(smc->dev);
 
 	/* Disable notifications */
 	apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
diff --git a/include/linux/mfd/apple-smc.h b/include/linux/mfd/apple-smc.h
new file mode 100644
index 000000000000..2f34ca0f07f3
--- /dev/null
+++ b/include/linux/mfd/apple-smc.h
@@ -0,0 +1,9 @@
+#ifndef LINUX_MFD_APPLE_SMC_H
+#define LINUX_MFD_APPLE_SMC_H
+
+struct device;
+
+int apple_smc_mfd_probe(struct device *dev);
+void apple_smc_mfd_remove(struct device *dev);
+
+#endif

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
