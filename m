Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609C139896C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhFBM04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbhFBM0w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 08:26:52 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE80C061760
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 05:24:56 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id e18so3564055eje.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KwzIciJcRMLFeuSk+73IfkH7cFnyIlKyHf0qK2B6F5s=;
        b=YLu782R4rDcdufVKCWyFar1u0k6ZHIS149dEuY/M5/REZQmi81VEd0HYxa83bcsHrq
         Ph/aAm5w6euQn1Gk2P/2HibUDzDJaszXa6Sh8AoWF1dxeSubYazVzxeNMy+UsHgq4lZq
         r0mWTqK5wk9E5LZkcU7TtLXMdyLzQv5fGG1I8VHGX1ePRV3zQdnpuRYnSPTcwDCHD96a
         +Srku5qHx4JSQsrRe/JyFM+JhmjOwFSc8AQ/JrkqHFgdDHBpQq412gKfzpJ1Mb33UOeG
         0t1++gb+1Q1nIvrnzdh2c0tESVfU4RuGgK7aJBu24qrb/h+/684mjxJxvDZ9xkgt3bYH
         HsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KwzIciJcRMLFeuSk+73IfkH7cFnyIlKyHf0qK2B6F5s=;
        b=D9L7VfMizqJZpMi19VUjx98BeM1zadBF0d2nOhII+IOPCr0FmMQutamKKHxOYMwsEC
         O/SZGzmSwKsb615+q/dEYAJtnF6VzFovTPFH6jS3JJLkPLL8zn5VhTwI5rQGkg3aq7Zv
         6pyOCjzwJUh3e1NKjKBqbnMvK1Thbuzt1lyFc8osPrZk5LZujN38TYE/yzM6rVzDjNu5
         OklokAlxiTvFVoCyrofg4KQBggSOFPidh2WGsTbtLbQwd745zaAx+ToX7l7G1gI7N09w
         No/SrPN3V5e1i/r0NHVYL1bsvJNekACSko8/49koGo+25hfSJnnF5RU3GtDhKrqE4FVW
         9k1g==
X-Gm-Message-State: AOAM532FJjeTGqh+0KL23Ky3TSR/y1OvVd0Iuu1izvVRGv5Gui3bxn2X
        7KG90sK/cv1RHipMzbQVFlKZsQ==
X-Google-Smtp-Source: ABdhPJyUATHNryaU2UdW7mbUDR3V6ErfrzvZ7r7XgrMT94yfOmagV2tucEdTb8VY/t4Cv9cfiRAjEg==
X-Received: by 2002:a17:906:1848:: with SMTP id w8mr631935eje.277.1622636694788;
        Wed, 02 Jun 2021 05:24:54 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-250.xnet.hr. [88.207.96.250])
        by smtp.googlemail.com with ESMTPSA id z17sm8539340ejc.69.2021.06.02.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 05:24:54 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 6/6] MAINTAINERS: Add Delta Networks TN48M CPLD drivers
Date:   Wed,  2 Jun 2021 14:24:39 +0200
Message-Id: <20210602122439.2084775-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602122439.2084775-1-robert.marko@sartura.hr>
References: <20210602122439.2084775-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainers entry for the Delta Networks TN48M
CPLD MFD drivers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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

