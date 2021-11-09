Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335B844ACAF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343519AbhKILfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343522AbhKILfl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:41 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552E4C0613F5
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:32:55 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id w1so75825005edd.10
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6adjk580AwBpX7D5EH7ECcA7MO/6lGH/OQuhWqLcWr0=;
        b=ePCHlZ5s9Ca1lZx+Ue/zbqUXBWWK74DCtvcQBG3qSYUhBBYhK3Qifxqxd4eL841TER
         /tfx+DEQuyTCy6l0cW09Zc9/fu5rb7Pk2Z0RJM/hxWLiSlAxnkH73IQYYzBPOhju/5SA
         tPPj8nheYVRiKlO2tS7jVeVJdkbAgAqEp5ACRdF2OQ/vXre084Lx42Fi6tvDasc6RqP0
         XcFuX0oUM5CI8FI5Hh9RLuyk2ERaDGGUJM0SFvYebuxUmXA4vHrrq92wx1ikzo4GIuMI
         ea9w3xaJPXYI4Ww+FQxdSutJ1nFHtaZ+qAZNPiVWmsM5GNscEqBuJfO+5BMUnGryXnQL
         H2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6adjk580AwBpX7D5EH7ECcA7MO/6lGH/OQuhWqLcWr0=;
        b=yjkfTdNc/KGWBiPgff5x8JAOY7ia/o0kZR96L/W938vM+eZj+Ce1QDO7FDCzueoo4p
         PYx+Xnkg51XvFWwhI7Vj+R67gQ7IFQZ2sp62fyK7JznesdnhKmq8d9CLdUvDBj/vwcFE
         LfOKBQcUkH7CJY/on1KHRRsubh2AfEaCbCuOVTmLq9tjPKk24M1LagfwgYjOzLNeQ2GU
         ebx5PItNGSWKySRDOiRz7NoHTQbjb6UaIahxBGc+Y247s2OKC0DrNReTHaHnMYmNHczg
         dELN+vM7TIEq9Far+2Liqh4mQIc3h7cN9sAka0hclFm4EZJ3reugUlj80l4CFsoUds0B
         WvwQ==
X-Gm-Message-State: AOAM531iSuOL60qmQAcZ92RCOXaosdTJo+OQflLRqwP3uogjbKlJCagB
        2vb43i1B3oAXVr3pANvRyMAwIA==
X-Google-Smtp-Source: ABdhPJz9e6kGHWVTAn0UkguaWaO5ZH2j5n/zKug8t+61+ALHwQfJ1idBgI+P0ewSbsuC1WEMc1TYkQ==
X-Received: by 2002:a17:907:7e83:: with SMTP id qb3mr8826860ejc.469.1636457573897;
        Tue, 09 Nov 2021 03:32:53 -0800 (PST)
Received: from fedora.. (cpezg-94-253-144-18-cbl.xnet.hr. [94.253.144.18])
        by smtp.googlemail.com with ESMTPSA id s4sm6771167ejn.25.2021.11.09.03.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:32:53 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc, andrew@lunn.ch
Cc:     luka.perkov@sartura.hr, bruno.banelli@sartura.hr,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 6/6] MAINTAINERS: Add Delta Networks TN48M CPLD drivers
Date:   Tue,  9 Nov 2021 12:32:39 +0100
Message-Id: <20211109113239.93493-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109113239.93493-1-robert.marko@sartura.hr>
References: <20211109113239.93493-1-robert.marko@sartura.hr>
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

