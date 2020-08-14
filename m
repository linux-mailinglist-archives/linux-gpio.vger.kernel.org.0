Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE992443B9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHNDEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNDEH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:04:07 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038ABC061757;
        Thu, 13 Aug 2020 20:04:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g7so2410402plq.1;
        Thu, 13 Aug 2020 20:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mL4xScgLpm6GZnT5ws/9FIwwZ74rEqIv1N27JN7upQo=;
        b=pe1CcitEeOWOhGNcoplHa3LSDUbCGNHTQ8PCZmSoQHagv247AvvUyhYa9EuoERZzIa
         7XbeJjZE8a/K1vyWyJLweEWa7m1T6kjzV9LFtWji9afePiO9bppOuTtK+tM13G0/Cf3C
         QXn/wCaJPaNkkLRvn5wNkXpZgcfxmV9KfSDAtDyu91bJapjjG6hmP585GorLJwadXaIO
         4DP2jGTCMfYUogQIXyEqZjgDfSKiIqIsGcK8XgGBvtISO+ZEb2IZEyIr06jrSMQvQvw+
         5ri09b4u6dMAEJj2a5576UoC9C9c/AihlwxaEHAEdIAfCVdQkiIZ2tH4GgP63Ct2Odbg
         0BZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mL4xScgLpm6GZnT5ws/9FIwwZ74rEqIv1N27JN7upQo=;
        b=sjN8aciltI+/JeoYRE6KjIC0XAUz2AsKSldbEdZgH6dkjf5sOq3Ox/YQxABYwuV138
         jtdb6HgAbL9reyiNLiAJsNfyrHvwYje6+0V2580VOkmIKQDpCNg6OrLpkNfBSpiAxyy3
         5liZx/K3KQKMykeQ5ogIfi5uQi4kg3TKWNjo+88kgic5bGbzss17gGAzi2/C13X3+MaC
         Xb0xy3Ok+kbuuQUGJIZIYLZzjN2deIo2LCI/kY91mXsGh/vMG82eBRYYlY0cCoHSHDeY
         syfEcQtANSpFNKico1pXiw788I54SNFEQv68H8oAWOpyyW9NnJbPh0Jd4LrVZaAq0qiZ
         2xBA==
X-Gm-Message-State: AOAM530nJUiNiwGs53l3+zenWP8c6McnXdvyVmu4r8FoEuJp9A/xpU9V
        OedYJ+Wlm6qG7BgGXnXh03mb6QKr
X-Google-Smtp-Source: ABdhPJxqjCNISAGNnFZsHqG7/0hfokJF28tTjo7LKsYnEJ2DWuKGyDgoYJLNq34UF/MWTH4YhROe8g==
X-Received: by 2002:a17:90a:740e:: with SMTP id a14mr549437pjg.165.1597374246161;
        Thu, 13 Aug 2020 20:04:06 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:04:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 06/20] gpiolib: add build option for CDEV v1 ABI
Date:   Fri, 14 Aug 2020 11:02:43 +0800
Message-Id: <20200814030257.135463-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a build option to allow the removal of the CDEV v1 ABI.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

This patch is before the v2 implementation, and is non-functional until
that patch, as some parts of that patch would be written slightly
differently if removing v1 was not considered.
Adding this patch after that would necessitate revisiting the v2 changes,
so this ordering results in two simpler patches.

 drivers/gpio/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8e409b9c33dc..0c62e35cf3a6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -82,6 +82,18 @@ config GPIO_CDEV
 
 	  If unsure, say Y.
 
+config GPIO_CDEV_V1
+	bool "Support GPIO ABI Version 1"
+	default y
+	depends on GPIO_CDEV
+	help
+	  Say Y here to support version 1 of the GPIO CDEV ABI.
+
+	  This ABI version is deprecated and will be removed in the future.
+	  Please use the latest ABI for new developments.
+
+	  If unsure, say Y.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
-- 
2.28.0

