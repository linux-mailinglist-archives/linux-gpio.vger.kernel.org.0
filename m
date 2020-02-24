Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D7016A2DE
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 10:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgBXJmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 04:42:05 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41303 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgBXJmE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 04:42:04 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so9537704wrw.8
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 01:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kc3RH6cl8PrURMVC2HcOMEqzVbKCqch6ndQPKF/V66A=;
        b=0YBu5nh7EwE0owIXSnCrf8JvY5+QrQDh3tlr/FACK7Kk/A5xfIV2CCrb7w7qcZoBJe
         CGVCX7By6mMfAtyy6KB/llK3WxNoXh8q36XqRmC08YtCHQaEGoPHSFt3yMgETa618fFf
         hd3zZojj95yUICFQI/GuITP83ur8BC+R+LsOos9rqNTwuslJsZ4g2HvHBCUo/HQlIRdK
         6AIDYJNEUIGU4o9IaB42XitaT93J3Tf9qtEHAfI48+HOcxl6gVyw+2QkeRh+vLMtGVVk
         lxdwKibT8n+BfAduR5BlRGAEzaQ76n+Az+2fKfX+VIg5Sf0tU5IeRtQ5ZfCqQExoxRX1
         Msaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kc3RH6cl8PrURMVC2HcOMEqzVbKCqch6ndQPKF/V66A=;
        b=DerbNxXY7CGT7FzAqVyxxmwNmvmjGsvUi6ZwlyJP5ejCgL1c09J6sxcJ+PLQiqpdEg
         qiHbqieXwe0eRELxFCtLIK3rK0ekri6VN5IVkPmij2MQFWD9XtxQNeUIKFgZK8wmEh7h
         EdFmkSoqEWWlYx7WtRFL4i8gqTQhK6/M3LCyCZ/0/ZfAw5B9/UvEaogydaf/twuDFEnL
         CzLiXk7pTiZtufbSVg3CmYM8r/jMGrernRdTwthI+xvr+t89foRw5HQTFzDNNsYdRwoX
         54Tnu2wwWvTmqa1GLZKwE5QbKUi+NDxAdwhLTgV3eENHB/SYi9pOdwR+uKVKcvpI9zPX
         t7Aw==
X-Gm-Message-State: APjAAAW8ZdVggUIhGeI6RvfEqubfLOAPryY3aKcrhTrh1JBTC8ut8UKY
        fQb4rbWsNc2zid5iMBQAq1p1Og==
X-Google-Smtp-Source: APXvYqxZ3HxmXrwssMNqpiLFkVCqb97GUflqayOJ0zf7Ob3MpyGGefF2z+IZSNgNrmgmJhlsrnw9ig==
X-Received: by 2002:adf:facc:: with SMTP id a12mr37775788wrs.100.1582537323534;
        Mon, 24 Feb 2020 01:42:03 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id t10sm16920730wmi.40.2020.02.24.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 01:42:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/3] gpiolib: provide VALIDATE_DESC_PTR() macro
Date:   Mon, 24 Feb 2020 10:41:56 +0100
Message-Id: <20200224094158.28761-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224094158.28761-1-brgl@bgdev.pl>
References: <20200224094158.28761-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're about to add a public GPIO function that takes a descriptor as
argument and returns a pointer. Add a corresponding macro wrapping the
validate_desc() function that returns an ERR_PTR() on error.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d0106ceeba7..da8ffd40aa97 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2864,6 +2864,14 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 		return; \
 	} while (0)
 
+#define VALIDATE_DESC_PTR(desc) do { \
+	int __valid = validate_desc(desc, __func__); \
+	if (__valid < 0) \
+		return ERR_PTR(__valid); \
+	if (__valid == 0) \
+		return NULL; \
+	} while (0)
+
 int gpiod_request(struct gpio_desc *desc, const char *label)
 {
 	int ret = -EPROBE_DEFER;
-- 
2.25.0

