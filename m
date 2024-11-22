Return-Path: <linux-gpio+bounces-13199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11B9D5F13
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 13:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACCEEB26E7D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 12:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55CC1DEFC8;
	Fri, 22 Nov 2024 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lhYRuWY5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7451E492;
	Fri, 22 Nov 2024 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279574; cv=none; b=ZdY9+CN91P2qkiTbMDaZx2cA4kj2UvNlVp1fo9dDJCCs9YHdEfWAz5UjofQAORkp/NJGC4+t3F7fs6s3r+ad3SN1KO6IGPFBlpDqRzyRUm6rt34PKf72qf+sLsoXfYORuHDna9pOB9TeJgt0/4sIKpkh4eO9X/5q/AzfX1IlBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279574; c=relaxed/simple;
	bh=HbmXBgGe4VtYNsyBvgCkfTFBJyyNuOGJY1ZWEnc4+QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=skYkyifG9qOPCzWhMoB12ISsnu3/GnV5MPDDudnBPg8MQAeJUas5BTRKJWHSy+05BghV8xhiARO0i4+z81IB2eVe8RSmHvmj7j40BLDA6RTzaqDw16qRve2frgOpT4WFj2yZSUJ6Rtr8c7VVOd7PXuP+y7Ln6UepEDpF+msDHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lhYRuWY5; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ET33tjl3RNbMMET33tD1vc; Fri, 22 Nov 2024 13:46:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1732279570;
	bh=hNiBKTNhrvcmco3gchSSISv4AnKViBv+HKmddqScrPA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lhYRuWY5JHFf1WyOVjOVsqZOklg7jeJyTSDQHhSnCc6cYS0uaxf03b1c6RifR80Wp
	 YxHd5M3IpW7L51fhTBzo8csajmPHG4UBh+P075Zdc1qBAnIhUmI/xi5FJhBdl7EmIz
	 kkMzgJudkYVIA/VRbkH/4cAwkXfIikEVRQh9Z1C23vCW2wV53gBEwekLJOia4LrVS5
	 i6CwOoPrjifkhPKVbKJBIqpfwgF17moFWeaVBHxR/Dm2lBzucd197kLKd9ou2o5PCX
	 1H/R11ZLh1NnKepFa2mvcJdEYgafE10G6Sa52he9wMcr4eIqCsMY0AtszTcKl8ilbD
	 CsTNPDeZAIGIg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 22 Nov 2024 13:46:10 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: mpsse: Remove usage of the deprecated ida_simple_xx() API
Date: Fri, 22 Nov 2024 13:45:45 +0100
Message-ID: <2ce706d3242b9d3e4b9c20c0a7d9a8afcf8897ec.1729423829.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The ida_simple_get()/ida_simple_remove() API was close to be removed (see
[1]). A usage has been re-introduced in v6.12 with this new driver 🙁

[1]: https://lore.kernel.org/all/cover.1722853349.git.christophe.jaillet@wanadoo.fr/
---
 drivers/gpio/gpio-mpsse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 3ab6651d2226..6bfc447b71fd 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -403,7 +403,7 @@ static void gpio_mpsse_ida_remove(void *data)
 {
 	struct mpsse_priv *priv = data;
 
-	ida_simple_remove(&gpio_mpsse_ida, priv->id);
+	ida_free(&gpio_mpsse_ida, priv->id);
 }
 
 static int gpio_mpsse_probe(struct usb_interface *interface,
@@ -422,7 +422,7 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	priv->intf = interface;
 	priv->intf_id = interface->cur_altsetting->desc.bInterfaceNumber;
 
-	priv->id = ida_simple_get(&gpio_mpsse_ida, 0, 0, GFP_KERNEL);
+	priv->id = ida_alloc(&gpio_mpsse_ida, GFP_KERNEL);
 	if (priv->id < 0)
 		return priv->id;
 
-- 
2.47.0


