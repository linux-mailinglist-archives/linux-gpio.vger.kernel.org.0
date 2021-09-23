Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB8C415892
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 08:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239555AbhIWG5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 02:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239559AbhIWG5X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 02:57:23 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BA8C061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:55:52 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id k24so5363445pgh.8
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wgc1S3GJ9AZxXRLjhNAdbTdGdQMnJejkg3NgP7CUzBI=;
        b=CkxeNMKCtraWlXYsL0l1+dR5R8WbufA4pXm4UgABxnXmywYDWbIxCa3OoHPhlzMSA6
         vGBj+SaJZOtKtt2s+P+OKr6eK6o8TNVj1zKpwd2z83bAWQs4o/z0PY7xN92z/vZwDrVA
         kt8fYkythppTFvBpk62P8pxxTS/Jepfw23cYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wgc1S3GJ9AZxXRLjhNAdbTdGdQMnJejkg3NgP7CUzBI=;
        b=gH/yfmk+vHDSPh+3UoLMAWJxaMD/NZ9tyz9VsAn6Yog7dxOxcKmNrJO37MQ44z6ARg
         CYeV2F+IhGh9YaJGHdJ2TpFb5NF1AACOxqqreU7zjESI91SGgJogNa1y6rU8DYPh/u4P
         5Sjc5JE3jV/XJKKsUw3czN3QviF3m4MK6HcKlbl5hklcwi5ZSS0AGc/Jmm/k/MQldLmn
         D29/OEc4tjZbjdOS49FszFQ2qlFoopxLiVVQenMurEagticL2ITZUtiCryp3MoQ5dDtO
         3bxKHMAoD6KyFpjKPKwK1vs4Ln0Yeq3FuRn8z/s7Syo8PVD1x2yAKQfql2UMvnuTpvsr
         D2Vg==
X-Gm-Message-State: AOAM532/iEiSwHa1Y+t58Luctm6HxpfMuusuJ/DBXleOhcYbChltixhy
        t6A3SiIPEREDLJCXeydKdqBZng==
X-Google-Smtp-Source: ABdhPJy7UMgVcQMFc+I5Esy1sAYq0zmLnPO4F4E/4jWRlKPNdO33u0n10RSou3+xtjz3N7p/eMF4mw==
X-Received: by 2002:a62:924c:0:b0:447:aae0:b6d6 with SMTP id o73-20020a62924c000000b00447aae0b6d6mr2771885pfd.52.1632380152146;
        Wed, 22 Sep 2021 23:55:52 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:55:51 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 05/11] gpio: msc313: Add support for SSD201 and SSD202D
Date:   Thu, 23 Sep 2021 15:54:54 +0900
Message-Id: <20210923065500.2284347-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds GPIO support for the SSD201 and SSD202D chips.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-msc313.c | 261 +++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index a894bafbd4c3..b2c90bdd39d0 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -221,6 +221,263 @@ static const unsigned int msc313_offsets[] = {
 };
 
 MSC313_GPIO_CHIPDATA(msc313);
