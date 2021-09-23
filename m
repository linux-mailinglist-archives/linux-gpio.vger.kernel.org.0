Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F85541589B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 08:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239590AbhIWG5j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 02:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239610AbhIWG5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 02:57:32 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36602C0613DE
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:56:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id w8so5385393pgf.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=isyvnOyWHI/5QEFWR32h8ywjPk7SKlWMocpKRpE+H2I=;
        b=mp9UAldhWy9Z8dDXvhARlu0yfTRe9BRTKVs5mpcE1yE4XbUNsX+5R1wMiVHeJHVDtZ
         o1Ikgo2qAzfSaIMrMjSBdIriHFgeAnRi7K0AZrK3ska6LFydNc1+obKRrYTKXMFaBlzl
         KsQbsFlkd40Wbh6Sb20tJJXv2cVx6UIY265jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=isyvnOyWHI/5QEFWR32h8ywjPk7SKlWMocpKRpE+H2I=;
        b=A7Yfo8zMDuufr/xTF56xVWN0VM6bL7wkWJsC9xBs1qolk8SNMjixd3+cC+XmB+Jk4G
         zfCrSdbcZU+OqlCyULS+tskUBpPt/Jm0iRwHnDixNcJBOxb76wAWJAhHJ3blPcNWQSW/
         DNcAkFp3ZtGfCiZCsvjZre1dWZR3Lg+GOYApDNNw96aOo9ckBKmCZs76EPrin1FScLRo
         BzeP0Jd6wcbVHflzwu83NFO8QI79XLnYCVHFUHppi6iPbbDwBjHpkpg8uf7RTN6i4Eug
         +X1YM0ookqj54rc1yW7rfrkmeFqL7Dt0ZrSt3RCpoqqwjKFlE9CQt8HQEUiLSLRQrChc
         U+6Q==
X-Gm-Message-State: AOAM532dJrSyLNyg0+GkKVdSIFGnjgtjspqKG1Y7scesdgkW4EYdDUvq
        KEKgxKcjcveVdje2hgwiNgASKavlUdbKsw==
X-Google-Smtp-Source: ABdhPJzQ49jQC2+GK3VVpNeNn/CiSeuoUext/mJFYl9r/LWWOwGq5y9VKyO0YmwdOZkAgL/lAK4v5g==
X-Received: by 2002:aa7:8426:0:b0:438:3550:f190 with SMTP id q6-20020aa78426000000b004383550f190mr2768687pfn.19.1632380160759;
        Wed, 22 Sep 2021 23:56:00 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:56:00 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 08/11] ARM: dts: mstar: unitv2: Add core regulator
Date:   Thu, 23 Sep 2021 15:54:57 +0900
Message-Id: <20210923065500.2284347-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
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
index a51490defabc..7fba3a772fb2 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -32,6 +32,14 @@ led-red {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	reg_vcc_core: regulator-vcc-core {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_core";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-boot-on;
+	};
 };
 
 &pm_uart {
-- 
2.33.0

