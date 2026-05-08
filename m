Return-Path: <linux-gpio+bounces-36433-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FihFzCA/WnnegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36433-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86D4F25C1
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AA953009CDE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F7335AC01;
	Fri,  8 May 2026 06:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHGrunoM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C733E373
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221087; cv=none; b=D+x5MZAQANXpkC3ZptiZVdt7QS8BDZk8YUdynqYvbo8JxMSwKI6dQxZ258V2LmcW+BE9xpKD0lSG6mAuJwP3lnIv0nMHk7Et48W06COYU38mrfo/yp73iOk7zXnS2b+iyva5EU22PGDkBiB6nJo/lxeJzPLd2v3qaUBnXY5Wmp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221087; c=relaxed/simple;
	bh=fne91szarOWdIvniaI9+UEt6vpPwm2FRb2JS2VMwdb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVjWp5T/JMsYNkNkMZH82lg41lydR0pqDZYbHx065CtsSoI0c4A0bJYEchYTzqVDCSGYYLJaZfXOBB8GYSxLeZMwbnvtT8+W1FqcNzhti5vRt+6DPnPWH8u+eTPtn71FaOgb01DwAuwMdhBe42NM1tgy23Nk+3Z3EMvSTjdzJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHGrunoM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso14752685e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 23:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221074; x=1778825874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btkeAG5X+48Uo58rvevp6gJltGqFkkONHOsVscYaKek=;
        b=VHGrunoMVLtvYYt6xSKBzpp0Wi1jszQ/g6/9wSP8iLL/8CThUZwcFCId+4lQXny+tO
         R6Oap6ho7m4jTAXjKCbdOoLRWtkg1qiNiPgmnu+ziKttUKQU22TIJG9RhpQtpRVBJDQn
         Bg7CcF37vorUbz7gcJ8jZogys+vOFViKwaq/je/SCDa9DJVKBIw99U0dJd8rLnNfMhQ4
         FOh/7H7PtUJKqXXMmbXI/r8Em3p+omxnCg7J6Rhue5VDcUGJsGITBeOO0vVM1gSfwKeS
         A7Csr0PIEWK6UF7/ZBUV5jrIrV9yzHLYfwAxXy/ix21qBZ5uJBJsSaFdx1XEGN1vwIhT
         kp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221074; x=1778825874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=btkeAG5X+48Uo58rvevp6gJltGqFkkONHOsVscYaKek=;
        b=Q5DuuHwiWehPBEPUb7TAO8xKZs2HulEjVuWdTxY0VV1fgk8zORIgnTTuHdRfvZbVwT
         VsIL2Xq7MECoch7z0WxfoYAS3pVgaR8R6fxojtvhQg51v+4JnD8FLisudwaemLjHfVi7
         z+sdJYmBmLWMJgBd8LhgTC7DV/toPnDOD2HxQTHCEM2/WhK5dQ6lZjYp8tznKz8X5gg6
         Yzfo2T0wRBGZX/oOaDLo/5aZmDnKIWs48dhvmkCFKSD3kWio7mKqSmST5N0s4yJXe56i
         lNbvLEh3bnTwdZJp/Tqt4iLPZshZk5JYmDF/2JY0Fj8PXeXlFOYHC+1L+KlOtuJVZT94
         wg0Q==
X-Forwarded-Encrypted: i=1; AFNElJ95vGLyP/JC3SKlfLQdmNjCD8OS2NerMNqC7/x+Wgd47d5+oXxQNe27aO0/Eiqo2pQizorw9tawdbfo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0PGsS45/yddR9csMh7iCuMmkFJStgNtMdW5IelvED8REPs0Jl
	GATMbH+0Y4KgPFFqX8ddjU528jiQJf7JwWPMVF+u3ZcvHUbe5pYF1HKh
X-Gm-Gg: AeBDieu4EyS5pVV8i3niQuOkNJKq9FNZcxwvT07MdAg6XoU9b8xuIFrn5kV/rhIsMgQ
	cjiwp3TCa5JakficaK2ZMbH3NtLlon2vIbE+ILBXiNmOdVIk/cFsRG0qdN1fqLL4IAyFerHIzIq
	afiAQsVhUTFzQOhWjSYW7G/ngEVeq99F1DFNnzdmwhq4UyxsQVAAZc5QrT2uQVno/HYP0fWe7/7
	xjtmx1qPdRsVYvNa+QEwDo+Y+9FiMGlHpPvy66/HoqOpKGO/bigCohKO+i046V7t46sWMH78y38
	hMs8u3J8zcbATbzHwZ5ipvIYJDcj8p8uSGyiG8PZfBHTy0o3DUuh+8e/ARpM5Y38J5iwNjNDXMi
	VE4LnEXn3Xdv17HzmSAaF2lCVXy0qEKI+/rafLoV8lu+3mXNDxboBejl3jcSHt7bc1b+CQBp53+
	XkVK95DAS7tcXsTOs=
X-Received: by 2002:a05:600c:8b65:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48e51f4e5fdmr200842415e9.28.1778221073991;
        Thu, 07 May 2026 23:17:53 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm11251175e9.14.2026.05.07.23.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:17:52 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	mika.westerberg@intel.com,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v4 3/6] gpio: acpi: ignore out-of-range pins in acpi_gpiochip_alloc_event()
Date: Fri,  8 May 2026 08:17:26 +0200
Message-ID: <20260508061729.9530-4-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508061729.9530-1-mscardovi95@gmail.com>
References: <afzlsRkyKQzuUcgL@ashevche-desk.local>
 <20260508061729.9530-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3E86D4F25C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-36433-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add a check to verify that the pin index retrieved from ACPI is within
the valid range for the GPIO chip (pin < chip->ngpio). If the pin is
out of range, an error is logged and the function returns early to
avoid invalid memory access.

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..e53d68578024 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -370,6 +370,11 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	handle = ACPI_HANDLE(chip->parent);
 	pin = agpio->pin_table[0];
 
+	if (pin >= chip->ngpio) {
+		dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, out of range\n", pin);
+		return AE_OK;
+	}
+
 	if (pin <= 255) {
 		char ev_name[8];
 		sprintf(ev_name, "_%c%02X",
-- 
2.54.0


