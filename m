Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D942320E90
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 20:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfEPSXR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 14:23:17 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44336 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfEPSXQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 14:23:16 -0400
Received: by mail-qt1-f196.google.com with SMTP id f24so5031557qtk.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WpWsJDR0H/2gGClHeRoCwOvyfeAcep1Uup7C85XF2/M=;
        b=N1cSfRivox4iKq4NkN8+FUYdmA1xeVeuBXbUIt79C/WMApyC8nbc8sgqfrw70gAxyV
         B38iKcrekhxbxO8GjbOp/TgK31ROIRv23PZnJOUrOJ+pe0C+Eg4z0rujh7dfx1wxix2/
         yIbbxdbfYI+AN5M7OWUZMBT4iLb3jeO58F/qo5GtzQxEpipNSfuzWITCa1h/GBVK8K1H
         xd+zsl4WrqS0LR8D5RwLRYhL/CgHH6+KUHfs74aQN67dR4jx+mewVrFFH/68boO1zCt9
         J8y2G3rFW+mbnooZrQHy0irbyc3LSqDs9ff2y7JKbS5shBFApR3KBb8qaHjQA2/2KUA2
         kS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WpWsJDR0H/2gGClHeRoCwOvyfeAcep1Uup7C85XF2/M=;
        b=FAwIbC7nnfoSfy/U+rTG0N/63XOWcMkB+S+hot1TxHit4XsaYggPrVZGvczSWfbhxI
         7yCLityW/QLwjQj+u7RU7v9AeiZAGhIaaamqS5udGYblGcw/fppn9doK/uM3WUIsi0d6
         lYwRAhr7BjxAyVEVSYftDXN32iCtcQhwxpUtjphllWr0DD8sLCQrX5vjEFmWpAWA+dqP
         aCGo8Vxkle/QU0U/WEttYRfslCc4aZZZhtITAhPv0zBXKvR9oKBKeWHOwNWS6rgniD9v
         ng6N5kYGTdMY7lCPfUWKOdkL6aMNtk366myUIvx1qWM6Wc60E+RXn9zsb7jmewM+nKL4
         txWA==
X-Gm-Message-State: APjAAAXnyv0mjmI+ncLRtzCnj7jbNW7y+80wm6RPwwnGiMom9GQ2vDyR
        GUMkLy15sJZdyQuxwL3mn9E=
X-Google-Smtp-Source: APXvYqwyPWPuMlDeWoRDaDSFZMdcxAuYUF6diBt1ccOAG91i4x9BTlfpCarAyWdjvzSynVG8zfTrWA==
X-Received: by 2002:a0c:99df:: with SMTP id y31mr41055493qve.171.1558030995642;
        Thu, 16 May 2019 11:23:15 -0700 (PDT)
Received: from jfddesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id m6sm2817574qkc.56.2019.05.16.11.23.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 11:23:14 -0700 (PDT)
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     michal.simek@xilinx.com, git@xilinx.com,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH] gpio: zynq: add a to_irq implementation
Date:   Thu, 16 May 2019 14:22:37 -0400
Message-Id: <20190516182237.5315-1-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function is required by various gpio consumer implementations as
well as the generic gpiolib-sysfs "edge" attribute.

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
 drivers/gpio/gpio-zynq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 9392edaeec3f..19ba8801a4f2 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -379,6 +379,13 @@ static int zynq_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 	return !(reg & BIT(bank_pin_num));
 }
 
+static int zynq_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct zynq_gpio *gpio = gpiochip_get_data(chip);
+
+	return irq_find_mapping(gpio->chip.irq.domain, offset);
+}
+
 /**
  * zynq_gpio_irq_mask - Disable the interrupts for a gpio pin
  * @irq_data:	per irq and chip data passed down to chip functions
@@ -870,6 +877,7 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = zynq_gpio_dir_in;
 	chip->direction_output = zynq_gpio_dir_out;
 	chip->get_direction = zynq_gpio_get_direction;
+	chip->to_irq = zynq_gpio_to_irq;
 	chip->base = of_alias_get_id(pdev->dev.of_node, "gpio");
 	chip->ngpio = gpio->p_data->ngpio;
 
-- 
2.11.0

