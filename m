Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8034696AB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 14:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244147AbhLFNV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 08:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244229AbhLFNVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 08:21:25 -0500
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5FEC061354
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 05:17:56 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uDrMmpEGIQyExuDrPm2JUf; Mon, 06 Dec 2021 14:16:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638796612; bh=CrLBmkwSELvVmTheaFu8QBeazdfNj4H2YIkCWYVH99E=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=cN1cKbgAKOA3XywU5E4Oe4zJzzjGpFh2///C0013bXhpUdPeHLJ94kgKcJ7wltABw
         gIL/JDUEteQiP2U3ePzg5e2zf3qSryE6wh+2ZzF1+Vy7AZwTV93KtrPvJdDPdZsgNQ
         ycAM7khEwmG4bZ7geqGLfVcITeZhkWdHckqfoypvcYEsrTTqHI/ZUQPWxJkXV+9OTG
         0Wuoxovbrkly34y1nkpUcTcE1idmWbBBG0bB+QzJOG3H3P+TvgebpzJMl1oxDUoxk7
         FvdiFu6mNppUxN5hTU6acsCS6quEPZyUCbYBw4KrceCr3G7+16zMiQQn2T0gi6DoPs
         9dXAazVaL9Hzg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/3] pinctrl/core: check that can_sleep is true in pinctrl_gpio_direction()
Date:   Mon,  6 Dec 2021 14:16:46 +0100
Message-Id: <20211206131648.1521868-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMwDLfFiqeI9ZBG8k00Zh1pVxeZYv9W9Z2t8TxADXtQeRpTcehdp6ErpGbZ0A8B3RfuoZqXgdXnGq3Xu9iwfzUNCBFydTXahIwMUoMO+eMxiabFHWDIO
 9uAukYZ/5TnMFt1gJkOJCx4T68xP72XQh076re8VRmzzHP7XI5ACOjdTsylu+McBnpbRcn66hBaoMBvAaI0b4Zaqhev+z9oWR6Vzusl60bRw2mheVX0Y0WK8
 gPgXbFmoD6YvZDLgBZmE1mjDJgDsDpGn+vq8TNSRQ8O7IKdlbxVSw7BGsoNbCivGnfUydVkwDe0TxYRzArRqqW8yBEgoaIbwyT5zfhjvBfe8OMO7Vej53Lz7
 Kcu4gPPVBPdm7sCsj8tBkD+IYQXy6A==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since pinctrl_gpio_direction() takes a mutex, the gpio driver must
have can_sleep set to true. If not, then this function will call
WARN_ON (only once per pin controller) to tell the developer that
something must be done: either set can_sleep to true, or set the
direction in the combine gpio/pinctrl driver itself without calling
pinctrl_gpio_direction_input/output.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/pinctrl/core.c | 11 +++++++++++
 drivers/pinctrl/core.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ffe39336fcac..886242d08dcf 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -845,6 +845,17 @@ static int pinctrl_gpio_direction(unsigned gpio, bool input)
 
 	mutex_lock(&pctldev->mutex);
 
+	if (!pctldev->checked_can_sleep) {
+		struct gpio_chip *chip = gpio_to_chip(gpio);
+
+		pctldev->checked_can_sleep = true;
+		/*
+		 * This pin controller can sleep, so check that the gpio
+		 * controller sets can_sleep to true.
+		 */
+		WARN_ON(chip && !chip->can_sleep);
+	}
+
 	/* Convert to the pin controllers number space */
 	pin = gpio_to_pin(range, gpio);
 	ret = pinmux_gpio_direction(pctldev, range, pin, input);
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 840103c40c14..ae14b4e69b7b 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -38,6 +38,9 @@ struct pinctrl_gpio_range;
  * @hog_sleep: sleep state for pins hogged by this device
  * @mutex: mutex taken on each pin controller specific action
  * @device_root: debugfs root for this device
+ * @checked_can_sleep: used internally to warn once if pinctrl_gpio_direction()
+ *	is called from a gpio driver that didn't set @can_sleep to true.
+ *	pinctrl_gpio_direction() uses mutexes, so it can sleep.
  */
 struct pinctrl_dev {
 	struct list_head node;
@@ -62,6 +65,7 @@ struct pinctrl_dev {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *device_root;
 #endif
+	bool checked_can_sleep;
 };
 
 /**
-- 
2.33.0

