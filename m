Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 764F9D44BA
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 17:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfJKPsB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 11:48:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39342 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfJKPsB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 11:48:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id v4so6331842pff.6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H8pWxllBl/HRU6dwk3RzvMewJ/lSEodvQ4T55bbhvxc=;
        b=FlY8Uu1xwdiAw2UR5YPjvulppFqfYvGkJgMrbjruIRl6xsz4ga7TTDmYKAVVnuz2In
         Z5PPiBdzmLdztmiM3Y6Yz2ZM7EhQdGrWMPe2WL3A2I5rF5Ws/fO/EMHpZcytqUq6ye8x
         lOxLUkGP4VFo7eeqsY/n5GLYqQAB4tGdtN54lnEbAo8N71T/rSXWBrbA6k2xsSL/Pl4n
         y9UCcaaEfXQ4eCQs5zkzt4hn6hofZFJ2Q0GXA52jTbm6wzQGqyShXQ6QexEXbcvvo2qn
         PAfL3LLCPKCYLidzvXoJl0CusrbiEsmpMK6Vpob4askad0RJNWmYyvuQzwNbVkC7pc4Z
         dfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H8pWxllBl/HRU6dwk3RzvMewJ/lSEodvQ4T55bbhvxc=;
        b=mZlyAaBGJVNjzxrmXXort8DsmAs6HiBDpkuadlYjPRHXlYQijWO6VnsqHrR2pe8Z09
         NW11a35rCsR/83yIkDLlPsN3zcgD3FrJHxZk2WDBl5WiGVauP5kBnq60jZ51/7LCYdrX
         NP8HuJNME7jLzeOdJEMkS1CFzS/ghgd7CxI+DkZU3N9LGRaAN2SdZV9w7JD+UaOpMMwW
         owwRrtT86nhnsgIZB9RgXaZ0ehrute5NCWAuaN5Fp3qgnDle9MCWurO+/hTYLaNC+I52
         Z41/r9vMtahBI4VjU6jQlzJk1IceXDF2tM/6J07ERokrEXi7dn5LYa94fmMbI0nYQkTW
         aSzw==
X-Gm-Message-State: APjAAAXX9Oh3WTannJSOB0Q6lpYinJ0iot48Y8BKmLCHooxe8rbHiui4
        Ee0aFU3+MyQ2C5IbMXaosx0emMDNCXSV9A==
X-Google-Smtp-Source: APXvYqwLHJ8wp6/wb+9LIXH+gmYBt3uC/VSqP0kMUl507SahYcgfv7UT7mQSunOhYY3BO5nMgPQtxg==
X-Received: by 2002:a63:1b0d:: with SMTP id b13mr17560328pgb.312.1570808879854;
        Fri, 11 Oct 2019 08:47:59 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v28sm13755404pgn.17.2019.10.11.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:47:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/5] gpiolib: add support for pull up/down to lineevent_create
Date:   Fri, 11 Oct 2019 23:46:46 +0800
Message-Id: <20191011154650.1749-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011154650.1749-1-warthog618@gmail.com>
References: <20191011154650.1749-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for pull up/down to lineevent_create.
Use cases include receiving asynchronous presses from a
push button without an external pull up/down.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 994e5d71375d..0912a00b2960 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -920,8 +920,20 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	/* This is just wrong: we don't look for events on output lines */
 	if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
 	    (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
-	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE) ||
-	    (lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
+		return -EINVAL;
+
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
+		return -EINVAL;
+
+	/*
+	 * Do not allow both pull-up and pull-down flags to be set as they
+	 *  are contradictory.
+	 */
+	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
 	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
 		return -EINVAL;
 
@@ -951,6 +963,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
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

