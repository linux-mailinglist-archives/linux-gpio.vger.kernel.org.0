Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677D625E7F4
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgIENjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728618AbgIENh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:37:27 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5377FC061258;
        Sat,  5 Sep 2020 06:37:26 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b16so4486512pjp.0;
        Sat, 05 Sep 2020 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XkUqnVE+e8JnchkHV5MBfgoc14AXpDqeCvw9QbCzaI0=;
        b=u/0klVtOJyDkSQBav7MR5yDAg8TIxVVSgEG9HiIKunpkrGIEJ7q4jyoHU+Cxm4JTj9
         4GYh6b+8ToFfQgtojtVVGquPNRg40H+Ht+twi4rN29BUDw90JUb9D+pYIX4hhDo1hIw1
         /NCvA3QiDZzDfb0DDHv4O522pSGeZX/xu6ybWVG3eJPfjnfVY9f6IkqrOt8i8KVazQBE
         tMfvfmhqkO17GDFfK8ipNtW/J+mriSOclu/TICBIAb2TcRPxIV0yZZr4yQMQIIpohHLx
         JPBybQ5nnHkGsDB/oTt7XOqe5Fyq8j5T2L6AvLXLFgrXyOif1pm7/16bzLpb8cVHN8h0
         j+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XkUqnVE+e8JnchkHV5MBfgoc14AXpDqeCvw9QbCzaI0=;
        b=T5HbJD/nAXeSRueAmVyJdq6s4Jl1UmFO9ZgyuzEoJmRVMQYLXMMs15riAj/eFXtcHp
         a/z1h/mdjjT1SDcsqOzB+tPu7nx4PQOFbs3WV2twhYrI6hTcw7yXG7RoifVL6hFxpFJ6
         ZDKjtKMC8Q+2NhnKB7hHfeF8v/8EA7jPWvTge0YX4D75n0BQv+6EM2TDChFTT3qY+mg/
         7KeTEe3bqNbryp74u4weaVID04G8Xc+l5ixQyrXW+8ZR3rzZziHvgl/+sTWhnBvufHWW
         7n4B4g4bZy3SaRAjx/YDqB9q/gqmccBMsIq9AsYRNhMbXKw9Uzy8zQL3brQoGaFcpvXa
         U6Bw==
X-Gm-Message-State: AOAM532b8ri1ElPJKGRLg9/fkq6z6WFDviy6vi1VTkVAawFqJ42vdTNo
        NYv80FLzZgyKEphmebzgVv1JnSJz0eM=
X-Google-Smtp-Source: ABdhPJym1NtJbGnYQK8Xe3Gky1iQh5Iw0HCK8/ovLPMvDjzzQBRAdAbjc3Ws1YuI1CZ6TnYjLMiYwA==
X-Received: by 2002:a17:90a:f298:: with SMTP id fs24mr12975003pjb.4.1599313044742;
        Sat, 05 Sep 2020 06:37:24 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:37:24 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 06/20] gpiolib: add build option for CDEV v1 ABI
Date:   Sat,  5 Sep 2020 21:35:35 +0800
Message-Id: <20200905133549.24606-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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

This patch is before the v2 implementation, and is non-functional until
that patch, as some parts of that patch would be written slightly
differently if removing v1 was not considered.
Adding this patch after that would necessitate revisiting the v2 changes,
so this ordering results in two simpler patches.

 drivers/gpio/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e4debd66d71f..ff9ca836026b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -82,6 +82,18 @@ config GPIO_CDEV
 
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
2.28.0

