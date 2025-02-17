Return-Path: <linux-gpio+bounces-16111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B7A37E4C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4C593AA915
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 09:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CB21FDA9D;
	Mon, 17 Feb 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="fUkNMear"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B81FDE02
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783824; cv=none; b=Wzu7fjnrWiw0bzGrDLrGuadcGDntznyiA+maG7rS8iHzoe9ZdjZlGO3tJ9ujui2NS/kbMnLUstu6f/QtZxzQkwoiw0lCGsswufm8xMKOd5MmiQG5DzgzAdfACHOHYB/FL20QfrVcbddSXjxNTiDqOXmMS4mVatxKqWKhsn0Gj3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783824; c=relaxed/simple;
	bh=w6Xek6gc0q+4P9UzPF8VfQsNZL0XbyhVwrY7dVOdb04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIrjcrRoU0yuoVzQUVZiPZMLxjcxnlroGR7s9HvBvaLtQTmrEJlpIj8RmYyiAUw+rqO1SOc2SVNOBjg9VO9+ZsWFceg0QXR7H7CSO2Us76GC4jpvp5VoHuTuZaBCE3xxHT//rxfmxpXilBHcYEQK7S78zsFVjzYcFzeAr/15opE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=fUkNMear; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5453153782aso1620442e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 01:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1739783820; x=1740388620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGyYdH1pDSfyQz+Thi0FH/5o/u/GeZTZnMnZcTSpLdQ=;
        b=fUkNMearvmqB84wtwjii/Ls4O9Msn3yedlN/n2O9V0GsHlCOnb79ZLXaqanBTL7oRa
         khbINwl8jUGtOj8SspsVGMWQ679g7bpZxsdigpd+vvtALF4FgDf57C6fGxOTjKpfJXON
         urk9q51EgipElZlyCfbH15Uhs760hOvWeAQcYEiZuIEBEbsvjayRTIFUwkInqkM0k2u1
         QL+uu8Y3EMsXt0CVpevMUVIZbEKAlZMSH/l/R1E7BAIlyMBrXMFJCvpjdqPJNxrpkZHY
         mAm3qHZ8fX1Zm4yAv/KYyBOCwkKujZFeWj2t+ueqvRebmZX9VTBsRMkZN+sv8amyRkui
         KyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783820; x=1740388620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGyYdH1pDSfyQz+Thi0FH/5o/u/GeZTZnMnZcTSpLdQ=;
        b=d+vv93yWpB90n4WZB0vYNh43iqRscsAiTq26dyAW4AEyGotZasY0H6gLWlhZCMs8sS
         nuyxLzaakmodCEHGuEBEKgpIgknYwUxznFqT0yE0GN9T1La0cSoMPsUKu+tLW9OBKSHR
         8vzrChbtzg1ijSrQdOk4jUt8a7T2sU6xe3dCnyOnvqcyfAPCPAyiTmi7areo4h3eSThg
         eZiup+wWq8T2Zepoc7SsX/6SxWnhweXqZ/f2TXPdCUPSr/B8US7ZuqwmhM0MFpPJPVat
         RRveTuG3wq9XHyulcLrt0I280WdL4HDWrMpEwHB5lW8AKJC3slLxfqY7gqcd4zVPc6j3
         CyqQ==
X-Gm-Message-State: AOJu0YzlyqpbfEFHzByXK85wf/XdCWamorFgPtnenaJaNOMuX7oI6Tuy
	DLzYKKlpUGFGbFVpwaXk0qwc82CNesAnZEEGmM0ReEmtciubw0/RmS2smKkpRASwLaDAZASFl14
	=
X-Gm-Gg: ASbGncvsUbj+dabUeklaMXUDC/O9xVeWW92KOr7KFz4s/o35WMR7X1VpP7ZKrDMWFPp
	M07hZ1Fp7mTpxAkdxzKgbvwZOnX/YjSYi2TPGu0FjPfaOiPcGupMQiM/638vxxfJgCD5KBuZoP0
	7ga960FpqKG+K43erkCd5xn6vFzMrM874BvM4BHa2zZWaoVyYk9Y6UkEllKuboFi1srGYKyHZ7r
	wFeOrl1OvNz+laSjsFUbTKvhCXR1MMj8UhvaQmDrjnKXxLv+PwL7cozfbW/zlHhU6atMwZ0dBDY
	TqchfP19Ilfu3+iyLaNNDcePRzo7NJxh7eFjAIx3JKAjdHcyfMvk+hMJK0CbqrrDlX5AMm7DUYi
	GQbzWbnZmeOnRkgE3oXQ6Bg8wzMbldSloUQ5fMhc+
X-Google-Smtp-Source: AGHT+IHr5LJSgDlSbDQgsKhQvtHHkAjw3oQCRwTlQBsKrWf9bI7/1oERlhBLt0NwZu0j1L/wlFMhiQ==
X-Received: by 2002:a05:6512:3b90:b0:545:2fa9:9704 with SMTP id 2adb3069b0e04-5452fe503abmr2927294e87.19.1739783819866;
        Mon, 17 Feb 2025 01:16:59 -0800 (PST)
Received: from yocto-build-johan.c.remarkable-codex-builds.internal (64.199.88.34.bc.googleusercontent.com. [34.88.199.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545e939224esm701585e87.135.2025.02.17.01.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:16:59 -0800 (PST)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: linux-gpio@vger.kernel.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	Linus Walleij <linus.walleij@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	stable@vger.kernel.org
Subject: [PATCH v3] gpio: vf610: add locking to gpio direction functions
Date: Mon, 17 Feb 2025 10:16:43 +0100
Message-ID: <20250217091643.679644-1-johan.korsnes@remarkable.no>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add locking to `vf610_gpio_direction_input|output()` functions. Without
this locking, a race condition exists between concurrent calls to these
functions, potentially leading to incorrect GPIO direction settings.

To verify the correctness of this fix, a `trylock` patch was applied,
where after a couple of reboots the race was confirmed. I.e., one user
had to wait before acquiring the lock. With this patch the race has not
been encountered. It's worth mentioning that any type of debugging
(printing, tracing, etc.) would "resolve"/hide the issue.

Fixes: 659d8a62311f ("gpio: vf610: add imx7ulp support")
Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: stable@vger.kernel.org

---

v3
 - Use guards from cleanup.h for spinlock
 - Added linux-stable to cc
 - Added Fixes: tags

v2
 - Added description on correcctness to commit text
 - Added Reviewed-by from Walleij and Haibo
---
 drivers/gpio/gpio-vf610.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index c4f34a347cb6..c36a9dbccd4d 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -36,6 +36,7 @@ struct vf610_gpio_port {
 	struct clk *clk_port;
 	struct clk *clk_gpio;
 	int irq;
+	spinlock_t lock; /* protect gpio direction registers */
 };
 
 #define GPIO_PDOR		0x00
@@ -124,6 +125,7 @@ static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 	u32 val;
 
 	if (port->sdata->have_paddr) {
+		guard(spinlock_irqsave)(&port->lock);
 		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
 		val &= ~mask;
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
@@ -142,6 +144,7 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio
 	vf610_gpio_set(chip, gpio, value);
 
 	if (port->sdata->have_paddr) {
+		guard(spinlock_irqsave)(&port->lock);
 		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
 		val |= mask;
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
@@ -297,6 +300,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	port->sdata = device_get_match_data(dev);
+	spin_lock_init(&port->lock);
 
 	dual_base = port->sdata->have_dual_base;
 
-- 
2.43.0


