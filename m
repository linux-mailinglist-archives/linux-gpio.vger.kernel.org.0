Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7A83DE60C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 07:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhHCFNs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 01:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233718AbhHCFNm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 01:13:42 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FA7C0613D5
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 22:13:31 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u16so13751867ple.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 22:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
        b=RoS1gW+/fNn3RB/dhB7nzScfvJQQsbjLIhYDsYTl4X0jCg/h6AdY/6PJ2cal4rof+Q
         97up+1FPQ2T64Co6AQXQiG1sD2aLoBpYSklNlcXon3aybN5XRHDKLLLG/mVlgPkBLdmy
         9OU0BiUeS5WVY1Zr85FSYBPV0B/PsMOTUCUFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
        b=QZmJ48yHP/Z3xXCXvFq9GYeJYxbiRiuIoJsFLPx4btn+npzaB8icb07Tc1ku44USML
         DBmKNGt7Qddfx3T9hiHTqsF+QZrJeyZZhOxUmM8Ptc+m52h5I8pOa1vRbcioVF6s6BgK
         HzsJcpNoNSIA+addr2cZ9si4ef9cvHstuLH0w9vXkJX3LutqWmrMg2OoMBiCCKRRsFV3
         dvM8k2PsuQmSKtjikVeKTFhHNfUyGf4/lsyQs1F09DhIdAAqSf9LTaLWj6igBs/igBlE
         iXvgQaNc3Ny43aeysJhbviEphqxhqGhir8cSJLATMGLco8j9xv9OQqPPCxfXJBkFrDZb
         5g5A==
X-Gm-Message-State: AOAM531O0ptBgIcLLVciSbIKUADA6RSe/Yy7s9D6X3Fuau2hkPOJa++v
        O79rYI5L8qYHKEnTV+8QuvDKtQ==
X-Google-Smtp-Source: ABdhPJwXpzsjl4OXSLsWVSfF8lTblrp6AM92riWciamL69PeJ7AqgmVERsB7T488R7e4C4w22/Mp9A==
X-Received: by 2002:a17:90b:1d8c:: with SMTP id pf12mr2499451pjb.130.1627967610468;
        Mon, 02 Aug 2021 22:13:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:c800:1b1d:5677:31a7])
        by smtp.gmail.com with ESMTPSA id x25sm115732pfq.28.2021.08.02.22.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 22:13:30 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm: dts: mt8135: Move pinfunc to include/dt-bindings/pinctrl
Date:   Tue,  3 Aug 2021 13:13:16 +0800
Message-Id: <20210803051318.2570994-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move mt8135-pinfunc.h into include/dt-bindings/pinctrl so that we can
include it in yaml examples.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm/boot/dts/mt8135.dtsi                                   | 2 +-
 .../boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {arch/arm/boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h (100%)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 0e4e835026db0..a031b36363187 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -9,7 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/mt8135-resets.h>
-#include "mt8135-pinfunc.h"
+#include <dt-bindings/pinctrl/mt8135-pinfunc.h>
 
 / {
 	#address-cells = <2>;
diff --git a/arch/arm/boot/dts/mt8135-pinfunc.h b/include/dt-bindings/pinctrl/mt8135-pinfunc.h
similarity index 100%
rename from arch/arm/boot/dts/mt8135-pinfunc.h
rename to include/dt-bindings/pinctrl/mt8135-pinfunc.h
-- 
2.32.0.554.ge1b32706d8-goog

