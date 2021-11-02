Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AE444342C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhKBQ7u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbhKBQ7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:59:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E199C061205
        for <linux-gpio@vger.kernel.org>; Tue,  2 Nov 2021 09:57:14 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r4so77526986edi.5
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6adjk580AwBpX7D5EH7ECcA7MO/6lGH/OQuhWqLcWr0=;
        b=K6Z/WKIntLo8Wvu+jh8QfHtlz8BLZ31gcoWCgFijcbtgYPcYb7dAyofL/41MK+4MjU
         9MnOo10fLpohPUZ6KCegL7XXRZKRlZLqX5J+tV8ZOKonZdnsWYuFL1GC8D0Ss/pB0YS5
         TGUJDX6GEvXd7eIKLzq1yary9suq+4WrsCoeRfZnyEN7OyFS93pedB865UiV4ocDnXf4
         h83NV+9+YXg5VleOOt06S/1glBKbZTQg48CpM6UvXWTq8oXh2vTAtgz2gRVRqLSmaXGe
         tRvjwOMx8olYEFpywPjJe9iX1hyP7Gcc2NKrcL+AUskYay105/OtwwpacJ5yH2JuWsHb
         aPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6adjk580AwBpX7D5EH7ECcA7MO/6lGH/OQuhWqLcWr0=;
        b=p8HhPl7k1l08T8We3ppyysuG8+KO+kRJNPxvcX+RzIufcPr77qJ97P57dyZgsqX6Lm
         OnxExAyEcSk2SZTRLOcX8186uEMOJfCKG3FsDYUox4PvifFAkLkPRZd8MZ+i+MBo375Y
         QefQcz8BAVCOLaSp22/7liIE2uMIqDE4ivAloRyBTlY5oTlYN+B3qRKxIpG4X7WUMP8H
         SyeS5DMW+0Z1zlqYPOfdg3nk4kQD70i+H/QH8o4Yi9TiqGD1eGAY2vAyGeCsgR4INO04
         Pq0oST3Oh2MD3n1zynxGDh54JifY0kum2dl1I0guO/cJrEexY26JacfMNi4JlbS+/XZB
         3vYQ==
X-Gm-Message-State: AOAM5330z+Ae0t4/LWWGApAd0yrNhFSk5TvsaekhwcpRbgtEGRAKNLRA
        038cgf6DEEZ5wlbY3tqmIXfYxA==
X-Google-Smtp-Source: ABdhPJy6cjSJNjn5rlsfGyomk3ptapZR6gmYMZ24mKVLvqJAdJ4U5YL6IdSvUqhvB/V6H/A9culDmw==
X-Received: by 2002:a17:907:6d82:: with SMTP id sb2mr28178851ejc.440.1635872232620;
        Tue, 02 Nov 2021 09:57:12 -0700 (PDT)
Received: from fedora.. (cpezg-94-253-144-183-cbl.xnet.hr. [94.253.144.183])
        by smtp.googlemail.com with ESMTPSA id i22sm10816297edu.93.2021.11.02.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:57:12 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@lunn.ch,
        andy.shevchenko@gmail.com
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 6/6] MAINTAINERS: Add Delta Networks TN48M CPLD drivers
Date:   Tue,  2 Nov 2021 17:56:57 +0100
Message-Id: <20211102165657.3428995-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102165657.3428995-1-robert.marko@sartura.hr>
References: <20211102165657.3428995-1-robert.marko@sartura.hr>
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

