Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A94025DE62
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgIDPtf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726941AbgIDPq5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:46:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCF7C061260
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:46 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so7227471wrm.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/FOPTskD02+rqmTy1Q+lvepWRalQafDGjAwi3K9HfYU=;
        b=DWSFeeLRu39HrwTsgIJnFObS4Eo0vIUxkcPBLAQ8iMkew4JxxJi2HeGJEwHFlAzsSC
         V4nymy+PcpCDVaRs1xvaygnoO+ldD8YU2XK9eLt5FRlZOI3wYRcprZQ7u0nHSojZmi94
         J6tKrqYyKczLhXpI/uxNrYUoFv129bNqR7YAXvmIq+RP/NU7cK0nUX6Fgw98DTzmsGkN
         OUBuerym7ms3eO6VilqR+cBH+FVtnJZ3cGCpmkzMc3e+F/SDdlMcOPxZi7D0wzC1gYPs
         CrL5Mb1Bqwd4ozdqBulR2kAIQQ2V2cv5mN44+Kac1+HItigj9IaT5KWXHVJcsq/QfAOI
         pTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FOPTskD02+rqmTy1Q+lvepWRalQafDGjAwi3K9HfYU=;
        b=XGBFaHxldrbxULA9A4rJrvJxKy3ZOnwijVHlxYhz9yN3KTRwIDGAA2QEn13ZwQ7EJG
         3cXv0I209KVz57D98ZLzXceK3t9sicA4YBTHsAnhOuP5/U5sPsE11gRM1OhHnBDOq8Sb
         4x9ZNhySntlczBnIeurO8IwbM2z3IaL1Ax4/7MG41Ks5tA6uXVnUX2j2R+I5zQfxyvhB
         d8W9eOf2ov5Gpz8KmiaglkPCHRhZtGq4yq0ZAkyhXQDmZwz+vwr6VWt76UzXg0yDkdE1
         G0Tnqi8v0oBvZEQE0NrcCJSBKfRGQOx4jUgbzLoXDQxlspUnHZmcOTK4TMMaW1fiSvYP
         LG7g==
X-Gm-Message-State: AOAM533SpzPW93McsTID/4ZQzv5rtrOf+T8JX0KWZ08vpDTf1bLz1PbD
        AxncOig3FJqoQjqKggvxQ3PBqQ==
X-Google-Smtp-Source: ABdhPJw/DYVsfbaGxg5IdpYA3yk8QnzF9jmg3mpJzGx7H7H6XBFu4ZqlmzQ4gBrGlTt8uzkbc4SHKQ==
X-Received: by 2002:a5d:61c2:: with SMTP id q2mr8972511wrv.25.1599234405459;
        Fri, 04 Sep 2020 08:46:45 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 12/23] gpio: mockup: define a constant for chip label size
Date:   Fri,  4 Sep 2020 17:45:36 +0200
Message-Id: <20200904154547.3836-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We'll be using this value in many places in this driver soon so define
a constant to avoid using magic values.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 801fba6496a4..e8a19a28ed13 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -32,6 +32,7 @@
 #define GPIO_MOCKUP_MAX_RANGES	(10 * 2)
 /* Maximum of three properties + the sentinel. */
 #define GPIO_MOCKUP_MAX_PROP	4
+#define GPIO_MOCKUP_LABEL_SIZE	32
 
 /*
  * struct gpio_pin_status - structure describing a GPIO status
-- 
2.26.1

