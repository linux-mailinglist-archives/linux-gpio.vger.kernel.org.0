Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05BEE324E2
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2019 23:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfFBVJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 17:09:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38884 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfFBVJY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jun 2019 17:09:24 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so9980270wrs.5
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jun 2019 14:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QUg6dYpNKQ/6d3jCHNUNNf9+Kx10LA8eI8XEkBYbHS8=;
        b=uktlQcov68kmi0VMkcSQPL+nKmo/6wT3c3b2zt2EMz1+V9p4+l9TQc5PqDo9b6pJr9
         aqYySlmpuwGIbWj2nZylrF+i7jsEJjefYuMXoxJKQXDkh5dnvpYlLHaGZbMKOEu6rmFG
         Gxq4X4+J1/p/jrU3FlrbKeknDgU/3NSykYGzksM48oVRqVlCRAMedrMbzMv4yELkVIrS
         nzExQvxzaOia5HSfT5AysUvRgecih6Q+0YiepPnrXV6PomI74KWzrgrA5o//DDTTy4G0
         xU2k2KHEreKs7Wx653FYHanSS3wt30eChaCc0pmSKT2uAg/wpW5XIlYyxmxi6zwJ9Ez0
         FQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QUg6dYpNKQ/6d3jCHNUNNf9+Kx10LA8eI8XEkBYbHS8=;
        b=dHTvgGEBiixaKL2u97AQrn7QLj+tAxgqB9VwgobRcZm2tLlknNPDPUhnN/JrgDFmWt
         B9ZwxRFZQ49MsGNYDZCnnu1EiACt7+F4ffjX3dPLoqlfIi42wgVPqpke+E6E1LHQX3AT
         yzp5nqqFAfFDEA2Cpi9XsOT/vOcAiSsoKeQ9n+tiFCwhcMZ36Fyc6g3HKAjLuCM43WN+
         Vut0nYyqPjqE+E04Z7kLMFYhK5CIvQn2/Qqz7SgDEKbctkYL1qeDgbMaLVtztsOKOg0B
         huNGpiKAjqJHaOxf270FY13Gp+2/v/tN012u5xlUbKkrAveIIQuE34N2yxeJuLEpydPZ
         qokQ==
X-Gm-Message-State: APjAAAXcFpf8u6JEIt9Sz5s9c2axzeQiA5RztwaH1g8ek7K8aTSkc37a
        1zQOdNoVcp3eKYLtziIA7Oxi7MRTI3U=
X-Google-Smtp-Source: APXvYqx+DbUuRBpaZUqN4wUKyEoFUhWDSg7fmB3FCs9G3dyHIHHJNOwEI6LTs5V9ELkWyi9Py+1d4A==
X-Received: by 2002:adf:afd5:: with SMTP id y21mr13612268wrd.12.1559509761602;
        Sun, 02 Jun 2019 14:09:21 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id w23sm10751838wmc.38.2019.06.02.14.09.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 02 Jun 2019 14:09:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: Fix SPDX tags
Date:   Sun,  2 Jun 2019 23:09:18 +0200
Message-Id: <20190602210918.32741-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some files were missing the appropriate SPDX tags so
fixed it up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/Kconfig           | 2 ++
 drivers/pinctrl/nomadik/pinctrl-ab8500.c  | 5 +----
 drivers/pinctrl/nomadik/pinctrl-ab8505.c  | 5 +----
 drivers/pinctrl/nomadik/pinctrl-abx500.c  | 6 +-----
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 +----
 5 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index c3efe7d7e91f..749466fa8f97 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 if ARCH_U8500
 
 config PINCTRL_ABX500
diff --git a/drivers/pinctrl/nomadik/pinctrl-ab8500.c b/drivers/pinctrl/nomadik/pinctrl-ab8500.c
index 0723627c7bc2..84ffbeea196c 100644
--- a/drivers/pinctrl/nomadik/pinctrl-ab8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-ab8500.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) ST-Ericsson SA 2012
  *
  * Author: Patrice Chotard <patrice.chotard@stericsson.com> for ST-Ericsson.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/pinctrl/nomadik/pinctrl-ab8505.c b/drivers/pinctrl/nomadik/pinctrl-ab8505.c
index 2683509c1410..ce973bbbf68e 100644
--- a/drivers/pinctrl/nomadik/pinctrl-ab8505.c
+++ b/drivers/pinctrl/nomadik/pinctrl-ab8505.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) ST-Ericsson SA 2012
  *
  * Author: Patrice Chotard <patrice.chotard@stericsson.com> for ST-Ericsson.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 3d630a0544e1..048fb5507490 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -1,14 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) ST-Ericsson SA 2013
  *
  * Author: Patrice Chotard <patrice.chotard@st.com>
- * License terms: GNU General Public License (GPL) version 2
  *
  * Driver allows to use AxB5xx unused pins to be used as GPIO
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 #include <linux/kernel.h>
 #include <linux/types.h>
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index ec02739bd21b..4ff7503867e6 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Generic GPIO driver for logic cells found in the Nomadik SoC
  *
@@ -5,10 +6,6 @@
  * Copyright (C) 2009 Alessandro Rubini <rubini@unipv.it>
  *   Rewritten based on work by Prafulla WADASKAR <prafulla.wadaskar@st.com>
  * Copyright (C) 2011-2013 Linus Walleij <linus.walleij@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 #include <linux/kernel.h>
 #include <linux/init.h>
-- 
2.20.1

