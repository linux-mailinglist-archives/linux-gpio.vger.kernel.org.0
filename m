Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C594939D584
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 09:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhFGHC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 03:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhFGHCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:02:55 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69094C061766
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 00:00:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id c11so20737376ljd.6
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 00:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6de/IK0aOFwVThL//8HFlMJOOeUDh6BEYbXGyUiEhY=;
        b=PZ14s73SVwxUYoanq9qxa/zRuNVV+hIgbOSQC9qd9rWZJD83UQPeyD8ApifOVwP8RK
         0plqKHzrReXV2LK6R2a2hzOzY2oHWtvcR4Fz3djE8M/4FeHrgYzJdGKJv78cUuX+DODU
         hJaA5lAjzRolIu7XRBXy3PKnl45KT9RMZPQTJthlnjoWmanA6NandyzQhmswm3xvSpk0
         6+YW5yBGoyOtS0ryNjsowfQ5BzvRlDenRICg4+ip7HN6bhZ17wlnu5mq69sM9jTbpuXx
         JQwQp+1j+C9GNFUcznOPv+yFwajl18MX1eEG93QNvInVR0HdIZxefvsQrnvJJk0a+XQI
         6GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6de/IK0aOFwVThL//8HFlMJOOeUDh6BEYbXGyUiEhY=;
        b=Cttex+1iLCL3cihHOAoggHWSG74ZMzKyEYjLKsdyizqxGi6wK1vzAGTlxA+NIDfmlj
         w8o9YAzyT3eV17s5ygrMHOnET3NX+1FbXqpivIqW7I1VOCOePz+zx9jVOpctMSsxrvx+
         EXKYs9RvtCEEOAzl2xrk7sRmvw3wlBTydLz25RFvkqCzfrDqFst8dRSfL4QxF4Flsm7S
         W1zDiS0v1RCD29ZeS7Wj+NsVN21PGg5lvyegNf+uTP031ABwef2GzgzfD4d+iJzCIgBn
         TTp0c/CVZ1BC7D4yaY7m2HpJ5dvBcd60z/dpWGVbuajnHS1/AkK7UICc07AWwMpwYWaD
         w1/Q==
X-Gm-Message-State: AOAM530KvZr88rgGKNyBuU3S0wpehGIpPnA/wMBwsa80SiQu36x2lwdA
        SG3QClXLViFf9HMFmSX9wCqAVoweO332tw==
X-Google-Smtp-Source: ABdhPJxfbL4a7gz9Gr4cWCgJ0a25bAaHrAAMcEzaMimePDilwgRsKZuCk63OweFHsUZI6rplWt4GVA==
X-Received: by 2002:a2e:5cc4:: with SMTP id q187mr13387956ljb.177.1623049252674;
        Mon, 07 Jun 2021 00:00:52 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id g22sm1382036lfh.109.2021.06.07.00.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 00:00:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Fabien Parent <fparent@baylibre.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: mtk: Fix mt8365 Kconfig dependency
Date:   Mon,  7 Jun 2021 08:58:50 +0200
Message-Id: <20210607065850.86934-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This SoC needs to select PINCTRL_MTK or we can end up in
kernel compiles that miss some symbols.

Cc: Fabien Parent <fparent@baylibre.com>
Reported-by: kernel test robot <lkp@intel.com>
Fixes: e94d8b6fb83a ("pinctrl: mediatek: add support for mt8365 SoC")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index b27c2070559a..7040a7a7bd5d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -158,6 +158,7 @@ config PINCTRL_MT8365
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK
 
 config PINCTRL_MT8516
 	bool "Mediatek MT8516 pin control"
-- 
2.31.1

