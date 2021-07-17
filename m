Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440463CC134
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jul 2021 06:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhGQFAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jul 2021 01:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhGQE7n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jul 2021 00:59:43 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCE4C061760
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:47 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id n11so6330155plc.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OApFkRKr43qnYe9uO+CssQNA+TR3XmmYu2y9NZ/H4so=;
        b=QG0tqodzp8dbcGKEw10rITkUq62sflIR9EF3RbHX6Xp/IDJ7zz2qyGjezpSwQQfoSQ
         q+YhvCktINiuKjxZBmR/cMqwyF1LAQMgMRuduA85VlTURRBBNAc0/kwg3wsbAJHQGJEY
         c8/LXLloX2EJL0i/jOPcVkdeu6ROidpk1FDMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OApFkRKr43qnYe9uO+CssQNA+TR3XmmYu2y9NZ/H4so=;
        b=c1KRyAMry4U/JYq8Y2ut+aZkFJQxpC05M4dH3XnOBzYjDphadeLCs0y/QeS/T7XfoB
         Pn7uonvUKMmYRU+1NEQIgcwyUmKJBpl7BCHiYRtZ7kBHIGJOCwCaF1SblISalDRff6vM
         Yy5HDvRF4Qhc+Sl739q+tBV8JfAd0N4zenHzE4O/m/i0DOsZfQC592KVPy5g0wcUVFuU
         KhPq7PICiQkA10TwMs2kF0f1hKjCVWGthpOd7B2wOAXL6eRbVy/W7Tv12gjSuNA7XnNJ
         iO0PwubaI3JiUcvR1i14qTFFmPbD7tl71h5CKedhvHs7K2SmyR6UpOvFKUE+LtKPmMyD
         hXwA==
X-Gm-Message-State: AOAM533s/TJh9E3u5mX8Osp2vwIuBMnzLGNMOu151zZZVlq+3HZKdNEX
        f4zkSNFv7Z6s+pdbECAabRx1xQ==
X-Google-Smtp-Source: ABdhPJzQAzLfuyfsmZ3KDCRGKs7De0i2DcinBAkt3kvcyzOFYJZYEaq1l0ayojY5pUgTUuxWG5o1+g==
X-Received: by 2002:a17:90b:d82:: with SMTP id bg2mr13097210pjb.28.1626497806633;
        Fri, 16 Jul 2021 21:56:46 -0700 (PDT)
Received: from shiro.work (p866038-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.60.38])
        by smtp.googlemail.com with ESMTPSA id w2sm12522885pjf.2.2021.07.16.21.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 21:56:46 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, romain.perier@gmail.com,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 02/10] dt-bindings: gpio: msc313: Add offsets for ssd20xd
Date:   Sat, 17 Jul 2021 13:56:19 +0900
Message-Id: <20210717045627.1739959-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717045627.1739959-1-daniel@0x0f.com>
References: <20210717045627.1739959-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the gpio offsets for the SSD201 and SSD202D chips.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 include/dt-bindings/gpio/msc313-gpio.h | 71 ++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/include/dt-bindings/gpio/msc313-gpio.h b/include/dt-bindings/gpio/msc313-gpio.h
index 2dd56683d3c1..5458c6580a02 100644
--- a/include/dt-bindings/gpio/msc313-gpio.h
+++ b/include/dt-bindings/gpio/msc313-gpio.h
@@ -50,4 +50,75 @@
 #define MSC313_GPIO_SPI0_DI	(MSC313_GPIO_SPI0 + 2)
 #define MSC313_GPIO_SPI0_DO	(MSC313_GPIO_SPI0 + 3)
 
