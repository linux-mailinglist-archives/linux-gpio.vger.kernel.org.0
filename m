Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8C23A8A
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 16:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389550AbfETOl0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 10:41:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35489 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389035AbfETOlZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 10:41:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so1951420wrv.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/eIOsCuxZwktl3xw8ay3mSx96v8QQ77Uvy6NZl0E648=;
        b=0uHHRnJUYdVoRrTFCqfzIRBv9Av29o4nV8C1TIS9S2aUgCicSRTzNLNnFQnKRyYvAT
         QRSxLM2pahL9yUiWDWZD1soaAnw50vTNmx2iuYfW4OAOFqhaltwHQQwu+hmwD88/tTWm
         7ISI3n+CapSqNCCeRzTtEl7EGbIVfJDcGGvJbWqciTEUQBaw7iYPj3NEKaGILqutpwaJ
         6+oeEkQw5Tc8FBI1CwD2UGZWEOeyLWNFsPiQMFF6EWyYGnXYBCebV4hTKriArm1d6icc
         U8ZC5B9HOFWd6ryyKpSXF9qN6SjUmtErJpkzHz2A3sVH92U3w7OmJKDiCWCKCLJuTVCE
         Ikug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/eIOsCuxZwktl3xw8ay3mSx96v8QQ77Uvy6NZl0E648=;
        b=pal6NSz56Zq/umvKwxjACW8vKAdoPnYeCMWdl2xN/3hjnG2xeNx3eHEu610vDVrxIA
         KPfLF++igKocefgvRO/PQsXQSpEm2anu+Y0KInf2wmWnwcamoLThn3x7oVOPtMkZBDIe
         vNGZUM7D07HSm7RYKNxyIhsi+vs/D3cRk+gUJ9IlcTmf08KtchCoT5BeGNPKMJJ2u8Gu
         Xa/1QYSArWuu0BfMXeTHhpGiM6GZ2406oQWDEldYo2r+C5Xbb7M/tqyWSwV3Gp0Vr1PJ
         o9DsOq8NlU0icrf0RL11mkDdICSsaEnO4hemSHXGMNb/Eo436r52jazVi4L/HTdx6WMg
         Ixlg==
X-Gm-Message-State: APjAAAW75DEGunz87atSQR7tmaCTMg67Fk9oVwlD0Ls3aeE64npDyFrq
        iSag4HK/u+R39VvW5LsDnTzH/g==
X-Google-Smtp-Source: APXvYqwgtePZNKu08GKGClVL1s98oqOvHASlh3T+I+k6sUKnVg2QOZSHDtEWj4Cg2DLN7JSb8cfegQ==
X-Received: by 2002:adf:ce8e:: with SMTP id r14mr33715538wrn.289.1558363283611;
        Mon, 20 May 2019 07:41:23 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:41:22 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/5] dt-bindings: gpio: meson8-gpio: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:41:07 +0200
Message-Id: <20190520144108.3787-5-narmstrong@baylibre.com>
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
 include/dt-bindings/gpio/meson8-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson8-gpio.h b/include/dt-bindings/gpio/meson8-gpio.h
index fdaeb5cbf5e1..e1387a8520e5 100644
--- a/include/dt-bindings/gpio/meson8-gpio.h
+++ b/include/dt-bindings/gpio/meson8-gpio.h
@@ -1,14 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson8 SoCs
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
 
 #ifndef _DT_BINDINGS_MESON8_GPIO_H
-- 
2.21.0

