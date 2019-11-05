Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAD9EF339
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbfKECFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:05:07 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35057 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:05:07 -0500
Received: by mail-pg1-f193.google.com with SMTP id q22so5262596pgk.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sBInI9S4pojSgWzJhUnUthAYxf7RcezTFnfQ+szOly0=;
        b=Cb5Drqhwi6srcMsfaJggZDuBEz6ml4bCkcjA6wchHpMAORZyBHzc8PwxcMzrwjiQjy
         ++tp9MVl4aHooOON/5xTimKhSuFStkCilPIp3oG5EVbfwfyP7iy6oOPeeBqmPk/eiL3h
         pSsf6McLRJ/AohtRjxxFb5X/21zx5RYKzkvROcM8T7kynmcIaOfO6wlnGhCkVsDMw1Qb
         K1o5FNBgIVCQtbIt3ek0WjBjnzVV2atrTaDiAY4iycIdzB3/zAfKOecXzv7uaEuP0jRa
         YwuSNPaXQ/DxfcVjJ+HWiM3nyx9fI8Zz3C3aL3jYEC6VLiTi4IyvkUD/B24OlmN+Zm+s
         p2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sBInI9S4pojSgWzJhUnUthAYxf7RcezTFnfQ+szOly0=;
        b=LJG+VLAB1seU8CXhRK69X63EAbDMJRVV0WFyTojdN63Ii31YfE4khW8FSCdMKk9V2J
         DiQOu0a/Nj4sJ5THBDoZoSPLuZvTEkkVNrxvfWEuMbALM237j2mP4VqF4WaesQ9MJu8p
         hKEtg7dCni45To04UK+1/pPfLJYlk9sjMwI7zeL35E27kYMp1oWL4ah8UgWaomPrMeZ/
         B5EW47dP15gfHByxLUfX1+z21A1sKrV7Kmz1IlOHEutOh9Jy+y7DvW71jMcHNUIh+QaS
         7OQ+jn8H6HwVorlXDLocnvgJTOjOmTPJBmy3zjipuZ5si7YNl8ux1qk9ZQGbGoVq+M8r
         /WnQ==
X-Gm-Message-State: APjAAAW1kjZN/+qNxRFyGgrpy0SVCtHKbwvWj7e+7p7NnVoQyEM/Xqss
        MqGx9UoUwZqj606Jqgkj1qcxjLeWJiHNbw==
X-Google-Smtp-Source: APXvYqxaV2DAQgG3ebsiFyDFiv7ouE2/EQTYWJuhCW93Rh8lnlsiBHud2EwgfSZG7lgU+mSiQpZMsA==
X-Received: by 2002:a63:e750:: with SMTP id j16mr34229937pgk.30.1572919506080;
        Mon, 04 Nov 2019 18:05:06 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:05:05 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 4/7] gpiolib: add support for biasing output lines
Date:   Tue,  5 Nov 2019 10:04:26 +0800
Message-Id: <20191105020429.18942-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
References: <20191105020429.18942-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow pull up/down bias to be set on output lines.
Use case is for open source or open drain applications where
internal pull up/down may conflict with external biasing.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0ac0a250b17a..f852ff60ae6e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -556,8 +556,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
-	/* Bias flags only allowed for input mode. */
-	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	/* Bias flags only allowed for input or output mode. */
+	if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
+	      (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
 	    ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
 	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
 	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
@@ -3168,6 +3169,9 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	}
 
 set_output_value:
+	ret = gpio_set_bias(gc, desc);
+	if (ret)
+		return ret;
 	return gpiod_direction_output_raw_commit(desc, value);
 
 set_output_flag:
-- 
2.23.0

