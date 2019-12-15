Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C340511F91E
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 17:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfLOQiY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 11:38:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33358 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfLOQiY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 11:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576427903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NsIe1TfjjC87ebbQQq7mTKvBvH+3/E1pCLvaqhaVSFE=;
        b=LVC0VZiVtpgiLkvECHv/KisX1pK5nYglWqUBMZYu4tcqpA1qKvbYFO6ri9ozvnqS1CdDRA
        l7N2PeJ5b/zCGV5gWbyw9Ah+CeZmfzBS3CuTAMlh+s6WxfruQ3uGW8JsrDBhCDqHSp4jVE
        PPSeEuNDMPjj0BO3OBG7eCyfQHZtgi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-TKwW9ClKPaOf1IQHm2C17Q-1; Sun, 15 Dec 2019 11:38:18 -0500
X-MC-Unique: TKwW9ClKPaOf1IQHm2C17Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7720EDB60;
        Sun, 15 Dec 2019 16:38:16 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 74B7E5D9C9;
        Sun, 15 Dec 2019 16:38:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/5] pinctrl: Export pinctrl_unregister_mappings
Date:   Sun, 15 Dec 2019 17:38:06 +0100
Message-Id: <20191215163810.52356-2-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename pinctrl_unregister_map to pinctrl_unregister_mappings so that
its naming matches its pinctrl_register_mappings counter-part and
export it.

The purpose of this patch is to allow non-dt platforms to register
pinctrl mappings from code which is build as a module, which requires
being able to unregister the mapping when the module is unloaded to
avoid dangling pointers; and to avoid registering the mapping multiple
times, when the module gets reloaded later.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/core.c          | 11 ++++++++++-
 drivers/pinctrl/core.h          |  3 ++-
 drivers/pinctrl/devicetree.c    |  2 +-
 include/linux/pinctrl/machine.h |  5 +++++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2bbd8ee93507..c98f8cc9c7ca 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1431,6 +1431,7 @@ int pinctrl_register_map(const struct pinctrl_map *=
maps, unsigned num_maps,
 		return -ENOMEM;
=20
 	maps_node->num_maps =3D num_maps;
+	maps_node->dup =3D dup;
 	if (dup) {
 		maps_node->maps =3D kmemdup(maps, sizeof(*maps) * num_maps,
 					  GFP_KERNEL);
@@ -1463,7 +1464,12 @@ int pinctrl_register_mappings(const struct pinctrl=
_map *maps,
 }
 EXPORT_SYMBOL_GPL(pinctrl_register_mappings);
=20
-void pinctrl_unregister_map(const struct pinctrl_map *map)
+/**
+ * pinctrl_unregister_mappings() - unregister a set of pin controller ma=
ppings
+ * @maps: the pincontrol mappings table passed to pinctrl_register_mappi=
ngs()
+ *	when registering the mappings.
+ */
+void pinctrl_unregister_mappings(const struct pinctrl_map *map)
 {
 	struct pinctrl_maps *maps_node;
=20
@@ -1471,6 +1477,8 @@ void pinctrl_unregister_map(const struct pinctrl_ma=
p *map)
 	list_for_each_entry(maps_node, &pinctrl_maps, node) {
 		if (maps_node->maps =3D=3D map) {
 			list_del(&maps_node->node);
+			if (maps_node->dup)
+				kfree(maps_node->maps);
 			kfree(maps_node);
 			mutex_unlock(&pinctrl_maps_mutex);
 			return;
@@ -1478,6 +1486,7 @@ void pinctrl_unregister_map(const struct pinctrl_ma=
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
index 7f34167a0405..cba38ef13b1d 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -175,11 +175,13 @@ struct pin_desc {
  * @node: mapping table list node
  * @maps: array of mapping table entries
  * @num_maps: the number of entries in @maps
+ * @dup: has the mapping table been memdup-ed by us?
  */
 struct pinctrl_maps {
 	struct list_head node;
 	const struct pinctrl_map *maps;
 	unsigned num_maps;
+	bool dup;
 };
=20
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
@@ -238,7 +240,6 @@ pinctrl_find_gpio_range_from_pin_nolock(struct pinctr=
l_dev *pctldev,
=20
 int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_ma=
ps,
 			 bool dup);
-void pinctrl_unregister_map(const struct pinctrl_map *map);
=20
 extern int pinctrl_force_sleep(struct pinctrl_dev *pctldev);
 extern int pinctrl_force_default(struct pinctrl_dev *pctldev);
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 674920daac26..a1925962a3e2 100644
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

