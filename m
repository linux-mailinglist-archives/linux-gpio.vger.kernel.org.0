Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0718262D40
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbgIIKcr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgIIK1t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:27:49 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F2FC061755;
        Wed,  9 Sep 2020 03:27:49 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so1133893pjb.0;
        Wed, 09 Sep 2020 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XkUqnVE+e8JnchkHV5MBfgoc14AXpDqeCvw9QbCzaI0=;
        b=gqUFe6hlgIzHrYO5CuzhH6YbV+TdWa93fao+JMGQ41qr1aM2K4gGG+Fxz5JJRpGJ1i
         ix3cJ+sePbh0Xa4Fng6mwtZ75puwauIXWpO9wIvo0PEuwzkN7pQB5YRULdbMYz2cKfZy
         bXbf7V05GQd4BjqxRKCpxSkjZ2zRpHIjBIHgkLkQ1hLcXQ7Rlc4JdcqS5KpXHnMFzb8o
         C1E2z5NW+fFbBFzRM5KWLfMmLwsxb56nUha+fTrVeMWvQDZ8UA3dxdll+lY1tqNmvaF5
         en4PXipV/ELXHSkVo88kWNezbISSUWEXro7iS0UCSGEWahDROttcWXNz54XEPkTFr6fv
         zBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XkUqnVE+e8JnchkHV5MBfgoc14AXpDqeCvw9QbCzaI0=;
        b=f+ZL5slg+01FWYZkFdOEA1hfDJBOK16vhTOV1o7roRIQw9FutCD9C4UuWejsBn1Nrh
         G88dRE66cPAJHVnnHGqJlNOzdpIAlHZdw//pvDuWS1pNI+Yi7PTJGcy1k9nelbewYYQf
         tOvsMFqStNxyiiV3jnfR+lRAcw5OyI9zkcod5+FnPSu5HvFPl3H5hMUnyr+iKJxRIrFr
         sNUuzxOGiXhMJhfp3dPlZm3Rogp7uzZCUANGr6eWZnqqISiYhMBZuVEChHOYCo/E7/db
         6HbNfGoHqGe+IWwJft7CYFapkIRK7TKIFSGCqNjb7yTwIFFws+SdiW79ENr6TGxdLt0s
         sufg==
X-Gm-Message-State: AOAM530Nl6Yvb7I/ySgfvgDfV0KLtzp8pIqpUQGXcGiL6YAk5kMrRPjv
        Er/ToaU/oJTXa/qMmXMxdVL7kRSAJpg=
X-Google-Smtp-Source: ABdhPJz6oi9pPkVO54S7dO2TELCWMWHA8l9LN78IxR/dEGu77ZFTah0EEu42v4TFsroZ3FCAhjvFvg==
X-Received: by 2002:a17:90a:cc17:: with SMTP id b23mr270960pju.32.1599647268991;
        Wed, 09 Sep 2020 03:27:48 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:27:48 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 06/20] gpiolib: add build option for CDEV v1 ABI
Date:   Wed,  9 Sep 2020 18:26:26 +0800
Message-Id: <20200909102640.1657622-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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

