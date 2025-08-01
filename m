Return-Path: <linux-gpio+bounces-23930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E373B17D5F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 09:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E28F7A3699
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 07:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E2B1F4E34;
	Fri,  1 Aug 2025 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q/gE5Hqe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6FF2AE72
	for <linux-gpio@vger.kernel.org>; Fri,  1 Aug 2025 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754032748; cv=none; b=bPpQrAbL77+54icUQq6noxfDMfOEe4g7cWf6KLIYJ4BI2SxKn6LEPoMNMxP5x+VwYFoDJ6Iid3qJepLLG2kmpIKeXTbHZLB6xLldXuUboRL1ER3na9chg/UUnIjb81WjfBEOXJnTaZ5JOgaEcyDFrZLXFtBsLbAivtWqKp5hoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754032748; c=relaxed/simple;
	bh=TYjLHC/Pp0ytAq/FGSdF8xCtocdkWfrMCnL4dVfmpek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y0dDn7RBnBFkwAM61hJRJZmI829Lch6RkUzUUGrfZ/YnT/5NMgIPsQQmF5PuqEHXDdm6UAxo1WI2kjmUJ/EwNuYI0LCdKm5XWK3WXR+HvY7xnEIPhU1Uury9wLfM5JZhf2BcRVU2fc7w/HB7GKN5NcuQ8KljbnLDcQofaPynfHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q/gE5Hqe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45617887276so3118525e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Aug 2025 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754032744; x=1754637544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yXoFBX87IgNPakRa1KKSp0Mi46FaeH8eAGWkq4o2TU=;
        b=Q/gE5HqeJnWUs+tMwL+u2zW6Mncsjy1lfI6SGsW8pO389PAug8xln5jfj77TzNBE19
         o+t39+oVhXePvu4iSPDFIkuHmHi8UDfjuTjUoNlsq90sYYx5/OcZ8o+CEPU4xAUkbxU7
         qd45WPrCyLyt+pA7zs+r6c1OTlouXmdqzD9KW3PQdI0itiKmPMTpPN8qshjpps+SAW3P
         N3p6ohgBAufI+lkd0FnQOPmhK0J9J9Ek1vUZiHBrVRZ+JhLfc37no7sjUYaIuGqdSUbg
         eg+Yy53qCXprmmFkBtEFZhKMCZGm5oQaHPIxy/XttzXhBxBQcAjfw6yDGYj99gFUUNJ9
         d3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754032744; x=1754637544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yXoFBX87IgNPakRa1KKSp0Mi46FaeH8eAGWkq4o2TU=;
        b=XnWhCEbNTubN6+inR9WSrNoZe4R6novucsj9KbqIYUPNHqMoohDdOWhPUfg4iYPBOe
         Ex8TuZI8b5IifYrhMv4dnWSCODZ0c4y651zklgJp+CxUHr9jWgu+2vWQh+1hbqhwf6Nr
         aBAnIrCjVJtMxYUX/kSwO9AAPSERyfmr85eCvSsZGhU1NeEUKGi+WP72JwhgaKcpIrPP
         81PXtvC3iUzwBTPWd/CM7tLea7AxTDnOwlnrf4n5qypF3CBf/+JTW/Z+RhTkXcTZk0K/
         XCyVzJPEi+fwUfPauaGWSrzsvVRphsb4XEnjhkBdDfSDohKhSlhTvbsey0gl16vNlWs9
         q6xQ==
X-Gm-Message-State: AOJu0YyhsKLDEpyeZz0IGmzSUshAJebUcsHXc+BEPtoE/WKWPUyzkc7t
	O8ho4A1rZpjEaVESLTWq4hPK4zeQQv+zplPOjxwuJ3L4lcFUtRtu560RR4IT0431nyz0Zv5aMxg
	bVPSS
X-Gm-Gg: ASbGncsxx87E5C5g6fk8RGe7wTwlk8+HUoWLRRAuzD2ni+TyRAimPbvsaDcgq1OWlXr
	fkiC+JYEaGHjgDdnfJ3HrSa7tk2AuNKAf89BbzPDMoS7nQ+yvuBzpDvFBElH0h6TKA/sd0S7awN
	g/greSiCAUw8aRNpKs3fx3AdvLybNwX+L10gCjX1jSe/nE78CKCWR07yndnjEtIDG/VOD0+5EFf
	o7PnJp5ox/y6fdo3fdG9w9ku/cToNmOe1AwONmHHuGCDFHb7nbJsyv2s+oXe/TEsLeHJ3cmxr+O
	XDBX3GMK40c1favux/p3bkL7KU5eoh6AjWfPaG00BvL+iseIMrvncV9mXIEJJBdiGmZQdhFiBws
	boPkDEn69r91OLfOJSc7biDwu
X-Google-Smtp-Source: AGHT+IFrM+1qPEm/v+IAgtQORrTytS39rb8W00LNW0JxurkZHcD7rv5qHPyt47qa17w0y5R6I+pY3g==
X-Received: by 2002:a05:600c:4fcc:b0:456:1a87:a6cb with SMTP id 5b1f17b1804b1-458a963c968mr15328055e9.19.1754032743750;
        Fri, 01 Aug 2025 00:19:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a700:e8fb:ed3d:8380])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edf5683sm54621895e9.7.2025.08.01.00.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 00:19:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: [PATCH] Revert "gpio: pxa: Make irq_chip immutable"
Date: Fri,  1 Aug 2025 09:18:58 +0200
Message-ID: <20250801071858.7554-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This reverts commit 20117cf426b6 ("gpio: pxa: Make irq_chip immutableas")
as it caused a regression on samsung coreprimevelte and we've not been
able to fix it so far.

Reported-by: Duje Mihanović <duje@dujemihanovic.xyz>
Closes: https://lore.kernel.org/all/3367665.aeNJFYEL58@radijator/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 13f7da2a9486..cbcdd416f8b9 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -499,8 +499,6 @@ static void pxa_mask_muxed_gpio(struct irq_data *d)
 	gfer = readl_relaxed(base + GFER_OFFSET) & ~GPIO_bit(gpio);
 	writel_relaxed(grer, base + GRER_OFFSET);
 	writel_relaxed(gfer, base + GFER_OFFSET);
-
-	gpiochip_disable_irq(&pchip->chip, gpio);
 }
 
 static int pxa_gpio_set_wake(struct irq_data *d, unsigned int on)
@@ -520,21 +518,17 @@ static void pxa_unmask_muxed_gpio(struct irq_data *d)
 	unsigned int gpio = irqd_to_hwirq(d);
 	struct pxa_gpio_bank *c = gpio_to_pxabank(&pchip->chip, gpio);
 
-	gpiochip_enable_irq(&pchip->chip, gpio);
-
 	c->irq_mask |= GPIO_bit(gpio);
 	update_edge_detect(c);
 }
 
-static const struct irq_chip pxa_muxed_gpio_chip = {
+static struct irq_chip pxa_muxed_gpio_chip = {
 	.name		= "GPIO",
 	.irq_ack	= pxa_ack_muxed_gpio,
 	.irq_mask	= pxa_mask_muxed_gpio,
 	.irq_unmask	= pxa_unmask_muxed_gpio,
 	.irq_set_type	= pxa_gpio_irq_type,
 	.irq_set_wake	= pxa_gpio_set_wake,
-	.flags = IRQCHIP_IMMUTABLE,
-	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int pxa_gpio_nums(struct platform_device *pdev)
-- 
2.48.1


