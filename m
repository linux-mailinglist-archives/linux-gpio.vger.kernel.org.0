Return-Path: <linux-gpio+bounces-29900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68501CDE5C6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 07:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C284C3005AB7
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 06:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEED28150F;
	Fri, 26 Dec 2025 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="cI+vNnf1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239E26E6F2
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766729076; cv=none; b=XgT86/6P9Tjo0poiuRM19WMgFKy2TPUUUdiPOxjeJujgxDzoIdf56VT/mlDLnU/c3l1atCHng3zRluzYoskiEcBowwVyGzuvxbS0WPSdV6eWpEOewm+FC7S0LqH3KEJmPsnoeUalVfE1UYrfJh0QeyqZKAj2k0SKuhkfV0HAsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766729076; c=relaxed/simple;
	bh=OKO8pPQ2u1PVbIbGFtwSsJ8PUCHGOqHmtWYFr7S9Uf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=astQSeF1PTeti0YoK0ZA/7Ti3qmFnfcQDumkyMro4Ci8n1ZPMNfQsHTu9QielPoGuj6SiS0MIRBwM4wWG6Cd0fsNhLYYGluoayprJnrTzQbcn+1k1Pgm2z/Z7e+PuWP673c4isk34TsTuPbf1bm35T6woxDXF3m6OZiOp8w+LIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=cI+vNnf1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f121c00dedso9437345b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 22:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1766729073; x=1767333873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4xGho7aYPu0F2BOeXnW+h7VL+kSgq0Xp5r0+dbQtUA=;
        b=cI+vNnf1uUnYbrrx3IjPLs1moi2coHQLtkzNejX7Pka+zTg4SPoKVrG3eklXax2pxZ
         jQCnPgjliO69vuZ7XpyxKu9czN4+9I9PixYceRrjER6FBxTB6k/0d1PaExmnT4txHmSN
         6AiWVMgenegnSMkuieLZ3ev9x7b++OLyzTM9Sdvfu6DiI7A+qvGsKZ/dTT2Njq0ZE+3P
         fV68IDoPNYxFR1Avh63kOx3isk1NrxUtUGRT2s5usI98opgQy1PH9kIuJuC57jDEW6RG
         QXXou5u7I7ktESXevN7vaHELmLrE1rq7/Odc0wTqN0RkzkI+luyhiI3R3rXGRtkaiNY9
         Z/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766729073; x=1767333873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4xGho7aYPu0F2BOeXnW+h7VL+kSgq0Xp5r0+dbQtUA=;
        b=JZ/9SyJqQ+99QBqH6MmfBr+tXBmIEq/d0JMVX+0Jzt8Rzs++iRrlKmd/sV20DKCPxZ
         N6OqAvdaA6uZ8QVJwrM72m0nhhwfPjAPT27aV8IhoIfyPIwCW/DZnon9WAIYC/Q/wJXg
         AiiG9fHpn/sAQJ0FsweCI1g9w1+vje1iEA9MIExz/OIUc35+S0tJ9XJHLW9L2ChCTNWu
         60akGDXPYJHBQYuvsIUp7EgZnicE8wLiY0SCtmO4/U6VLpI8FouJF8OillVDe0G3n0ko
         +kAOE8xEHVN8e0EeXEd1hnEw5o7RbPQ3nZFGOvIfpKvMGYg8Ck/N0vnx5Z3XbXZXXEca
         NkQA==
X-Forwarded-Encrypted: i=1; AJvYcCW9vkKlULY2NE+FlDpFI/I8Ykdq+gzTV/zP+/ufV7BEYVMouspbumVNAX9jN3ja4onsCj3J8OreFWtU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg20T7sYKOgj2DmiQ3frTVXsQvnqUcbz6Zmuub9rxNYzvwrWDZ
	ovb60zKkfr7CuHIzDJKJN3ES8nsvRZ82rX/fq59WvEwZszuYHi6ak+kquF69dEs5wjfa4Kzehnd
	xnuJV
