Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4246423A94
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 16:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391835AbfETOld (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 10:41:33 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44575 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388280AbfETOlX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 10:41:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id w13so4162813wru.11
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=30PJ+hCzDjQrVZsjGcZ/FXod6I84WDUG4kPyRzhauWE=;
        b=EeFetSQar48eOERqadrJy/r1TMYWe3tvZZ9D73uAfTEe7xVlG9kEpGi8cKF+fZimcE
         vm0msi4QvsnBhRfGIWhN5NNnIwMhd93/3iJtEhj5AL3iIQrATygF4+gQuTFsMqLYlFLN
         K8lCV0yr+e+dSMqXTPM60wWxKOFL0s5xNJRlB/AXELJESu2AnSF2NWxHl/PjfcHkluhC
         BRI320Yx0G12ddsNFsbrCxYlX3WgQFy9wj/vrNsVbEp4AfInuuV5cspNpMkKwhQHM4DR
         PcO6080P3WqMfMpZxg0SuTR/h8UMnUQRpCWASqneD6F01V0xT4DLrhqhv9+ip0oEoCqT
         OwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=30PJ+hCzDjQrVZsjGcZ/FXod6I84WDUG4kPyRzhauWE=;
        b=hRzoyacNrAYCspRUsiDDRzR82zusEggp66KBqtr7uwb+9P25aKlbmDW42KIrgpoc6j
         JF3VVexNpY/YEwbQqRoPOhteoSkVn12EIkvuQne0lRwT1nZ2il9+Qlh/N2+iR2k1QPIY
         rKOVbePqWfj9axEADc7Yg36+nnE2Ii8MXlp4SfJuorVtQ2+sSpRYy9ZSdcAVjT4RP/a5
         pz4+dxWqvwk0GVqNaNwlLK5KqwlMWFlVsOn/Is05XurNjaFtKHMJiaIsOYSfGLMHdlw6
         vk63vyLupFiJcZm8h22viZ5ZuC3LKOOp/nNACRXoAzE6KjmhzY++7SmZkqr4EEWCLyJy
         SMFg==
X-Gm-Message-State: APjAAAVD26y8jce71/f+6m2222k9aEoeaZrk4pMHUr3lbxeLnSpTghIL
        QTYCzB+V0bFcQij8sXGNG40N1A==
X-Google-Smtp-Source: APXvYqwy0QdFmLf4P0q3Gllfwk9oesu78IlGZ97TtHhp2ZY2oBw/SZe5fTVEuzIPvAu1zn35uG6lRA==
X-Received: by 2002:adf:c60e:: with SMTP id n14mr14278140wrg.255.1558363281892;
        Mon, 20 May 2019 07:41:21 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:41:21 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/5] dt-bindings: gpio: meson-gxbb-gpio: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:41:05 +0200
Message-Id: <20190520144108.3787-3-narmstrong@baylibre.com>
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
 include/dt-bindings/gpio/meson-gxbb-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-gxbb-gpio.h b/include/dt-bindings/gpio/meson-gxbb-gpio.h
index 43a68a1110f0..c93274d7e108 100644
--- a/include/dt-bindings/gpio/meson-gxbb-gpio.h
+++ b/include/dt-bindings/gpio/meson-gxbb-gpio.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson GXBB SoCs
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
 
 #ifndef _DT_BINDINGS_MESON_GXBB_GPIO_H
-- 
2.21.0

