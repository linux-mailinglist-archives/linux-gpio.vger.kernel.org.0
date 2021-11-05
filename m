Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DC04462EA
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 12:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbhKELl5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 07:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbhKELly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 07:41:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A072C061205
        for <linux-gpio@vger.kernel.org>; Fri,  5 Nov 2021 04:39:15 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id c8so15294805ede.13
        for <linux-gpio@vger.kernel.org>; Fri, 05 Nov 2021 04:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6adjk580AwBpX7D5EH7ECcA7MO/6lGH/OQuhWqLcWr0=;
        b=PTQpkE73T8VhxCQRE4WhJJhCyojtElJ0yQxQdOzz5Kl+xX4aemHEcBHvP6EZJxRBuU
         9vpKIEUzjbSmIKckHblGxPQqM9gtg4xaftYzThbZNdc3qfm8fdEdxSd9Z+A0LkkwxDpH
         eqVivy7eeSQj5jY3hYsVhIy6f8kpeuo9YkC64fT1DhLh2daYpAGMXnXK9JrYxGe7uUw9
         XBshf2mbqTRFHg5C3IujZ9aexhgtHB0pyAoUIPBbkm1+sEWudTVk1zBhQvBaoi+VPHLK
         J3mHxYakJ5WcIxNmwG0swQ96Cr2e8coDykUXYth71g/rSvhNF76+2xo+0SmQe39GS1Aq
         6ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6adjk580AwBpX7D5EH7ECcA7MO/6lGH/OQuhWqLcWr0=;
        b=bck3QKPhE7oNN5kKm/Hav2Qj5J66ABcc68bIrKtEL8Ah2dhmOss3zDwkUwaGyz4Cb8
         mjaImZ08ZtBXbTHYx0NokV//V2m9ARVNt1RU9XAPQhjo4v/vT9QGQcXAHn/4aZOyKmJ6
         lOkjMVgxUlWxji1mO/snBNrZTp4RjvzcBW8iRKHqEH7aLPuxKRgtLL2RA4BsGieYGXuU
         LDCqGkzjQDANZxNUDBn+FoYvPyng9nKpg0MH7ggiwCNVplBmHVycYTUW2QQu4lg+Y1PQ
         VZmxE5D8Fl0kaDVcHa/UA71TVuU28eo6pPvJIFOom9VNtgD54aoNswOVCPbvagaE/zD+
         2oXA==
X-Gm-Message-State: AOAM5304qTqmLIquzHkwZxTz85daTAdxdGp1IEPax8c2mkvOjtyjXUfC
        /MCLd3coBXeA/BRvbEM4KkDSL7OMqartrA==
X-Google-Smtp-Source: ABdhPJx46W7TaP6K14Q54kzOmy38rYsDTGuuLKLlGkvE7kcQnhyX5+lM6JcOLz6QRswp8wsbzNEwnQ==
X-Received: by 2002:a05:6402:1d4a:: with SMTP id dz10mr5712600edb.172.1636112353778;
        Fri, 05 Nov 2021 04:39:13 -0700 (PDT)
Received: from fedora.. (dh207-99-83.xnet.hr. [88.207.99.83])
        by smtp.googlemail.com with ESMTPSA id bn20sm4011325ejb.5.2021.11.05.04.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 04:39:13 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        michael@walle.cc
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 6/6] MAINTAINERS: Add Delta Networks TN48M CPLD drivers
Date:   Fri,  5 Nov 2021 12:38:59 +0100
Message-Id: <20211105113859.101868-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105113859.101868-1-robert.marko@sartura.hr>
References: <20211105113859.101868-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainers entry for the Delta Networks TN48M
CPLD MFD drivers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Add reset driver documentation

Changes in v2:
* Drop no more existing files
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7b4f32875a9..92747bfc01db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5289,6 +5289,15 @@ S:	Maintained
 F:	Documentation/hwmon/dps920ab.rst
 F:	drivers/hwmon/pmbus/dps920ab.c
 
+DELTA NETWORKS TN48M CPLD DRIVERS
+M:	Robert Marko <robert.marko@sartura.hr>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
+F:	Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
+F:	Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
+F:	drivers/gpio/gpio-tn48m.c
+F:	include/dt-bindings/reset/delta,tn48m-reset.h
+
 DENALI NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-- 
2.33.1

