Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0627E4EBE7
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 17:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfFUPYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 11:24:17 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37526 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfFUPYR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jun 2019 11:24:17 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so7027640wme.2;
        Fri, 21 Jun 2019 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdrvmsVqqlAxUFDLsu2PN2EQ0pp54wfLQimMiZwpnRU=;
        b=K3Xpi31soohLp3aOcQr/OpDvZ8bviOFr+dJipdoftnLxdq9nhzpCWjbHMbKXN/NpDp
         3JxyK7L1bdVHpu7GFN8x06qIcpHayzpJ7ZO0v6iOnIVvU22l2S7wzzqffa2pWck1I147
         1W+u3qzvYQig3aAgipGfVH9rgZNte6MvtNxdy4XAtCUyxcNUlxhlsahzerRtkV3W7Zw8
         mxvtRTGOEb8SrtWpOXOPgPpTYU64jhZbCVkLH/rnJ9Y+LgiXrRhMHZhdS3BYE1jFf9TK
         ipEUrvc4xkSOLKN7IoPBtYNSAz8VSbgNj97VgL4p3Z6n3veBjmka+vXZS2RYrTpCCUto
         ND6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdrvmsVqqlAxUFDLsu2PN2EQ0pp54wfLQimMiZwpnRU=;
        b=n7HTMj7MFZNwQbO+JoLtfnnB4OgvBRNXKdZSUtlyQI2X0Nl/+TdlsmvyJiP74QydoN
         feKiPSrpNkwdx1T7QgdvH5DmCdDoyvL1IH7O+wCoiIeI35d5G0H8T4QeQZNZarb6+1Sd
         47ScHq4UAUfiBwfzyZJHefBxVyItXmagGVjHQakALICNRAReX1Ud0M2+wFmd5anTK4la
         qVZqQvE4C/kvb/MvmTvEM1Ak6POVd3Rz9xQToErLB1RRNXz333Cv2RNqVVtELM2aVeJl
         PmOlYkNrlyxVWkXS+qWUyxkAPOpCaXHKqpAY99lGhaBWnR8deDijd4eCOT32ltpzfcQ3
         0i7g==
X-Gm-Message-State: APjAAAWLMH25yk5QN+00Y82f9Aa6M4wWnA28ljYc7JljGUd9JSnsTPZd
        1qlxzZFgMmwHZGqgdpKpIyI=
X-Google-Smtp-Source: APXvYqwxz3m7/gzhOBPYllPJtMxJ8LJa6pnAmTdpyrtJ0KuS/wCu3X4+NMKDGVB9qNTFjbpAI+atDw==
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr4652376wmg.48.1561130655029;
        Fri, 21 Jun 2019 08:24:15 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id j7sm4245434wru.54.2019.06.21.08.24.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:24:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: Add device link between pin controller and GPIO
Date:   Fri, 21 Jun 2019 17:24:13 +0200
Message-Id: <20190621152413.21361-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When a GPIO controller registers a pin range with a pin controller,
establish a device link between them in order to keep track of the
dependency, which will help keep the right suspend/resume ordering.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b70df27874d1..5079e8a5de61 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -404,6 +404,17 @@ void pinctrl_add_gpio_range(struct pinctrl_dev *pctldev,
 	mutex_lock(&pctldev->mutex);
 	list_add_tail(&range->node, &pctldev->gpio_ranges);
 	mutex_unlock(&pctldev->mutex);
+
+	if (range->gc) {
+		struct device_link *link;
+
+		link = device_link_add(range->gc->parent, pctldev->dev,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!link)
+			dev_err(pctldev->dev,
+				"failed to add device link to %s\n",
+				dev_name(range->gc->parent));
+	}
 }
 EXPORT_SYMBOL_GPL(pinctrl_add_gpio_range);
 
@@ -2136,8 +2147,12 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 	pinctrl_free_pindescs(pctldev, pctldev->desc->pins,
 			      pctldev->desc->npins);
 	/* remove gpio ranges map */
-	list_for_each_entry_safe(range, n, &pctldev->gpio_ranges, node)
+	list_for_each_entry_safe(range, n, &pctldev->gpio_ranges, node) {
+		if (range->gc)
+			device_link_remove(range->gc->parent, pctldev->dev);
+
 		list_del(&range->node);
+	}
 
 	mutex_unlock(&pctldev->mutex);
 	mutex_destroy(&pctldev->mutex);
-- 
2.21.0

