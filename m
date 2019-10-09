Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C23D0DC4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 13:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbfJILip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 07:38:45 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44216 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJILip (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 07:38:45 -0400
Received: by mail-wr1-f66.google.com with SMTP id z9so2475982wrl.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TljJwf0KxQiABT9yA9WoVggnDZWeRFmQiWV9jmK5nDc=;
        b=V2QEJ83ZbYLMDaksqA/hfUkMisrt6bC9jYPn7Cu2YqiMV/s0+RR1IKH1v+261VnYtU
         Q50+cVeh5uqgVmMsaIkjwntSC2hXN1Y6IR2y2oZHbQw9mA2XY3ODsDnEl1h8fo3KSFRD
         5jV/FP+zE16xsbY/y2TGuqUlFdCQcuo4CpHy9VDl3ShQGbMjb5BfTwFzA5T3ucMNhXEL
         1pS9c62IPdeHTD0kgYWzvNgIq/2bYZlEg+yceAyfRWdLvJtSAN3xDFgYrqrHvHjAfMrv
         tBDJzz2HSMgUzLv1661OZc7o8DyNFXFbaMzdp+Hzr41DqbkXSnravaA9PhYEmS1FuUJa
         da2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TljJwf0KxQiABT9yA9WoVggnDZWeRFmQiWV9jmK5nDc=;
        b=OPcBRr6dEEibZwDWApauCjz9jmHYneEC/gUsKCPYgJizZX2zf2dsIyiDL6BtQrsoTq
         lWHp6TqfXkLoEyN1kSBHEGdZjPyKZZCdjOCAaWbGZ8/ChAt8xNqyS0wR9WNi0jNvYUkL
         rnqCjoP7jpv94ACuKUWjlP+S2ad0AU42f0fpmae1+2KBgyhpYOM3nF1YX7j2BOSgRzYk
         WoMTvoiW25Wg7JMcZ4uHbCQytyCrcbeqh930ZuXPIHea5ZPQQwgt8YUnJ706t6DmPpp/
         z7yx5s1pFPxYcfBDokkSaaVl2jIRGtXbCcr5VOcL/sflblxluVGQn8wG2HbhcEJeoCJ8
         sQZg==
X-Gm-Message-State: APjAAAWH5ZaYLs0N30rdKFHMDHCf760zbyuZityGpJFoKyBlruRwHPH+
        UUf5InMwaM4RNc3qln3AfL23ijcI6hCoXw==
X-Google-Smtp-Source: APXvYqxVC8mUxmU7vCRj4pSgWMy0UogFKjw1aq5EThPFyiI3pJV4ysXX6NaKrr0f5yCRixoyaDFr8Q==
X-Received: by 2002:a5d:660f:: with SMTP id n15mr2287544wru.179.1570621122812;
        Wed, 09 Oct 2019 04:38:42 -0700 (PDT)
Received: from x1.fritz.box ([2001:16b8:5c80:ac01:2d69:222e:6eca:3415])
        by smtp.gmail.com with ESMTPSA id j18sm2016904wrs.85.2019.10.09.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 04:38:41 -0700 (PDT)
From:   Drew Fustini <drew@pdp7.com>
To:     warthog618@gmail.com
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, Drew Fustini <drew@pdp7.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Date:   Wed,  9 Oct 2019 13:32:33 +0200
Message-Id: <20191009113232.28852-1-drew@pdp7.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191009002211.GA11168@sol>
References: <20191009002211.GA11168@sol>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

set pull-up/down flags in lineevent_create and add sanity checks

Check the pull-up/down flags in lineevent_create() and set the
corresponding bits.

Add sanity checks to make pull-up and pull-down flags mutually
exclusive and only valid when the line is an input.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 drivers/gpio/gpiolib.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 646ae4cffe26..babc26267561 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -554,6 +554,20 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
+	/*
+	 * Do not allow PULL_UP & PULL_DOWN flags to be set as they are
+	 * contradictory.
+	 */
+	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
+	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
+		return -EINVAL;
+
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
@@ -941,6 +955,24 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_label;
 	}
 
+	/*
+	 * Do not allow PULL_UP & PULL_DOWN flags to be set as they are
+	 * contradictory.
+	 */
+	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
+	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)) {
+		ret = -EINVAL;
+		goto out_free_label;
+	}
+
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))) {
+		ret = -EINVAL;
+		goto out_free_label;
+	}
+
 	desc = &gdev->descs[offset];
 	ret = gpiod_request(desc, le->label);
 	if (ret)
@@ -950,6 +982,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIO_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
+	else if (lflags & GPIO_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.20.1

