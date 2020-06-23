Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E3720484E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732263AbgFWEDG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWEDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:05 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF033C061573;
        Mon, 22 Jun 2020 21:03:04 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e9so9248079pgo.9;
        Mon, 22 Jun 2020 21:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tbZllv0rRwEivahkEluEWQ/Pj7zSjYlN1BX1CxBYQQM=;
        b=e84N9oOBnqb+4n4u59arGHa3p5I4/5W2OsPXIT+5Jot8ldKYCJUc2hjt//QncEU8j0
         VXkbaxb7ovUDL+wKvzDgvg18ZShJjNqaW5/rs6W7pWV15WamI2WEJNYcXtlBgI1OFmeg
         BNoH/yEnuY7quRhYDbtsKlaqnt+L/zMO2+1pls1w7P4Y6fB+5YICAIQDZ1Hzj/PeZD7M
         LphCSLN4azyz7GGYHSGeSdXi9lH8jtZpQz0Ls1VbI1E7zn75RpqUrNE6wV//jI7fUTse
         cS6FZ8ELqF8y1PLEK+e6Pe0xvo/myOvZZ41yCov6+HxAndZafpiI4qZSbXJafdr5AYdJ
         4CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tbZllv0rRwEivahkEluEWQ/Pj7zSjYlN1BX1CxBYQQM=;
        b=QSCqiq6lcvyexhlM4HeuL9fF/DCKj8aMqh2B6TnUUp/4xfG0uW8/EAjwstaCwp3bkx
         m502ONz/7Dyf5DvWm5S8d1TKwrUByF7/Z/kepWTq7PiXETG9qBA0FxMDlbwDbOi1srvQ
         d3ggWnI967RW55ednqKTwcQynDH2juWiS6aDRoypiwdmrfNrQMjvlG57MM1aw51OYEE2
         reZrSSa+anfKL2dYazpTGwlgPPaIk7RiPkBz/WA2rAkqwya9EIvXKpqGiuYlwUIxExJH
         GKBbjXXZx/qnVO0ySIVzPXIAIRPUtWvPEbSz/G/i7qDy9gfesqnoVIOWA0bBRnQ0RYbw
         QBGw==
X-Gm-Message-State: AOAM531JNDRh1FKGdmMp/DZG13XYcQaYxO3A8hsFmfCAggBcPxg5y9GK
        XR4+FLf2rpoQho3ea8BQ6F7eL0RIeMM=
X-Google-Smtp-Source: ABdhPJwggx/avAGtNm8/B4ywLETEDIJs4dCQ5hU/6NyEotJx4VlaX3B03YznA2bZJi3xWc/l7M6uww==
X-Received: by 2002:aa7:8a51:: with SMTP id n17mr724558pfa.89.1592884983553;
        Mon, 22 Jun 2020 21:03:03 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 15/22] gpiolib: add build option for CDEV V1 ABI
Date:   Tue, 23 Jun 2020 12:01:00 +0800
Message-Id: <20200623040107.22270-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a build option to allow the removal of the CDEV v1 ABI.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

This patch is before the V2 implementation, and is non-functional until
that patch, as some parts of that patch would be written slightly
differently if removing V1 was not considered.
Adding this patch after that would necessitate revisiting the V2 changes,
so this ordering results in two simpler patches.

 drivers/gpio/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index affc1524bc2c..b966a7dc1c9a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -81,6 +81,18 @@ config GPIO_CDEV
 
 	  If unsure, say Y.
 
+config GPIO_CDEV_V1
+	bool "Support GPIO ABI Version 1"
+	default y
+	depends on GPIO_CDEV
+	help
+	  Say Y here to support version 1 of the GPIO CDEV ABI.
+
+	  This ABI version is deprecated and will be removed in the future.
+	  Please use the latest ABI for new developments.
+
+	  If unsure, say Y.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
-- 
2.27.0

