Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CE14158A6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 08:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239622AbhIWG54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 02:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239654AbhIWG5o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 02:57:44 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400BEC0613DF
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:56:09 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id n23so2027130pfv.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+bVI50/U/Px2zafLKGxljVTDM1XHyN1eJT93Wdky9A=;
        b=bXaP7hsMAlQQDjWuf7Lz+35buzCADQS6gm4KXJB3lS7Z0C732tfosARG3sqLV7KaA9
         Fdtg9gllDyWvAqwNtq5gOg8E4PPyJWnJKEWJGrhNJDWtV8tZ0r4r8KQpGXkN9zoG3RL6
         RHY6xQi1+tKzCWgd8EEy5+exMwsDMAf5zp5Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+bVI50/U/Px2zafLKGxljVTDM1XHyN1eJT93Wdky9A=;
        b=WWVP1eBV+LsB0w0cL1nZzghokQkkakxgJjCY76MBolxsAX2KH8q8XoZfzGm7qUCbwz
         3YG/g1wwii4hCiTg3Q97GNNp9DkcOHF+V6oNrspJ4bWcsQFGE8u0d2Qs7jnrq+Tj/KgL
         vYNeZsNzBmj6u+1nrFtWxVUXoXh1mg/XtIMum3cJ/Ec9i/N9PyvZw6Fy/3SB5eLwhQVx
         aFjNcdKrMEDW25mKTVqMDsn8C+nJmgWT8MCfH9N8lYGx/NSIx3gOGCjKJ60VhCdSvVYq
         M7WJDf+RyUFlmokAxxe8zGd5CqR+4QPXQnyIbCjSQ9qot+M98vZlxvmg568BjbM5HbEB
         njGg==
X-Gm-Message-State: AOAM531tP963MP5J9+MY8ts51waqu0311XXyRHK8uLVvueXA8QF2BoPy
        45lPXXlIdItrMy8k3P8JxmWwnw==
X-Google-Smtp-Source: ABdhPJxVSpxmZt6T0yS0J0POEvpxKeFeTedQKq5tV5O5Ar/V2msMW3vnS2WcW7sX52oHPQC1n+bDgQ==
X-Received: by 2002:a63:b505:: with SMTP id y5mr2775207pge.91.1632380168827;
        Wed, 22 Sep 2021 23:56:08 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:56:08 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 11/11] ARM: dts: mstar: unitv2: Add wifi switch
Date:   Thu, 23 Sep 2021 15:55:00 +0900
Message-Id: <20210923065500.2284347-12-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a GPIO controlled fixed regulator for the Realtek WiFi
connected via USB.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
index ec8da9cc8cb2..b3eaffa6ee06 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -56,6 +56,14 @@ reg_vcc_dram: regulator-vcc-dram {
 		regulator-max-microvolt = <1500000>;
 		regulator-boot-on;
 	};
+
+	reg_vcc_wifi: regulator-vcc-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio SSD20XD_GPIO_GPIO14 0>;
+	};
 };
 
 &pm_uart {
-- 
2.33.0

