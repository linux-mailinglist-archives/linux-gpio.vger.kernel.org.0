Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466E34773FA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 15:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237651AbhLPOKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 09:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbhLPOKU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 09:10:20 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB7DC061574;
        Thu, 16 Dec 2021 06:10:20 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u17so44471859wrt.3;
        Thu, 16 Dec 2021 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M4S3yEDl2sri3CN7K6SJ7eB9rs+UFpcF10UQdvR1F9I=;
        b=SGevDWG7/XtXGSkZundrDiuUg1dnOH+f275L0JJfM8K40sUB7KMOGVcp3GR5R4ox1X
         zgdnyNtG6HEQ3R/YbpCXu57KkP5JYgSiXAoMzchCZpKu580+0cq9Bruneo1FYqlmA1G4
         0GZ0NMZJTz0WvVxMnV1m9a6pwn0mGKfXzjdHsuvzMlJfMEctoc5YR7jV2aWA6JLiJV7L
         PV5tvYS8Iv7Ly9w2a/wM48BK4GWf3eSBjLNZds8WPMs5zADaV/Q8EY654cYtGcl27Ula
         LVMIPOdOVSiGBZT9GkZ2qEbzPc+9yS3JaAmCVFHQMVj/raKSuiNV92dk3a4PwsI49AoL
         /pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M4S3yEDl2sri3CN7K6SJ7eB9rs+UFpcF10UQdvR1F9I=;
        b=Ix0p6wQXNOMPc0STuUnFKYecIUgUBGiv6EYp3+s9OvPDWWFpNIgui1Udl+4O+fJr4N
         DUsPRPVH+aWGAZRg4sTX2K9/BnXf7qBJr9n9Zizyncx11+UTHK5d/HInI8RXECfaB3ZA
         ytTL8yEepQyYu3XCduXqgbB7bYeX+4uIuio6eiCcqUemwVv7XBoLPgB1f+G1Ihv3Ilaj
         KDCGKh4JvI/ubwwXsKOTsPonuBhGzrAw0odfcp9kSx8u2Z00Nbk6wd7P0UzAnfwr5dN1
         e0/Fm0y6YN/XQ6CwpMBlSZ1Urmh08w0Inq7fV/p4o4ktkSgYVxq0xgcaxpRPhn4nNaUS
         LXpA==
X-Gm-Message-State: AOAM530i+OK3+fkWm9NVtWIRMYZTM4szUMiTWyTFm0EuMAg8dfgjKEAE
        c51eYPJ84izZqXoIIO33ANzno+yDBR7hWA==
X-Google-Smtp-Source: ABdhPJxri4Bo0/XfGfjj6AhyXRiyxXlN0IZ6TuIoCRV0R7kC0vBimoTzRQrY42XSfyWFf9aiFyqs4g==
X-Received: by 2002:adf:b608:: with SMTP id f8mr8666933wre.628.1639663818948;
        Thu, 16 Dec 2021 06:10:18 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h5sm4778890wrz.63.2021.12.16.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 06:10:16 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpio: Add Tegra241 support
Date:   Thu, 16 Dec 2021 15:10:08 +0100
Message-Id: <20211216141009.1478562-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216141009.1478562-1-thierry.reding@gmail.com>
References: <20211216141009.1478562-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Akhil R <akhilrajeev@nvidia.com>

Add the port definitions for the main and AON GPIO controllers found on
Tegra241 (Grace).

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/gpio/tegra241-gpio.h | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra241-gpio.h

diff --git a/include/dt-bindings/gpio/tegra241-gpio.h b/include/dt-bindings/gpio/tegra241-gpio.h
new file mode 100644
index 000000000000..80cee3016be6
--- /dev/null
+++ b/include/dt-bindings/gpio/tegra241-gpio.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2021, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for the nvidia,tegra241-gpio DT binding.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA241_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA241_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA241_MAIN_GPIO_PORT_A 0
+#define TEGRA241_MAIN_GPIO_PORT_B 1
+#define TEGRA241_MAIN_GPIO_PORT_C 2
+#define TEGRA241_MAIN_GPIO_PORT_D 3
+#define TEGRA241_MAIN_GPIO_PORT_E 4
+#define TEGRA241_MAIN_GPIO_PORT_F 5
+#define TEGRA241_MAIN_GPIO_PORT_G 6
+#define TEGRA241_MAIN_GPIO_PORT_H 7
+#define TEGRA241_MAIN_GPIO_PORT_I 8
+#define TEGRA241_MAIN_GPIO_PORT_J 9
+#define TEGRA241_MAIN_GPIO_PORT_K 10
+#define TEGRA241_MAIN_GPIO_PORT_L 11
+
+#define TEGRA241_MAIN_GPIO(port, offset) \
+	((TEGRA241_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+/* GPIOs implemented by AON GPIO controller */
+#define TEGRA241_AON_GPIO_PORT_AA 0
+#define TEGRA241_AON_GPIO_PORT_BB 1
+
+#define TEGRA241_AON_GPIO(port, offset) \
+	((TEGRA241_AON_GPIO_PORT_##port * 8) + (offset))
+
+#endif
-- 
2.34.1

