Return-Path: <linux-gpio+bounces-29532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F935CBB910
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3930230014C0
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9D12C21CF;
	Sun, 14 Dec 2025 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="q/vLTEym"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86992C11DD;
	Sun, 14 Dec 2025 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765705268; cv=none; b=tfTD/9zpv6YsL1VfE+hKBV57UtLeKffPYIyIybA5c3BXRasP4CJgwTrX2cnb9BZwqh9eWmxVq6QQimkkipqB29dZz59OS1kFhHgdoDOUTsT4+pBA7ZE+WuAsR/PulwOYArHOyrEP8k/3CZ22I6dC7zX/QmwZeU7R7tF2xue5SEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765705268; c=relaxed/simple;
	bh=0hwOfhAp3UTL+iR2tyBdVops9IcCIdCfHjICSSG+9YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hc+3WUM/I5CBPHOOv6SkKf4oBWPmCeukI4HG7qVjafEsI6VFzgboC8UuwoWxV4WpQ7O5BE8NWAa59v4sRO4Vm4Qk99aqgTDy4u7AUtyNBWuCxs1MLHzYYqhYdChx1JBb36yN89jVBX1vOI8g8aUlkY9xZg6QCSr/IByR9ULB1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=q/vLTEym; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id UiS8vIWZh3uKaUiS8vNd9F; Sun, 14 Dec 2025 10:31:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765704705;
	bh=msBpPCdi77sPTHHajIHtie7l4GqzHly2h9Y2kEQTlB8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=q/vLTEymif60zEam0GCBQw6LpG3kcLqwBeQ7B/AWhvHUN6fNb07Dkx004gGMdyifi
	 pf97yjvLgwJLYigHEsXCa+Web/Lw5C5vi9rNFGfEkHLlD7h5ApDbHQgidSJYyLKxZ+
	 JhRkwjhex/Wo2PKs4nrvG0SzBQJ7EX/fjdollsIe83EanUvwGk+vy3zLFKlY+xZFkg
	 lWOBkfbnYofFdSYEgWTIoa/b6vvnX2G0PvIKYpwlmYVJ8+Aabc2RaYR2I2vqRJBTdp
	 k0/FVzHkE5IQA+nBJli/ENX9o425d+LtBXcYbjritTzYFs3g/XKbPEQie/NczJP0Gb
	 SdEEfGpPBEjMg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Dec 2025 10:31:45 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: Constify struct configfs_item_operations and configfs_group_operations
Date: Sun, 14 Dec 2025 10:31:40 +0100
Message-ID: <ccb5155342ce6dbb89cfbad0687b448860d8e8f0.1765703044.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  43935	  11632	    384	  55951	   da8f	drivers/gpio/gpio-aggregator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  44191	  11376	    384	  55951	   da8f	drivers/gpio/gpio-aggregator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/gpio/gpio-aggregator.c |  8 ++++----
 drivers/gpio/gpio-sim.c        | 16 ++++++++--------
 drivers/gpio/gpio-virtuser.c   |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 416f265d09d0..a4cd32674a96 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1226,7 +1226,7 @@ gpio_aggregator_line_release(struct config_item *item)
 	kfree(line);
 }
 
-static struct configfs_item_operations gpio_aggregator_line_item_ops = {
+static const struct configfs_item_operations gpio_aggregator_line_item_ops = {
 	.release	= gpio_aggregator_line_release,
 };
 
@@ -1247,7 +1247,7 @@ static void gpio_aggregator_device_release(struct config_item *item)
 	gpio_aggregator_free(aggr);
 }
 
-static struct configfs_item_operations gpio_aggregator_device_item_ops = {
+static const struct configfs_item_operations gpio_aggregator_device_item_ops = {
 	.release	= gpio_aggregator_device_release,
 };
 
@@ -1292,7 +1292,7 @@ gpio_aggregator_device_make_group(struct config_group *group, const char *name)
 	return &line->group;
 }
 
-static struct configfs_group_operations gpio_aggregator_device_group_ops = {
+static const struct configfs_group_operations gpio_aggregator_device_group_ops = {
 	.make_group	= gpio_aggregator_device_make_group,
 };
 
@@ -1328,7 +1328,7 @@ gpio_aggregator_make_group(struct config_group *group, const char *name)
 	return &aggr->group;
 }
 
