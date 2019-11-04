Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36D1EE408
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbfKDPji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:39:38 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34207 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDPji (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:39:38 -0500
Received: by mail-pf1-f193.google.com with SMTP id n13so716044pff.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6raOhOND06klFsKlr/jnva9F9j0rsalhrUFCEioucRs=;
        b=Lrq5Tvg2GvpKT7ZtRWKxC0amZFRHkr4kj1tuDGae/3GoFZQser118NCqsyHTpz9Q9Q
         80Yo0Ce9Pudwg1TYa8Wqkf98Wksz2HlUByj7yzVh8ZkE27aL8pS4uDCL9DLWeajFZZFJ
         2AB607KInpNCRGYdDQ1T4YhZpnm9DCHEYEVagYkliRMRb/SlePNYf6nOADnt7zBbBuLv
         wWygBs6jn1k/rERNuSgo6KLZmBOZUg2rAm//Kdltat8F9cE17Zva4v4g74zjl5cGfmSt
         z42dYQCxGHq9OK2M0K9nnhtAmw8xrI1zWSIYncSw1hTbejzNStCoF4XPDigO6U1/m3ki
         HDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6raOhOND06klFsKlr/jnva9F9j0rsalhrUFCEioucRs=;
        b=tzWQjhazK/B0rQbfbwK1wk4bP2nGsdxjbMc262Mox3HS+60mGDt0jrLtL9EbZomora
         34r7nUoXcXZLDANbhlPrQFY4fOxKiEzYjBNtj9gQh6/pAodNrvJji/BNESnFPVEGhOa0
         eJX1mkYq0bHFzu41SuP61Lavy0LHr+/CwsGpSVJbqtPg1sw+3qu5hV/92brzepmMjf3x
         dsKF5C6l2v2QzCsljSXUtvTXssGFlvJiH24p780ub2on46eP3qxUb0d9/Z/4JDpIq/tT
         6lBY0qu5HvNf9F05i3xLQNmbtepXNISjLEdgxPKimvy8MVhUkZtJOpo10sowLIp8b9lu
         sFhg==
X-Gm-Message-State: APjAAAWio4l1NE6mUTe5YEnTbbI04zKAP4zSppyTZqTb4CQCxoEZGcmk
        N8lm8A+pIQi/1FNSVY+wiNk9c6kibRqsjQ==
X-Google-Smtp-Source: APXvYqwRsMZIzgtMm9PjM/wDEc1b+iQECFwJDl5qR7SKY25EAW1uRTYN594zAimidcRMGQDbKdn7eg==
X-Received: by 2002:a65:5c0a:: with SMTP id u10mr9999299pgr.315.1572881977164;
        Mon, 04 Nov 2019 07:39:37 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a66sm5819761pfb.166.2019.11.04.07.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 07:39:36 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 4/7] gpiolib: add support for biasing output lines
Date:   Mon,  4 Nov 2019 23:38:38 +0800
Message-Id: <20191104153841.16911-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104153841.16911-1-warthog618@gmail.com>
References: <20191104153841.16911-1-warthog618@gmail.com>
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
index 7d8ff52ada42..de08d1a4a3fb 100644
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
@@ -3144,6 +3145,9 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	}
 
 set_output_value:
+	ret = gpio_set_bias(gc, desc);
+	if (ret)
+		return ret;
 	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
-- 
2.23.0

