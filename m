Return-Path: <linux-gpio+bounces-14729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06320A0C002
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 19:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38ED07A1103
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 18:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C48B1D63C4;
	Mon, 13 Jan 2025 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWtjyX+g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF61D5CFD;
	Mon, 13 Jan 2025 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736793290; cv=none; b=ipumxh4S0NBXvQnh0mw6Eoh3LIhTidkjCPdRwSxVAr1QFwbrPVg5ULIxmQh8xb32bkYUk87HwFnvZRHe1D/1K0EEkh9+7i4ZI1+7G0pC7k1Kq5Ivn+VBehVjqvgwuiszYv4ec7fazcxU28Z1hOkIV52pgriTj7xBVhoMFprfSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736793290; c=relaxed/simple;
	bh=BVTpr2WgfB147t8nOT2ZNXSsU67zM/RobQ2D7pMpfgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CmrchsKat8nMMfCjTczBa1xN7k4LAPYcs/xGgUfcKMM0MO31bdv1sb3qt0OmZCtIFyuOrsmhgHPTYaUbCtaFVY61MEdmrhiCxXOrIwiC6+khfKPH/iZbT12BkWIPxDSmRnbONb3a53MgnmDR1TwavvSURwpE0Khf4QZWNWuv71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWtjyX+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8484C4CEE3;
	Mon, 13 Jan 2025 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793289;
	bh=BVTpr2WgfB147t8nOT2ZNXSsU67zM/RobQ2D7pMpfgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWtjyX+gw/tIFZ30N9xkti6DiA5/slg1kCADbORcBa80rBQzGGjQxUI7B8TPJPLEl
	 a15M93rpLX2ZhQBxvnLV/ETP9CGLGaU3qHcXY7le7LdhfQTJvNoin/C9ZWs8Ikb6Fh
	 HceiO/4z1XCOD6ta43xRvKtHGO/Z6K14JMRIOfB3UNDo4Bv1mLl8bi4U9To83ds2qi
	 0htNbbPsMAdv+TwVhq16v2BABESQ8sfIjg65YGUvHQUhA27zm6p/F9t81Ifw0wuTqJ
	 HlBB1nXR/D8lnDc2vVBiePIFWDvx9jEjuG9x9U9g6+z4rHKaDqXigmbbf5Ua5y82gd
	 9OJCvKB3MHI3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Koichiro Den <koichiro.den@canonical.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 10/20] gpio: virtuser: lock up configfs that an instantiated device depends on
Date: Mon, 13 Jan 2025 13:34:15 -0500
Message-Id: <20250113183425.1783715-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113183425.1783715-1-sashal@kernel.org>
References: <20250113183425.1783715-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.9
Content-Transfer-Encoding: 8bit

From: Koichiro Den <koichiro.den@canonical.com>

[ Upstream commit c7c434c1dba955005f5161dae73f09c0a922cfa7 ]

Once a virtuser device is instantiated and actively used, allowing rmdir
for its configfs serves no purpose and can be confusing. Userspace
interacts with the virtual consumer at arbitrary times, meaning it
depends on its existence.

Make the subsystem itself depend on the configfs entry for a virtuser
device while it is in active use.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
Link: https://lore.kernel.org/r/20250103141829.430662-4-koichiro.den@canonical.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-virtuser.c | 47 ++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 91b6352c957c..615984cdd4ca 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1532,6 +1532,30 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
 	kfree(dev->lookup_table);
 }
 
+static void
+gpio_virtuser_device_lockup_configfs(struct gpio_virtuser_device *dev, bool lock)
+{
+	struct configfs_subsystem *subsys = dev->group.cg_subsys;
+	struct gpio_virtuser_lookup_entry *entry;
+	struct gpio_virtuser_lookup *lookup;
+
+	/*
+	 * The device only needs to depend on leaf lookup entries. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	list_for_each_entry(lookup, &dev->lookup_list, siblings) {
+		list_for_each_entry(entry, &lookup->entry_list, siblings) {
+			if (lock)
+				WARN_ON(configfs_depend_item_unlocked(
+						subsys, &entry->group.cg_item));
+			else
+				configfs_undepend_item_unlocked(
+						&entry->group.cg_item);
+		}
+	}
+}
+
 static ssize_t
 gpio_virtuser_device_config_live_store(struct config_item *item,
 				       const char *page, size_t count)
@@ -1544,15 +1568,24 @@ gpio_virtuser_device_config_live_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	guard(mutex)(&dev->lock);
+	if (live)
+		gpio_virtuser_device_lockup_configfs(dev, true);
 
-	if (live == gpio_virtuser_device_is_live(dev))
-		return -EPERM;
+	scoped_guard(mutex, &dev->lock) {
+		if (live == gpio_virtuser_device_is_live(dev))
+			ret = -EPERM;
+		else if (live)
+			ret = gpio_virtuser_device_activate(dev);
+		else
+			gpio_virtuser_device_deactivate(dev);
+	}
 
-	if (live)
-		ret = gpio_virtuser_device_activate(dev);
-	else
-		gpio_virtuser_device_deactivate(dev);
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		gpio_virtuser_device_lockup_configfs(dev, false);
 
 	return ret ?: count;
 }
-- 
2.39.5


