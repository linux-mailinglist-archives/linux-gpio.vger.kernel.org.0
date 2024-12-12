Return-Path: <linux-gpio+bounces-13816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990F9EE875
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5215168367
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0760421B8F5;
	Thu, 12 Dec 2024 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Ic/tPlrp";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="S7Fust9P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FDB217F30;
	Thu, 12 Dec 2024 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012538; cv=none; b=fX8UUSi2EqiJkls9E/NCvJA5AQHvYYcKTULvksTtvhrZ1kplU+Yg4llJsMwTaSmfNsEDItfrRzS2yWejKLS313oIF92AdNSV+b33nc9+ubKDfAXmELLTtwre71C8uijSqfIHJ00HEsojVEs6ZIHdqlzrCZSft9Z6cWpqtaB8P5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012538; c=relaxed/simple;
	bh=32lkfdGyRWnIdd5Yn0piwJWTS6nq8NIkj0Tj30J3H8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGg6hP8knkuIi4quHYk52Tnq8dDMLKfLtYSsjdzX2TBKUnqLOHEDCzndmPOzIphnMVkifD80g9Spr4QFh1/4l+gPStDYtMnquy6o6U/UN1axhMd2PM5RtIQy23ipAk6zcXugX3qYptXOIKaDaBcwZfGTCBWkg64iTk5t81shgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Ic/tPlrp; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=S7Fust9P reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1734012536; x=1765548536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EBPazB6x/3XAvx5Rg9TqKzgzi+wzxYH/xuD94jLtl0U=;
  b=Ic/tPlrpfK/YTGf5Mm4dX8UwaS39fmsfYsCUSB/pwRNFLNIGgQXDQzvI
   +Zftu8Bx+S/Lp5pVaQAPCbBWnWa3HFinlH0tSi5xG8C7thwyVesCrgx6G
   rNBF6FicEXuw6IBwr1qv8XMdAHmdln6mbQOEO+AZV37J8Dfmuz7AfgbQF
   fCz0h+tOCtQabBkoIwllYQkzEx+b6Pntr/TGo1a6cbqauQoPMkYSdhg04
   RSG26D/NX7T4dikV+Q88tEeMWqvhXBv1jujRMZ2Bn41oj/2A4+5UFKx1B
   sbBC+l6l1OPEHlMnvi7tjq4+14/IXfDDB8Yq8swZcl41WDfLCAarermOf
   w==;
X-CSE-ConnectionGUID: JrJkikmqRtSqcelnjqic+g==
X-CSE-MsgGUID: bQNAscaKR9G96KlwoJO7Qg==
X-IronPort-AV: E=Sophos;i="6.12,228,1728943200"; 
   d="scan'208";a="40566531"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Dec 2024 15:08:55 +0100
X-CheckPoint: {675AEE77-38-1B231F50-D910A4E3}
X-MAIL-CPID: F17B46793F879E49B6D3EF65D6C274D0_5
X-Control-Analysis: str=0001.0A682F25.675AEE77.00F4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 329B416B98E;
	Thu, 12 Dec 2024 15:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1734012531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBPazB6x/3XAvx5Rg9TqKzgzi+wzxYH/xuD94jLtl0U=;
	b=S7Fust9PUrTSmUqwC4knQmkwMvfSf6DVU97hwh27elm4sIUYHDtTDc8a1gBA7pdbr6gt/C
	qEeWr4OcjqiwN0p3W7BnFzNbw88UMwYlpxgkSATEM4yJXhUcEQn2DKdWl8918bWOQz+H7+
	98EvtQ3RPPdisseFrLOhHNfhl6WMDTdtLNYRwGw1A9F/q89CEEmFjRYQMEvabW/C5tM9to
	nqHYsy5JrsFvZCk5mDfNDNF6hSFUKST18P5UZNYpg3pU8W32U0/hHZAzGO1mOsccrq+bwQ
	29D1lLYEThLuAn8/lSam2tO62l57eAidmEKbFaX7hVym+NAe+UpjVSyv/xLO9A==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 4/5] gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
Date: Thu, 12 Dec 2024 15:08:08 +0100
Message-ID: <f60ec3cc1386d4527ebb864d1b069683473b7a5a.1734001247.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a helper for the common read-modify-write pattern (only used in
tqmx86_gpio_irq_config() initially).

No functional change intended.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

 drivers/gpio/gpio-tqmx86.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index e55ce4503e70b..4bef13cad1807 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -66,6 +66,18 @@ static void tqmx86_gpio_write(struct tqmx86_gpio_data *gd, u8 val,
 	iowrite8(val, gd->io_base + reg);
 }
 
+static void tqmx86_gpio_clrsetbits(struct tqmx86_gpio_data *gpio,
+				   u8 clr, u8 set, unsigned int reg)
+	__must_hold(&gpio->spinlock)
+{
+	u8 val = tqmx86_gpio_read(gpio, reg);
+
+	val &= ~clr;
+	val |= set;
+
+	tqmx86_gpio_write(gpio, val, reg);
+}
+
 static int tqmx86_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
@@ -118,7 +130,7 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
 	__must_hold(&gpio->spinlock)
 {
-	u8 type = TQMX86_INT_TRIG_NONE, gpiic;
+	u8 type = TQMX86_INT_TRIG_NONE;
 	int gpiic_irq = hwirq - TQMX86_NGPO;
 
 	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED) {
@@ -130,10 +142,10 @@ static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
 				: TQMX86_INT_TRIG_RISING;
 	}
 
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~TQMX86_GPIIC_MASK(gpiic_irq);
-	gpiic |= TQMX86_GPIIC_CONFIG(gpiic_irq, type);
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	tqmx86_gpio_clrsetbits(gpio,
+			       TQMX86_GPIIC_MASK(gpiic_irq),
+			       TQMX86_GPIIC_CONFIG(gpiic_irq, type),
+			       TQMX86_GPIIC);
 }
 
 static void tqmx86_gpio_irq_mask(struct irq_data *data)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


