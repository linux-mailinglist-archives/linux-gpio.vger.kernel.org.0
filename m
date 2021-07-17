Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678723CC137
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jul 2021 06:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhGQFAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jul 2021 01:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbhGQE7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jul 2021 00:59:48 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2884C061760
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:51 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id i16-20020a17090acf90b02901736d9d2218so8271283pju.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0rz76Uc0LSYGvJko26iv1kEWKVn4GBongsN3dvP4t3E=;
        b=fw6Rc6/gX1cbWXS1E4I07KfwxO5Ofoo4zYOelu2h59detjB2EO662l0wbYJN0WNmem
         bwOxLc9wLSjSvDJTNRU6Kwdi2/mlfJbumaS0tbLpqCNrLaTX2S/ynV/ooj2+BRYGWbq/
         w963pewJ4qdgAp1BdPDY3iJdyY90v5//0wnHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0rz76Uc0LSYGvJko26iv1kEWKVn4GBongsN3dvP4t3E=;
        b=aa0x2yUKQu3JF2MH8clbNhp08KY0Jy8a6kvevc7M8mxHi7Mj/PBre4nNfPTpHpa5Dv
         de9qP429PyTxqCP/1rPQ+epWRYFDJUT/19eqoOUNNQiBQ+PnYmkJZVNP2DaokpNyImlN
         yD4Vq2EinVIAI+44sEMy5az/+fCtrDEm16fyrJwYlKjY0kEgdIPjeETIr1WQC29S1YKT
         0Y+AUe2W03UayHYCgHGfssiGZCpNaQnpKSWADHDMridfI3Kt/W0efDR7GPSiYM9HkLQU
         Wh5yzhDFxUm/RmfCfW1V8skozhRnAE7315JRQBhWAP8uQts7AEghpnEXEjt47kvmE9Lo
         bvhA==
X-Gm-Message-State: AOAM532VJ7nIx0UqdqlAWPz6e4j/eYgm9D2fJbBBG0L1qfIUmEF148Ul
        RFhPt8uUFWsCaYdBuvLgIIcd4e0vfb4OzA==
X-Google-Smtp-Source: ABdhPJzX6UuGrudwh22kSb3rtW/NW6/mONKwSy+EltD3JetL47mDHDFQSLVDXylJusrGeaaQkFwq3w==
X-Received: by 2002:a17:902:b711:b029:11e:6480:258a with SMTP id d17-20020a170902b711b029011e6480258amr10486656pls.41.1626497811398;
        Fri, 16 Jul 2021 21:56:51 -0700 (PDT)
Received: from shiro.work (p866038-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.60.38])
        by smtp.googlemail.com with ESMTPSA id w2sm12522885pjf.2.2021.07.16.21.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 21:56:51 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, romain.perier@gmail.com,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 04/10] gpio: msc313: Add support for SSD201 and SSD202D
Date:   Sat, 17 Jul 2021 13:56:21 +0900
Message-Id: <20210717045627.1739959-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717045627.1739959-1-daniel@0x0f.com>
References: <20210717045627.1739959-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds GPIO support for the SSD201 and SSD202D chips.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
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
2.32.0

