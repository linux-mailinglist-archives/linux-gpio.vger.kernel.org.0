Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1A223A8D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 16:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389035AbfETOl0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 10:41:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36413 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388965AbfETOlY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 10:41:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id s17so14942963wru.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1us822oM0AhXAzcfAqzMQ3a5bieM7q3ASmOGadOuJBc=;
        b=E1AMWXuy38k5enWVyxUIT/ZFjHFZOcLT7CtTfUN1RC08MO3lMPdlB9MZH6gbDpwXD5
         sIKnvw6Pt9WOWPtKKFY5ZZBINljbEiv3mIAs3Zhvs18xzREQM10TX32ptwEB12C4QqgY
         wQ4lwYft+xHb2ElPch/aLITUutJEdMrtuT37fdrqAKdcI2c5c79ymYkeg45++A6eV93b
         JHs+yVdektui4T0pIf5OS1mtK+6pKlECHlMbVhcw/HI8lRo17pkA79XTzmrAuaPNECpq
         O4TXt98WUPh9rzKjCQ5u6chtmr6HTFHcyANC1+0he2BUvbUwG18Rs6RReBGUMJ+J+z7o
         LJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1us822oM0AhXAzcfAqzMQ3a5bieM7q3ASmOGadOuJBc=;
        b=Z4Xn7dIxhopcgrPNCsCNwF3PLGeTGRtL7CZ3gnBbDgTrI95F3+SN2PYJEwuYUkcL1w
         7dkMKDGWvczV8BZNtHvRvdWc4a3mOmmvqW6lrTg61huuzk6Ka0S2gGfPVE0SHuvUM9e4
         JUTwj23l5UblOzfKUtytrQgjBR9irYedrfRSouOFcWWqgH7J+ShPwy1kayIYDPJl2D97
         Oi+I3alNFPjt4L+4UTOEC47elig88AITlTsex8/ZsJLnXLSlCsf9UM+zHMJD9rvZoNC5
         f3CTP+NoEj8YqiQJwtwPYrR+tyMKw/2HHSObH3nCXFEGwQjjnL/6bioVk42PNE16n1P8
         ecZQ==
X-Gm-Message-State: APjAAAVtXu4+hT8mXzFWLw0MJ/Kx3fRw9i8gxTgWtKxjNq5UpzKrGlFl
        RenFFuC/7e+lITk9kEiZCXFwHQ==
X-Google-Smtp-Source: APXvYqzBMSwJalhz2Y3RNdF8Ya61WL0sUiZ27ozMXzLdu3QUKt9tpH6yOyRHK1BjUf1IUkGmcdgesw==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr7135680wrv.268.1558363282687;
        Mon, 20 May 2019 07:41:22 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:41:22 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/5] dt-bindings: gpio: meson-gxl-gpio: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:41:06 +0200
Message-Id: <20190520144108.3787-4-narmstrong@baylibre.com>
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
 include/dt-bindings/gpio/meson-gxl-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-gxl-gpio.h b/include/dt-bindings/gpio/meson-gxl-gpio.h
index 01f2a2abd35e..62417358f55b 100644
--- a/include/dt-bindings/gpio/meson-gxl-gpio.h
+++ b/include/dt-bindings/gpio/meson-gxl-gpio.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson GXL SoCs
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
 
 #ifndef _DT_BINDINGS_MESON_GXL_GPIO_H
-- 
2.21.0

