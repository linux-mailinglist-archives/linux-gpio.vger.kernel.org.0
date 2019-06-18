Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF314A5DD
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 17:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbfFRPvD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 11:51:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:37008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729246AbfFRPvD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Jun 2019 11:51:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8650E20673;
        Tue, 18 Jun 2019 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560873062;
        bh=amiGxlK9jktZZWhSySTfq7svLj5sClCQ7XV1YNGtBkw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z05ck0cuuyZ6PdknHth1oOp4sqlEQkrhdylgFxwM+OJ4L3ZS/qS3vZkZHHA+muLUH
         hSfT9StYXXiegD3kOVlRhNmBve2u+POgwb/wN00gChPsxNhAtU/3lvy3p+tvblkuH6
         ChpFvEZ9bTcdjXz+7I+trIK4dVwIXLkbjNqrSq7M=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     bamv2005@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] gpio: tegra:  no need to cast away return value of debugfs_create_file()
Date:   Tue, 18 Jun 2019 17:50:46 +0200
Message-Id: <20190618155047.16894-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618155047.16894-1-gregkh@linuxfoundation.org>
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is fine to ignore the return value (and encouraged), so need to cast
away the return value, you will not get a build warning at all.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpio/gpio-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 6d9b6906b9d0..a54bba1bda6c 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -550,8 +550,8 @@ DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
 
 static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 {
-	(void) debugfs_create_file("tegra_gpio", 0444,
-				   NULL, tgi, &tegra_dbg_gpio_fops);
+	debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
+			    &tegra_dbg_gpio_fops);
 }
 
 #else
-- 
2.22.0