-static struct configfs_group_operations gpio_aggregator_group_ops = {
+static const struct configfs_group_operations gpio_aggregator_group_ops = {
 	.make_group	= gpio_aggregator_make_group,
 };
 
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index a83f5238427c..437b4500f56b 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1384,7 +1384,7 @@ static void gpio_sim_hog_config_item_release(struct config_item *item)
 	kfree(hog);
 }
 
-static struct configfs_item_operations gpio_sim_hog_config_item_ops = {
+static const struct configfs_item_operations gpio_sim_hog_config_item_ops = {
 	.release	= gpio_sim_hog_config_item_release,
 };
 
@@ -1433,11 +1433,11 @@ static void gpio_sim_line_config_group_release(struct config_item *item)
 	kfree(line);
 }
 
-static struct configfs_item_operations gpio_sim_line_config_item_ops = {
+static const struct configfs_item_operations gpio_sim_line_config_item_ops = {
 	.release	= gpio_sim_line_config_group_release,
 };
 
-static struct configfs_group_operations gpio_sim_line_config_group_ops = {
+static const struct configfs_group_operations gpio_sim_line_config_group_ops = {
 	.make_item	= gpio_sim_line_config_make_hog_item,
 };
 
@@ -1494,11 +1494,11 @@ static void gpio_sim_bank_config_group_release(struct config_item *item)
 	kfree(bank);
 }
 
-static struct configfs_item_operations gpio_sim_bank_config_item_ops = {
+static const struct configfs_item_operations gpio_sim_bank_config_item_ops = {
 	.release	= gpio_sim_bank_config_group_release,
 };
 
-static struct configfs_group_operations gpio_sim_bank_config_group_ops = {
+static const struct configfs_group_operations gpio_sim_bank_config_group_ops = {
 	.make_group	= gpio_sim_bank_config_make_line_group,
 };
 
@@ -1549,11 +1549,11 @@ static void gpio_sim_device_config_group_release(struct config_item *item)
 	kfree(dev);
 }
 
-static struct configfs_item_operations gpio_sim_device_config_item_ops = {
+static const struct configfs_item_operations gpio_sim_device_config_item_ops = {
 	.release	= gpio_sim_device_config_group_release,
 };
 
-static struct configfs_group_operations gpio_sim_device_config_group_ops = {
+static const struct configfs_group_operations gpio_sim_device_config_group_ops = {
 	.make_group	= gpio_sim_device_config_make_bank_group,
 };
 
@@ -1589,7 +1589,7 @@ gpio_sim_config_make_device_group(struct config_group *group, const char *name)
 	return &no_free_ptr(dev)->group;
 }
 
-static struct configfs_group_operations gpio_sim_config_group_ops = {
+static const struct configfs_group_operations gpio_sim_config_group_ops = {
 	.make_group	= gpio_sim_config_make_device_group,
 };
 
diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 37f2ce20f1ae..090f5643afaf 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1631,7 +1631,7 @@ static void gpio_virtuser_lookup_config_group_release(struct config_item *item)
 	kfree(lookup);
 }
 
-static struct configfs_item_operations gpio_virtuser_lookup_config_item_ops = {
+static const struct configfs_item_operations gpio_virtuser_lookup_config_item_ops = {
 	.release	= gpio_virtuser_lookup_config_group_release,
 };
 
@@ -1692,11 +1692,11 @@ static void gpio_virtuser_device_config_group_release(struct config_item *item)
 	kfree(dev);
 }
 
-static struct configfs_item_operations gpio_virtuser_device_config_item_ops = {
+static const struct configfs_item_operations gpio_virtuser_device_config_item_ops = {
 	.release	= gpio_virtuser_device_config_group_release,
 };
 
-static struct configfs_group_operations gpio_virtuser_device_config_group_ops = {
+static const struct configfs_group_operations gpio_virtuser_device_config_group_ops = {
 	.make_group	= gpio_virtuser_make_lookup_group,
 };
 
@@ -1729,7 +1729,7 @@ gpio_virtuser_config_make_device_group(struct config_group *group,
 	return &no_free_ptr(dev)->group;
 }
 
-static struct configfs_group_operations gpio_virtuser_config_group_ops = {
+static const struct configfs_group_operations gpio_virtuser_config_group_ops = {
 	.make_group	= gpio_virtuser_config_make_device_group,
 };
 
-- 
2.52.0


