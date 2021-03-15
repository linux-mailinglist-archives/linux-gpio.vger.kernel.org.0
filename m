Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D6433C5F8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 19:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhCOSol (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 14:44:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:24292 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232160AbhCOSob (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 14:44:31 -0400
IronPort-SDR: 0wwzIrJpxMNNNFW4cLUZY0HUgkcY0Qv8cqAe0NbB8iDZTJftUqbZ4l4KDzTGQ9pVlOeyY8cPHY
 dZFP37mYh45Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="253154950"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="253154950"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 11:44:27 -0700
IronPort-SDR: GFBLKvJVxYXOZ4sXiVf+of8xkR8iT1GQngpxTJJ1mKq1mdQjXAnDcBU3J+CfTwzUROstMABWAM
 CAhRPfECjhbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="371724628"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2021 11:44:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 835C411C; Mon, 15 Mar 2021 20:44:36 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Assign fwnode to parent's if no primary one provided
Date:   Mon, 15 Mar 2021 20:44:30 +0200
Message-Id: <20210315184430.17755-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case when the properties are supplied in the secondary fwnode
(for example, built-in device properties) the fwnode pointer left
unassigned. This makes unable to retrieve them.

Assign fwnode to parent's if no primary one provided.

Fixes: 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
Fixes: 2afa97e9868f ("gpiolib: Read "gpio-line-names" from a firmware node")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7ec0822c0505..569c62863748 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -571,6 +571,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *lock_key,
 			       struct lock_class_key *request_key)
 {
+	struct fwnode_handle *fwnode = gc->parent ? dev_fwnode(gc->parent) : NULL;
 	unsigned long	flags;
 	int		ret = 0;
 	unsigned	i;
@@ -594,6 +595,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	of_gpio_dev_init(gc, gdev);
 
+	/*
+	 * Assign fwnode depending on the result of the previous calls,
+	 * if none of them succeed, assign it to the parent's one.
+	 */
+	gdev->dev.fwnode = dev_fwnode(&gdev->dev) ?: fwnode;
+
 	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {
 		ret = gdev->id;
-- 
2.30.2

