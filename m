Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D7EC88F2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 14:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfJBMmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 08:42:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfJBMmX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Oct 2019 08:42:23 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7EB02133F;
        Wed,  2 Oct 2019 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570020142;
        bh=NLDQQjTMKStTfy+mmZiFdDPpDbYYwDq97K+fyh0rmQA=;
        h=From:To:Cc:Subject:Date:From;
        b=dJnxXL+yQ7XMCepN6ICMOHC9GiR/ws2fcKtNxQRw+uZysq57qIxRjdAP2/IoFE6oI
         ANUY12euHdOugmdy82+lhqZTOif3n9gul2YuV0qp4hzjK7Ok6+KjDCwIp6tDEa9uWL
         vh4FKjOByYAVdPWEfWeMGoCFNi+Qs3vzuq8jRtyI=
From:   Will Deacon <will@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [RESEND PATCH] pinctrl: devicetree: Avoid taking direct reference to device name string
Date:   Wed,  2 Oct 2019 13:42:06 +0100
Message-Id: <20191002124206.22928-1-will@kernel.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When populating the pinctrl mapping table entries for a device, the
'dev_name' field for each entry is initialised to point directly at the
string returned by 'dev_name()' for the device and subsequently used by
'create_pinctrl()' when looking up the mappings for the device being
probed.

This is unreliable in the presence of calls to 'dev_set_name()', which may
reallocate the device name string leaving the pinctrl mappings with a
dangling reference. This then leads to a use-after-free every time the
name is dereferenced by a device probe:

  | BUG: KASAN: invalid-access in strcmp+0x20/0x64
  | Read of size 1 at addr 13ffffc153494b00 by task modprobe/590
  | Pointer tag: [13], memory tag: [fe]
  |
  | Call trace:
  |  __kasan_report+0x16c/0x1dc
  |  kasan_report+0x10/0x18
  |  check_memory_region
  |  __hwasan_load1_noabort+0x4c/0x54
  |  strcmp+0x20/0x64
  |  create_pinctrl+0x18c/0x7f4
  |  pinctrl_get+0x90/0x114
  |  devm_pinctrl_get+0x44/0x98
  |  pinctrl_bind_pins+0x5c/0x450
  |  really_probe+0x1c8/0x9a4
  |  driver_probe_device+0x120/0x1d8

Follow the example of sysfs, and duplicate the device name string before
stashing it away in the pinctrl mapping entries.

Cc: Linus Walleij <linus.walleij@linaro.org>
Reported-by: Elena Petrova <lenaptr@google.com>
Tested-by: Elena Petrova <lenaptr@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/pinctrl/devicetree.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 88ddbb2e30de..9721ad30c541 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -29,6 +29,13 @@ struct pinctrl_dt_map {
 static void dt_free_map(struct pinctrl_dev *pctldev,
 		     struct pinctrl_map *map, unsigned num_maps)
 {
+	int i;
+
+	for (i = 0; i < num_maps; ++i) {
+		kfree_const(map[i].dev_name);
+		map[i].dev_name = NULL;
+	}
+
 	if (pctldev) {
 		const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 		if (ops->dt_free_map)
@@ -63,7 +70,13 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 
 	/* Initialize common mapping table entry fields */
 	for (i = 0; i < num_maps; i++) {
-		map[i].dev_name = dev_name(p->dev);
+		const char *devname;
+
+		devname = kstrdup_const(dev_name(p->dev), GFP_KERNEL);
+		if (!devname)
+			goto err_free_map;
+
+		map[i].dev_name = devname;
 		map[i].name = statename;
 		if (pctldev)
 			map[i].ctrl_dev_name = dev_name(pctldev->dev);
@@ -71,10 +84,8 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 
 	/* Remember the converted mapping table entries */
 	dt_map = kzalloc(sizeof(*dt_map), GFP_KERNEL);
-	if (!dt_map) {
-		dt_free_map(pctldev, map, num_maps);
-		return -ENOMEM;
-	}
+	if (!dt_map)
+		goto err_free_map;
 
 	dt_map->pctldev = pctldev;
 	dt_map->map = map;
@@ -82,6 +93,10 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 	list_add_tail(&dt_map->node, &p->dt_maps);
 
 	return pinctrl_register_map(map, num_maps, false);
+
+err_free_map:
+	dt_free_map(pctldev, map, num_maps);
+	return -ENOMEM;
 }
 
 struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
-- 
2.23.0.444.g18eeb5a265-goog

