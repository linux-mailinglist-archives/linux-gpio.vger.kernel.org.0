Return-Path: <linux-gpio+bounces-37025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N5vcNTzGCmqg8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:56:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B001D5683D2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C690530198BD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F603E2749;
	Mon, 18 May 2026 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOVn2SWn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B99B3E0C74
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090863; cv=none; b=P4CWPUdLwNy7I+2Pm/guDp1QWTX9e9LEf2s1EHobfygP1FvMyGXjSrmnwLXSbc3JyJZPe8RCB8J3cxLvu40E8R8d57LlcVRRLQBncJCdU3Ov3LNpJqeKC3n4i37X/btodmWcvGLsRqtamQahSx0LoGt6vnvWRBoyzuJwEIXv07M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090863; c=relaxed/simple;
	bh=TzAiXOXdFdd5ooTM1upT2oXPj+V4/6Q8UObelMDcd6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRVSwSKIuAXre01ABYJM9yjTikN5RJ0bVSChh5PQVgVV1U0OgTIIohYQXo3rMTGL5P9p41PLQBhn0fDVS1nAME8VKFCVJT5KEnm1BRwVKlECCW1uOBTeBwPIaLV1TVs1i+P/uCgrwt1VZ4hgcF8t3iNzr3CZw9fx9+3dHAH9VIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOVn2SWn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso1696369f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090854; x=1779695654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JK4uuLcystNEzU6NVyAqom5nzqSXsoYns1Ebnwqzbs=;
        b=eOVn2SWnZ0MMOxLDBT5aqn5j7APb+AerAJla7lAarjqoEy7/WsTIpdSXYN9p9Eba8Q
         yAhbV6Ic33n86am7D7GpMAVz67KVVOsyISgWSC4SmgCEvjiUHLWXMBj1BDMB0QvhEne6
         BxVnIXaGmbxtF379P71QaNuuZ7RACxRId48l/Uzo/7fb0zTqM5bU+KDXNN5nGX9iY/Og
         mNVuymRoEXynMHrcD1ChNXhRZc+Hzvlei44WdL24siwiPJYgBvT4KxXTQ6iYVdKHYayx
         vdjw3797cMcxuTMnQZyRPvbXu+Ig1L3Iri9s7N++BU/EIIjBpcApEZEbCofLwvikWnNy
         ztcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090854; x=1779695654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3JK4uuLcystNEzU6NVyAqom5nzqSXsoYns1Ebnwqzbs=;
        b=QdOLA3f7OkA8FLRFt7/r/z3+8h9fr6BQU7mQcTKASTURD0vyaONN5NLiUrMDtQRw1l
         CApoufp/Hhgn3j2+AES5owTeGdNaEPTcPctyWPhxokZluLsAu3EripzvYxJQpuv2z+Vf
         LCJOC2xKhZc/NR8fhA5vUxEe3zm12gvv+Rm4bTh+35xElugEYNOiqC0B7O/FgSxriXwu
         bGJjc+YtZOXIlGm2nqHr+3ZfgTVqKeMymKLCUhXxP+kctD0/tDoTz2/xYoUIiv7ZX+5c
         RG+5zMKlcOpmlFTEkSwA5JCEFKDt9lHB0JAhnBCNBF9CrcCwki57CH1rSCNGMzR0MJYG
         A3MQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jleE25GBjJ4LoU6wiWhJBzMOxRt1njlWAcCQZk68VjcRDcF+1cXhArG9uKJR7BoNVx1MxPI/E8AMV@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ4Mr/av/ipPnW7iCuWEdpg/ZlDv+oyTZ4mbHS9fwRrIhKcwjf
	PqJlM0G5ko/9xGlzbKyalWaOpiZeyfhB4mGCcCmGx+si1mzgclXVgCU/
X-Gm-Gg: Acq92OGIFbtGsVDRWka36lJy9AbDsuEcg0qxg6PRCoFeOYbL01VjwaxcjnhZmh1S56L
	U2yey7Vqy11fPtMVE4JUOm0fyOp82zf7Tzq67B8CoZ+E5wYhgMVpgmAqS0gkdaDkJ9oEsLsX3By
	ON5OdGE9DO6FinZ162jLPKC/nQhgn+1Vx05CIrg0iP2QxnjtjwJ3i1/1YSDOnlcRyZ4bckGualX
	FdUWcFUUxHJZ7EVTU7cdifLR+S5hofX2dQOjmIOWDpj/bZzR5TrOPvHod4kf0DZeEKMx7qH5a/O
	cuHaY4KQSKgDFfwoOsjilJKu+nS7CP7o3WTwcLsVRGuOUQc1DJTRRq5dKwxm7QHzoG1u2YqBXt9
	NsMMBcvPQ2U0t64f5IV9Cz36eczUogSirzpzrq32dhj+u/JN+Tcj/78ywjf+ej2QCIvAhZRqcFX
	PK1Q4ZCHsbT+G8v7KnrbuwZlLTtK+2kIAZgN2w
X-Received: by 2002:a05:600c:6290:b0:48f:f199:7a33 with SMTP id 5b1f17b1804b1-48ff1997b3emr175348915e9.28.1779090854005;
        Mon, 18 May 2026 00:54:14 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:13 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 10/12] gpiolib: acpi: Declare shared event helpers in gpiolib-acpi.h
Date: Mon, 18 May 2026 09:53:55 +0200
Message-ID: <20260518075357.112584-11-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: B001D5683D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37025-lists,linux-gpio=lfdr.de];
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

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index 6729da5a6fb7..d209a4edb936 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -63,6 +63,9 @@ struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
 void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip);
 void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip);
 
+void acpi_gpio_chip_dh(acpi_handle handle, void *data);
+bool acpi_gpio_irq_is_wake(struct device *parent,
+			   const struct acpi_resource_gpio *agpio);
 #ifdef CONFIG_ACPI
 void acpi_gpiochip_add(struct gpio_chip *chip);
 void acpi_gpiochip_remove(struct gpio_chip *chip);
-- 
2.54.0