X-Gm-Gg: AY/fxX6QpWWd/Xos8mAiuWMESODNss1MR6mOUxVPAU7bTB5oIhfiQ6O70QOVS+l60BJ
	kPFgILjtJR9U4eIz0RVc6AnY9yuvkDH7mtwkM/4XXT2cZWEVifunWHafRSaJxM5aFfua0CPl4vj
	p4fAQeurgiVTmdee2EA7SzUXhUWkuhBi4q7v1AaYARW+MRfZYXAow9ZTUnAMNqMQRbltoYgVTRd
	RDGDobc3r3H13VZGUB9Mm5EjdlSuqgjL6+P3wkq8tLBytyBlmxoF17u5lXEC5tBLqxWNEOYKs4g
	r5wBNuRWAVbwFCGkIf0NF43qacansbPHjlCEkfUUk7rD4SlG8uG7HJooQcMTJes6EH3SgW8RF4i
	eWWyuRFeY3t4+C6oJDEdr5cOPb54vNnGA5gHJnQai3YdJ9lHpNxxDfF65C2LHCQoCW/ESbl5DDd
	zuGu6BQlqDoEY7LQ6s8rykr5dd
X-Google-Smtp-Source: AGHT+IG+gJCqvf6cX/cvf23QXKpxJilzTTZX3/LI0nMqhPGbDIqafJa+NVZYkW9sVgMEo5U1DYe4PA==
X-Received: by 2002:a05:6a00:302a:b0:7b7:79ca:9a73 with SMTP id d2e1a72fcca58-7ff646f9664mr22376207b3a.10.1766729072784;
        Thu, 25 Dec 2025 22:04:32 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm21262129b3a.45.2025.12.25.22.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 22:04:32 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: linusw@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] gpio: mpsse: fix reference leak in gpio_mpsse_probe() error paths
Date: Fri, 26 Dec 2025 11:34:10 +0530
Message-ID: <20251226060414.20785-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference obtained by calling usb_get_dev() is not released in the
gpio_mpsse_probe() error paths. Fix that by using device managed helper
functions. Also remove the usb_put_dev() call in the disconnect function
since now it will be released automatically.

Cc: stable@vger.kernel.org
Fixes: c46a74ff05c0 ("gpio: add support for FTDI's MPSSE as GPIO")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Not tested on real hardware.

v1->v2:
- Switched to use devm_add_action_or_reset() to avoid unnecessary gotos,
  as suggested by Bartosz Golaszewski.

Link to v1: https://lore.kernel.org/all/20251223065306.131008-1-nihaal@cse.iitm.ac.in/

 drivers/gpio/gpio-mpsse.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index ace652ba4df1..12191aeb6566 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -548,6 +548,13 @@ static void gpio_mpsse_ida_remove(void *data)
 	ida_free(&gpio_mpsse_ida, priv->id);
 }
 
+static void gpio_mpsse_usb_put_dev(void *data)
+{
+	struct mpsse_priv *priv = data;
+
+	usb_put_dev(priv->udev);
+}
+
 static int mpsse_init_valid_mask(struct gpio_chip *chip,
 				 unsigned long *valid_mask,
 				 unsigned int ngpios)
@@ -592,6 +599,10 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	INIT_LIST_HEAD(&priv->workers);
 
 	priv->udev = usb_get_dev(interface_to_usbdev(interface));
+	err = devm_add_action_or_reset(dev, gpio_mpsse_usb_put_dev, priv);
+	if (err)
+		return err;
+
 	priv->intf = interface;
 	priv->intf_id = interface->cur_altsetting->desc.bInterfaceNumber;
 
@@ -713,7 +724,6 @@ static void gpio_mpsse_disconnect(struct usb_interface *intf)
 
 	priv->intf = NULL;
 	usb_set_intfdata(intf, NULL);
-	usb_put_dev(priv->udev);
 }
 
 static struct usb_driver gpio_mpsse_driver = {
-- 
2.43.0


