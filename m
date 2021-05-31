Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA82395AEF
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 14:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhEaMxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 08:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbhEaMxf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 08:53:35 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80960C061760
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:51:55 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id u24so3840844edy.11
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zY5RLk/fd5DiVsCKJBYSJiTcCIwghmyi0mxOi7Ll8fE=;
        b=JtQ8nsOX3x/T/v8WGPvA2TvDbSPtSkug8i5PY3M+SbRqF039heGdh7jbrhVHWDIF/Z
         ggJ0F8/58x8iLwz//OsmFrN9JWW6l06SVvc+1PcRZSyzQ24gy8ZhOB9ZUutTHdNPMAJF
         3gDfyUOllnc+/Q/pQzn3DwxUnQvSqB40/Nl7ITVc3Q2HMf5OYEDAAAoQwUrd7aQ68Yl3
         A3ZK3+Vttdw6njYhuED2qbRi5skJHNSs93FFp6pOJzb9JkpS3OPkv0f47YYpa9UYEUuV
         ItvSKVZnQo+9FsB2TpajjEbuggJ5iiJ2uheyJFpytFCR8f3IwdXq/DmZALf03aFiKMJA
         kSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zY5RLk/fd5DiVsCKJBYSJiTcCIwghmyi0mxOi7Ll8fE=;
        b=PCa2mbNBDVtjWZLgKxomMmatfweSeqGOC9H0hLu6H08+/ViOlpyq/pMi39ughHpTzH
         a0rjXSga1kdYaycgY/ka0T77A0bmPkjHznxYragp3Uy4da/P0YQItYiepu/c9IQZWJ/s
         jXivzeZU/Jt+YxLrI7+Gz/PDm80iyaqQQoRRmHQqnW24T0bcytSQ3BSphGQBNFjZ0L+W
         i3xmFpQhzja7W1zaCgtIrC9+aCz8gabptNZpmShwIpASSv8f5VfBFop5Mvy4dLxkmDTN
         W+cDCrVLspP2dHoAxW4CBo2KuKRX4QsQJ+Mih6adBhsbuwtIoVDimcPm+3HSNug8F+66
         5Ouw==
X-Gm-Message-State: AOAM5302IVexiqJ9WauTMsYk1MohoqSEDAwJUYmo2eO2pKrPfPSBq/yz
        Q5HmVBKJd/3+E++os/k0KksGRA==
X-Google-Smtp-Source: ABdhPJwmhpdMNQacGQNei7IJPsMuLfoz9qE+p0b2rlxXzVVkJK1bMIX3Q/wgiAXrR5tj5vk8YgcGdA==
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr24974986edv.373.1622465514153;
        Mon, 31 May 2021 05:51:54 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.231])
        by smtp.googlemail.com with ESMTPSA id zb2sm5886898ejb.52.2021.05.31.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 05:51:53 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 3/6] dt-bindings: reset: Add Delta TN48M
Date:   Mon, 31 May 2021 14:51:40 +0200
Message-Id: <20210531125143.257622-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531125143.257622-1-robert.marko@sartura.hr>
References: <20210531125143.257622-1-robert.marko@sartura.hr>
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

