Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40BD3CC138
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jul 2021 06:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbhGQFAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jul 2021 01:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhGQE7u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jul 2021 00:59:50 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FE7C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:54 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u3so6317814plf.5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+99X6tDDuJ/XktfbyFhmKZGyLFxw8e69PtMLfb60Jwk=;
        b=nx0dOqNc1L+tIbRTHbQkMSV2014cdIVo8H/lvQberVUn4cI+XevZ9dCVXN5aOLOiHX
         4YaNWo+HBXs89M5jks4zav8jJB2syiB66tMR6UcJcaaMO55B0fPpohWRTkAHN0Fgohzn
         /KLQTp0ZrJMlToyvUoUuScaiYEE/96V5wKrwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+99X6tDDuJ/XktfbyFhmKZGyLFxw8e69PtMLfb60Jwk=;
        b=bUNYHGbCBqZ7asKg5SI5bkvUCJuojXxlJRO2twNhF9JYgz8edPNhVHUV0bpn5lY9CP
         SIJ592j5D6kmBAUTN6KdSjo+po5tnsib6BZk1TGXsZ2n/sQ2PFarOZDFPDGqRMWRtqcF
         GflIqzlUyC2CoIrkWl19ZGoklMi7aSgOHd0d6l6V1pslXHhkOk/ptQG0f9Mzovh8A00j
         R15T4hVKXjAykl3Q81RRhsmO0ePddnQWPsRkjUzBtID9D98fuEb1pqejpMnU4SChRLYD
         qlq+bT78rFO6CaTOsy8gB6ZrB7g5OiGKFEU8VLfMv6z5foPSQWq2qu2ODcK3uhqbOeFt
         0Mgw==
X-Gm-Message-State: AOAM531Q/oaGaHDm1JXFFo41WXxBJykX7S31tnduMs00TRbQ2EuQTvke
        8q8ZsnN+BksZ9u7da4loiz8+eA==
X-Google-Smtp-Source: ABdhPJyQzZHeaw/dbUZRfEWWOtOv3kUyMj1TQQA3beExPEf0SUosVfBZyHlIhMXCZ4guT4+66ErGZw==
X-Received: by 2002:a17:902:e2d3:b029:129:70aa:990 with SMTP id l19-20020a170902e2d3b029012970aa0990mr10524774plc.34.1626497813793;
        Fri, 16 Jul 2021 21:56:53 -0700 (PDT)
Received: from shiro.work (p866038-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.60.38])
        by smtp.googlemail.com with ESMTPSA id w2sm12522885pjf.2.2021.07.16.21.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 21:56:53 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, romain.perier@gmail.com,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 05/10] ARM: dts: mstar: Set gpio compatible for ssd20xd
Date:   Sat, 17 Jul 2021 13:56:22 +0900
Message-Id: <20210717045627.1739959-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717045627.1739959-1-daniel@0x0f.com>
References: <20210717045627.1739959-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now there is gpio support for ssd20xd set the right compatible in the gpio node.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
index 7a5e28b33f96..6f067da61ba3 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
@@ -6,6 +6,11 @@
 
 #include "mstar-infinity2m.dtsi"
 
+&gpio {
+	compatible = "sstar,ssd20xd-gpio";
+	status = "okay";
+};
+
 &smpctrl {
 	compatible = "sstar,ssd201-smpctrl", "mstar,smpctrl";
 	status = "okay";
-- 
2.32.0

