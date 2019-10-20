Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 277EFDDEEF
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2019 16:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfJTOoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Oct 2019 10:44:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35081 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfJTOoG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Oct 2019 10:44:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id c3so5260333plo.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zppTvTzfyAYsMLsI6rPRpyuhTC9g+t2YwxeJc0+37uQ=;
        b=FxP+ewo5R8tktR6h69PAR0G3MrhReNHwEl/iTesqctmQi5ea2EM1FhJSo27rulm5fy
         LmxMn/HJ9LqZYUdrZNkcz3kVNhwBMJQ9zEiwHkyUTRcJm2o/CnQpxHmfBZtIRhqA/MbK
         KgXmegwobI1bE11YD87089VtqdyCpkq3EkgmkpEnnQgkXt8XSdbp/fCJHOdjT/7/Gy7H
         Rn1i5Z5q1FdKfKld+CkTEhWFtwH/xfYp9PxRnNUbKaG77hj8/iiEx0CTc7/312EvxHXV
         nf4gXvBDhN6+JUYaRX0hoDFl03n8UXyw/EROcknil6xSZXx2uL9L0zVidqvKtSai5oGa
         ZlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zppTvTzfyAYsMLsI6rPRpyuhTC9g+t2YwxeJc0+37uQ=;
        b=OYWHLqI5Nap0BOnCCtgT1TO4gTic00dtVEEC6sJMSmXwfabhZ4sHmUJpEunOXFx3Ub
         BQwKrN6qZ4iXUuh1i6W5btg22qes5iZWN5hDzhJDuwZAPkza0ZcWQqEfq8qascqe24xU
         6t5gXZZV1qM7fz0iYQ5vOlcoD+ojMR5dBAUO2LqaDXQ6zAEOHf2mcEGpFBGqqTOsWcLa
         ShfxvaGZUwf+TII7Mf2IUTHowJUser8zxs9XrJ8VX9buCXCdqMpxvzXg+mlpeWHkhTSG
         wxbGF+Emb2M790oUj+XfF7COSnS9WGoC03KPLEekwJxYHRDYTpM2UIvRs9GZH8+H6zfH
         C5sQ==
X-Gm-Message-State: APjAAAWRh2kbdSeJyxJRW/7GEdVqcgMEXwlcg1loKH4dHscWjf4lAF4+
        t8/gFBC3cxmcEWcV5yc2Jvz8bQHyuEy+zw==
X-Google-Smtp-Source: APXvYqzzPos6d8hjz+x7bmw+P51z3VTHAKrCyeofnRHqSFS8t3On64DnbpMD2saL7NhULbOs0R/b2A==
X-Received: by 2002:a17:902:7207:: with SMTP id ba7mr9833575plb.172.1571582643799;
        Sun, 20 Oct 2019 07:44:03 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id w14sm14671842pge.56.2019.10.20.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 07:44:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 2/5] gpiolib: add support for pull up/down to lineevent_create
Date:   Sun, 20 Oct 2019 22:42:35 +0800
Message-Id: <20191020144238.14080-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020144238.14080-1-warthog618@gmail.com>
References: <20191020144238.14080-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for pull up/down to lineevent_create.
Use cases include receiving asynchronous presses from a
push button without an external pull up/down.

The patch also restricts the application of bias to lines
explicitly requested as inputs to prevent bias being applied
to as-is line requests.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 604dc17b3207..eef964417521 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -554,6 +554,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
@@ -944,6 +950,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.23.0

