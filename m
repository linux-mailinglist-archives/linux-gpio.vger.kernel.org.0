Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E749469245
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 10:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240576AbhLFJ0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 04:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240549AbhLFJ0Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 04:26:24 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBED7C061354
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 01:22:55 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d9so21013658wrw.4
        for <linux-gpio@vger.kernel.org>; Mon, 06 Dec 2021 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZHunadnw/3GpbVgjO5A4T67/ob/hV/yjNLsQHf4UAwU=;
        b=cGj8/bQL76uljMZmFmnk+Wi9cJhauTv9+CfAuurs+4uKg7Rwdy8akLF+P5V3MqjeV9
         iDqiVBqQBrdzyWrI3SiSJAYgtXO4se0uyQXMT2RNm1rKAb8isBjf9QuNe3w1qXihgPyW
         XPUz098zyRvCFf2dVO4JoA6bkW6diEZUNZ3j83ooPZhcbt4GWB3wj9C8LoBGPaW8sFYA
         /VwvIJAE3cSVnfDF8PpVAJkHXVQDW7/+HN5//iT//n7590mniNt08OPup/Ug/4cx04ng
         2EdRL+TdcEdHMfWcJzQaNC252lQ1Rd+Q7I3Q6zUx/tS27PNuW6QTSl2d7ciH77lh5EAk
         uEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHunadnw/3GpbVgjO5A4T67/ob/hV/yjNLsQHf4UAwU=;
        b=HQMRuPtodQEvN1BONMpeO80p72H9cuFOjI6iu8/M9bw+JGHTCVigiVYzT9rsFEBKbe
         omI/mkO3J912TPnve4Yfx1NY+F75ZnFgB2f14pL5VG+YVYLwftA26+ZTc4OCEiAg4iL5
         hAGyZhX4Vgnu98LY7PAqUMqc0vhhq89VW+FSF6rkesd6NUWU6+OAvtKaGeye+/7+1Gcd
         Acay0R7F9DASTkKni4pldOS00KQXTgDWgCRNowiWxoK9a+g+TJXojySh0BfhVP/c7ZjU
         Y+/J5b5F10iYDwheHMdIs096b4C+zAo+NbKLOld90mcAFcBbgkzgrANHijeoqWlFTpH2
         caKg==
X-Gm-Message-State: AOAM532JgB2lP4McVi2F4WQ4C1XeLin4e52XxHqfluGVcUzPOkosl3dG
        xUfLG9/nHfYGtDeFBCwbNqqcjg==
X-Google-Smtp-Source: ABdhPJycWcoVf3TQ/hHLw1/bp1d905C1aCcJAe21V3hdkg/l9WCRKMjjDzo+hkWVda4hjp7knIcXAA==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr41584796wrs.270.1638782574542;
        Mon, 06 Dec 2021 01:22:54 -0800 (PST)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id b10sm10746365wrt.36.2021.12.06.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 01:22:54 -0800 (PST)
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
Subject: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
Date:   Mon,  6 Dec 2021 09:22:37 +0000
Message-Id: <20211206092237.4105895-3-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206092237.4105895-1-phil@raspberrypi.com>
References: <20211206092237.4105895-1-phil@raspberrypi.com>
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

Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
---
 arch/arm/boot/dts/bcm2711.dtsi | 2 ++
 arch/arm/boot/dts/bcm283x.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 9e01dbca4a011..dff18fc9a9065 100644
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
index a3e06b6809476..c113661a6668f 100644
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

