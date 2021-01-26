Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FF3304324
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731036AbhAZPlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392582AbhAZPka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 10:40:30 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E25EC061D7F
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:39:50 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id a20so2201061pjs.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ry2gpr6gXFVf9iEI53wDazGx/7l4smEJsdfHqtTX24g=;
        b=fut77XsLgqRrTecfD8hYhm9vkVQR+/2SxFdqR+yrvS81FLqhWJfD8kMELzwLPpHyKX
         QRL5vKAFe7Wtgg/zyy0pj/Q0lDVKY+UlDgdVRYMGqa+CukUxn0gTsx4jzYO5Y0DLqP/9
         hK6evT3ZxexhMHnV05EYzqCeyRmKDkLUt8B0WUX/OKrOgRq1SKoDoeGhb02o9yC0rDh4
         xQh7+KnSrgVheNGhBbp+rV5pIgbOkkCs+UKaXIR6WjRoMxl8DzPr7/8NtMIFn6MSffjH
         xr0bl331JWQ00Gpn0dYjlaNLhNNQ7L4evvwkKqCITeNkWuBBnRKJzMRHeux8aRWPjrkD
         6uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ry2gpr6gXFVf9iEI53wDazGx/7l4smEJsdfHqtTX24g=;
        b=MmzJS1X61LJoBXez6ImBJhN6ijZxuq2AWfFEHA6icv5RPhAIxHwLAHwBEa5Khl1hRV
         jDumhloUweVRvEOzucUORDlzVd9sO/Z4NSm9ef/KwaEBQrfFVm//LRvBSb8jVZlnCAs8
         dBXLM5/uOcKve8i08l5j1JGDKVgoD/90RDSEnsUAyBCXheNzlkdYARxqfkR2z6OKIy3i
         ZE23Ck/5QsTPaiB75SS9Wbv83Xg70hneFsHbG0ektrI4pyyW6bB/cg/NsTW+VPpSmOsq
         TcxGYwOVyYlAu4Zp7wdBXktNKuCtoDHvy16Ey+7WpeWh6iyL8VvHoexcSNBwcjTWaIXm
         Ga7w==
X-Gm-Message-State: AOAM531NFEhhJ6lMoWT9Cl/JTQxBWRfMsn+dgl2zpQZqxFB7YYRRvdht
        qiDfSMu7R5UdPGD2WLkA9zvc
X-Google-Smtp-Source: ABdhPJyEIQlk7u5/AohAMRMIjlOMghL0I91m9bodQZa0HBw1shzSQ741fgJ6fM4ZcGleJWi+lCBn8Q==
X-Received: by 2002:a17:90a:c68d:: with SMTP id n13mr360368pjt.71.1611675589591;
        Tue, 26 Jan 2021 07:39:49 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6d84:5293:c96f:fa31:6124:85e6])
        by smtp.gmail.com with ESMTPSA id n128sm20433159pga.55.2021.01.26.07.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 07:39:48 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org
Cc:     afaerber@suse.de, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, cristian.ciocaltea@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] pinctrl: actions: Add the platform dependency to drivers
Date:   Tue, 26 Jan 2021 21:09:35 +0530
Message-Id: <20210126153935.29623-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Actions Semi pinctrl drivers are a mix of both ARM32 and ARM64
platforms. So let's add the correct platform dependency to avoid them
being selected on the other.

Also make sure they are available for build test by depending on
COMPILE_TEST.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Added depends on COMPILE_TEST

 drivers/pinctrl/actions/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/Kconfig
index a1d16e8280e5..119f0e471efd 100644
--- a/drivers/pinctrl/actions/Kconfig
+++ b/drivers/pinctrl/actions/Kconfig
@@ -12,18 +12,21 @@ config PINCTRL_OWL
 
 config PINCTRL_S500
 	bool "Actions Semi S500 pinctrl driver"
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S500 pinctrl driver
 
 config PINCTRL_S700
 	bool "Actions Semi S700 pinctrl driver"
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S700 pinctrl driver
 
 config PINCTRL_S900
 	bool "Actions Semi S900 pinctrl driver"
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S900 pinctrl driver
-- 
2.25.1

