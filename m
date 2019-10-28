Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4E1FE6D55
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 08:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732853AbfJ1HiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 03:38:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35670 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732043AbfJ1HiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 03:38:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id c8so6338642pgb.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mXQP59Elz4pQKBc6wkSj/ourzYJVZdzHRKBxMLch/aA=;
        b=tG3VU9HL5ltK+Yf9sTp2b1QWkHCK51tswXKNQ2+C8f/UqS8nuCJPxjYR1CMVaqhAsd
         cKQsWgAwBcmmKigpFyX30jCeQPmhWZXNJ3Dopp0rMl6yCPAhZt5d0kr/n3VZX5Aa0AZH
         V3boOp4aMSPKS8yJAth2Dpo6br/sQY2iPh1Vj8HPRoQNUSvxfr32mn/BGE6W9nVS/Fgs
         X7JoLa8ELw74JG+LoQsZ33JuuczU0fLg+u2dHyaFeqd4YHWApVc7nOJo0fRsB/+ruKXk
         p3PbRuAGDqOJ9GT7yj9O8ZwIQ7Y6kIe0C9br1zKw5CftSJbHycemfHrHw8Qkc/kErQG3
         RLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mXQP59Elz4pQKBc6wkSj/ourzYJVZdzHRKBxMLch/aA=;
        b=Ma2mtt/wFovjojI1gh3nPu6T6TUTmwIPBDSZIySbHHgQ88Qg7jGkCaF60a8u9zmm3U
         aVBGzzf42kcc1MG5Rn1EaKYb1JhhtzUk67n3O3rp105r4RgpsY0DwPpuOIjAKl+kxOeM
         1IUPsJSxTUqNHxrTb8EGL0qqAyTx1rBrvEiQKK2e+Yvx+nJ2tqt/+wSkUFwCt2n9JWCO
         AJKrZsuzGSuWTg2Vb3rVBFv40/JcexmlbGzDqZ4cyWfV7aoJFyy5kZjn0T807xD8KiPx
         UTmYCb7sz904XqAwazw8PU/vPjxadq5usFqhjDLW+WHTup91AEBdANKMEwHajIfl45d3
         Ocfw==
X-Gm-Message-State: APjAAAW/019KFE6vd73WIQ3WwlVJCZIUz7ux8u/j+hsrWDUzUgm7eRZ5
        cNR2BbRlo+5jWvFGu8UMv35yvyro6DsvTHhA
X-Google-Smtp-Source: APXvYqxDhwK2uv6/CoHJyr/nrapm4TKR21qic/nYDdK3Y6eDvLWHGtxco1ti2hMxgJtDqeFG66uOVw==
X-Received: by 2002:a17:90a:a002:: with SMTP id q2mr18895202pjp.124.1572248285406;
        Mon, 28 Oct 2019 00:38:05 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b17sm11191015pfr.17.2019.10.28.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 00:38:04 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 2/5] gpiolib: add support for pull up/down to lineevent_create
Date:   Mon, 28 Oct 2019 15:37:10 +0800
Message-Id: <20191028073713.25664-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028073713.25664-1-warthog618@gmail.com>
References: <20191028073713.25664-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pull up/down to lineevent_create.
Use cases include receiving asynchronous presses from a
push button without an external pull up/down.

Also restrict the application of bias to lines
explicitly requested as inputs to prevent bias being applied
to as-is line requests.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e80e689be2cc..7dfbb3676ee0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -554,6 +554,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
@@ -944,6 +950,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.23.0

