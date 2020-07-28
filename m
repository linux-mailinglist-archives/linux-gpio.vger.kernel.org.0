Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDCD230BAE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 15:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730209AbgG1Nmo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 09:42:44 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30661 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730208AbgG1Nmh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jul 2020 09:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595943755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=d1H2TqJa+xnwL6Sscbi4oBQam2i37LFg06gHTI5VeII=;
        b=jJF8wSotsww/28RRwbNhNVRo0b121v+oSKuNWCM8SerkY0rKxEEFxEYltVOHVrm8P6+DWA
        IHSSKzQJ3fD80sWvp5RSPs19SardP77FsOKq/+nYgiynsA47txTUHaBwpw/7Pl9HOYGRP5
        c1o5RO2S8V2iAcJHIne7xoV3+Xe69cQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-hz7kQPeENRu2oSl61ei4pQ-1; Tue, 28 Jul 2020 09:42:33 -0400
X-MC-Unique: hz7kQPeENRu2oSl61ei4pQ-1
Received: by mail-qv1-f70.google.com with SMTP id u10so13395465qvj.23
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 06:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d1H2TqJa+xnwL6Sscbi4oBQam2i37LFg06gHTI5VeII=;
        b=VdikWK6Rsuc74md2XOl0JfVYOECaZs3cblvZnKBY7pIszaoJWSBTZyunL7qojmxmSR
         rqJ6uGOD13Jt9OISEPQAi29jDuZvlmDb7gRm/ULZe5WTmLN7riYRAW26s2tMpg/XF0KA
         xNJlUzjvksY83VvynGDREbYXeoZKTp4ocIuNg2idtpf6zgSCzan9KWot/wXix/OMqIY4
         pXFHRdRg9fM9hh7G10+nH6XoYB9Qqc8Ut8ZlCSxUrCgAg1k7wv0OI3sY2y1r9FguRKd5
         U87i3E7M1crwre/xp9mKKjeZDXCXdnQWJGQfwizHul3SwyCdlk2i6gqPb2WzSboNjMX8
         FyzA==
X-Gm-Message-State: AOAM530vV01bnmQOEQ6ByE02O7zu+RMrBOpqbzSLngPUYJjdzCb6VG3P
        FP4Is1VMoKYMh33vTu5yt3ZUKGZc0EKOKMt0qGzbMqXvTinWgeQW1mcGKCaFNeh99PbCQ1Vm9Vo
        EKGGQddM0V4S6pshJmA2Srw==
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr19233695qtv.130.1595943752832;
        Tue, 28 Jul 2020 06:42:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjoBZqluR8LTz0WpQlDuqfrVZK7AmZoX8oS/5fepe6D+QCGMesvqo/QSjTRIUOkRc+AysTQg==
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr19233674qtv.130.1595943752568;
        Tue, 28 Jul 2020 06:42:32 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 71sm13879623qkk.125.2020.07.28.06.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 06:42:32 -0700 (PDT)
From:   trix@redhat.com
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        frank.rowand@sony.com, geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] gpiolib: of: reset name variable in of_gpiochip_add_hog
Date:   Tue, 28 Jul 2020 06:42:26 -0700
Message-Id: <20200728134226.27592-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this error

gpiolib-of.c:664:9: warning: 2nd function call argument
  is an uninitialized value [core.CallAndMessage]
        ret = gpiod_hog(desc, name, lflags, dflags);

name is sometimes set by of_parse_own_gpio
name is always used by gpiod_hog

So it is necessary to reset name so an old value is
not mistakenly used by gpiod_hog.

Fixes: bc21077e084b ("gpio: of: Extract of_gpiochip_add_hog()")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpio/gpiolib-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bd31dd3b6a75..277ada41d04a 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -657,6 +657,7 @@ static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
 	int ret;
 
 	for (i = 0;; i++) {
+		name = NULL;
 		desc = of_parse_own_gpio(hog, chip, i, &name, &lflags, &dflags);
 		if (IS_ERR(desc))
 			break;
-- 
2.18.1

