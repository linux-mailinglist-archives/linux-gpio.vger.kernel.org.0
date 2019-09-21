Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E54BEB9D55
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 12:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407505AbfIUKMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Sep 2019 06:12:24 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52008 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407498AbfIUKMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Sep 2019 06:12:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id 7so4938641wme.1;
        Sat, 21 Sep 2019 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRl8yaM1fyM1OCMxH91zR3gb7yp4+jxBMN8fXKObKac=;
        b=lZ9bRUAQXrwcLPZYLSNoDgC5gQGj2BekwFAs7HmjSQ70xEKKfyYOiMc3Ichlr0W3ZZ
         XQt45+U0JqnnuO4yT7sC3cVyXtw4US/jQ4Ilopg/cQYyYgGltogOslnZHqhCHosPLtKi
         Y0zVV/o0Y5xnTDjl0jvc8YB+RV3VVsUIv6ewfm1sotDPWaGrnD5p9PtX/Uc+fDYDdhLL
         0ymkHyJYhYQuH4mLTJlb9vPqEYXudCSu31MAM6oFQLG56i2oOdGWIo65G6TA6i9gVF06
         QreITHR5Rf10dkBbhY8YJM9O2jM161DqiUejFUfxjVojSkfv1emWuWA/0z31gCCxviWK
         yRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRl8yaM1fyM1OCMxH91zR3gb7yp4+jxBMN8fXKObKac=;
        b=tEVFvfOANmn31uBEW7It9q0yYt55OOaNZOETcZGPJjA0sWmPOpsJD4w9VdNQntVh4L
         w8FRrs4gFCTWK/JtJmVhHEAna1Gt0IkdpuIad8Q+83XKk+tdzUY88qrjbKNHl1weTRSZ
         8oCPcuL8GE4QX/BFu9tgBt1hCX8W/Qy2nigfPvc/Y7zG7eeOt/GB0dJPtIVeJ5miuIa1
         x17J1BWXvu4A0kgo4DRBvzzk/MY/+qNMjwThx+wkmo82Q0LGyHavoodboKsP2VOVYYmB
         ndo1yRSca8By3XNQRNM03D7ZJPBeXHyh53P8MQ/hsFByOrlxUOLGMqicy8DQK6f4Xa+0
         kXpA==
X-Gm-Message-State: APjAAAUIddoIUNlA/jSS62sVjNdwbGPo3uKbfr/YEJxGtmuEMmSihUll
        3aBvNe715uhrI6s2RMeVYBKy3W/adpQ=
X-Google-Smtp-Source: APXvYqxlzvmvzVS2jQKs1yCY7rYAzFpgK14YA83MM41aSi9yCvAyQumOYSwAx+QqeqVbp0BSOA66+Q==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr6720324wmb.73.1569060741551;
        Sat, 21 Sep 2019 03:12:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id l1sm6129262wrb.1.2019.09.21.03.12.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:12:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: power: Add missing rpmpd smd performance level
Date:   Sat, 21 Sep 2019 12:12:06 +0200
Message-Id: <20190921101207.65042-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921101207.65042-1-kholk11@gmail.com>
References: <20190921101207.65042-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

The RPM_SMD_LEVEL_TURBO_HIGH is used by MSM8956/8976 and APQ variants:
add the definition.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 93e36d011527..30a0aee0df57 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -68,6 +68,7 @@
 #define RPM_SMD_LEVEL_NOM_PLUS        320
 #define RPM_SMD_LEVEL_TURBO           384
 #define RPM_SMD_LEVEL_TURBO_NO_CPR    416
+#define RPM_SMD_LEVEL_TURBO_HIGH      448
 #define RPM_SMD_LEVEL_BINNING         512
 
 #endif
-- 
2.21.0

