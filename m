Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88C1AF562
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 07:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfIKFQP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 01:16:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43555 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfIKFQP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 01:16:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id d15so12872653pfo.10
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 22:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BMbiIR1LyRY98dnnELG+YAf1kawqGEANpBbQC+CCbhM=;
        b=hXFF7s+PuFW/NxL4QbBtCtkypBM6BCKYfL5Y4lDxq0MOLXR5iPqBGXyy6lo6DNUTzf
         bfCuPZIzKyEo5zHuuJ4/fcTkFLpI0wmW7ZILWwHnD4bjemvW3FE/mnuDq5PIvxzlDSvW
         H+OdfrFmDdj+G6wKnx6ypaSLghjQ0p14FssHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BMbiIR1LyRY98dnnELG+YAf1kawqGEANpBbQC+CCbhM=;
        b=Kj0ZdEphy+19q7dZBB9nCf2IMijnxGEdpEb65GMm264oe9ELnhCZQJWidFAkMN6RK1
         E+ugF5AnTiEeh+egvPLFJmclk6ZT/cVABL7Z4VO2M86v+PT7uKSXxX+7ykiK2KTRn3Gm
         RoLirK/NwpR/+UTbRBXLkDdztrG3r97oCDeljbJqT77OfC01Q7mxYUlvOMjTBf1qjQz4
         eZoxj+UWauTiJlpiHOTFgtq7kJKm2Tx4o+348k9Bc7/1eIMPlPN7Rlmd9EW9Zrrj9jIa
         4YdZ0LDHOOM1iX9m6awYIzEI3RujHRwAsjQobB46DT81bW1L2HW4qmi/gF9JwXL5RC0d
         nlCw==
X-Gm-Message-State: APjAAAVDvo2StQsijTKjOdbInopOCk+A90hHmwwHNzvOhAH6z7CmY51G
        27YJs1APXV7+xm55ksMXl4x2UA==
X-Google-Smtp-Source: APXvYqwYQWfMQ6vWWOF3mSdlh/pc8D0x/hHtJukanbuXtbH4cOkp3f+6D5/1gN28cXGa7MC9q4xGzA==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr30755038pgc.409.1568178973942;
        Tue, 10 Sep 2019 22:16:13 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id h186sm33650986pfb.63.2019.09.10.22.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Sep 2019 22:16:12 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v1 1/1] pinctrl: iproc: Add 'get_direction' support
Date:   Wed, 11 Sep 2019 10:41:25 +0530
Message-Id: <1568178685-30738-1-git-send-email-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add 'get_direction' support to the iProc GPIO driver.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index b70058c..d782d70 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -355,6 +355,15 @@ static int iproc_gpio_direction_output(struct gpio_chip *gc, unsigned gpio,
 	return 0;
 }
 
+static int iproc_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct iproc_gpio *chip = gpiochip_get_data(gc);
+	unsigned int offset = IPROC_GPIO_REG(gpio, IPROC_GPIO_OUT_EN_OFFSET);
+	unsigned int shift = IPROC_GPIO_SHIFT(gpio);
+
+	return !(readl(chip->base + offset) & BIT(shift));
+}
+
 static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 {
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
@@ -784,6 +793,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	gc->free = iproc_gpio_free;
 	gc->direction_input = iproc_gpio_direction_input;
 	gc->direction_output = iproc_gpio_direction_output;
+	gc->get_direction = iproc_gpio_get_direction;
 	gc->set = iproc_gpio_set;
 	gc->get = iproc_gpio_get;
 
-- 
1.9.1

