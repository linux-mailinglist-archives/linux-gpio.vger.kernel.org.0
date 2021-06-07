Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E494939DC93
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 14:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFGMgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 08:36:47 -0400
Received: from mail-ej1-f52.google.com ([209.85.218.52]:36694 "EHLO
        mail-ej1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbhFGMgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:36:45 -0400
Received: by mail-ej1-f52.google.com with SMTP id a11so25665393ejf.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2o3lod6/tQHJli1HMNUrlxY009C4XIUm342TOsfm420=;
        b=LRXwdOLxb4x7g7xhsp9PBEKGxP4DmnE5Qj0csPwhaXSmxv4oBBVzcPcnS8wT3iGaEO
         reBH6BO45k7qMLKWgzs/pLiCcDgdH2W2LZB0IG+ELCry1k0wy+vAjTn8fTg4uCP+mNy3
         ywSRgxhypVz0oPAgeX26xLw2pV88b4AvuDhFGeR1t/BVnKoXOuis8k6jB15BVpkNuTss
         KXZrhePsdfvI3i8eVbW08KumrrUiWHePNNTk2ct3uulB1QRtee8ttvNjE+DLYVUWEsS9
         Kku6lMCSXSTlt+L142TDnSU7uNkgPKvZmB3gbD+DzyW4Ovt7F+Q46jSIcDzIZV78rycn
         JSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2o3lod6/tQHJli1HMNUrlxY009C4XIUm342TOsfm420=;
        b=fTIhGJHHDJTCaX6P9tPsTNFYCTvGtiFRBP5ccAotG0rnKH+P6rH7VZS+W1i/C1XNeo
         CpBZM1ge/6kc4fLvrakFjESACU+PQXoWfAkOGqLMJVJ9vK03/C2VJGi4Fw6gQnM29QWt
         rofq+/W763kIdkOY/WXoPhdnrcOEFL1HviUb/IMm7ihn3NSOe2FbgLHDXeQQLDGLQcDf
         Z5vifdr/q45ZH+j+IQ3xOAPOPsVjlwprIT7WPzAMEkBXXTNWbmiVuMrbov0x9unPu/zO
         6gYKyyeosoCI+YXau7PXJQ/AYVaJion/qCvzMwz/senULoN9b8oWJBje+WYa+FPkMOar
         xjbQ==
X-Gm-Message-State: AOAM532lvbUPOdfadL2fNMZR+l7CsRXPWTvVTfMihg+SDV+QGLgA/kHD
        UdYxZFv8EDzetxkGcnQe6lK0Zw==
X-Google-Smtp-Source: ABdhPJz/Hr+gO9MAPM9PRNPEay7RzqTJpJntQ+xo57MOxVAOjknOseGXUJ6OHBDpV3H6B+Sllz8ylg==
X-Received: by 2002:a17:907:770a:: with SMTP id kw10mr17723655ejc.213.1623069217160;
        Mon, 07 Jun 2021 05:33:37 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id f18sm6471000ejz.119.2021.06.07.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 05:33:36 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v6 6/6] MAINTAINERS: Add Delta Networks TN48M CPLD drivers
Date:   Mon,  7 Jun 2021 14:33:17 +0200
Message-Id: <20210607123317.3242031-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607123317.3242031-1-robert.marko@sartura.hr>
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
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

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9450e052f1b1..82d9c2943c34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5096,6 +5096,15 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/platform/sti/delta
 
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
2.31.1

