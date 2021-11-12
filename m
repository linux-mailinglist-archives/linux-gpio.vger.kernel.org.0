Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9E544E6F3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 14:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhKLNFE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 08:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbhKLNFD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 08:05:03 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1202EC061766;
        Fri, 12 Nov 2021 05:02:13 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id y196so7629731wmc.3;
        Fri, 12 Nov 2021 05:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BO69vDb+zk1DYg5rdwu2pWTGEm9MeGEK0gyy0o758TM=;
        b=jaAf75ysiPH/bLfZ5p8JYR138U3Cymiw6M79FErqgPcF0Io690dtDMSl3yO+TgrooE
         pujDVh7iX5Ppiz4gQeF+RtTcly7dhuJVm6WrM38a+3kAfecUq2X78k1/ijgshh4LG61V
         9F7G+GUs66LNaRnWEAm7x70bWwLGuvHQRJKDrRPm65QHb0EOl6MGPeJEjN3xfpQL6xU+
         vhPqPH71+QVFqTrVBTj5l4bFM+oMmZ1LRmRVju1ytn7bclCoeMZF3MwCehvyT4Y7Giqe
         GV5nftnl3Nzk22b1gqGBPZBkhvKOC//ekT5qzESi0EnptUNrLcvYSBu+n+sU/HbCBFzy
         3gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BO69vDb+zk1DYg5rdwu2pWTGEm9MeGEK0gyy0o758TM=;
        b=Rwm42TZ2tpfchqm1/1lLs/X5z8k+pYZaZmzhFVwGS9quKXQf8lWiQiuMFQ+KY/8rcn
         aQVkkgALMd/rBw1yziJvq0LNsYRADDgI58fGZamYG9PFIucL7VNtDATINI8uXVAF4HjQ
         gLaw6BEDQQ9hEPhx0w/hj4C4ELhXg2gT0cNYqiPsMBsCMgSqFZPQgiwyp+E04D4iyBl8
         o1NLgmqaF3dQ4V6F2QhvYSLg08PfSPuaCl3bNkRn7NhmkxnYhRizSWSSrn3RCaaz6od4
         V2MpTPPoo8hKfvR/NKDgeMH17zFFoJIj0bA4k0pFCNNF9nNFuN3dMBWOffQw2/npKMrE
         AQkw==
X-Gm-Message-State: AOAM531CWMHECeU0bcZzKyxUM+5CE2e0UC38TD9hK7NQJCv7DmfUlsVV
        5CB2j/FWIengAPHnWlMHFa8=
X-Google-Smtp-Source: ABdhPJyjiSZ/WUUaEqKBDCjdCDyiQzhOCC6bwVH4Y2r6ATfvppA7MxtNjOTqBbzSLKWvVg3ylCeFRg==
X-Received: by 2002:a05:600c:3584:: with SMTP id p4mr33628896wmq.109.1636722131598;
        Fri, 12 Nov 2021 05:02:11 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c79sm5617416wme.43.2021.11.12.05.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:02:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: tegra: Add main and AON GPIO controllers on Tegra234
Date:   Fri, 12 Nov 2021 14:01:51 +0100
Message-Id: <20211112130152.3682556-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130152.3682556-1-thierry.reding@gmail.com>
References: <20211112130152.3682556-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These two controllers expose general purpose I/O pins that can be used
to control or monitor a variety of signals.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 74 ++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 63274181d544..33523f7a9aaa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -25,6 +25,65 @@ misc@100000 {
 			status = "okay";
 		};
 
+		gpio: gpio@2200000 {
+			compatible = "nvidia,tegra234-gpio";
+			reg-names = "security", "gpio";
+			reg = <0x02200000 0x10000>,
+			      <0x02210000 0x10000>;
+			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
 		uarta: serial@3100000 {
 			compatible = "nvidia,tegra234-uart", "nvidia,tegra20-uart";
 			reg = <0x03100000 0x10000>;
@@ -111,6 +170,21 @@ rtc@c2a0000 {
 			status = "disabled";
 		};
 
+		gpio_aon: gpio@c2f0000 {
+			compatible = "nvidia,tegra234-gpio-aon";
+			reg-names = "security", "gpio";
+			reg = <0x0c2f0000 0x1000>,
+			      <0x0c2f1000 0x1000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
 		pmc: pmc@c360000 {
 			compatible = "nvidia,tegra234-pmc";
 			reg = <0x0c360000 0x10000>,
-- 
2.33.1

