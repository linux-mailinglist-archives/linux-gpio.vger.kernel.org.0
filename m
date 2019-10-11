Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83AACD44BF
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 17:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfJKPsP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 11:48:15 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36579 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfJKPsP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 11:48:15 -0400
Received: by mail-pg1-f193.google.com with SMTP id 23so6034687pgk.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0bswD5djDX5qSZz0CkJ8QmEvt8BM+UaLc2rx/9lbfB8=;
        b=ZIHehPcMG9EoNwmGgphOK8Bx8D8JSPbgUCDMBIRRu96xbSuL9Mz4Iii6tEqAbq8IHh
         I4t23nobZ9TuJeUQoEQ/8BKUjyZ1hJYeTX7BYrqHEFnHnsfiz10iewPgWkZ+FGvaF2cF
         SCYX4tjsuuOc3ci9V0nk/uzdw+c34LMOpS6sqdBiI4ApRyMIoRP0dCPZBsyJHlXdc8RK
         Y70Usi6+Fg4pRy5y4+ClUVrufhAkJ2RW8UTjCLTx+N0yfD/v0NudqThofyqs+ZLJho5K
         pop3Dgxa/w5UwygcxiOrdep0QcEdROMdDnrHSA8eArFlsnQqdI/R5ljxBPdJnAuqkOD+
         L3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0bswD5djDX5qSZz0CkJ8QmEvt8BM+UaLc2rx/9lbfB8=;
        b=MNG8pSnekR7oxaQFX90VvO47VhmmcB4LyFLhF5el2L9e/Si4OMsz71F/y1fNxD/Tec
         I/3A+2a8AcOZgBstkHIYSXXgHJa0JAMglWLs2Y/A3Rl51jXNskK+l1HzgkI/CfsSXdW3
         FKycqYZePF4I+IV5G/SRvh8XOvgBxNDDKhiRvM7bteEsm6HcB7n4FqfcnY46vFu6oTN6
         lqzF4CscgyX1lgAKl4B7vlbjwOStrdCBdbuLoLDQQjJIqNAaD+TO3OTULdTYQ6AF9NEe
         CF9t0eySXhofQkMVVOI2K+wnU4pOLTu/8VWKWASC6xaYjO5PsrBEa1a4gh4qx0rgEuHN
         bXZw==
X-Gm-Message-State: APjAAAX5VjMKRbyzhBXGud30l479DfJfmL8a4EKqFnss6ge4E7h0gluG
        3O0vCVneoQQnBpvjro3vQuu1PcmwWr8wJA==
X-Google-Smtp-Source: APXvYqw7eZXNOZOq60IuTlLqnlPPY8NZhWfWpSHQnSdhAiZ4mD+cw+phbwOlUtfvwmuxbEoI8Bcr9g==
X-Received: by 2002:a17:90b:f09:: with SMTP id br9mr3084547pjb.107.1570808893846;
        Fri, 11 Oct 2019 08:48:13 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v28sm13755404pgn.17.2019.10.11.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:48:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 5/5] gpiolib: allow pull up/down on outputs
Date:   Fri, 11 Oct 2019 23:46:50 +0800
Message-Id: <20191011154650.1749-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011154650.1749-1-warthog618@gmail.com>
References: <20191011154650.1749-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch allows pull up/down bias to be set on outputs.
Use case is for open source or open drain applications where
internal pull up/down may conflict with external biasing.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f0665ea396cd..38ead7a87d44 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -554,8 +554,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
-	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
-	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	/* PULL_UP and PULL_DOWN flags only allowed for input or output mode. */
+	if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
+	      (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
 	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
 	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
 		return -EINVAL;
@@ -2932,6 +2933,24 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
 }
 
+static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
+{
+	int bias = 0;
+
+	if (test_bit(FLAG_PULL_UP, &desc->flags) &&
+	    test_bit(FLAG_PULL_DOWN, &desc->flags))
+		bias = PIN_CONFIG_BIAS_DISABLE;
+	else if (test_bit(FLAG_PULL_UP, &desc->flags))
+		bias = PIN_CONFIG_BIAS_PULL_UP;
+	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+		bias = PIN_CONFIG_BIAS_PULL_DOWN;
+
+	if (bias)
+		return gpio_set_config(chip, gpio_chip_hwgpio(desc), bias);
+
+	return 0;
+}
+
 /**
  * gpiod_direction_input - set the GPIO direction to input
  * @desc:	GPIO to set to input
@@ -2979,16 +2998,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (ret == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
-	if (test_bit(FLAG_PULL_UP, &desc->flags) &&
-		test_bit(FLAG_PULL_DOWN, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_DISABLE);
-	else if (test_bit(FLAG_PULL_UP, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_UP);
-	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_DOWN);
+	gpio_set_bias(chip, desc);
 
 	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
 
@@ -3114,6 +3124,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	}
 
 set_output_value:
+	gpio_set_bias(gc, desc);
 	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
-- 
2.23.0

