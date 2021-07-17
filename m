Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7D33CC145
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jul 2021 06:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhGQFAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jul 2021 01:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbhGQE7z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jul 2021 00:59:55 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0763BC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:59 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 37so12098418pgq.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIrdVgz9P1mE1bbJ+kfNCJNaaulCoo7DUfLJr8XjKBo=;
        b=HO/58JAdAa1iyc4hzq0WIwFcfnVHoRaUS0npx45UKuwfov7YLlcPLPag0Xb11NS/km
         0M5/p1WMbr/uIyQtXX5ZOadMgh7jQvoXASYUuuIzzQx6K9m9YXQ24dG0abMQtvZti+Dt
         11WbQpOMhxzCjVkEpKR8wTuh6eeiGDaDeIYlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIrdVgz9P1mE1bbJ+kfNCJNaaulCoo7DUfLJr8XjKBo=;
        b=Gx5b5yP9RQlBSVWFqvVZcjdCZjyPhfBQfYRUdur6wUqB/E5Ci0SyTWT7XIsWCotyPP
         upF9sISwfqSgqztP+/OfRhFzQp+tYKpGqJ351SM94yc2Xq22EqESZjVpKHGaUJIxsyUh
         E7C9ZBQxCgSF0BR/lwMun6Wouf+hsSWKmFaXC/lP3y7iSiCtbw53qMFZo4++H4wp73s/
         z3mMDOuUC2fD+8yX9nGoSWt/MEOnVLt2rD9oedYf2GbbyDQWz78qFqWMPH5znRqbQHqK
         Uw5lkogfa1o/kNNWxZLEK/093vNZT714gTUMkxpO9hBc7s4HrH2ul6rgFgEfBrgLUPn2
         7N2g==
X-Gm-Message-State: AOAM531W9yv3B5oFP1nROjWyMsIHKGvhRqCuuM8Das0As7mJjrugdx/z
        fNLnyBqeEkorAav1nynx+k7uDw==
X-Google-Smtp-Source: ABdhPJwhoL+9Laz0mhJCLoufLpGxSrkIU6xn/FGH+LSJ2Pqm0A1vzWuWygoUi/8F02eZrG8kex0E0Q==
X-Received: by 2002:a65:6909:: with SMTP id s9mr7074493pgq.321.1626497818629;
        Fri, 16 Jul 2021 21:56:58 -0700 (PDT)
Received: from shiro.work (p866038-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.60.38])
        by smtp.googlemail.com with ESMTPSA id w2sm12522885pjf.2.2021.07.16.21.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 21:56:58 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, romain.perier@gmail.com,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 07/10] ARM: dts: mstar: unitv2: Add core regulator
Date:   Sat, 17 Jul 2021 13:56:24 +0900
Message-Id: <20210717045627.1739959-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717045627.1739959-1-daniel@0x0f.com>
References: <20210717045627.1739959-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a fixed regulator for the "core" (mainly CPU) voltage.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
index eb35ce00ae50..4a22b82afbfd 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -32,6 +32,14 @@ red {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	vcc_core: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_core";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-boot-on;
+	};
 };
 
 &pm_uart {
-- 
2.32.0

