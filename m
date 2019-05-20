Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8456723A9D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 16:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391419AbfETOl4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 10:41:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36976 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730904AbfETOlX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 10:41:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id e15so14926922wrs.4
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QuVh9TVsMqZSn9qS73DaH0TkGBsg1S2LZDD25U2BAlk=;
        b=WCbRRamr4ZuC30uvTI0zqjb40m9TBkUAGNetbDmjURtBHYQm7JZtDqmVMxLVisKum/
         moGYyeiHx3jCWiteFsGfm4mPMmCsxdH78GkvOfkaU5lonf//0m0Bl3uCi2q5WF6yv8ho
         Ah6+4VpJzq9M7+ls7RGtlxvPhRVjGc2QOvfTzoXReszIvluY+i4h49bcycRWP4gsZoZb
         wKHZrHV4MOUIDPsmO6HdT5tYMaWH8hXFwlpxzLYroMXXh2fREFmFkobxSB5owMkU5/x2
         E/IR4jNBR7MI4HTWFR9yUr62+KxcB/c5atuMEKHB0mDNkYsgsXY2QFe441f48s7bBOBn
         JpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QuVh9TVsMqZSn9qS73DaH0TkGBsg1S2LZDD25U2BAlk=;
        b=uFsdvesznSnogrn5UJnxu+9OhbyG06GrhDUX88IqqsBQ2iw/escPfEMGDr0xzRL/3E
         Xqle7L7fV376ZbOwP25rEJonWGalkU9QsbOuvPuPtyDU1dHPNY7n1PeGE8FCjnw69Bbk
         I0xEQ9A/NV89LK53/21tqwQ4K8VfKhGM47ManMp0JjXLQBVTpNXOJli9d0rCO/Fd6lhV
         c3ntU6dhra3hqmm5cur/DwNx1Luq3Zf4VMLSmpeJsASbrF8uZLIcYw24HtwPGRiU0Qdy
         9IGVI6O4TxGQ1MYqDOKJ1NKp9Aw9lnrVa0hDXBlUljJzQV+qWw8XSV4m+44rmTs62ymV
         cRtw==
X-Gm-Message-State: APjAAAUswgWLkvc1fuQGdByoB3kT7kGOBkO+IrjOJWcYj+wWAoHEormu
        imO/UZpCEMDGJ3j8nQtlC3Uj+w==
X-Google-Smtp-Source: APXvYqwLWGWrmt9aWGH3uyiRHLGzj2Yw71bsYLdFfvi+AaABiH/XMU4nW2WLFlYBNK/Qtb3WCPayTQ==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr29036029wrm.98.1558363281095;
        Mon, 20 May 2019 07:41:21 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:41:20 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/5] pinctrl: meson: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:41:04 +0200
Message-Id: <20190520144108.3787-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
References: <20190520144108.3787-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.c      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.h      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8.c     | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 8 +-------
 8 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 4edeb4cae72a..83c0b1753e70 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson GXBB.
  *
  * Copyright (C) 2016 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 0c0a5018102b..813f2bdd90a5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson GXL.
  *
  * Copyright (C) 2016 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson-gxl-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..54fe8f0e4e6d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 5eaab925f427..29ca94926af0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -1,14 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Pin controller and GPIO driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/gpio/driver.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
index b93b058c8a07..3810b066df16 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * First generation of pinmux driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 /* For this first generation of pinctrl driver every pinmux group can be
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.h b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
index 47293c28f913..47c0c28bb8fe 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * First generation of pinmux driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 struct meson8_pmx_data {
diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 785e29e74a56..2070e3c61a34 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson8 and Meson8m2.
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson8-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 7f76000cc12e..8d2d430ea02d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson8b.
  *
  * Copyright (C) 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson8b-gpio.h>
-- 
2.21.0

