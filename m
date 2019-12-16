Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D43F6121B46
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 21:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfLPUvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 15:51:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50155 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726729AbfLPUvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 15:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576529491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pvjquvCkoze0MtjNw3nKGvgtAe0VvOjNZaCP9z525sw=;
        b=I1bwQtUI5Ic2Pmoe2RzFp9jvmNjgje/KcRULXdfRFLzVr2L7/xiVYluC48kpRBxrAeH2Jn
        f5PA+nPMTvC8Nx27+pLJMZw7IWyhYxJ1wjPF1oPSP6s3+Lx0RvU0Ge/uid3QI0jr4HHqte
        zVmNZJwpZ8V6k30NXQG5uFUeHzB1BCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-0P7U2uBGPNaQW1ifvJCavQ-1; Mon, 16 Dec 2019 15:51:30 -0500
X-MC-Unique: 0P7U2uBGPNaQW1ifvJCavQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B9C107ACC4;
        Mon, 16 Dec 2019 20:51:28 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E6A2A1001B00;
        Mon, 16 Dec 2019 20:51:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/5] pinctrl: Allow modules to use pinctrl_[un]register_mappings
Date:   Mon, 16 Dec 2019 21:51:18 +0100
Message-Id: <20191216205122.1850923-2-hdegoede@redhat.com>
In-Reply-To: <20191216205122.1850923-1-hdegoede@redhat.com>
References: <20191216205122.1850923-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently only the drivers/pinctrl/devicetree.c code allows registering
pinctrl-mappings which may later be unregistered, all other mappings
are assumed to be permanent.

Non-dt platforms may also want to register pinctrl mappings from code whi=
ch
is build as a module, which requires being able to unregister the mapping
when the module is unloaded to avoid dangling pointers.

To allow unregistering the mappings the devicetree code uses 2 internal
functions: pinctrl_register_map and pinctrl_unregister_map.

pinctrl_register_map allows the devicetree code to tell the core to
not memdup the mappings as it retains ownership of them and
pinctrl_unregister_map does the unregistering, note this only works
when the mappings where not memdupped.

The only code relying on the memdup/shallow-copy done by
pinctrl_register_mappings is arch/arm/mach-u300/core.c this commit
replaces the __initdata with const, so that the shallow-copy is no
longer necessary.

After that we can get rid of the internal pinctrl_unregister_map function
and just use pinctrl_register_mappings directly everywhere.

This commit also renames pinctrl_unregister_map to
pinctrl_unregister_mappings so that its naming matches its
pinctrl_register_mappings counter-part and exports it.

Together these 2 changes will allow non-dt platform code to
register pinctrl-mappings from modules without breaking things on
module unload (as they can now unregister the mapping on unload).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Drop __initdata from arch/arm/mach-u300/core.c pinctrl-map, so
 that we can drop the dup behavior for non device-tree callers
-Stop memdupping the pinctrl-maps in some cases, remove all code for
 dealing with dupped maps, including the extra coded added for this in v1
 of this patch
-Drop the private (non-dupping) pinctrl_register_map function, now that
 our public pinctrl_register_mappings does not dup we can simply use it
 everywhere
---
 arch/arm/mach-u300/core.c       |  2 +-
 drivers/pinctrl/core.c          | 41 +++++++++++++--------------------
 drivers/pinctrl/core.h          |  4 ----
 drivers/pinctrl/devicetree.c    |  4 ++--
 include/linux/pinctrl/machine.h |  5 ++++
 5 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
index a79fa3b0c8ed..a1694d977ec9 100644
--- a/arch/arm/mach-u300/core.c
+++ b/arch/arm/mach-u300/core.c
@@ -201,7 +201,7 @@ static unsigned long pin_highz_conf[] =3D {
 };
=20
 /* Pin control settings */
