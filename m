Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E2618E20
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 18:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbfEIQ3p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 12:29:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45077 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbfEIQ3a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 12:29:30 -0400
Received: by mail-wr1-f65.google.com with SMTP id s15so3886628wra.12
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5yCZDsoXX8gNHDHrkDE/DYR09t36eKuYM9S/4pn/Ftw=;
        b=q6sRXgfrPS1ftufCAYoUuOq9QwnKCARST8ggrwycQjcZEErNyH9+1jKicpx23HkC/C
         6Tgi6ceqLnhlx42xWUIYG8+ienjUrl62Y7kbMWzp2XcPQHE6r0zqdusvDMTg+wSw/EqF
         L8AkMdxu20sO+KfFYKteAsmrnXDx9QI8K1PVG/1r+Agpuwq0jOdMduFxfF+MHn7UdH9h
         XaBAmYlAsM2vsukhUM2sJSjRI5FuEPfZpV81calRjNKdAX/c9Z4C0NkVZ0HzvRkwukaS
         zly0hygjE2gPggWhUU9FT7Kh7pse1ZVzJeTk/G8RPzbIpPoRtmR1AucMvltDAnEDvFHM
         kQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5yCZDsoXX8gNHDHrkDE/DYR09t36eKuYM9S/4pn/Ftw=;
        b=WLWBC8dTYnXmP6XdkLEDwD16k8eoowOOMPW2bhDnHtMdfniyGjN/Tq2UPcZeDxGBYg
         l/K5gddfqiMPXqt+MK2bOZgukfIlv41/hNlZsFspX4s9qnL8YJB26bMYJ48sOdXGQrnB
         qaracchHEMH1qdT+1fDqcX6WI7hmShkRnhMm5Q+fDhAipmfhQCiWdNBDyeTDFHcSKCzK
         zvxmN5BJKODq10uXQrXzVxNxAqAkbLn5MsAwnFEW5tUJ57RKd9FR6w39BOoz+Qn3IPBM
         ZlKs2S+VQZtfdrESNYwjm/2RfMu323yuMWsxU1qaEpeAhSr4jVdMV2+rFHWewy0mBjeN
         9LHA==
X-Gm-Message-State: APjAAAUSoUOTAgb8a36fpBCPgNdMh7KJ5Hua7by2c3CDWmHkI59dCaUm
        NvJCBoiFrCSgV7domDCjqRA3aw==
X-Google-Smtp-Source: APXvYqzj+ok+fo5I5fpLh+PgmP0jZdB7XOCCyhpRY/RVnOJ6kCV7LLIaPMaBoUBOW/zSbhP7uYluzg==
X-Received: by 2002:adf:f488:: with SMTP id l8mr2233330wro.287.1557419368935;
        Thu, 09 May 2019 09:29:28 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:29:28 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] pinctrl: meson: g12a: add DS bank value
Date:   Thu,  9 May 2019 18:29:20 +0200
Message-Id: <20190509162920.7054-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

add drive-strength bank regiter and bit value for G12A SoC

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index d494492e98e9..3475cd7bd2af 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1304,28 +1304,28 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 };
 
 static struct meson_bank meson_g12a_periphs_banks[] = {
-	/* name  first  last  irq  pullen  pull  dir  out  in */
-	BANK("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
-	     4,  0,  4,  0,  12,  0,  13, 0,  14, 0),
-	BANK("H",    GPIOH_0,    GPIOH_8, 28, 36,
-	     3,  0,  3,  0,  9,  0,  10,  0,  11,  0),
-	BANK("BOOT", BOOT_0,     BOOT_15,  37, 52,
-	     0,  0,  0,  0,  0, 0,  1, 0,  2, 0),
-	BANK("C",    GPIOC_0,    GPIOC_7,  53, 60,
-	     1,  0,  1,  0,  3, 0,  4, 0,  5, 0),
-	BANK("A",    GPIOA_0,    GPIOA_15,  61, 76,
-	     5,  0,  5,  0,  16,  0,  17,  0,  18,  0),
-	BANK("X",    GPIOX_0,    GPIOX_19,   77, 96,
-	     2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
+	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
+	BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
+		4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
+	BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
+		3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
+	BANK_DS("BOOT", BOOT_0,     BOOT_15,  37, 52,
+		0,  0,  0,  0,  0, 0,  1, 0,  2, 0, 0, 0),
+	BANK_DS("C",    GPIOC_0,    GPIOC_7,  53, 60,
+		1,  0,  1,  0,  3, 0,  4, 0,  5, 0, 1, 0),
+	BANK_DS("A",    GPIOA_0,    GPIOA_15,  61, 76,
+		5,  0,  5,  0,  16,  0,  17,  0,  18,  0, 6, 0),
+	BANK_DS("X",    GPIOX_0,    GPIOX_19,   77, 96,
+		2,  0,  2,  0,  6,  0,  7,  0,  8,  0, 2, 0),
 };
 
 static struct meson_bank meson_g12a_aobus_banks[] = {
-	/* name  first  last  irq  pullen  pull  dir  out  in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_11,  0, 11,
-	     3,  0,  2, 0,  0,  0,  4, 0,  1,  0),
+	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
+	BANK_DS("AO", GPIOAO_0, GPIOAO_11, 0, 11, 3, 0, 2, 0, 0, 0, 4, 0, 1, 0,
+		0, 0),
 	/* GPIOE actually located in the AO bank */
-	BANK("E",   GPIOE_0,  GPIOE_2,   97, 99,
-	     3,  16,  2, 16,  0,  16,  4, 16,  1,  16),
+	BANK_DS("E", GPIOE_0, GPIOE_2, 97, 99, 3, 16, 2, 16, 0, 16, 4, 16, 1,
+		16, 1, 0),
 };
 
 static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
-- 
2.17.1

