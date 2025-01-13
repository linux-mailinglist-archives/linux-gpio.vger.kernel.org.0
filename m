Return-Path: <linux-gpio+bounces-14730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC8A0C004
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 19:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E833E160C0A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 18:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61771E572F;
	Mon, 13 Jan 2025 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXcqc4bq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECBC1DAC90;
	Mon, 13 Jan 2025 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736793291; cv=none; b=Zu83WMNmwmAWPnL/TIf8GBkb0p25PM578cPtZhmB+LNKdoGiZtyngW7byf+9MClsDrZRzeykl4vTX0qfA1gB5M0hiJjO/iGkEz6ZwuKbjKyP6tuqqa6SMNLH13M0ghNr2+TVFLrQ+lU3GnMbgGIcqUNfg+FBeKkVDGt2RW9V+Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736793291; c=relaxed/simple;
	bh=KNnOWt6ECsfWle5FiIRB34PUo2GPi7cdSOaQq3vhKew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k+BCXgpfiY/keL8QzOMmZ2F/U8gYg7CKvz7eTVhLD7BmA4annLacBfoiMW8oWPXuly+KCNb7hZIYQ/6nngCg8eqVvZ4etvoIp45Bs+KmkuaLbzCYm21ntszvSmeQ9su228Q0m1H1bYIFmi+N0At6AlwNAOLpTwcBc+sVPF7z514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXcqc4bq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A3DC4CEE2;
	Mon, 13 Jan 2025 18:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793291;
	bh=KNnOWt6ECsfWle5FiIRB34PUo2GPi7cdSOaQq3vhKew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXcqc4bqJs489wHPQ4YYpU4/stwxVznXjS7hkVWuAVAlXMvLXPobXvZu1RRnwvyL2
	 /I3LRQjyHErg6w3pC3blfmd2N4VHLmyKWY2fPHCerwetOfSnUfwXFH1VMCHVa6zqXB
	 QF1QQyyUa/KY6dVXa57G6xEcwcOVeK6cGdfqpeu1ba9zjlTpL6T/q2zEySF1s9W3o0
	 dZzDFecavCBD6VN/DlNPlyhoYaO6MZ6rdx18QcOatRJPmktCMq2jC2rh9JqrDPLJrV
	 CgORjP2wLEXK2AT281s5nBittXlp640EPeEOcTHwDiz4C40nWBfzKcuI+VfE6lZjeD
	 kzw0rZBUHCohw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Koichiro Den <koichiro.den@canonical.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 11/20] gpio: sim: lock up configfs that an instantiated device depends on
Date: Mon, 13 Jan 2025 13:34:16 -0500
Message-Id: <20250113183425.1783715-11-sashal@kernel.org>
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

[ Upstream commit 8bd76b3d3f3af7ac2898b6a27ad90c444fec418f ]

Once a sim device is instantiated and actively used, allowing rmdir for
its configfs serves no purpose and can be confusing. Effectively,
arbitrary users start depending on its existence.

Make the subsystem itself depend on the configfs entry for a sim device
while it is in active use.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
Link: https://lore.kernel.org/r/20250103141829.430662-5-koichiro.den@canonical.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-sim.c | 48 +++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index dcca1d7f173e..deedacdeb239 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1030,6 +1030,30 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 	dev->pdev = NULL;
 }
 
+static void
+gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
+{
+	struct configfs_subsystem *subsys = dev->group.cg_subsys;
+	struct gpio_sim_bank *bank;
+	struct gpio_sim_line *line;
+
+	/*
+	 * The device only needs to depend on leaf line entries. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	list_for_each_entry(bank, &dev->bank_list, siblings) {
+		list_for_each_entry(line, &bank->line_list, siblings) {
+			if (lock)
+				WARN_ON(configfs_depend_item_unlocked(
+						subsys, &line->group.cg_item));
+			else
+				configfs_undepend_item_unlocked(
+						&line->group.cg_item);
+		}
+	}
+}
+
 static ssize_t
 gpio_sim_device_config_live_store(struct config_item *item,
 				  const char *page, size_t count)
@@ -1042,14 +1066,24 @@ gpio_sim_device_config_live_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	guard(mutex)(&dev->lock);
+	if (live)
+		gpio_sim_device_lockup_configfs(dev, true);
 
-	if (live == gpio_sim_device_is_live(dev))
-		ret = -EPERM;
-	else if (live)
-		ret = gpio_sim_device_activate(dev);
-	else
-		gpio_sim_device_deactivate(dev);
+	scoped_guard(mutex, &dev->lock) {
+		if (live == gpio_sim_device_is_live(dev))
+			ret = -EPERM;
+		else if (live)
+			ret = gpio_sim_device_activate(dev);
+		else
+			gpio_sim_device_deactivate(dev);
+	}
+
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		gpio_sim_device_lockup_configfs(dev, false);
 
 	return ret ?: count;
 }
-- 
2.39.5


