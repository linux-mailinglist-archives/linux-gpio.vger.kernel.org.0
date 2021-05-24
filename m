Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A4B38E638
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 14:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhEXMHV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 08:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232793AbhEXMHT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 08:07:19 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD755C06138B
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 05:05:51 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id u133so14768785wmg.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y4mDLJI6ZBdxgxH0dBpQUIM+/toIWaURghT1ZZl8ozY=;
        b=zacssyyJnwqvvoDKaK/qA3DhnNEcedibRWR+rSep0JbnvR5N6MVCLqVte25MJXmBYv
         1TZS3tdj7L7Ok5gtxMO1i85sdiaW4SQNXjyw8AufZKXpBoAF/DSyDUw/YTyzmQE/hK/F
         RnlZsGvggqHsafYN6pvDgsVHpyPbgadLucqTPGxMVMuy3qtP9f/61uywZBShfe8mSGUM
         Jz1rHL+cwHzGernAtHRlyX3wwehFWGvHBG1EgCvaMancHaDTQfUiaOBZc1wqu+W7zQ0V
         a6u+0PNX4caMJ1y53QUirLoEbAjLKAEp8+Mjywew0cy1IDkGzpyr3ZwGTm3rWy72/sft
         p8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y4mDLJI6ZBdxgxH0dBpQUIM+/toIWaURghT1ZZl8ozY=;
        b=npqK4KJ6l7oVrA/yzN0af6jCqbgzqTKYOs2aBTSpwk5cq+fct2UPMW5Qvyb7BAyHNS
         CmAEjvf3Q9CxvGun79oe6QjJVQVdgTdmLVJmeOJ8Hp9hmLqDr9bNshACJvSeXNQyp45H
         UKb7D2U0gCf++K2wemtM9k13StFu1/oiYNsHfecFxSNQTB9FuFjZdKggegw6uUiV7fb0
         VEI6IWN5+XOTW3f/s4mdi98TLA+jTfucMfyaBJ77/gFE4tlOGvBS5/Z5Uft2XrXlK5PJ
         FCF4Ou5XFlSAcjlQCgKKagyHvLF4XD+cHbUAZl17WKH1BhcLjLHwV9dWi5SWqEl5KmTr
         eqvA==
X-Gm-Message-State: AOAM532DTXa8z+fQFDEO2LUnl/6elQ2ATXUHB4AxiIOP64Qq2IabzRPx
        yH+Midx/2nVz8rv0czbXKEuOPA==
X-Google-Smtp-Source: ABdhPJz0DoA7taigFJ1JR2F0uQQE2ldAgwNGedwjYYbAUsM7F3gwAvJCabQLNuVjwK6pcOA7l8VX+A==
X-Received: by 2002:a1c:9d02:: with SMTP id g2mr19065979wme.119.1621857950421;
        Mon, 24 May 2021 05:05:50 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.224])
        by smtp.googlemail.com with ESMTPSA id b10sm14342856wrr.27.2021.05.24.05.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 05:05:50 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 4/4] MAINTAINERS: Add Delta Networks TN48M CPLD drivers
Date:   Mon, 24 May 2021 14:05:39 +0200
Message-Id: <20210524120539.3267145-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524120539.3267145-1-robert.marko@sartura.hr>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainers entry for the Delta Networks TN48M
CPLD MFD drivers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Drop no more existing files

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81e1edeceae4..dd2bcb8c7756 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5180,6 +5180,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/platform/sti/delta
 
+DELTA NETWORKS TN48M CPLD DRIVERS
+M:	Robert Marko <robert.marko@sartura.hr>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
+F:	Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
+F:	drivers/gpio/gpio-tn48m.c
+
 DENALI NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-- 
2.31.1

