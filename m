Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC383142DF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhBHWZA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:25:00 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:52711 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhBHWYz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:55 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2VGj-1luhmR3RJ1-013sEY; Mon, 08 Feb 2021 23:22:16 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 09/12] drivers: base: reintroduce find_bus()
Date:   Mon,  8 Feb 2021 23:22:00 +0100
Message-Id: <20210208222203.22335-10-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:rzHVi5GoHivXWlnfqQmxW9ROEO3dTvvCGJjkmHY1rYU58qOtQdB
 BWExFeO+Lo7FQnJw4FivMBV8vVs5qdqC8Daz5Q4ov4Da0LJhOvhFlR2siSolW392MDgY9cH
 8XXxJ+Jsbc1T1eAY/QQvG6JTPj2JQU031dT6WF7IOT1GkP5PSJ/eJ5zfvyp2hkFU/FXNikO
 2tQpzN1WMr8i6gawh2pSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3jDwSQW1sfw=:S+k5ohg/fvN1L6nK+an5kA
 +R/OSvwPagPSZlWc9jBeQRyCOsKSYmcnZ6bF0GFMGDOmdX8fJtZJp1GS3sOshQtcqou/bjxDV
 qdNYObRRD4gTkYQOGao7jMJzlMiH/Ac2uM4LBRda23m8yqNhnCPEk5/Loq96ANivz4m8CCcbj
 /s+VFTolH9CbObyDG2qp+fF8tJrl/H0GwmVkxxV8NyVFHHHDHVXoyoDVsLqZVovSt7T1tTS6t
 BMJQmQBWcjVricSiOzaFEpI+OgXkx1n4vG78rHYOe1xEXcm7gr85UmUGQloXjulge/oKPFkKj
 vPAE5uZex4dZ9T+qQ6PLsHnt2nL01nQp67LXPvksmkPXP5n8/xzMIPYQFdcW2HereIzUKBRru
 jjB4jWNWlZrcXptDCJjplCphEmEPyr9eMjg9IMJVdaFFGJ9xGkFyjo0GKfVOB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

---
 drivers/base/bus.c         | 14 ++++++++++----
 include/linux/device/bus.h |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 450d3ed6cf1f..a06ae2786092 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -754,13 +754,19 @@ EXPORT_SYMBOL_GPL(device_reprobe);
  *
  * Note that kset_find_obj increments bus' reference count.
  */
-#if 0
-struct bus_type *find_bus(char *name)
+struct bus_type *find_bus(const char *name)
 {
 	struct kobject *k = kset_find_obj(bus_kset, name);
-	return k ? to_bus(k) : NULL;
+	struct subsys_private *subsys_priv;
+
+	if (!k)
+		return NULL;
+
+	subsys_priv = container_of(to_kset(k), struct subsys_private, subsys);
+
+	return subsys_priv->bus;
 }
-#endif  /*  0  */
+EXPORT_SYMBOL_GPL(find_bus);
 
 static int bus_add_groups(struct bus_type *bus,
 			  const struct attribute_group **groups)
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 36a1dae26c95..b4cbcfe176c5 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -254,6 +254,8 @@ void bus_sort_breadthfirst(struct bus_type *bus,
 			   int (*compare)(const struct device *a,
 					  const struct device *b));
 
+struct bus_type *find_bus(const char *name);
+
 /**
  * bus_unregister_device_by_name - remove device by bus id from specific bus
  *                                 and unregister it from device core
-- 
2.11.0

