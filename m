Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE4339DA20
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 12:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhFGKxb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 06:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhFGKxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 06:53:30 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC29C06178B
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 03:51:39 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t3so19768640edc.7
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zY5RLk/fd5DiVsCKJBYSJiTcCIwghmyi0mxOi7Ll8fE=;
        b=lKEgVVge16JAcUzME/1+z9dZh/fLoK2/0LoM5Qvw2COMMVYN6E+3TsSXpKY0BE4JOg
         t+J3i1PVhg+5cXE8EP2uccF8zu78kR5Z0iJTXzUvc0fz8Fg9ZOm+RuV16co5czaSWudv
         YwtP15usCs7FnR0W5yjyyJ15ORKWH2tiQvesaYVVc4qU+mi4zUXPYl0+4xdfBAyYmj+d
         Hjvrh15R8nHnm0phEvH3Urv41gBtedXJ5XHh11GJJciBZxGvfMb45FtIiv5HTE05UjdG
         FaXuYk8VzSmrMma91jx1gAn9tsGGFHvvdZlOFlI8WC5SqVlj6zB7LS8YK9nB74vJFvLb
         cwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zY5RLk/fd5DiVsCKJBYSJiTcCIwghmyi0mxOi7Ll8fE=;
        b=st4n8Y/dm09/qehcPeyZpM3IQ7bFb4ED+wAoz7GHYEva2oLD4fMf36YLtdrObZyuKY
         RHd2ZpU307xtaNvqUebhwBTYmQediZCyGveacM/IYJLocfwZdtuQTIEwuk/hgyFUCT+j
         0bWoGUf6SlNFqZZmfafUFCSMcM6iEfbfi+KanUeGOhTv/0xtsLx/OIOodpVrRPHPy+WU
         9hLeEYVPmSdkkdf19mPykjWk5SMmMH/d8zor1rcWWWIOnHxDfZJBUOJ2Dtz7GFICa1qO
         jHtTIvF7Uc1RLRzY1PZLYry+CADHHesEIhwi+6fCeTiNhRXb3UYaW+TIr++RcPvKNNos
         g+YQ==
X-Gm-Message-State: AOAM5313YB6SKbeXq8tDRJi7bP2NqYzOgJzSNvCGR8OPbkeh5AfaW56R
        Ehn29Aa0aOyYB8bhgIecepXMyw==
X-Google-Smtp-Source: ABdhPJw9XIdL1bVqq3Jcj5m7KmzUJiTZnc94FSczF1v6Eu98PChOdiinE9pG25oqi/pzKwM+OF5HqQ==
X-Received: by 2002:aa7:d846:: with SMTP id f6mr19252675eds.341.1623063097976;
        Mon, 07 Jun 2021 03:51:37 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id f6sm6340003eja.108.2021.06.07.03.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:51:37 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, lee.jones@linaro.org,
        p.zabel@pengutronix.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bgolaszewski@baylibre.com
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 3/6] dt-bindings: reset: Add Delta TN48M
Date:   Mon,  7 Jun 2021 12:51:19 +0200
Message-Id: <20210607105122.2047212-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607105122.2047212-1-robert.marko@sartura.hr>
References: <20210607105122.2047212-1-robert.marko@sartura.hr>
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
index 000000000000..659a3f6c4d47
--- /dev/null
+++ b/include/dt-bindings/reset/delta,tn48m-reset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Delta TN48M CPLD GPIO driver
+ *
+ * Copyright 2021 Sartura Ltd
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
2.31.1