+/* SSD20x */
+#define SSD20XD_GPIO_FUART	0
+#define SSD20XD_GPIO_FUART_RX	(SSD20XD_GPIO_FUART + 0)
+#define SSD20XD_GPIO_FUART_TX	(SSD20XD_GPIO_FUART + 1)
+#define SSD20XD_GPIO_FUART_CTS	(SSD20XD_GPIO_FUART + 2)
+#define SSD20XD_GPIO_FUART_RTS	(SSD20XD_GPIO_FUART + 3)
+
+#define SSD20XD_GPIO_SD		(SSD20XD_GPIO_FUART_RTS + 1)
+#define SSD20XD_GPIO_SD_CLK	(SSD20XD_GPIO_SD + 0)
+#define SSD20XD_GPIO_SD_CMD	(SSD20XD_GPIO_SD + 1)
+#define SSD20XD_GPIO_SD_D0	(SSD20XD_GPIO_SD + 2)
+#define SSD20XD_GPIO_SD_D1	(SSD20XD_GPIO_SD + 3)
+#define SSD20XD_GPIO_SD_D2	(SSD20XD_GPIO_SD + 4)
+#define SSD20XD_GPIO_SD_D3	(SSD20XD_GPIO_SD + 5)
+
+#define SSD20XD_GPIO_UART0	(SSD20XD_GPIO_SD_D3 + 1)
+#define SSD20XD_GPIO_UART0_RX	(SSD20XD_GPIO_UART0 + 0)
+#define SSD20XD_GPIO_UART0_TX	(SSD20XD_GPIO_UART0 + 1)
+
+#define SSD20XD_GPIO_UART1	(SSD20XD_GPIO_UART0_TX + 1)
+#define SSD20XD_GPIO_UART1_RX	(SSD20XD_GPIO_UART1 + 0)
+#define SSD20XD_GPIO_UART1_TX	(SSD20XD_GPIO_UART1 + 1)
+
+#define SSD20XD_GPIO_TTL	(SSD20XD_GPIO_UART1_TX + 1)
+#define SSD20XD_GPIO_TTL0	(SSD20XD_GPIO_TTL + 0)
+#define SSD20XD_GPIO_TTL1	(SSD20XD_GPIO_TTL + 1)
+#define SSD20XD_GPIO_TTL2	(SSD20XD_GPIO_TTL + 2)
+#define SSD20XD_GPIO_TTL3	(SSD20XD_GPIO_TTL + 3)
+#define SSD20XD_GPIO_TTL4	(SSD20XD_GPIO_TTL + 4)
+#define SSD20XD_GPIO_TTL5	(SSD20XD_GPIO_TTL + 5)
+#define SSD20XD_GPIO_TTL6	(SSD20XD_GPIO_TTL + 6)
+#define SSD20XD_GPIO_TTL7	(SSD20XD_GPIO_TTL + 7)
+#define SSD20XD_GPIO_TTL8	(SSD20XD_GPIO_TTL + 8)
+#define SSD20XD_GPIO_TTL9	(SSD20XD_GPIO_TTL + 9)
+#define SSD20XD_GPIO_TTL10	(SSD20XD_GPIO_TTL + 10)
+#define SSD20XD_GPIO_TTL11	(SSD20XD_GPIO_TTL + 11)
+#define SSD20XD_GPIO_TTL12	(SSD20XD_GPIO_TTL + 12)
+#define SSD20XD_GPIO_TTL13	(SSD20XD_GPIO_TTL + 13)
+#define SSD20XD_GPIO_TTL14	(SSD20XD_GPIO_TTL + 14)
+#define SSD20XD_GPIO_TTL15	(SSD20XD_GPIO_TTL + 15)
+#define SSD20XD_GPIO_TTL16	(SSD20XD_GPIO_TTL + 16)
+#define SSD20XD_GPIO_TTL17	(SSD20XD_GPIO_TTL + 17)
+#define SSD20XD_GPIO_TTL18	(SSD20XD_GPIO_TTL + 18)
+#define SSD20XD_GPIO_TTL19	(SSD20XD_GPIO_TTL + 19)
+#define SSD20XD_GPIO_TTL20	(SSD20XD_GPIO_TTL + 20)
+#define SSD20XD_GPIO_TTL21	(SSD20XD_GPIO_TTL + 21)
+#define SSD20XD_GPIO_TTL22	(SSD20XD_GPIO_TTL + 22)
+#define SSD20XD_GPIO_TTL23	(SSD20XD_GPIO_TTL + 23)
+#define SSD20XD_GPIO_TTL24	(SSD20XD_GPIO_TTL + 24)
+#define SSD20XD_GPIO_TTL25	(SSD20XD_GPIO_TTL + 25)
+#define SSD20XD_GPIO_TTL26	(SSD20XD_GPIO_TTL + 26)
+#define SSD20XD_GPIO_TTL27	(SSD20XD_GPIO_TTL + 27)
+
+#define SSD20XD_GPIO_GPIO	(SSD20XD_GPIO_TTL27 + 1)
+#define SSD20XD_GPIO_GPIO0	(SSD20XD_GPIO_GPIO + 0)
+#define SSD20XD_GPIO_GPIO1	(SSD20XD_GPIO_GPIO + 1)
+#define SSD20XD_GPIO_GPIO2	(SSD20XD_GPIO_GPIO + 2)
+#define SSD20XD_GPIO_GPIO3	(SSD20XD_GPIO_GPIO + 3)
+#define SSD20XD_GPIO_GPIO4	(SSD20XD_GPIO_GPIO + 4)
+#define SSD20XD_GPIO_GPIO5	(SSD20XD_GPIO_GPIO + 5)
+#define SSD20XD_GPIO_GPIO6	(SSD20XD_GPIO_GPIO + 6)
+#define SSD20XD_GPIO_GPIO7	(SSD20XD_GPIO_GPIO + 7)
+#define SSD20XD_GPIO_GPIO10	(SSD20XD_GPIO_GPIO + 8)
+#define SSD20XD_GPIO_GPIO11	(SSD20XD_GPIO_GPIO + 9)
+#define SSD20XD_GPIO_GPIO12	(SSD20XD_GPIO_GPIO + 10)
+#define SSD20XD_GPIO_GPIO13	(SSD20XD_GPIO_GPIO + 11)
+#define SSD20XD_GPIO_GPIO14	(SSD20XD_GPIO_GPIO + 12)
+#define SSD20XD_GPIO_GPIO85	(SSD20XD_GPIO_GPIO + 13)
+#define SSD20XD_GPIO_GPIO86	(SSD20XD_GPIO_GPIO + 14)
+#define SSD20XD_GPIO_GPIO90	(SSD20XD_GPIO_GPIO + 15)
+
 #endif /* _DT_BINDINGS_MSC313_GPIO_H */
-- 
2.32.0

