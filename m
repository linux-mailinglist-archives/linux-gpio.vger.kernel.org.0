Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F0925721F
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgHaDWX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgHaDWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:22:19 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99D1C061573;
        Sun, 30 Aug 2020 20:22:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so2402361pjb.1;
        Sun, 30 Aug 2020 20:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XkUqnVE+e8JnchkHV5MBfgoc14AXpDqeCvw9QbCzaI0=;
        b=W913JJ4qq+CnOcpTfmM8zRq8sEvuI59CRr6UQ6kmOaHbbJ3LcPvD2sdepDu2NtceEg
         PKJi3Tzy0YZKMyun2DJJrk4BKAlpiXbqs/4Cwd7YAOduE5staL3oDQj0drZzZ8dINt30
         Mn4riTalMG9sLN5xgKeXy9gf5ZmvMbzUf2KsZAeSVOb++E/xOeki868ZHvNU9+Qu9LDO
         54/1b0lNhtirRArEgyClJ6n8qmz2mopf1TxF28Dg5cUHnbVgbmchVABazFaUdRe5CN6/
         tUBB+pW+kkwtgk3vmBh+squKhBXdYQBkD7QawEmXyl/gN0Xwkto0hIVLYirKd/bZd7JN
         RMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XkUqnVE+e8JnchkHV5MBfgoc14AXpDqeCvw9QbCzaI0=;
        b=mLygJkahjrjnJYtToX8R4Xpflul8x8ko0OI7WX0iXcfSf3l34THcrNz0z/+k8p8819
         VJ6UHy4uVY6MnrvnB+5MxhrtRVNri7rbsc34CRZtCyeETHxqi8ZpK+c6JIqTBWuXfkF0
         L9L+nefVUBbbCuSHULkITsW4oc/YP1c6u9zRKasK896G+a0i5kDAYK3QfHceJIUhxoxG
         KPhAH3DFOxOkD88Ezzwgh2BUBL6aal74ZE5lg6fqgQ6qMezItvAO3TcypuT0JTVImgFq
         U5wnLUIDmDN71ciMb8tcoKBh+UTngTXzYtTFK1wXrlZmaJXrnDtXWK2z5bh3ketYtiOQ
         t1mg==
X-Gm-Message-State: AOAM533bzkoKkR2RudvBVFHwDHQ6F58UX3o5Cbm2V8KusBPFdlPvf+Gd
        GF6efYE5IaGVuFYAM/bTclynD0GSNDQ=
X-Google-Smtp-Source: ABdhPJySx0U4YtEpEcumymEJaaq6ANuNM05TT6PCh0y5I43m9NnpzxhmyqDAe4nO9BH78/UHTw+WDw==
X-Received: by 2002:a17:90a:2e0f:: with SMTP id q15mr8997397pjd.49.1598844137917;
        Sun, 30 Aug 2020 20:22:17 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:22:17 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 06/20] gpiolib: add build option for CDEV v1 ABI
Date:   Mon, 31 Aug 2020 11:19:52 +0800
Message-Id: <20200831032006.1019978-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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
index e4debd66d71f..ff9ca836026b 100644
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

