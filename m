Return-Path: <linux-gpio+bounces-37018-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM0WOvXFCmqa7wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37018-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A879956830F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BBFF300909B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682D73E0C42;
	Mon, 18 May 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duBsM5ka"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C53D1A82
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090848; cv=none; b=cjgbMOCoXad4oh74T+u5owwce4xOI+wh8OfaurdQqagVuA4kcy9/9Ii4u5a7GUN/fXdcXdDp9rxLZw73PoMKrd810FroueyLGOdPrsXP0q5EiF/vO7FglzK2aszU2oHyqsd56OZ9unCGLUN5xqh0jHwNOQctDFC+0A2QvNnpc2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090848; c=relaxed/simple;
	bh=iTm+CAQk66ngIKIctcP1U8DkyFnXKgU8LB2KAj4Nf48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7pQq8D9DqZMTUs9vM/bv6VmBaJl2Ukso/6aqE6scBzPso8yP8z8SXGf3Q7mQf2X+SG90RsVv7RsmWIgNAIj1HGmbwwRYzXNurXLteEGBA2vSUoq+gRF6urI2BXCjxHKvCy4e835ozV0BiYD8MttswhJGUoLlq0ZrJ9wlsYyR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duBsM5ka; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso12048995e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090842; x=1779695642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwWV/qMNurIkUDOKP/bbi2uYeI9zTRHL+F4n5fG2Tvg=;
        b=duBsM5kaIA9mJw5OtKtwGoa2FhM/zdp8B22IgETjl8ieFIXlIXTVbuSqRuLLhau3Bc
         ZfvJolWeIQ5DNyfG0BMOAN5hdIOZu3LdJHMLBJpxaiVTF9zO4sr/1W8w5ZuCK5YO9KHO
         VCtLA+Y7ZPKSYdL1rRjTZ1UD5mJpPouBpX3Q5rEvyZn63IUkgaRY85PyO0FulhASRz8a
         TPxQBX4mdL1Ije/XcCmGA3RvKz3nXCZyqcP+tf8aRvNNoSWwd7x9KANAGtpomT5qmDCJ
         wEazdIZsW8xKL3tkQy6noYcQxzPhKcg4lLR9Ol99YCvD57v3nZnMcblVKa6EIyXCdnYR
         49ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090842; x=1779695642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwWV/qMNurIkUDOKP/bbi2uYeI9zTRHL+F4n5fG2Tvg=;
        b=pRX4bCcKI44jCXT1C/oV5T9My+213VKwxZpqR1UtR9gyQsRHKj2JxA099m/zC+C26M
         masnu7hlmVvKdi+EjqDWOnDz60Gk8PeQ0mQYFwqkvzoU6kXsX7RtlWNvHPjtYAn4Q7lb
         ea0NEiv4+7IyIQtmI5ugmfMh1R8EMSeEMRzG2sPglMb1Ud91RCI+AEuzVxob90IJ53vb
         uaWH3ThJCZG45UinPFZsl7gR1NBfJHnzmBy6AfEIsLzLlsnJwnR5/zBBnGeJ/abgscR4
         kmdvEGKg0pncvmduNJdvqnjwPnb7hzSwYR+KuPR16/isg/Erp1CiZdznsvYGDxBLhPz5
         kxoA==
X-Forwarded-Encrypted: i=1; AFNElJ91DSQ+hlL9Mji7buB5aCLHhe5WNwWR9/Wvyk/2CeKav7AEm8MonqN1xsbjk/WrZy/V0SYdmaRE/rRP@vger.kernel.org
X-Gm-Message-State: AOJu0YwBrUBoufC0J8E93o8JbQhsQviFN3TiqF+wejGnSFxB35uv+BV+
	waoTqhciUsvY0LFDmyPKwrWHkHrJYgkFH/3FCEsJreuji9UvA3wYK+fQ
X-Gm-Gg: Acq92OEuN0C9TEd7iFTBTjGrkoWVogRSPFtBbTrDEsFJVISRWS9Xp1lQ6XhfK6onxWr
	LAr/H+9rYVaKmUnOvfbjoWTGqlOGtbJgnhTSXaE5Mtd+KDqtOMlJa2liINFTru+NObNEkpEmSAK
	rkqyWvs9RhN4qUFv/da/cAuNux5qbdGGlm54kDTmPZTQf6fFBd1S5uYq/MS45TIZPfvwnK/i1os
	WjmIub+8zVINCrs5isQjKe/thLjRSwME99RjGDO6CUa/aAqJEr/mf73kZwyJ9skAKUxCytWb7F+
	tkDRzBOjAqpIpQz8npHBb05jWyaFNQp7SxTtAFYtey3M4q3bh1a2MB86iLTVZoIdkQawFayDuB5
	7ui0GN6BdCmZq/U73yboTA1mhthEQt91dAuzA3cHUQYEIPqhkwkHGlinKwm44eTFY8MlfwYtCLQ
	Q7L83qQ+bist569hI=
X-Received: by 2002:a05:600c:49a2:b0:48f:e6de:1cbb with SMTP id 5b1f17b1804b1-48fe6de1de1mr132113575e9.28.1779090841718;
        Mon, 18 May 2026 00:54:01 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:00 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 01/12] gpiolib: acpi: Use snprintf() for ACPI event name formatting
Date: Mon, 18 May 2026 09:53:46 +0200
Message-ID: <20260518075357.112584-2-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518075357.112584-1-mscardovi95@gmail.com>
References: <20260518075357.112584-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A879956830F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37018-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Replace sprintf() with snprintf() when formatting ACPI GPIO
event names and fix minor formatting inconsistencies.

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..64040b098e91 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -372,9 +372,10 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 
 	if (pin <= 255) {
 		char ev_name[8];
-		sprintf(ev_name, "_%c%02X",
-			agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
-			pin);
+
+		snprintf(ev_name, sizeof(ev_name), "_%c%02X",
+			 agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
+			 pin);
 		if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))
 			handler = acpi_gpio_irq_handler;
 	}
@@ -645,7 +646,7 @@ __acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags, enum gpiod_flags update)
 }
 
 static int acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags,
-				        struct acpi_gpio_info *info)
+					struct acpi_gpio_info *info)
 {
 	struct device *dev = &info->adev->dev;
 	enum gpiod_flags old = *flags;
@@ -1206,7 +1207,7 @@ static void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
 						    NULL, achip);
 	if (ACPI_FAILURE(status))
 		dev_err(chip->parent,
-		        "Failed to install GPIO OpRegion handler\n");
+			"Failed to install GPIO OpRegion handler\n");
 }
 
 static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
-- 
2.54.0


