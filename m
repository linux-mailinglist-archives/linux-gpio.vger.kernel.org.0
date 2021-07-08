Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1823C15D8
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 17:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhGHPYC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 11:24:02 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:45844 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbhGHPYB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 11:24:01 -0400
Received: by mail-lf1-f51.google.com with SMTP id p1so16720906lfr.12;
        Thu, 08 Jul 2021 08:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vSXN7Kh9x6gUYLLQwWC/sSb0E4UPI2sT9SAOdpYbkPg=;
        b=QX0vL98es+y/BQNXMBqfb3IPiTURZw0irJ8w/w7nqNPD5fYIgonVsa/GbWWE/U5Bvl
         nFMn4xCEK0uyBZY/W794KPr97788o3DJTa//bish6ThatEK2/yoKoA6Kbq8oM0iO4TDG
         jbBtxieyTxhQwdJN/GY2hkORe5xEY9odwyDsI6uqelxeD6pJ0zdbo+QT1//keHtKdorF
         8tnhuY7/y3wquik8tZL9X8ZWsiz1ALW9Uo9pheA/n9o5jcpzMuPtAJpJRCfJnCU9yH1d
         DZogYz8gVjFWtco4DJosD7JYMmmQrJLANJKF58b9dlLGGAhDKHIzgRiNLZOe1Q71hpWG
         Kqxw==
X-Gm-Message-State: AOAM533BRX0API8RvZ3+DTUN81PkgWEexK12HPtcL+AB0B7XK87vdyp9
        IPahKKxwTeAgmJUL3iCmQQ0=
X-Google-Smtp-Source: ABdhPJxWrzepObN6CSW8WNRQ+3zqT4UTWNkQxd6YGC/oJWxo3WQDcjnbsKvh+kb42dRvV9UjSjqS4Q==
X-Received: by 2002:a05:6512:224e:: with SMTP id i14mr20966868lfu.195.1625757677635;
        Thu, 08 Jul 2021 08:21:17 -0700 (PDT)
Received: from localhost (88-112-11-80.elisa-laajakaista.fi. [88.112.11.80])
        by smtp.gmail.com with ESMTPSA id a24sm221525lfg.231.2021.07.08.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 08:21:17 -0700 (PDT)
From:   Hannu Hartikainen <hannu@hrtk.in>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hannu Hartikainen <hannu@hrtk.in>
Subject: [PATCH] docs: gpio: explain GPIOD_OUT_* values and toggling active low
Date:   Thu,  8 Jul 2021 18:20:54 +0300
Message-Id: <20210708152054.361704-1-hannu@hrtk.in>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I was confused about the gpiod_flags values and thought that
GPIOD_OUT_LOW and GPIOD_OUT_HIGH set the line to be active low / active
high. This is not true, but I got the misconception because the flags
GPIOD_OUT_*_OPEN_DRAIN do change line configuration and there's a
subchapter about *active low* and *open drain* semantics.

Add an explicit mention that the initial value is a logical value (and
not the line configuration or physical line level). Also add a mention
of the function gpiod_toggle_active_low which was previously missing
from this document.

Signed-off-by: Hannu Hartikainen <hannu@hrtk.in>
---
 Documentation/driver-api/gpio/consumer.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index 3366a991b4aa..47869ca8ccf0 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -72,6 +72,10 @@ for the GPIO. Values can be:
 * GPIOD_OUT_HIGH_OPEN_DRAIN same as GPIOD_OUT_HIGH but also enforce the line
   to be electrically used with open drain.
 
+Note that the initial value is *logical* and the physical line level depends on
+whether the line is configured active high or active low (see
+:ref:`active_low_semantics`).
+
 The two last flags are used for use cases where open drain is mandatory, such
 as I2C: if the line is not already configured as open drain in the mappings
 (see board.txt), then open drain will be enforced anyway and a warning will be
@@ -252,6 +256,8 @@ that can't be accessed from hardIRQ handlers, these calls act the same as the
 spinlock-safe calls.
 
 
+.. _active_low_semantics:
+
 The active low and open drain semantics
 ---------------------------------------
 As a consumer should not have to care about the physical line level, all of the
@@ -309,9 +315,11 @@ work on the raw line value::
 	void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
 	int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 
-The active low state of a GPIO can also be queried using the following call::
+The active low state of a GPIO can also be queried and toggled using the
+following calls::
 
 	int gpiod_is_active_low(const struct gpio_desc *desc)
+	void gpiod_toggle_active_low(struct gpio_desc *desc)
 
 Note that these functions should only be used with great moderation; a driver
 should not have to care about the physical line level or open drain semantics.
-- 
2.32.0

