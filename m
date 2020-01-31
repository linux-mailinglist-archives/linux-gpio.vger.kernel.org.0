Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BDE14EC81
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2020 13:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgAaM3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jan 2020 07:29:38 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:53298 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728484AbgAaM3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jan 2020 07:29:38 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so2754269pjc.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2020 04:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZgAZqbd/45dU5A0ct1fKMrQ98x0sfUmGu1qOa70gxg=;
        b=Aa3v3WVsnWkTePS4WJIJqBD5YAbm3MZa/5bpi+CgG++5hev75c4ZNr55emztLt6W48
         MVfmvQjTkgyIw/WU/yrSZwiPl0EYYo8p9tvlYGglCs/c9MzOqcmrEQWDszvgwpKnkHPV
         fqTzOzafdi0hMtB8haWPRUw6xlvMz4M4EKX39OCfQOqBHwsE7TxZSPfYNLrefxv4fwsN
         V2uMP60mFPYB7I6Y5Yx0jcDc1Nk9KQbmGtzy91Bu26r6rFAe/x9m2Cuz4Tk6vckSDPWq
         kYQlBYoKmhlmnoy24XtUNo6B46XDtxQ1vtct9V3IHQHJC8pYbctfZ5RK7o4egv9nWQgI
         MG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZgAZqbd/45dU5A0ct1fKMrQ98x0sfUmGu1qOa70gxg=;
        b=WfeCcOSANvCWleuRlS4oCUeMY80tWGzX2i8ZWjbk1iiGGSken1I65lUzcfUhwzTJUo
         TqmicWYEOK37TyZPoFxXg/jWghsbrK4zN1t5AimlJOvx2d90ErwTvJcbb5MYYD92yp09
         u7mMGxH+6EvFvgCMSkY15rt/SCszI9ckTySnfS5yuec7ItydYFYDIjGi/UFxE1TpGv7l
         bru74/WxNPDnxIDPUygYW8KuK+9wzRmIKaHd5oIJlP09mScq071xTYjwOjaaN/U47DUx
         15s2/Q2zhm0MxTtJyAZnCiGmQMoVIUwT2FNbXOhBnWSf6CiFJipd2DPzP3QZfY+lZdjC
         JT2g==
X-Gm-Message-State: APjAAAVQxG4nKlqvAJcZnYsqh+5nDBH1p6eRPeWLJ7jj522YOU4A6Xbf
        y/glDsH4T0VGD2r521BUbX7PqQ==
X-Google-Smtp-Source: APXvYqx9B3qhyHQqFHQjyJX/0jf/B6c36Y1S+jEvCiGUxju3zJIcAgw1DHI9supsJbjk/39NrlFaOQ==
X-Received: by 2002:a17:90a:a115:: with SMTP id s21mr11791095pjp.23.1580473777526;
        Fri, 31 Jan 2020 04:29:37 -0800 (PST)
Received: from localhost.localdomain (36-239-237-206.dynamic-ip.hinet.net. [36.239.237.206])
        by smtp.gmail.com with ESMTPSA id d14sm10551187pjz.12.2020.01.31.04.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 04:29:37 -0800 (PST)
From:   Axel Lin <axel.lin@ingics.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: wcd934x: Fix logic of wcd_gpio_get
Date:   Fri, 31 Jan 2020 20:29:18 +0800
Message-Id: <20200131122918.7127-2-axel.lin@ingics.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131122918.7127-1-axel.lin@ingics.com>
References: <20200131122918.7127-1-axel.lin@ingics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The check with register value and mask should be & rather than &&.
While at it, also use "unsigned int" for value variable because
regmap_read() takes unsigned int *val argument.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-wcd934x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 9d4ec8941b9b..1cbce5990855 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -57,11 +57,11 @@ static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct wcd_gpio_data *data = gpiochip_get_data(chip);
-	int value;
+	unsigned int value;
 
 	regmap_read(data->map, WCD_REG_VAL_CTL_OFFSET, &value);
 
-	return !!(value && WCD_PIN_MASK(pin));
+	return !!(value & WCD_PIN_MASK(pin));
 }
 
 static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
-- 
2.20.1

