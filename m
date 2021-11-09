Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C2444ACA8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343509AbhKILfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343510AbhKILfg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:36 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F678C061766
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:32:50 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id f8so75503273edy.4
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ck6CnoOUEpGTUA7mAEjajeF6BgfIwURf2ogwlOV0P5c=;
        b=FeXLH1pPPI0+MypZV7+bL3BfS0wxqYMXB4avJXACzAMfoacmwFOflQGxEV0+fq9JiJ
         npmpznbhCTz3yiXPZ9Qnlx462rIWvMnULYoDANnxUuZ2IA/SbQ1Ljqj83YCxfW6Mddsc
         DduIV7tnATrUwdgj3qz56tD4ENHTvMHdJeaN/GPq+ArMWZwBl4jhqsytkEPtMCthvp0W
         xkcouQkW+JKhrN8zpVRfU+wX86ge2O1+fsjf/P/zNW4lBFRbYCzxTGMRxcVaio+RKuwy
         jAAxoWLtNcrWo5t2Jl4b/u5PNrpNFu7lQ81ASc8QCVd1baxEnIVO4Hl8tGvn5MctOCsU
         CFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ck6CnoOUEpGTUA7mAEjajeF6BgfIwURf2ogwlOV0P5c=;
        b=KuAtAuL9uqGBkuHDQxd5W8MIgCrTi1Fu7Ro9Nz9p14x4rwbrRqQgcn0Q+wa8kPv6tH
         HDeeGPsRrADO6xbMgTxQZ6wIYQl+D63p5Ep1cPfNxUhqD6h29eHeaSylK5NAMuFkd7Yy
         QEekLzHEfudexF2paOPfbs4JuIzhQOjpUeqUZc+vA/qGao7jTONbrd+3vOmJk5214YKu
         YzorgzCdetb+Y82kgfNoW0JntZfYmBRAq+OaRpAU04af+YT5YWWdNfdpjkUc2FJz5IEl
         90bI/mbYBKYjrc2MfB1BpCby7yHV7krUyhLmeoq7L6ksdq9rxB54Z0BSw6BIfHdxSoNq
         s/ng==
X-Gm-Message-State: AOAM532YW9NDnX8R2Cn3zznDMHb3nKtfbJv4FIxzwRFQPezvxLovOxx3
        Aq9i0NMjWfgOPBYU2uW+lPNQtg==
X-Google-Smtp-Source: ABdhPJzXVuJcNh8rEvDEevrI72uQf4B4ngUk1j2LeISLKIgqbjLsc4mF9QDs0Jb1vCXWI4hKPCrckg==
X-Received: by 2002:a05:6402:40c6:: with SMTP id z6mr9097720edb.304.1636457568686;
        Tue, 09 Nov 2021 03:32:48 -0800 (PST)
Received: from fedora.. (cpezg-94-253-144-18-cbl.xnet.hr. [94.253.144.18])
        by smtp.googlemail.com with ESMTPSA id s4sm6771167ejn.25.2021.11.09.03.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:32:48 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc, andrew@lunn.ch
Cc:     luka.perkov@sartura.hr, bruno.banelli@sartura.hr,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 3/6] dt-bindings: reset: Add Delta TN48M
Date:   Tue,  9 Nov 2021 12:32:36 +0100
Message-Id: <20211109113239.93493-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109113239.93493-1-robert.marko@sartura.hr>
References: <20211109113239.93493-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add header for the Delta TN48M CPLD provided
resets.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
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
2.33.1

