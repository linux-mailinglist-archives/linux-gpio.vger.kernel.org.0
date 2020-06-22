Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A163203E01
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 19:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730078AbgFVRcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 13:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729992AbgFVRcU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 13:32:20 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5C4C061795
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:19 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dr13so18826270ejc.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bp2iCF0V+pxEB1qX+I4xhpc7NppyeLuUVo+dt6mFcSk=;
        b=IvuoGUIWcCIQo6CK77cG7w8/8i6yMRGu3jqAVtDneEVMOskWKPt1H5oEvI8WqMhZNy
         q3SZWQbxGmZX1YAnVnJLK3IZb+MNj06WDzV3WIOWGXbePqjg6Gr32LVdAm+ea4xL1J1R
         3uHLkLBW/4wYUdbOWNMEPxv0aCuTQsY3P2oXIKSxqAuZexLhJMJjaysulNWtJ9oTIJfK
         72vrHtPOxvoSYRgMDiorDeWTFthyA+/CQfOVWG7szw4j5gleM7rbHk0lDC2nfCgr24FK
         SVj5JBtkX2fLH2Ifz7i/LUeoqZubDhCzule77jMfzb6forrMTIIRz/JN/qtFMGyKwyrj
         QMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bp2iCF0V+pxEB1qX+I4xhpc7NppyeLuUVo+dt6mFcSk=;
        b=ncPaTojBBZHzjVXvs27aFZmkryIUV//n89NoKm/rVsIisTr1GA+2g4U2Iez5Z2iTLT
         TNxm8q/tWv8D9d9hyulSfpXT4RcOXj0tKAU5hCCHs2Cw4kn+Kt89K/NAPAYN88p0HVfH
         0XTNTKHuZXtDEazkaY4Zvc/5/q+ug6g9EEZ1NPC2+IwrwYAXgHWOW2tFijcmw4OGXcEe
         I7iV2Wxjvw/ORxOvM58lc/1DWT6D01xvULWk9lOneknbj0GM86qGtbzyYizJBtmnW1Tm
         GmTXnjVuHad5XXfIVzEmctYdnzTTJP+LqJ+kNtMfIdfZF4hZl1h5lFzKb0nJmAnwFrHB
         L3iw==
X-Gm-Message-State: AOAM5311ytUjgCOUtLpY9wU9qHA3DXcioW3z5PM/8JOPGxZD4fjSXw+u
        JEvZfYjA5ho5GIK5XNouMa2vuA==
X-Google-Smtp-Source: ABdhPJy021kLIGLXUWAQwFLlIxfxylwPiPKp9FWG0opDvmlw8+MPskGqjPkQP4pPHMC+fjUtjPUFfA==
X-Received: by 2002:a17:906:454b:: with SMTP id s11mr17460979ejq.546.1592847138559;
        Mon, 22 Jun 2020 10:32:18 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z1sm4747386ejb.41.2020.06.22.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:32:17 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3 2/3] ARM: dts: change AM33XX_PADCONF macro separate conf and mux
Date:   Mon, 22 Jun 2020 19:29:50 +0200
Message-Id: <20200622172951.524306-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200622172951.524306-1-drew@beagleboard.org>
References: <20200622172951.524306-1-drew@beagleboard.org>
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