+
+/*
+ * Unlike the msc313(e) the ssd20xd have a bunch of pins
+ * that are actually called gpio probably because they
+ * have no dedicated function.
+ */
+#define SSD20XD_PINNAME_GPIO0		"gpio0"
+#define SSD20XD_PINNAME_GPIO1		"gpio1"
+#define SSD20XD_PINNAME_GPIO2		"gpio2"
+#define SSD20XD_PINNAME_GPIO3		"gpio3"
+#define SSD20XD_PINNAME_GPIO4		"gpio4"
+#define SSD20XD_PINNAME_GPIO5		"gpio5"
+#define SSD20XD_PINNAME_GPIO6		"gpio6"
+#define SSD20XD_PINNAME_GPIO7		"gpio7"
+#define SSD20XD_PINNAME_GPIO10		"gpio10"
+#define SSD20XD_PINNAME_GPIO11		"gpio11"
+#define SSD20XD_PINNAME_GPIO12		"gpio12"
+#define SSD20XD_PINNAME_GPIO13		"gpio13"
+#define SSD20XD_PINNAME_GPIO14		"gpio14"
+#define SSD20XD_PINNAME_GPIO85		"gpio85"
+#define SSD20XD_PINNAME_GPIO86		"gpio86"
+#define SSD20XD_PINNAME_GPIO90		"gpio90"
+
+#define SSD20XD_GPIO_NAMES SSD20XD_PINNAME_GPIO0,  \
+			   SSD20XD_PINNAME_GPIO1,  \
+			   SSD20XD_PINNAME_GPIO2,  \
+			   SSD20XD_PINNAME_GPIO3,  \
+			   SSD20XD_PINNAME_GPIO4,  \
+			   SSD20XD_PINNAME_GPIO5,  \
+			   SSD20XD_PINNAME_GPIO6,  \
+			   SSD20XD_PINNAME_GPIO7,  \
+			   SSD20XD_PINNAME_GPIO10, \
+			   SSD20XD_PINNAME_GPIO11, \
+			   SSD20XD_PINNAME_GPIO12, \
+			   SSD20XD_PINNAME_GPIO13, \
+			   SSD20XD_PINNAME_GPIO14, \
+			   SSD20XD_PINNAME_GPIO85, \
+			   SSD20XD_PINNAME_GPIO86, \
+			   SSD20XD_PINNAME_GPIO90
+
+#define SSD20XD_GPIO_OFF_GPIO0 0x0
+#define SSD20XD_GPIO_OFF_GPIO1 0x4
+#define SSD20XD_GPIO_OFF_GPIO2 0x8
+#define SSD20XD_GPIO_OFF_GPIO3 0xc
+#define SSD20XD_GPIO_OFF_GPIO4 0x10
+#define SSD20XD_GPIO_OFF_GPIO5 0x14
+#define SSD20XD_GPIO_OFF_GPIO6 0x18
+#define SSD20XD_GPIO_OFF_GPIO7 0x1c
+#define SSD20XD_GPIO_OFF_GPIO10 0x28
+#define SSD20XD_GPIO_OFF_GPIO11 0x2c
+#define SSD20XD_GPIO_OFF_GPIO12 0x30
+#define SSD20XD_GPIO_OFF_GPIO13 0x34
+#define SSD20XD_GPIO_OFF_GPIO14 0x38
+#define SSD20XD_GPIO_OFF_GPIO85 0x100
+#define SSD20XD_GPIO_OFF_GPIO86 0x104
+#define SSD20XD_GPIO_OFF_GPIO90 0x114
+
+#define SSD20XD_GPIO_OFFSETS SSD20XD_GPIO_OFF_GPIO0,  \
+			     SSD20XD_GPIO_OFF_GPIO1,  \
+			     SSD20XD_GPIO_OFF_GPIO2,  \
+			     SSD20XD_GPIO_OFF_GPIO3,  \
+			     SSD20XD_GPIO_OFF_GPIO4,  \
+			     SSD20XD_GPIO_OFF_GPIO5,  \
+			     SSD20XD_GPIO_OFF_GPIO6,  \
+			     SSD20XD_GPIO_OFF_GPIO7,  \
+			     SSD20XD_GPIO_OFF_GPIO10, \
+			     SSD20XD_GPIO_OFF_GPIO11, \
+			     SSD20XD_GPIO_OFF_GPIO12, \
+			     SSD20XD_GPIO_OFF_GPIO13, \
+			     SSD20XD_GPIO_OFF_GPIO14, \
+			     SSD20XD_GPIO_OFF_GPIO85, \
+			     SSD20XD_GPIO_OFF_GPIO86, \
+			     SSD20XD_GPIO_OFF_GPIO90
+
+/* "ttl" pins lcd interface pins */
+#define SSD20XD_PINNAME_TTL0	"ttl0"
+#define SSD20XD_PINNAME_TTL1	"ttl1"
+#define SSD20XD_PINNAME_TTL2	"ttl2"
+#define SSD20XD_PINNAME_TTL3	"ttl3"
+#define SSD20XD_PINNAME_TTL4	"ttl4"
+#define SSD20XD_PINNAME_TTL5	"ttl5"
+#define SSD20XD_PINNAME_TTL6	"ttl6"
+#define SSD20XD_PINNAME_TTL7	"ttl7"
+#define SSD20XD_PINNAME_TTL8	"ttl8"
+#define SSD20XD_PINNAME_TTL9	"ttl9"
+#define SSD20XD_PINNAME_TTL10	"ttl10"
+#define SSD20XD_PINNAME_TTL11	"ttl11"
+#define SSD20XD_PINNAME_TTL12	"ttl12"
+#define SSD20XD_PINNAME_TTL13	"ttl13"
+#define SSD20XD_PINNAME_TTL14	"ttl14"
+#define SSD20XD_PINNAME_TTL15	"ttl15"
+#define SSD20XD_PINNAME_TTL16	"ttl16"
+#define SSD20XD_PINNAME_TTL17	"ttl17"
+#define SSD20XD_PINNAME_TTL18	"ttl18"
+#define SSD20XD_PINNAME_TTL19	"ttl19"
+#define SSD20XD_PINNAME_TTL20	"ttl20"
+#define SSD20XD_PINNAME_TTL21	"ttl21"
+#define SSD20XD_PINNAME_TTL22	"ttl22"
+#define SSD20XD_PINNAME_TTL23	"ttl23"
+#define SSD20XD_PINNAME_TTL24	"ttl24"
+#define SSD20XD_PINNAME_TTL25	"ttl25"
+#define SSD20XD_PINNAME_TTL26	"ttl26"
+#define SSD20XD_PINNAME_TTL27	"ttl27"
+
+#define SSD20XD_TTL_PINNAMES SSD20XD_PINNAME_TTL0,  \
+			     SSD20XD_PINNAME_TTL1,  \
+			     SSD20XD_PINNAME_TTL2,  \
+			     SSD20XD_PINNAME_TTL3,  \
+			     SSD20XD_PINNAME_TTL4,  \
+			     SSD20XD_PINNAME_TTL5,  \
+			     SSD20XD_PINNAME_TTL6,  \
+			     SSD20XD_PINNAME_TTL7,  \
+			     SSD20XD_PINNAME_TTL8,  \
+			     SSD20XD_PINNAME_TTL9,  \
+			     SSD20XD_PINNAME_TTL10, \
+			     SSD20XD_PINNAME_TTL11, \
+			     SSD20XD_PINNAME_TTL12, \
+			     SSD20XD_PINNAME_TTL13, \
+			     SSD20XD_PINNAME_TTL14, \
+			     SSD20XD_PINNAME_TTL15, \
+			     SSD20XD_PINNAME_TTL16, \
+			     SSD20XD_PINNAME_TTL17, \
+			     SSD20XD_PINNAME_TTL18, \
+			     SSD20XD_PINNAME_TTL19, \
+			     SSD20XD_PINNAME_TTL20, \
+			     SSD20XD_PINNAME_TTL21, \
+			     SSD20XD_PINNAME_TTL22, \
+			     SSD20XD_PINNAME_TTL23, \
+			     SSD20XD_PINNAME_TTL24, \
+			     SSD20XD_PINNAME_TTL25, \
+			     SSD20XD_PINNAME_TTL26, \
+			     SSD20XD_PINNAME_TTL27
+
+#define SSD20XD_TTL_OFFSET_TTL0		0x80
+#define SSD20XD_TTL_OFFSET_TTL1		0x84
+#define SSD20XD_TTL_OFFSET_TTL2		0x88
+#define SSD20XD_TTL_OFFSET_TTL3		0x8c
+#define SSD20XD_TTL_OFFSET_TTL4		0x90
+#define SSD20XD_TTL_OFFSET_TTL5		0x94
+#define SSD20XD_TTL_OFFSET_TTL6		0x98
+#define SSD20XD_TTL_OFFSET_TTL7		0x9c
+#define SSD20XD_TTL_OFFSET_TTL8		0xa0
+#define SSD20XD_TTL_OFFSET_TTL9		0xa4
+#define SSD20XD_TTL_OFFSET_TTL10	0xa8
+#define SSD20XD_TTL_OFFSET_TTL11	0xac
+#define SSD20XD_TTL_OFFSET_TTL12	0xb0
+#define SSD20XD_TTL_OFFSET_TTL13	0xb4
+#define SSD20XD_TTL_OFFSET_TTL14	0xb8
+#define SSD20XD_TTL_OFFSET_TTL15	0xbc
+#define SSD20XD_TTL_OFFSET_TTL16	0xc0
+#define SSD20XD_TTL_OFFSET_TTL17	0xc4
+#define SSD20XD_TTL_OFFSET_TTL18	0xc8
+#define SSD20XD_TTL_OFFSET_TTL19	0xcc
+#define SSD20XD_TTL_OFFSET_TTL20	0xd0
+#define SSD20XD_TTL_OFFSET_TTL21	0xd4
+#define SSD20XD_TTL_OFFSET_TTL22	0xd8
+#define SSD20XD_TTL_OFFSET_TTL23	0xdc
+#define SSD20XD_TTL_OFFSET_TTL24	0xe0
+#define SSD20XD_TTL_OFFSET_TTL25	0xe4
+#define SSD20XD_TTL_OFFSET_TTL26	0xe8
+#define SSD20XD_TTL_OFFSET_TTL27	0xec
+
+#define SSD20XD_TTL_OFFSETS SSD20XD_TTL_OFFSET_TTL0,  \
+			    SSD20XD_TTL_OFFSET_TTL1,  \
+			    SSD20XD_TTL_OFFSET_TTL2,  \
+			    SSD20XD_TTL_OFFSET_TTL3,  \
+			    SSD20XD_TTL_OFFSET_TTL4,  \
+			    SSD20XD_TTL_OFFSET_TTL5,  \
+			    SSD20XD_TTL_OFFSET_TTL6,  \
+			    SSD20XD_TTL_OFFSET_TTL7,  \
+			    SSD20XD_TTL_OFFSET_TTL8,  \
+			    SSD20XD_TTL_OFFSET_TTL9,  \
+			    SSD20XD_TTL_OFFSET_TTL10, \
+			    SSD20XD_TTL_OFFSET_TTL11, \
+			    SSD20XD_TTL_OFFSET_TTL12, \
+			    SSD20XD_TTL_OFFSET_TTL13, \
+			    SSD20XD_TTL_OFFSET_TTL14, \
+			    SSD20XD_TTL_OFFSET_TTL15, \
+			    SSD20XD_TTL_OFFSET_TTL16, \
+			    SSD20XD_TTL_OFFSET_TTL17, \
+			    SSD20XD_TTL_OFFSET_TTL18, \
+			    SSD20XD_TTL_OFFSET_TTL19, \
+			    SSD20XD_TTL_OFFSET_TTL20, \
+			    SSD20XD_TTL_OFFSET_TTL21, \
+			    SSD20XD_TTL_OFFSET_TTL22, \
+			    SSD20XD_TTL_OFFSET_TTL23, \
+			    SSD20XD_TTL_OFFSET_TTL24, \
+			    SSD20XD_TTL_OFFSET_TTL25, \
+			    SSD20XD_TTL_OFFSET_TTL26, \
+			    SSD20XD_TTL_OFFSET_TTL27
+
+/* On the ssd20xd the two normal uarts have dedicated pins */
+#define SSD20XD_PINNAME_UART0_RX	"uart0_rx"
+#define SSD20XD_PINNAME_UART0_TX	"uart0_tx"
+
+#define SSD20XD_UART0_NAMES	  \
+	SSD20XD_PINNAME_UART0_RX, \
+	SSD20XD_PINNAME_UART0_TX
+
+#define SSD20XD_PINNAME_UART1_RX	"uart1_rx"
+#define SSD20XD_PINNAME_UART1_TX	"uart1_tx"
+
+#define SSD20XD_UART1_NAMES	  \
+	SSD20XD_PINNAME_UART1_RX, \
+	SSD20XD_PINNAME_UART1_TX
+
+#define SSD20XD_OFF_UART0_RX	0x60
+#define SSD20XD_OFF_UART0_TX	0x64
+
+#define SSD20XD_UART0_OFFSETS \
+	SSD20XD_OFF_UART0_RX, \
+	SSD20XD_OFF_UART0_TX
+
+#define SSD20XD_OFF_UART1_RX	0x68
+#define SSD20XD_OFF_UART1_TX	0x6c
+
+#define SSD20XD_UART1_OFFSETS \
+	SSD20XD_OFF_UART1_RX, \
+	SSD20XD_OFF_UART1_TX
+
+/*
+ * ssd20x has the same pin names but different ordering
+ * of the registers that control the gpio.
+ */
+#define SSD20XD_OFF_SD_D0	0x140
+#define SSD20XD_OFF_SD_D1	0x144
+#define SSD20XD_OFF_SD_D2	0x148
+#define SSD20XD_OFF_SD_D3	0x14c
+#define SSD20XD_OFF_SD_CMD	0x150
+#define SSD20XD_OFF_SD_CLK	0x154
+
+#define SSD20XD_SD_OFFSETS	SSD20XD_OFF_SD_CLK, \
+				SSD20XD_OFF_SD_CMD, \
+				SSD20XD_OFF_SD_D0,  \
+				SSD20XD_OFF_SD_D1,  \
+				SSD20XD_OFF_SD_D2,  \
+				SSD20XD_OFF_SD_D3
+
+static const char * const ssd20xd_names[] = {
+	FUART_NAMES,
+	SD_NAMES,
+	SSD20XD_UART0_NAMES,
+	SSD20XD_UART1_NAMES,
+	SSD20XD_TTL_PINNAMES,
+	SSD20XD_GPIO_NAMES,
+};
+
+static const unsigned int ssd20xd_offsets[] = {
+	FUART_OFFSETS,
+	SSD20XD_SD_OFFSETS,
+	SSD20XD_UART0_OFFSETS,
+	SSD20XD_UART1_OFFSETS,
+	SSD20XD_TTL_OFFSETS,
+	SSD20XD_GPIO_OFFSETS,
+};
+
+MSC313_GPIO_CHIPDATA(ssd20xd);
 #endif
 
 struct msc313_gpio {
@@ -412,6 +669,10 @@ static const struct of_device_id msc313_gpio_of_match[] = {
 		.compatible = "mstar,msc313-gpio",
 		.data = &msc313_data,
 	},
+	{
+		.compatible = "sstar,ssd20xd-gpio",
+		.data = &ssd20xd_data,
+	},
 #endif
 	{ }
 };
-- 
2.33.0

