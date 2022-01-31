Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32644A481C
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 14:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378851AbiAaNbD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 08:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378804AbiAaNbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jan 2022 08:31:03 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D3DC06173D
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 05:31:02 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id j2so26577656edj.8
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 05:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wIFrVd2u/8DoSbhYwqaffO09sSr4jwUgAKN7554KadE=;
        b=6ynhEw6YEeLr7KmxPAi9zJRfPgSUmX2Ry9Q/iAH/kfwBHAedMipog/uzi2ABn+YvRt
         XTrvAuY5OxhMVbr3z3+Rm1TZ4CEELZM2JCQCsScVrI9Xe/hOkziiv5w1H7Sqfu2A1Dyq
         aB4YoWwTFzEt6knpw7wJdzMQKYkRrpFrz066wvh61dVCXBS+LKA1AMyPebE413jYG30k
         8+j0h6/OXsBUwANz8L//nbceoTt6wZlyzIcnqI0i+SmB4Yk2nVBcW9BQtH4lWDFGN9FD
         j1XgwQLKE+Tw6WgY9XC5lfgCAkDH35OQ8IEIqvPqT9M7e9UGTNK++gO8vh57CYSPgJmH
         xxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wIFrVd2u/8DoSbhYwqaffO09sSr4jwUgAKN7554KadE=;
        b=jQnZFouum6SCrNbqpP+hVZW79mMbB2chiaFtt3kdQMSLOFhfj811fufsYFQBYw5G8Z
         GrCR5cOlJoJyx166v88iGw60zYJP9Dq6KaXgoqU0orZHulHJTdC5QtWRFhK976YLAPHC
         Fs4DN1SapPG9a/LUeMBk/gMVtSW8xYcKT7UZg5DpNjfjtYrapJUg45eAFXiBwg9mX7cs
         yIBojolI/3u9saVv0Y1EiMy1t9UruSH4UJflkbFCXxzUYFHPZDeykxFOLWRhiuWB0qGR
         qM3tNRbNw0GG+gpftnWFtWpLncEACjkwf2l2L2sNO+mBHMhtEiuvfen6LadO7DZmhdvj
         BNKQ==
X-Gm-Message-State: AOAM533kNbLLtLSa4VIwz7FeZ7UG40fYKN4toevCaaGRt8uXUkBLMFdd
        cUFU7euZXSZKR2gaG6YNghj9xQ==
X-Google-Smtp-Source: ABdhPJxsX5td68vif/C48lIW4cwr721tgcqXy33D61Tc4dcg2g1jhJg/P1PnmrvOPirCCxCcvLIZQg==
X-Received: by 2002:aa7:cd57:: with SMTP id v23mr20512474edw.257.1643635861383;
        Mon, 31 Jan 2022 05:31:01 -0800 (PST)
Received: from fedora.robimarko.hr (cpezg-94-253-144-81-cbl.xnet.hr. [94.253.144.81])
        by smtp.googlemail.com with ESMTPSA id c22sm13094334eds.72.2022.01.31.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 05:31:01 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
        lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        skhan@linuxfoundation.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v10 3/6] dt-bindings: reset: Add Delta TN48M
Date:   Mon, 31 Jan 2022 14:30:46 +0100
Message-Id: <20220131133049.77780-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131133049.77780-1-robert.marko@sartura.hr>
References: <20220131133049.77780-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add header for the Delta TN48M CPLD provided
resets.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 include/dt-bindings/reset/delta,tn48m-reset.h | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/reset/delta,tn48m-reset.h

diff --git a/include/dt-bindings/reset/delta,tn48m-reset.h b/include/dt-bindings/reset/delta,tn48m-reset.h
new file mode 100644
index 000000000000..d4e9ed12de3e
--- /dev/null
+++ b/include/dt-bindings/reset/delta,tn48m-reset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Delta TN48M CPLD GPIO driver
+ *
+ * Copyright (C) 2021 Sartura Ltd.
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#ifndef _DT_BINDINGS_RESET_TN48M_H
+#define _DT_BINDINGS_RESET_TN48M_H
+
+#define CPU_88F7040_RESET	0
+#define CPU_88F6820_RESET	1
+#define MAC_98DX3265_RESET	2
+#define PHY_88E1680_RESET	3
+#define PHY_88E1512_RESET	4
+#define POE_RESET		5
+
+#endif /* _DT_BINDINGS_RESET_TN48M_H */
-- 
2.34.1

