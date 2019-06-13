Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53174446F3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfFMQzt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:55:49 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:39796 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729987AbfFMB4D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 21:56:03 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x5D1tauk028457;
        Thu, 13 Jun 2019 10:55:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x5D1tauk028457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560390936;
        bh=pt+Nr64T0NPrCAcdTorRfTpUgTXiQs3U70zfvyWcj80=;
        h=From:To:Cc:Subject:Date:From;
        b=DkY1vevyYgmJYUcdyPap7f3JBGtDDwKAZ/T9Kk1KM2D9m6+7n8+c6hcASnD9UK+XP
         sPpOkhJtm9MH8GURhyTKynRJk8cSIYauztgvWH+JXtGCkAhnxxg8k/os/Lylq2sNcj
         SgdL5sH05qqOLg3jJUrZMNTCg0JxWNOgYO89jQ+p2R4WwJkXD4rtBNDKMOFtAGnedn
         KCSlPL58ZHNT0xp3Gomz2mB1kn3F7Ym+pQDjaqJ2vpaG3jW6ekz1SoGg+Scz2uW2H8
         QvxaunFuhiBaceGmlfa5WuvwawWn0dZ6Gqb/fqdEFN5UDCjX9E1eXLOTB1lEaBy+YD
         At7SpFraePWMA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: remove unneeded #ifdef around declarations
Date:   Thu, 13 Jun 2019 10:55:31 +0900
Message-Id: <20190613015532.19685-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

What is the point in surrounding the whole of declarations with
ifdef like this?

  #ifdef CONFIG_FOO
  int foo(void);
  #endif

If CONFIG_FOO is not defined, all callers of foo() will fail
with implicit declaration errors since the top Makefile adds
-Werror-implicit-function-declaration to KBUILD_CFLAGS.

This breaks the build earlier when you are doing something wrong.
That's it.

Anyway, it will fail to link since the definition of foo() is not
compiled.

In summary, these ifdef are unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/pinctrl/pinconf-generic.h | 20 ++++++--------------
 include/linux/pinctrl/pinconf.h         |  4 ----
 include/linux/pinctrl/pinctrl.h         |  4 ----
 include/linux/pinctrl/pinmux.h          |  4 ----
 4 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 6f260c1d3467..b55231993d24 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -11,6 +11,12 @@
 #ifndef __LINUX_PINCTRL_PINCONF_GENERIC_H
 #define __LINUX_PINCTRL_PINCONF_GENERIC_H
 
+#include <linux/device.h>
+#include <linux/pinctrl/machine.h>
+
+struct pinctrl_dev;
+struct pinctrl_map;
+
 /**
  * enum pin_config_param - possible pin configuration parameters
  * @PIN_CONFIG_BIAS_BUS_HOLD: the pin will be set to weakly latch so that it
@@ -155,9 +161,6 @@ static inline unsigned long pinconf_to_config_packed(enum pin_config_param param
 	return PIN_CONF_PACKED(param, argument);
 }
 
-#ifdef CONFIG_GENERIC_PINCONF
-
-#ifdef CONFIG_DEBUG_FS
 #define PCONFDUMP(a, b, c, d) {					\
 	.param = a, .display = b, .format = c, .has_arg = d	\
 	}
@@ -168,14 +171,6 @@ struct pin_config_item {
 	const char * const format;
 	bool has_arg;
 };
-#endif /* CONFIG_DEBUG_FS */
-
-#ifdef CONFIG_OF
-
-#include <linux/device.h>
-#include <linux/pinctrl/machine.h>
-struct pinctrl_dev;
-struct pinctrl_map;
 
 struct pinconf_generic_params {
 	const char * const property;
@@ -220,8 +215,5 @@ static inline int pinconf_generic_dt_node_to_map_all(
 	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
 			PIN_MAP_TYPE_INVALID);
 }
-#endif
-
-#endif /* CONFIG_GENERIC_PINCONF */
 
 #endif /* __LINUX_PINCTRL_PINCONF_GENERIC_H */
diff --git a/include/linux/pinctrl/pinconf.h b/include/linux/pinctrl/pinconf.h
index 514414a5ad01..eb16a1e0bcfa 100644
--- a/include/linux/pinctrl/pinconf.h
+++ b/include/linux/pinctrl/pinconf.h
@@ -11,8 +11,6 @@
 #ifndef __LINUX_PINCTRL_PINCONF_H
 #define __LINUX_PINCTRL_PINCONF_H
 
-#ifdef CONFIG_PINCONF
-
 struct pinctrl_dev;
 struct seq_file;
 
@@ -64,6 +62,4 @@ struct pinconf_ops {
 					    unsigned long config);
 };
 
-#endif
-
 #endif /* __LINUX_PINCTRL_PINCONF_H */
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 34b10d112be6..c6159f041f4e 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,8 +11,6 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
-#ifdef CONFIG_PINCTRL
-
 #include <linux/radix-tree.h>
 #include <linux/list.h>
 #include <linux/seq_file.h>
@@ -197,6 +195,4 @@ extern const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev);
 extern const char *pinctrl_dev_get_devname(struct pinctrl_dev *pctldev);
 extern void *pinctrl_dev_get_drvdata(struct pinctrl_dev *pctldev);
 
-#endif /* !CONFIG_PINCTRL */
-
 #endif /* __LINUX_PINCTRL_PINCTRL_H */
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index e873ed97d79e..9a647fa5c8f1 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -15,8 +15,6 @@
 #include <linux/seq_file.h>
 #include <linux/pinctrl/pinctrl.h>
 
-#ifdef CONFIG_PINMUX
-
 struct pinctrl_dev;
 
 /**
@@ -84,6 +82,4 @@ struct pinmux_ops {
 	bool strict;
 };
 
-#endif /* CONFIG_PINMUX */
-
 #endif /* __LINUX_PINCTRL_PINMUX_H */
-- 
2.17.1

