Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 867BE68FE4
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2019 16:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389461AbfGOOQI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 10:16:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:33000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388662AbfGOOQI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jul 2019 10:16:08 -0400
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0780D217D8;
        Mon, 15 Jul 2019 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563200167;
        bh=a7a6E074fEkxycHYhCF7OWwjizPLKZ5bUgrLePPAsx0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sLb4Xr6m3xFqecE7UDWimYPNgS2ykE+NNHzvYScue/lYDX1t6z7vmQ8kDt4XizX0W
         d8PpMyOU9/PNgVMFweQL8HrCK5udV7ULe/vll5J1WtX8p9ZK6QvlVWvlgUlLyXRPKT
         eaYcUxq+9oHwgtnCNFWxHlwxkwv+VpyR7+0CH1Bw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 200/219] gpiolib: Fix references to gpiod_[gs]et_*value_cansleep() variants
Date:   Mon, 15 Jul 2019 10:03:21 -0400
Message-Id: <20190715140341.6443-200-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715140341.6443-1-sashal@kernel.org>
References: <20190715140341.6443-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 3285170f28a850638794cdfe712eb6d93e51e706 ]

Commit 372e722ea4dd4ca1 ("gpiolib: use descriptors internally") renamed
the functions to use a "gpiod" prefix, and commit 79a9becda8940deb
("gpiolib: export descriptor-based GPIO interface") introduced the "raw"
variants, but both changes forgot to update the comments.

Readd a similar reference to gpiod_set_value(), which was accidentally
removed by commit 1e77fc82110ac36f ("gpio: Add missing open drain/source
handling to gpiod_set_value_cansleep()").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/20190701142738.25219-1-geert+renesas@glider.be
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fd1344056e1d..b8a5c1e3b99d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3012,7 +3012,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
 	VALIDATE_DESC(desc);
-	/* Should be using gpio_get_value_cansleep() */
+	/* Should be using gpiod_get_raw_value_cansleep() */
 	WARN_ON(desc->gdev->chip->can_sleep);
 	return gpiod_get_raw_value_commit(desc);
 }
@@ -3033,7 +3033,7 @@ int gpiod_get_value(const struct gpio_desc *desc)
 	int value;
 
 	VALIDATE_DESC(desc);
-	/* Should be using gpio_get_value_cansleep() */
+	/* Should be using gpiod_get_value_cansleep() */
 	WARN_ON(desc->gdev->chip->can_sleep);
 
 	value = gpiod_get_raw_value_commit(desc);
@@ -3304,7 +3304,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
 	VALIDATE_DESC_VOID(desc);
-	/* Should be using gpiod_set_value_cansleep() */
+	/* Should be using gpiod_set_raw_value_cansleep() */
 	WARN_ON(desc->gdev->chip->can_sleep);
 	gpiod_set_raw_value_commit(desc, value);
 }
@@ -3345,6 +3345,7 @@ static void gpiod_set_value_nocheck(struct gpio_desc *desc, int value)
 void gpiod_set_value(struct gpio_desc *desc, int value)
 {
 	VALIDATE_DESC_VOID(desc);
+	/* Should be using gpiod_set_value_cansleep() */
 	WARN_ON(desc->gdev->chip->can_sleep);
 	gpiod_set_value_nocheck(desc, value);
 }
-- 
2.20.1