-static struct pinctrl_map __initdata u300_pinmux_map[] =3D {
+static const struct pinctrl_map u300_pinmux_map[] =3D {
 	/* anonymous maps for chip power and EMIFs */
 	PIN_MAP_MUX_GROUP_HOG_DEFAULT("pinctrl-u300", NULL, "power"),
 	PIN_MAP_MUX_GROUP_HOG_DEFAULT("pinctrl-u300", NULL, "emif0"),
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2bbd8ee93507..b0eea728455d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1376,8 +1376,15 @@ void devm_pinctrl_put(struct pinctrl *p)
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_put);
=20
-int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_ma=
ps,
-			 bool dup)
+/**
+ * pinctrl_register_mappings() - register a set of pin controller mappin=
gs
+ * @maps: the pincontrol mappings table to register. Note the pinctrl-co=
re
+ *	keeps a reference to the passed in maps, so they should _not_ be
+ *	marked with __initdata.
+ * @num_maps: the number of maps in the mapping table
+ */
+int pinctrl_register_mappings(const struct pinctrl_map *maps,
+			      unsigned num_maps)
 {
 	int i, ret;
 	struct pinctrl_maps *maps_node;
@@ -1430,17 +1437,8 @@ int pinctrl_register_map(const struct pinctrl_map =
*maps, unsigned num_maps,
 	if (!maps_node)
 		return -ENOMEM;
=20
+	maps_node->maps =3D maps;
 	maps_node->num_maps =3D num_maps;
-	if (dup) {
-		maps_node->maps =3D kmemdup(maps, sizeof(*maps) * num_maps,
-					  GFP_KERNEL);
-		if (!maps_node->maps) {
-			kfree(maps_node);
-			return -ENOMEM;
-		}
-	} else {
-		maps_node->maps =3D maps;
-	}
=20
 	mutex_lock(&pinctrl_maps_mutex);
 	list_add_tail(&maps_node->node, &pinctrl_maps);
@@ -1448,22 +1446,14 @@ int pinctrl_register_map(const struct pinctrl_map=
 *maps, unsigned num_maps,
=20
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pinctrl_register_mappings);
=20
 /**
- * pinctrl_register_mappings() - register a set of pin controller mappin=
gs
- * @maps: the pincontrol mappings table to register. This should probabl=
y be
- *	marked with __initdata so it can be discarded after boot. This
- *	function will perform a shallow copy for the mapping entries.
- * @num_maps: the number of maps in the mapping table
+ * pinctrl_unregister_mappings() - unregister a set of pin controller ma=
ppings
+ * @maps: the pincontrol mappings table passed to pinctrl_register_mappi=
ngs()
+ *	when registering the mappings.
  */
-int pinctrl_register_mappings(const struct pinctrl_map *maps,
-			      unsigned num_maps)
-{
-	return pinctrl_register_map(maps, num_maps, true);
-}
-EXPORT_SYMBOL_GPL(pinctrl_register_mappings);
-
-void pinctrl_unregister_map(const struct pinctrl_map *map)
+void pinctrl_unregister_mappings(const struct pinctrl_map *map)
 {
 	struct pinctrl_maps *maps_node;
=20
@@ -1478,6 +1468,7 @@ void pinctrl_unregister_map(const struct pinctrl_ma=
p *map)
 	}
 	mutex_unlock(&pinctrl_maps_mutex);
 }
+EXPORT_SYMBOL_GPL(pinctrl_unregister_mappings);
=20
 /**
  * pinctrl_force_sleep() - turn a given controller device into sleep sta=
te
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 7f34167a0405..840103c40c14 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -236,10 +236,6 @@ extern struct pinctrl_gpio_range *
 pinctrl_find_gpio_range_from_pin_nolock(struct pinctrl_dev *pctldev,
 					unsigned int pin);
=20
-int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_ma=
ps,
-			 bool dup);
-void pinctrl_unregister_map(const struct pinctrl_map *map);
-
 extern int pinctrl_force_sleep(struct pinctrl_dev *pctldev);
 extern int pinctrl_force_default(struct pinctrl_dev *pctldev);
=20
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 674920daac26..9357f7c46cf3 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -51,7 +51,7 @@ void pinctrl_dt_free_maps(struct pinctrl *p)
 	struct pinctrl_dt_map *dt_map, *n1;
=20
 	list_for_each_entry_safe(dt_map, n1, &p->dt_maps, node) {
-		pinctrl_unregister_map(dt_map->map);
+		pinctrl_unregister_mappings(dt_map->map);
 		list_del(&dt_map->node);
 		dt_free_map(dt_map->pctldev, dt_map->map,
 			    dt_map->num_maps);
@@ -92,7 +92,7 @@ static int dt_remember_or_free_map(struct pinctrl *p, c=
onst char *statename,
 	dt_map->num_maps =3D num_maps;
 	list_add_tail(&dt_map->node, &p->dt_maps);
=20
-	return pinctrl_register_map(map, num_maps, false);
+	return pinctrl_register_mappings(map, num_maps);
=20
 err_free_map:
 	dt_free_map(pctldev, map, num_maps);
diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/mach=
ine.h
index ddd1b2773431..e987dc9fd2af 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -153,6 +153,7 @@ struct pinctrl_map {
=20
 extern int pinctrl_register_mappings(const struct pinctrl_map *map,
 				unsigned num_maps);
+extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
 extern void pinctrl_provide_dummies(void);
 #else
=20
@@ -162,6 +163,10 @@ static inline int pinctrl_register_mappings(const st=
ruct pinctrl_map *map,
 	return 0;
 }
=20
+static inline void pinctrl_unregister_mappings(const struct pinctrl_map =
*map)
+{
+}
+
 static inline void pinctrl_provide_dummies(void)
 {
 }
--=20
2.23.0

