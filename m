Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C328B23A93
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 16:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387775AbfETOlc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 10:41:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39997 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389174AbfETOl0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 10:41:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so14923489wre.7
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eyDz/kU6Wjim2biRU2q8CqgWCCB8KF6iAcPXPEhI4iE=;
        b=GL1kPF/zUzZXKB5Un27WiEJQ0HNwcqqnlgkMiO94zM4OnjMJI1m+TNzvxK4Yn+Gx/8
         5O8+gBuLemwUJVEipgg/GahnWgcjh0WLtWb0wr61aGUmUtQopw70+M3+d5YBam07vBvP
         ooVf8RaJCsspmSiwvNglwLoisdmIU4WgXxqjHO3jt/BzyV0M4bBrMlx7gLFStGfEPh8k
         FP6DpQyiBbQf80owDtMzoOOv0DRnv/0FMnhZUSG8Dn9+Dwucxn9Xotr9GoZ9AzOJ/Fte
         a7SJQMwvLQPrdlFVrmy02dW86PGusTvFGXn0n8frBI/zylHHeuBpPZG9eloWHuoydEm6
         8KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eyDz/kU6Wjim2biRU2q8CqgWCCB8KF6iAcPXPEhI4iE=;
        b=SOcflp3WgObkL7mG/90PeT0jTebnne63hu2jAgy+sesl2JtO0ulgeJ3w1CgSCRZrvP
         cDvW63QimNh/gridLJtWp3myy1lcsoCjJEUSet0zcWPO4Po1QqqSxeIUyKTkGNBthc4C
         Qb2Drs0piq6HKR8M+tpw/cOMnzxIWMDseetWKvWL7Jt6u2HkKp6x53UfWN8qKfSvdlLQ
         Qzx7TQbGzzYoK3e5VnIcncxD4CGIzU8X2IhmIx8ZMmnqdByJiDqu5TFz1h3dhVpBq3FN
         RMrVJpiqrnLW/bMHuyO4dv+3ody3uwpfausxvMARuFQSYDkBlH28G8o3XKZ0cGE+8d+P
         QS2w==
X-Gm-Message-State: APjAAAU7e9da12qEnISrZR4I7sDwRBCSaJWzK061U/GZXJ74JjSQ/CAo
        4qr6VRwUNSlRxcrBGLb91YLcIA==
X-Google-Smtp-Source: APXvYqwNFE1d2hRxTr4yNHyu/Qt22C88efwwzfb2tPMpnZSFiu3ODusoG5pkwtkQFTWj5bADDe/gBw==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr36194064wrn.209.1558363284655;
        Mon, 20 May 2019 07:41:24 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:41:23 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5/5] dt-bindings: gpio: meson8b-gpio: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:41:08 +0200
Message-Id: <20190520144108.3787-6-narmstrong@baylibre.com>
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
 include/dt-bindings/gpio/meson8b-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson8b-gpio.h b/include/dt-bindings/gpio/meson8b-gpio.h
index bf0d76fa0e7b..e75d09b6087b 100644
--- a/include/dt-bindings/gpio/meson8b-gpio.h
+++ b/include/dt-bindings/gpio/meson8b-gpio.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson8b SoCs
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
 
 #ifndef _DT_BINDINGS_MESON8B_GPIO_H
-- 
2.21.0

