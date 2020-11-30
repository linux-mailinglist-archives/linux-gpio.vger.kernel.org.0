Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844062C9179
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 23:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388287AbgK3Ws6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 17:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388262AbgK3Wsz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 17:48:55 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6FCC0613D6
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 14:48:15 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id z68so10024217pfc.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 14:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=mFKhjbWpDLNsHACLGmSHDXeR1f1UUpzNDZei7Sfx4p4=;
        b=MvulgOGVVW08Vt/wL+I1C6I9oeDyrppJFT8uqQTNSjTwSd/sD6sBnUAWZxhuLLZE3y
         S4usiy+muEMGYxatq1U9Y7mfsJAU0ROb6yBoE/ltWahRxvIYhsdTSl0iW0IgWUjwY8jJ
         FoRhoC//fH/m6MGBlPGhrgB1RYZKIY+uOtYw1tgM5UrTMLP+hFBMhGfCH15rJRifI6a8
         Q6fOxn9KP3TPygBiIyXm8u6qe+EjzsTCs2yMsw8e7/6N8plZIViv8JC95w0NgoI2XOVt
         jSDzBlWehVZ1mVm+BuLXcwzv1cw6ptJHYb+/L6NJ6eq1qrtyxaQpovPNIyH0hzOBcxya
         hB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mFKhjbWpDLNsHACLGmSHDXeR1f1UUpzNDZei7Sfx4p4=;
        b=UX7Zh6mPksN4F6RM0TDQ75wKPQvnmncTeWkZDFCZc98P4NSg91cTlm2/ybRRQKvrdv
         tEI9rvhOQwTVmy8KpuBAsn8FztkVNMDKG9GbInLzr8mJ5Qc7a7S2bOE3RPNB1yCfqSn+
         fSTI6p8m398iUbVqHDiZ7g1vxKsBNPWvAwiVZIv8GNwxeW8sW45jpMXVXQGQoMRB0See
         2Y51Qtg1zpgdJaH3oc+7TnsKPgytCdFzq+8C6JgXTPwia9klpeBVVybI94IhbaBCVpQZ
         sUHIPVe66Cxpn44Wb5og1YSkyx/SMKP93PVHuf1mGxVpsTqlkAGaM7GyAcchdiOM523W
         3rew==
X-Gm-Message-State: AOAM533MtVwMSNi4fnzKT06S+lCl0WoyFyN6FGro2Kz4n6Ms/Kg+/xMz
        m29zl4x1he+QwaOF2G6VO2WS8pMRwuhoejKzS7w=
X-Google-Smtp-Source: ABdhPJzzdnkUYT3hv3toB3W84HZCkOGX5OS+zb5UKJf6oZl0xdsy/y+HunnvnQfX6IJdR+jOsHsYOHUF+Z/dpPIAPD0=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:724c:b029:d9:e964:c4a4 with
 SMTP id c12-20020a170902724cb02900d9e964c4a4mr20861397pll.82.1606776495078;
 Mon, 30 Nov 2020 14:48:15 -0800 (PST)
Date:   Mon, 30 Nov 2020 22:47:53 +0000
In-Reply-To: <20201130224753.1569357-1-willmcvicker@google.com>
Message-Id: <20201130224753.1569357-2-willmcvicker@google.com>
Mime-Version: 1.0
References: <20201130224753.1569357-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 1/1] gpiolib: Don't free if pin ranges are not defined
From:   Will McVicker <willmcvicker@google.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     Edmond Chung <edmondchung@google.com>,
        Andrew Chant <achant@google.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Edmond Chung <edmondchung@google.com>

A similar check was added in gpiochip_generic_request, but not in free.
This has caused an imbalance count of request vs. free calls to the
pinctrl driver. This patch is targeted to fix that issue.

Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
Signed-off-by: Edmond Chung <edmondchung@google.com>
Signed-off-by: Andrew Chant <achant@google.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 089ddcaa9bc6..6e3c4d7a7d14 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1806,6 +1806,11 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
  */
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
 {
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return;
+#endif
+
 	pinctrl_gpio_free(gc->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
-- 
2.29.2.454.gaff20da3a2-goog

