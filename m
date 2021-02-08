Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8883B3142E8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhBHWZZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:25:25 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:50717 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhBHWZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:25:04 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKKlN-1lUTlZ2RrT-00Lm3a; Mon, 08 Feb 2021 23:22:14 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 05/12] of: kobj: __of_attach_node_sysfs(): add optional basename parameter
Date:   Mon,  8 Feb 2021 23:21:56 +0100
Message-Id: <20210208222203.22335-6-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:npTHoKrL2oZbIv5cy3FmU1KTINiQbH4qQhD55Xayo4OIGdDxoev
 gbzaBfDm82BI+WL0Q5XXfcw2bf1mhzCP5EfsMEH22W+YrQEoWvpFapetR8aW4a4Mn1BHh31
 Pm01SE0jNYzBPFs79nvITLiY849a6/f12ji880iUonxJzqoj9k+3PirBtebr4pjkU1/KWJ6
 kwWQTazNy00Vr3t1i8Sfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8z86mJ3AC+k=:6VyNFzdPV/KSorHycOvmKI
 5+mYc3CjznHOHfVs9RqH3PCNXVGIpSxUI9D+ViGXZNfZsZfe0TWmFDHPRI+NUnLnqq/y39poV
 M+L575DO+CQ79T2eODO2/7m92kauR41BCOyik0it83xhr/t4A2tKO+VyIoZ8bC5jsnKZxUzIK
 2rz7fIDerNi3zIaY8d7u8BPJm2YXgaF+W8zNFYo7t/4e4pWC5AUFYk4IEeKpWJUjLB6LRtPYI
 TIe4V5y2mz7+h9eVfE34zXk8Hwtec2comFPyuCJ6F360VrgfAw6kOfUGC4zP/mtUnvP3ia2U4
 y4efzNucwczV+sryhyHUjKNumVF8H39Yk5wcuLIbuos8JJwu6Ic1eVMinOH5wmNNZ46rHiOV6
 5Rx95sodEKfSXBQPIJjsPaZfsuThBd+efbCtI0KgSaeBgm0WPUNNFFIfkvIzF
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce additional parameter for specifying the name of the base directory
underneath /sys/firmware/devicetree. This is for scenarios where we want
entirely separate oftree instances. Passing NULL falls back to the existing
base name 'base'.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/of/base.c       | 2 +-
 drivers/of/dynamic.c    | 4 ++--
 drivers/of/kobj.c       | 7 +++++--
 drivers/of/of_private.h | 6 +++---
 drivers/of/unittest.c   | 6 +++---
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 649c2a32bb48..be63493bd232 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -177,7 +177,7 @@ void __init of_core_init(void)
 		return;
 	}
 	for_each_of_allnodes(np) {
-		__of_attach_node_sysfs(np);
+		__of_attach_node_sysfs(np, NULL);
 		if (np->phandle && !phandle_cache[of_phandle_cache_hash(np->phandle)])
 			phandle_cache[of_phandle_cache_hash(np->phandle)] = np;
 	}
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 9a824decf61f..63768f0dc60e 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -243,7 +243,7 @@ int of_attach_node(struct device_node *np)
 	__of_attach_node(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	__of_attach_node_sysfs(np);
+	__of_attach_node_sysfs(np, NULL);
 	mutex_unlock(&of_mutex);
 
 	of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, &rd);
@@ -635,7 +635,7 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 
 	switch (ce->action) {
 	case OF_RECONFIG_ATTACH_NODE:
-		__of_attach_node_sysfs(ce->np);
+		__of_attach_node_sysfs(ce->np, NULL);
 		break;
 	case OF_RECONFIG_DETACH_NODE:
 		__of_detach_node_sysfs(ce->np);
diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index a32e60b024b8..511d7e8b9068 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -112,20 +112,23 @@ void __of_update_property_sysfs(struct device_node *np, struct property *newprop
 	__of_add_property_sysfs(np, newprop);
 }
 
-int __of_attach_node_sysfs(struct device_node *np)
+int __of_attach_node_sysfs(struct device_node *np, const char *basename)
 {
 	const char *name;
 	struct kobject *parent;
 	struct property *pp;
 	int rc;
 
+	if (!basename)
+		basename = "base";
+
 	if (!of_kset)
 		return 0;
 
 	np->kobj.kset = of_kset;
 	if (!np->parent) {
 		/* Nodes without parents are new top level trees */
-		name = safe_name(&of_kset->kobj, "base");
+		name = safe_name(&of_kset->kobj, basename);
 		parent = NULL;
 	} else {
 		name = safe_name(&np->parent->kobj, kbasename(np->full_name));
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index d9e6a324de0a..371f4da77161 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -63,7 +63,7 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp);
 void __of_remove_property_sysfs(struct device_node *np, struct property *prop);
 void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
 		struct property *oldprop);
-int __of_attach_node_sysfs(struct device_node *np);
+int __of_attach_node_sysfs(struct device_node *np, const char *basename);
 void __of_detach_node_sysfs(struct device_node *np);
 #else
 static inline int __of_add_property_sysfs(struct device_node *np, struct property *pp)
@@ -73,7 +73,7 @@ static inline int __of_add_property_sysfs(struct device_node *np, struct propert
 static inline void __of_remove_property_sysfs(struct device_node *np, struct property *prop) {}
 static inline void __of_update_property_sysfs(struct device_node *np,
 		struct property *newprop, struct property *oldprop) {}
-static inline int __of_attach_node_sysfs(struct device_node *np)
+static inline int __of_attach_node_sysfs(struct device_node *np, const char *basename)
 {
 	return 0;
 }
@@ -135,7 +135,7 @@ extern int __of_update_property(struct device_node *np,
 extern void __of_update_property_sysfs(struct device_node *np,
 		struct property *newprop, struct property *oldprop);
 
-extern int __of_attach_node_sysfs(struct device_node *np);
+extern int __of_attach_node_sysfs(struct device_node *np, const char *basename);
 extern void __of_detach_node(struct device_node *np);
 extern void __of_detach_node_sysfs(struct device_node *np);
 
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index eb51bc147440..caf4ade8b141 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1391,7 +1391,7 @@ static void attach_node_and_children(struct device_node *np)
 	of_node_clear_flag(np, OF_DETACHED);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	__of_attach_node_sysfs(np);
+	__of_attach_node_sysfs(np, NULL);
 	mutex_unlock(&of_mutex);
 
 	while (child) {
@@ -1451,7 +1451,7 @@ static int __init unittest_data_add(void)
 	if (!of_root) {
 		of_root = unittest_data_node;
 		for_each_of_allnodes(np)
-			__of_attach_node_sysfs(np);
+			__of_attach_node_sysfs(np, NULL);
 		of_aliases = of_find_node_by_path("/aliases");
 		of_chosen = of_find_node_by_path("/chosen");
 		of_overlay_mutex_unlock();
@@ -3115,7 +3115,7 @@ static __init void of_unittest_overlay_high_level(void)
 		of_root->child = overlay_base_root->child;
 
 	for_each_of_allnodes_from(overlay_base_root, np)
-		__of_attach_node_sysfs(np);
+		__of_attach_node_sysfs(np, NULL);
 
 	if (of_symbols) {
 		struct property *new_prop;
-- 
2.11.0

