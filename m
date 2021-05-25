Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4C338F9E0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 07:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhEYFWT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 01:22:19 -0400
Received: from gproxy8-pub.mail.unifiedlayer.com ([67.222.33.93]:37071 "EHLO
        gproxy8-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230218AbhEYFWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 01:22:19 -0400
X-Greylist: delayed 1430 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 May 2021 01:22:19 EDT
Received: from cmgw11.mail.unifiedlayer.com (unknown [10.0.90.126])
        by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id E116A802E9E9
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 04:56:59 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id lP7glnr0h8qK0lP7jlcuTO; Tue, 25 May 2021 04:56:59 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=VK0YI/DX c=1 sm=1 tr=0 ts=60ac839b
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=5FLXtPjwQuUA:10:nop_rcvd_month_year
 a=oz0wMknONp8A:10:endurance_base64_authed_username_1 a=vU9dKmh3AAAA:8
 a=ih8mQXEslZcGCoKzrYEA:9 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=VdnD4uDwX5Sv4iXNgJb4bVnQULj/RgmEk/ImrVSPxlQ=; b=hEO0OT+UG62j3hIcRkr0d19jZP
        fbn1+stLFrqVVaWFV+nSkquMWYSe1/dQJ0zPozmgtMhrgX854WYiWDermeCz5DqpqenVYyc/theYX
        N/lggt9Frp2XsSKprXgUmyaWHD+57gL2cAGBij/bK+hsr8kpJHmmSRvdGX3orpbn1WGSHdFBorUuL
        HKue5YsD4UTJ1T29Y3uoOnysmsRuzLcf0jS3SMdverN3v1VZKWOLBOeYm5a6sJMw3it0rOqloiqpt
        4nj0izUUXmoclHmpQSM3/Y50NAW47xgqTK9fX5WCswhNd6Ghi1r0YzilH2mV+ljxfaCwK0OcOOVJ/
        AoZb++Eg==;
Received: from [117.202.187.62] (port=38780 helo=localhost.localdomain)
        by md-in-79.webhostbox.net with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <navin@linumiz.com>)
        id 1llP7g-000nRs-66; Tue, 25 May 2021 04:56:56 +0000
From:   Navin Sankar Velliangiri <navin@linumiz.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     vilhelm.gray@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com,
        Navin Sankar Velliangiri <navin@linumiz.com>
Subject: [PATCH] gpio: 104-idio-16: Fix coding style issues
Date:   Tue, 25 May 2021 10:27:17 +0530
Message-Id: <20210525045717.20652-1-navin@linumiz.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 117.202.187.62
X-Source-L: No
X-Exim-ID: 1llP7g-000nRs-66
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [117.202.187.62]:38780
X-Source-Auth: linumcmc
X-Email-Count: 5
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixed multiple bare uses of 'unsigned' without int.
Reported by checkpatch.

Signed-off-by: Navin Sankar Velliangiri <navin@linumiz.com>
---
 drivers/gpio/gpio-104-idio-16.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 50ad0280fd78..55b40299ebfa 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -44,11 +44,12 @@ struct idio_16_gpio {
 	struct gpio_chip chip;
 	raw_spinlock_t lock;
 	unsigned long irq_mask;
-	unsigned base;
-	unsigned out_state;
+	unsigned int base;
+	unsigned int out_state;
 };
 
-static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int idio_16_gpio_get_direction(struct gpio_chip *chip,
+				      unsigned int offset)
 {
 	if (offset > 15)
 		return GPIO_LINE_DIRECTION_IN;
@@ -56,22 +57,23 @@ static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int idio_16_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int idio_16_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int offset)
 {
 	return 0;
 }
 
 static int idio_16_gpio_direction_output(struct gpio_chip *chip,
-	unsigned offset, int value)
+	unsigned int offset, int value)
 {
 	chip->set(chip, offset, value);
 	return 0;
 }
 
-static int idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int idio_16_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned mask = BIT(offset-16);
+	const unsigned int mask = BIT(offset-16);
 
 	if (offset < 16)
 		return -EINVAL;
@@ -96,10 +98,11 @@ static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
 	return 0;
 }
 
-static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void idio_16_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int value)
 {
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned mask = BIT(offset);
+	const unsigned int mask = BIT(offset);
 	unsigned long flags;
 
 	if (offset > 15)
@@ -180,7 +183,7 @@ static void idio_16_irq_unmask(struct irq_data *data)
 	}
 }
 
-static int idio_16_irq_set_type(struct irq_data *data, unsigned flow_type)
+static int idio_16_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	/* The only valid irq types are none and both-edges */
 	if (flow_type != IRQ_TYPE_NONE &&
-- 
2.31.1

