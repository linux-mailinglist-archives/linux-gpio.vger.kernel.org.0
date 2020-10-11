Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4415728A517
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 04:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730670AbgJKCtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Oct 2020 22:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730606AbgJKCs4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Oct 2020 22:48:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B6DC0613D5
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id i2so10731265pgh.7
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vLeDJv2LEyp4hsuL8OTNT30POuyz8ArX635EhrQnzs=;
        b=STe/LTO3sE8ArlpYVttyq+bUWHmBARlhnCTyVrUnDlLywj1MCzq2QZCx2CQTd1HyWu
         yOhqpV7p2qJ7KW4Tz9XluTEuJCxyEaUBocIABJn1ZRNi7id5+dXPD4AJczMQddWA6bOl
         wnNLoZ2n3UKfLG7UFGKJc+V/Fkb7Q0W8TcYQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vLeDJv2LEyp4hsuL8OTNT30POuyz8ArX635EhrQnzs=;
        b=b38kuZgqDgQS2ysNV3v2YS8OGvdCGiQmaP2JyRWk9/bputDp94r7bxqqV2Ht2UsuzJ
         sOA9jqRpgIifUjm5krNyrW3BUWm064KnsaE/vYxoJjZE+KAKYY1y+mzCSEOq1NI8PBW8
         UdPNXns9qzwBHjMiX3Bo4UiUKbWD9BvIUdPxRVmKgyqnwTgz46p0odrLiWMc/EoPLC5s
         tdpaUI23DcrrJveb2L/odwmCALo8PBGNu5gtSdQCkX68GtRBg+F+9cMbHH8XZEC7ilUc
         vIV5GzZ7dkcAGMlWVO3FUMSnUGXXdociWxFdiq5adbHbcRAbUGOpG7jTkF/zl5kRn/8U
         23PA==
X-Gm-Message-State: AOAM530WMp+c/bcq4nqQ9WaXWfHwVfGwNNqKW/itjVBnGHTSjAuC8BAh
        IM5kW89d/k5cyjfLf1BNPL81kHJ/h338Fw==
X-Google-Smtp-Source: ABdhPJw+6VG/mZn4JUuPfcL37j7Uvj10eLj33h9cOzWzBPDPPog5+dIvYSA5FPlHjFpHHGAenvKfeQ==
X-Received: by 2002:a17:90b:4b90:: with SMTP id lr16mr13260150pjb.0.1602384535082;
        Sat, 10 Oct 2020 19:48:55 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id z25sm14832836pgl.6.2020.10.10.19.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 19:48:54 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 5/5] ARM: mstar: Fill in GPIO controller properties for infinity
Date:   Sun, 11 Oct 2020 11:48:31 +0900
Message-Id: <20201011024831.3868571-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201011024831.3868571-1-daniel@0x0f.com>
References: <20201011024831.3868571-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fill in the properties needed to use the GPIO controller
in the infinity and infinity3 chips.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity.dtsi b/arch/arm/boot/dts/mstar-infinity.dtsi
index cd911adef014..6432b2976c2c 100644
--- a/arch/arm/boot/dts/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity.dtsi
@@ -6,6 +6,22 @@
 
 #include "mstar-v7.dtsi"
 
+#include <dt-bindings/gpio/msc313-gpio.h>
+
 &imi {
 	reg = <0xa0000000 0x16000>;
 };
+
+&gpio {
+	compatible = "mstar,msc313-gpio";
+	interrupt-parent = <&intc_fiq>;
+	interrupt-names = MSC313_PINNAME_SPI0_CZ,
+			  MSC313_PINNAME_SPI0_CK,
+			  MSC313_PINNAME_SPI0_DI,
+			  MSC313_PINNAME_SPI0_DO;
+	interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+	status = "okay";
+};
-- 
2.27.0

