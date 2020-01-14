Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C881B13A318
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 09:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgANIkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 03:40:21 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34340 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgANIkV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 03:40:21 -0500
Received: by mail-pf1-f193.google.com with SMTP id i6so6248374pfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 00:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZR7iL6rDkWI9c3J40FqEWMz9/qBe7v556TrmI33+1s4=;
        b=aXVhTQaO67ykw8tnN0eJMPN1TybFUSmbtAxtR1vhR+TAtJOAQStOwltVWt8pHJIa7r
         l7wDjoff48zmYXr1enbyVeWp5HNq43oO0dSQVcBvfWGna7knRzsCJKmySfejuhjWFPws
         GsJ0l7kRtcIui7hQLvJcTWWaf5a6l2DpVvmvxIpGskDW2Dy2D/6tmJnl54RpKHteF6Tz
         6UsuCmkdRI3kSJugBF4vmseZOsZOr+cD8m8iiIs2TQDXIYf8zuSsLy7DMXGyYDZG8D9D
         LVdd6E0iODG7OyBeEy1hvBXqkZzgZ+NimqDdZr0AjQutU6CEsh8oV4jgfUhbeNZnYVps
         tsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZR7iL6rDkWI9c3J40FqEWMz9/qBe7v556TrmI33+1s4=;
        b=l/m1sHuyKog8Dpr6uyC6MBL7F3zL/M+l2h5h1G4VJ9iadoyrE8U5ttYfLi4l6JOrlU
         BgVZRFoDlBazPoSFHtMV3ySKsmuZ3aeoyPnS41QPiTKU12s79S0E3fRkvKGbG6qtvn3e
         oNJLdN5F876Ig8vcmdq4mK/zKX0R8b1EzuDUUpIsdsaKB57wwUk9elhgrhuyIr/yTfi6
         V5N8JzxRsJcb3M4au7yrfS8B7jjqGSjjfG7KwzXZO4bupjpAh0PUjjPbyeZ07VK4nP1h
         6QqRBfhWUr1RqefgvAXhBKW5i5ZSok4L469nnWjn8YbSzyNszRQmgsSzVTiDwxxsQ9xr
         igKQ==
X-Gm-Message-State: APjAAAVkDUlGdojVANQKlB6/OapQ8hJiTFxoJJjZxJ5iuq1pD9UF//yD
        pg4uLN3uXmZzrf2EY90IDLer+EaDwkk=
X-Google-Smtp-Source: APXvYqwP6ThoBjPemdGvaxpS4kUjjYEkYfytsN5aBmw8XQlPuG4AGj+dPe3JyZFhPZwBfNlIdh8D9A==
X-Received: by 2002:a62:342:: with SMTP id 63mr24243118pfd.19.1578991220608;
        Tue, 14 Jan 2020 00:40:20 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id o16sm16284910pgl.58.2020.01.14.00.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:40:20 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kevin Hao <haokexin@gmail.com>
Subject: [PATCH 3/4] gpiolib: Add the support for the msi parent domain
Date:   Tue, 14 Jan 2020 16:28:20 +0800
Message-Id: <20200114082821.14015-4-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20200114082821.14015-1-haokexin@gmail.com>
References: <20200114082821.14015-1-haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If the gpio's parent irqdomain is a msi irqdomain, we should ignore
the EEXIST error returned by the msi irqdomain because all the msi
interrupts have already been allocated.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bedf611a7c9e..1cca9ab61923 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2037,6 +2037,12 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	chip_info(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
 		  irq, parent_hwirq);
 	ret = irq_domain_alloc_irqs_parent(d, irq, 1, parent_arg);
+	/*
+	 * If the parent irqdomain is msi, the interrupts have already
+	 * been allocated, so the EEXIST is good.
+	 */
+	if (irq_domain_is_msi(d->parent) && (ret == -EEXIST))
+		ret = 0;
 	if (ret)
 		chip_err(gc,
 			 "failed to allocate parent hwirq %d for hwirq %lu\n",
-- 
2.14.4

