Return-Path: <linux-gpio+bounces-31811-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAH2NzAOlmmNZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31811-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:08:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AA0158ECC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69775301E7D7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1466346769;
	Wed, 18 Feb 2026 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNUMzMqw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507D3491EB
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441631; cv=none; b=DPXFubWq1aQgLCHBY4eSsSOZVB89FSlskysAjoi9C/+YxJewoO2ad1DSfx0iEBXo5ZcnwdbrqaoqmumOgMZ2Q1cPVmx56liSzM6VmHWbil/v61MFHaXpnldDpesfSyn+XWSquBRWzKqVFhFUHGqQeTCpi0w4BIQtXfC6DEoXhEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441631; c=relaxed/simple;
	bh=RXq0XwW4e6ubdWOTbU6D7ug7kjXKDpmpH/1iFtO/ZgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ap5jYa+s8i1LkJtFrAbuYq0L6Lk+LX1bGplqCF94cKBeW/sFHcHk5k1uwosoiLN1b5zyKT8pBJ8gpNr4w/5sGsIBCHzWFLzApK25m73s+yGHiD69nZQpdemTnNnO+DVCiqhD13iG8i/px+1sqn4+cv2uWhiFWDVevECqS1+F6ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNUMzMqw; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b82c605dbdso307490eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441630; x=1772046430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4inRPg0e7Orbfi1mzlwgEgLRjxuarMpN1X3OBha6IM=;
        b=BNUMzMqw0An7Shmfp5+iUg97jx73hYm8v6zrRtzpNFueAUNCUoLiQ7DtDnCXPeb+ci
         k8kn9ku9g2eR/RhhZdVaUF4WmOtY02f720hLnpny6XGCoF26gAakXMoBVf4INz0E8sZ0
         29QSAT25PBx8hP7Q4XqW7//ywe04k2vpSsJ8wUzVc5g0ErKCWFzf+Durmhpj8P9pQJkT
         Qrg0L+D0zFmjNvSrc3Oq7fgh22SmBks0/iQEqErCwCiQbFAw7Oc2MEkHChFhvH/4Rzoh
         RHjrDXXg2a4gUZYThB11hKKlurJFb2T0Y3bi9kz2DQGDT1ZYUlnv8+72HowSamaTzqjT
         1BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441630; x=1772046430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x4inRPg0e7Orbfi1mzlwgEgLRjxuarMpN1X3OBha6IM=;
        b=atdEuhzLxkesyoNAuxU+vZazB32AdJqwKmc8Ou9v56VnPbt7gtGM/BdD6ScugSn2+g
         zVZpf0uCaQXTgw7G27s3Y67uiZrFkmTs6q82N1yi7Mf45+TgN9eyr14jt5gUqh0KZ/7i
         clUlFgSRePiIjxwleJSTOpoj82XMqCa8CRmrnua3kOafOKNoZ0J2erXdHnvyfRQgFVav
         vYTnguTqk8MA3wo7ojBP4KeiaxDYPQQ/s53nwhSGk+fb+VEcMQI1E8uW7Xn47DdUmySW
         U7UjnJP599UvZ++r3c+s2pMlcAoNBSKeMuyfIuOlAJ0huniJ7OYDlh/J44xrZZcvXU88
         3HgA==
X-Forwarded-Encrypted: i=1; AJvYcCXCSTsLNhk3yoA0xZdQnhYUQb0DyotYE/3fXvICAcShT2BFMZtjVvzZE4s6LEgwkYQbU1GShNU+EXL1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7VRBWU4Tlo/FnHpJNUOSTDZh3JOtbMyIIuTgdfeYnqNp5tZuk
	swO62QkD/Jb/4T12erzkgwfsQZrlT0KNyqf+81b1ZwyHICFg2mA+/yM9
X-Gm-Gg: AZuq6aJJboL/epSC5+JOTfiCDyHZ5ZJv4CtQFnKKa5Wp6/q5O+XW04w5y0SuJTVQwhk
	wHmmmdVt6zi7PVjnqriLr615taqcrNIxSckhzDm2BvWjBpHKTZIAHAQCoDbK39HeUs8Qrw+VDfj
	wNTS1ZR+UjQzVlDNw370rw8NCO3WyMDGpA1V7UbhV3H5vAw+dOWuZ74PvNtMtnbPdMjxyE+G+vZ
	5l5sy+K5BBzJpONqM5R+x/7khrBnWbHft1En54PcOLOfOZdOhsblM8ablvlGYrviDFDQcMa60zm
	8xXzPT+g4nJegBXhy0TTMHznrsf8cYlcdW0HqC4YSS9nWTYUgjX2VbyO0rfq8/VL5gRIPAQyfcO
	ARP00o6NfBfbVXv5ObjrBM0zf62LUO8eaLTn2plT5I/vyUrTHSDHUzWihX+mGcMm5GfigtGFr6k
	wz5xCxNmMyVHEp2trBiukvdywtk8s15MwBOxmfe7JaHiyW+cQhSfwDcdXEo5ikS+xUvGH1G0b8l
	fRpFJXU9kOGDT8=
X-Received: by 2002:a05:7301:6091:b0:2ba:a341:5bd6 with SMTP id 5a478bee46e88-2bd5015e9afmr2096117eec.25.1771441629589;
        Wed, 18 Feb 2026 11:07:09 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d80sm22108652eec.1.2026.02.18.11.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:07:09 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 7/7] gpio: viperboard: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 11:06:56 -0800
Message-ID: <20260218190657.2974723-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
In-Reply-To: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31811-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63AA0158ECC
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by vprbrd_gpiob_get() in the output
case is normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-viperboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 15e495c109d2..89087fd48a81 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -288,7 +288,7 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
 
 	/* if io is set to output, just return the saved value */
 	if (gpio->gpiob_out & (1 << offset))
-		return gpio->gpiob_val & (1 << offset);
+		return !!(gpio->gpiob_val & (1 << offset));
 
 	mutex_lock(&vb->lock);
 
-- 
2.53.0.335.g19a08e0c02-goog


