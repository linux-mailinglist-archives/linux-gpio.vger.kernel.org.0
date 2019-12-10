Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F060A1199B4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 22:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbfLJVHw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 16:07:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:54538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbfLJVHv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 16:07:51 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05D1924687;
        Tue, 10 Dec 2019 21:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576012070;
        bh=GnQbOwM7WkzyvqqeFRk9acVA5AeQFUGfQbjYtec5xoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VTEUGOKU25fTWTWQF7JWWomEJ0g9ENTjGODQaBtDXkX6pO8NiHG4J6LQ1ydbU3WeF
         uG7i2SYyK1Nhw12dZuSUodywjpMRXklVsofWpc9M2AHXPlH/dnfzYhjd/D9J/k9so6
         djxKyY+6jif6x46XKOxrB+T4lMF8/4LecHgZ6eNc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Elena Petrova <lenaptr@google.com>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 051/350] pinctrl: devicetree: Avoid taking direct reference to device name string
Date:   Tue, 10 Dec 2019 16:02:36 -0500
Message-Id: <20191210210735.9077-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Will Deacon <will@kernel.org>

[ Upstream commit be4c60b563edee3712d392aaeb0943a768df7023 ]

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
Link: https://lore.kernel.org/r/20191002124206.22928-1-will@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/devicetree.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 5d6d8b1e90620..dbaacde1b36af 100644
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
2.20.1

