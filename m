Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4570C200497
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 11:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731794AbgFSJG5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 05:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731780AbgFSJGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 05:06:53 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1840EC06174E
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 02:06:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id y13so9419931eju.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5mEvzhD8ZDNfnKNW5KPSqhD16ebDefQ348OLXK7WNy4=;
        b=X1XJo4xQqza5Gpmu5TS6+sFT/+90kfsxQwDVnSGPwQaL6hbFdH21IfK5LnIvWKmlTj
         gaFsYadBj8FbAs0pNrTKRZlA2+66YP2SeubU9X26yVbBRXWPqGIEO4OICu2sRQ+9lY5e
         EmZukeqFRzEyTIrBogjX7YxfkkdIGPAdOsFtIZG/LitU3ZAAJzNsjJN0pk79wYWA/Pc1
         zGxL6jpw6nuzBg6Xo7s8ntORdfcO4qJ71Z2wnBSOYm4n3qiTtJbILegg5sR2/ArWTZpt
         bBCGfw+hcBzTiosEQbvpF8Jo//TjbtthL0cHnwhvniO8Rva4MAeOcucbi5FK/wEdjmQN
         sWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5mEvzhD8ZDNfnKNW5KPSqhD16ebDefQ348OLXK7WNy4=;
        b=DRfDaS15hq3QwUlWvzrGZgwJZghF51n8H8B4kidta7Fj1SR5PnsnVczz2XGsxizwya
         f+pjNeg2eTJhSOxbNFlwRozmYm3iTHPHuwkGSYC0+tkFGvsiU08RGDstN/1YMpw8cwQp
         59ALzqfOdibhths7GcMujHWbLy1K3+2/PVhqjWUBHure5G7+E5GhxNnvdNlngWcSqmPm
         Btv9PrdrZLF22F01sAQY9w2ccA9LlT8jUbQ+hNEhn2Wp9HafyZ3vBtbULDVhByh8+Rm8
         ljfiz4iUtNOtQgQLq6boNcN3Im7J9YZmBTz1Q4Dbh2ka7KUcg0MBYpZZqY/RFFVN56QS
         QRVA==
X-Gm-Message-State: AOAM531LWwCoiDNZ2c4nYvhDWe9zWLXWw4LmqTgRQSrgMM6UYmwYSCyr
        Dm2Kx2oqfENJEIEdDJEl0Xq9ew==
X-Google-Smtp-Source: ABdhPJzO4kbHdFvwlDaJ4wJ4m/s3iIdkdw6eY8mxMyd30QFl7MlUDUx58T6KaBdKzzwhRHx6KyznLA==
X-Received: by 2002:a17:907:35c2:: with SMTP id ap2mr2547627ejc.530.1592557609833;
        Fri, 19 Jun 2020 02:06:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c68:7901:5c06:6064:338b:4004])
        by smtp.gmail.com with ESMTPSA id dm1sm4653650ejc.99.2020.06.19.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 02:06:48 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2 1/3] ARM: dts: change AM33XX_PADCONF macro separate conf and mux
Date:   Fri, 19 Jun 2020 11:06:06 +0200
Message-Id: <20200619090608.94948-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200619090608.94948-1-drew@beagleboard.org>
References: <20200619090608.94948-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AM33XX_PADCONF macro is modified to keep pin conf and pin mux separate.

This requires #pinctrl-cells = 2 in am33xx-l4.dtsi

pinctrl-single.c but also be changed to support "pinctrl-single,pins"
with 3 arguments (offset, conf, mux)

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 change:
- remove outer parentheses from AM33XX_PADCONF macro as it causes a
  compile error in dtc.  I had added it per suggestion from checkpatch
  about having parentheses around complex values.

 include/dt-bindings/pinctrl/omap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
index 625718042413..2d2a8c737822 100644
--- a/include/dt-bindings/pinctrl/omap.h
+++ b/include/dt-bindings/pinctrl/omap.h
@@ -65,7 +65,7 @@
 #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
-#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
+#define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
 
 /*
  * Macros to allow using the offset from the padconf physical address
-- 
2.25.1

