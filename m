Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2DA461433
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 12:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238501AbhK2LyW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 06:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236221AbhK2LwU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 06:52:20 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BDBC08ED7C
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:56:14 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id j3so35835703wrp.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZfEoBbQk9ONECLNrOcF/c65XH6Dj3L7ZBAnd/speD8A=;
        b=X3pKhf4XzRQ2NeLjZhaNyB8xA/+CokWlcc+WMuKfV8BFqDnLqQlGPD9tJ2i2UpzWiI
         C6tPIoeDXOAzEj6E08ojGI3Oz1jUSZ94h4mnjVRG2RY4NstoG2Ky5XtG3NoiRE70X16B
         4/AYzllR2hMpBRHc+jaSM05cI51PGp0b6ovfQItozx5D628yj0JdY74hymYQVlrk4NZV
         cGYZ1x0Elepo0nZXUzv6S0Mp0nvOhp1C7r7QS/HPo9VH4xXzac6pEiayDMZkM6D0Ok+m
         ptcNOzFIIbSpZeYIYnk/RDnXRXQTUD02Z7GlDSH+YFASL7bP0aFN7Eo0SC9lE3fTY839
         iEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZfEoBbQk9ONECLNrOcF/c65XH6Dj3L7ZBAnd/speD8A=;
        b=5bhTVm7oOY44kUZNsLhCSXtKYapcP5c8I7fw351AHo5aVQdZE2QLV5OOZ0bGfoiQHN
         tzW51QdBcsnbCY8trHF7Nds/ry1/dz9xOaNlXE4myLBW1ImqEhWLoSSnme4ECUe11whC
         5rapsy1QhMUbglVbQyHrqEeyar9UtORG+ejxswia795D8jlxVTdGANeFcP5NbCIqL52X
         u4R/sncZ5mo/5AfF6UH0oaC3ZCEPfzTDjfecak6QpD/nfIimMHABtooNlmNXa9VNUXp8
         px8dF1AtmiJnKiTiQQxGm+qZGU0fady22t23uzPo2HZE4a9RVtCP2w8LWRFNt6iD022d
         Dt1A==
X-Gm-Message-State: AOAM533o5mfUvtWkFyeG0Y8Vf891/6yMdW76EOPsW4r3CkocEIU4RHm/
        t3f5Z9Yv12QYLauBCJKKnAKadA==
X-Google-Smtp-Source: ABdhPJxHm92jwXsF+QAiagLFH4/A19S6SFKU28ueXRsS9Z0Wr5docJJst8qgOK1ih6T71bj/MZrg4g==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr32167464wrm.229.1638183372723;
        Mon, 29 Nov 2021 02:56:12 -0800 (PST)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id z15sm13246285wrr.65.2021.11.29.02.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 02:56:12 -0800 (PST)
From:   Phil Elwell <phil@raspberrypi.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: gpio-ranges property is now required
Date:   Mon, 29 Nov 2021 10:55:56 +0000
Message-Id: <20211129105556.675235-3-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129105556.675235-1-phil@raspberrypi.com>
References: <20211129105556.675235-1-phil@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since [1], added in 5.7, the absence of a gpio-ranges property has
prevented GPIOs from being restored to inputs when released.
Add those properties for BCM283x and BCM2711 devices.

[1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
    pin-ranges")

Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without
                      pin-ranges")
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
---
 arch/arm/boot/dts/bcm2711.dtsi | 2 ++
 arch/arm/boot/dts/bcm283x.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 9e01dbca4a01..dff18fc9a906 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -582,6 +582,8 @@ &gpio {
 		     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 
+	gpio-ranges = <&gpio 0 0 58>;
+
 	gpclk0_gpio49: gpclk0_gpio49 {
 		pin-gpclk {
 			pins = "gpio49";
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index a3e06b680947..c113661a6668 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -126,6 +126,8 @@ gpio: gpio@7e200000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			gpio-ranges = <&gpio 0 0 54>;
+
 			/* Defines common pin muxing groups
 			 *
 			 * While each pin can have its mux selected
-- 
2.25.1

