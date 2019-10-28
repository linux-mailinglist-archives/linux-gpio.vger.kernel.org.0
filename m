Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 176DCE6D58
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 08:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732989AbfJ1HiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 03:38:18 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44310 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732043AbfJ1HiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 03:38:18 -0400
Received: by mail-pf1-f193.google.com with SMTP id q26so2686657pfn.11
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 00:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ehKV7ltIoKTEMy3G96ov92GcJaXVZr5SNSr+TsPmJDM=;
        b=qiZ9tbNQzBOIY10SnsyPXENa6RJKrD1SNdREiXD38AbGwklGC4vyf/NY8tHCkw2Wfx
         w3AzQwLf2TG06dOowpfDr5xE3/idU0zHUx0IzqNkvTRxo+EvbwOA6eSdOM/KFL+86JQK
         ombZEhfSfLhKki9tf71AQKpupwyY3sS/K6REIl31YLzvn57HQDD3xmQcivQrerpA0+mv
         5wTS9bD/EY0nM8cXCsXIZOskB0RCtyek9isSu8wmvnwbEI1LICIHMMXFlkTQIbifr6Df
         j4WS2DN8gA8AFWOi0cW+jAtlUzaVGsZHM9e1UOnszUOkiacFttrvqbQgMyhY1OZQy2wE
         vQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ehKV7ltIoKTEMy3G96ov92GcJaXVZr5SNSr+TsPmJDM=;
        b=p5iBGqI2ON/ZXXoYVBpt1eE+yU/Actk/Y5rCOswtW5ZfzUQoKINWkg+4vxpoF2nJmV
         WeZy/1tlEwkBERt59M2NJK6t238XfPYJGHhi6XL9AmHwre6byRGaul9bg6z/R8r5I9xW
         YOG7LV0jNlzieI2ppXgMrr7IiE4UbG5/spiOwEgUOQaT39uvooxKKhb976Op3YiH+5DE
         PyqMXLCMZObFMcwg6nWkUKjpozPEzCEHvWjdMiwglRoH8NgUJlb1QLbi8FQ5ZdOb6CQ9
         fYI/5ShlZ610b/4EKXyHaJaiThm0s61Q1Wy7ZksqZhg3Q9DJ1CilWwUx9ZjOJDe487qH
         jYSg==
X-Gm-Message-State: APjAAAUfDlpGa/+yFy9JnzkU0YU5t3fFWKHcTMHzGLQYPH2fCP0p3vDy
        kgn+SfQWrJCx+4ZJkDZy1qBgzoXhhOtCClW2
X-Google-Smtp-Source: APXvYqzcIA3xT0O0A6u+riD/98qUkbHMBLCVeA708G8NxxvpJUGXPjiO+AQYKRYOKuUlV4VPexA7PQ==
X-Received: by 2002:a63:fb4f:: with SMTP id w15mr18396565pgj.403.1572248295539;
        Mon, 28 Oct 2019 00:38:15 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b17sm11191015pfr.17.2019.10.28.00.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 00:38:15 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 5/5] gpiolib: add support for biasing output lines
Date:   Mon, 28 Oct 2019 15:37:13 +0800
Message-Id: <20191028073713.25664-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028073713.25664-1-warthog618@gmail.com>
References: <20191028073713.25664-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 177d25e19758..56b2814b843e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -555,8 +555,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
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
@@ -3148,6 +3149,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	}
 
 set_output_value:
+	gpio_set_bias(gc, desc);
 	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
-- 
2.23.0

