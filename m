Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD9ADDEF2
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2019 16:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfJTOoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Oct 2019 10:44:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32889 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfJTOoV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Oct 2019 10:44:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so6719543pfl.0
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uj9TY5/c/Cxtwqqb0czzgGiMNMMgJ+VH9m61Ry2oS70=;
        b=Ygwybu0LjS/5dvBsSViBtNgzosg/LygYFHfcmbAHfXCZ0He82QFkeONjduWJA8DvJ9
         KpXxMPqEe30j+ZaIrPxDQrQEqSam9h+9ZGypsu9TX3gCE1wAemVobZvv+hBofYOMyRSM
         wDdaDmcrLRYBajB6ZHmDojQ3wWZ859JPWUV8asUmGmTsFVt0izCyefP6QuPiTgs5SW9U
         gf169xUpOvT9QyJPvnirtcq2plff/RVIzkeB4cHXMfcygAk0jUJPqoD6maD2mUETdjJ9
         h9f+DbEHfLOpmQmboWPJPrupXgBO4pqR6TYk7wKkrO0gHATP9fi2cGLg7GdjO/XJHzWL
         keRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uj9TY5/c/Cxtwqqb0czzgGiMNMMgJ+VH9m61Ry2oS70=;
        b=SHuZxVb3VWyybWHHLyHMAn0AeOMt/J3MCtT7HaWJPBNJej0oVf40w9i/64fUTb/DII
         tjc/5VRscIjGTjwmY+VlHaa0W7XJBd6oN487a7eJbFwezA+trIwaX7xTMBPfjSfqKNGo
         uVSaYAjZiF0CZ5IWXPOHOy8Zzjfo/Tg8J0M4Je3C9OuaTbaxMtAUB7TXXflXHa4O4XnA
         Hqiz9W9JUFYKFc74t48lkD2YCtx4s9NmCaqM92HDieEEYFN+TiGmAHX7mhDjvdEbK7s+
         vpFTteH3RyXJTsCXmN5PtA+scSPKy8N6D5mMnLDpPqmcKq94zjhOMIXWcF+d2LSzHE3A
         Sl8Q==
X-Gm-Message-State: APjAAAXB7oXeUJzU7VN9Pp9TWQqre+C4NiIHZUkRB+liFPoPQNfdzxGQ
        qJjX7VvrvAMUUrsO4MDMVQgLR/w6AiQ2WQ==
X-Google-Smtp-Source: APXvYqyPFxghD4J3UsYYIfpsiDSSiE57GWn3vq6YSkKi8O6r/610L1uTMTejiTgqDzC55gYL+c67+Q==
X-Received: by 2002:a17:90a:ba8d:: with SMTP id t13mr22999396pjr.129.1571582660619;
        Sun, 20 Oct 2019 07:44:20 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id w14sm14671842pge.56.2019.10.20.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 07:44:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 5/5] gpiolib: add support for biasing output lines
Date:   Sun, 20 Oct 2019 22:42:38 +0800
Message-Id: <20191020144238.14080-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020144238.14080-1-warthog618@gmail.com>
References: <20191020144238.14080-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b6fdaedc793a..f1f6a390e7f5 100644
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
 	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) ||
 	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
@@ -3132,6 +3133,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	}
 
 set_output_value:
+	gpio_set_bias(gc, desc);
 	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
-- 
2.23.0

