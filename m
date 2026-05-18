Return-Path: <linux-gpio+bounces-37019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALHeH5rHCmqf8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:02:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85F56853B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E859E3046392
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE013DFC7B;
	Mon, 18 May 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2keNu9O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC853DD85E
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090849; cv=none; b=g6bAKroHSSiSNQCzeJQW/ARUxG+8nqwoVC0xvt39ShKfHCR24KR1jDAvPcCbAD+L3zD0S1KJZDfJ9aKGGbjdbMyzEMGcT9/5XsJVmaNkqj90KRtlN3JRaZtJQ2TdNI7Cmd4ETQ1KJgHfNm2WVCbV9Qt60S3LmbyZICpGbbsQJJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090849; c=relaxed/simple;
	bh=8WXTBqMNIFhnx+3wevtqjrf8Oa5MXDmznN+ABA2Tczo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=om/FzZ5KGs32yI8bb3NyD55kuw5rNpjW/d3fnxbdLcLVf+Yct0o8olG5TyMi7RNdICyS/ojCrZ7ne8/qFUG7+BZAUyHaK2wDG750ZwGWBYlxtkOlxVfIuX9LC8ofdghQKj86PW9lVYvsVU7tPeA4AvE+H1GjthRX41++muuL7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2keNu9O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso10162005e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090843; x=1779695643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okI3jpGXkOilPpvASVElza3EnDJyjYuX7GFWIHz3VNk=;
        b=i2keNu9OWdFMUlDbwio69D4tRisuVmYEXpIDfycV7XuF59QdfBWFiKMTm8LsMc+pDX
         GXwhynpcQmFKp8cVqAwAVZg6fHxnsN6SeC2dg8007zfIJsz4PDVWx4zZeyktKO9Gt4zn
         hxiXArqgb3fi92voRUkzBwTUt7kE9sRIgceGaQ9/qNZW26QEj7uyYOVpYhA74B+zFRnd
         Te9xYL64lVT2WmegkWyon1/jyc4hPlVhXfr2xypVHglE/v4CGqR6ZBFXuYn+gPibyB3Y
         oMpAIW+W61IvC8p5+snstsyPUecpUoVgh6vfquaFQwoNRhFTgtX/+m9AZsKFKCeJvUri
         CG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090843; x=1779695643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okI3jpGXkOilPpvASVElza3EnDJyjYuX7GFWIHz3VNk=;
        b=TaDJb+6t37/pa2ZfqPv1uckKMYMCCIdY4PQmkwKIxgEJOwDaPqatQ/XzRdxtMrRmfW
         k1BIrtZLZL7injqv6dVCiDWnxmuy+36So4qV7swwQz4aCmOhh9OOuYURokZg3vkfJhST
         ST5/rPVblol5tVqivY2tBRzjBkJsymEK2vMKmRqMNjgDKp4HLqjHeDagB3Oe+11Ckyy7
         ZTjLTGrCi66IyFlN/Mial6qGuD2X9jtOGLP0bYR4EYWymplCyv+RUq/3BF/EpMEmalH2
         8Ty81Mm0TFopgPONKGZNzbbxaYlPJnjfVEU4c9zZO31HIdo/zj2dEwb7ITcOkPH4kCDR
         0Ehg==
X-Forwarded-Encrypted: i=1; AFNElJ9q5zSvnRxR7Tv0MUSSshUOxCFfwQqARqXnJYafkn6c7X6Yg9lCKKJRU8T/3l62kKjRGoOZC5futSEh@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZcTDVJOjFCVcWhUrKyrDsAJknJeSJiee6HpmugazuM5UNRBu
	C/41tDeyKRJbl4ShdyyI8oy5R+Y4V1yp7u9IPoXORIBofcRSyTe6qQ/o
X-Gm-Gg: Acq92OGkIn1NgTG6CIrvxflgiOJqP7T14eJ3gLsu/PBIntziTTQZ5btR3RByxvLsuzX
	hteZIy6r8jiHVbs+XToSVewDNqEnFPMKnhPmzkdWhyZ3BxAF7XHTc6RODI3jOW7/2WnSbv1KNF4
	iFJnzBooU4bzYi+vYSc2vz/dUA1fEgrkF8JgjcPr0hDuCcacaftnLJNkgUO3ZjxGXC12BN9ycW7
	XjjsZ40CM7HQ9s59/XBXVu8dEBTXFPTMnUpKU8UBMeceA4pOmfcY/ahYdgV6RV0CgR1869GL1Ww
	45T/25aztf+3d3WCJNPXLQFcZYeZ4GAY/TEdzXtqq/wJtdvuCDKqqheZt5C5usaSR3s/MlTrs0J
	nAFwgv2HYmJJfIk9V7fXFWPhj5R3xId4PBWZ2Z5yx9RKrSE4lzIPYQBFF9paEt33m2R+9dJYigk
	lSwwj137foEt5BNMY=
X-Received: by 2002:a05:600c:858d:b0:48e:82b4:b54 with SMTP id 5b1f17b1804b1-48fe6514873mr166371845e9.23.1779090843109;
        Mon, 18 May 2026 00:54:03 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:02 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 02/12] gpiolib: acpi: Modernize string parsing in quirks layer
Date: Mon, 18 May 2026 09:53:47 +0200
Message-ID: <20260518075357.112584-3-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: EE85F56853B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37019-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004975..761ef49b5314 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -24,14 +24,12 @@ MODULE_PARM_DESC(run_edge_events_on_boot,
 static char *ignore_wake;
 module_param(ignore_wake, charp, 0444);
 MODULE_PARM_DESC(ignore_wake,
-		 "controller@pin combos on which to ignore the ACPI wake flag "
-		 "ignore_wake=controller@pin[,controller@pin[,...]]");
+		 "controller@pin combos on which to ignore the ACPI wake flag ignore_wake=controller@pin[,controller@pin[,...]]");
 
 static char *ignore_interrupt;
 module_param(ignore_interrupt, charp, 0444);
 MODULE_PARM_DESC(ignore_interrupt,
-		 "controller@pin combos on which to ignore interrupt "
-		 "ignore_interrupt=controller@pin[,controller@pin[,...]]");
+		 "controller@pin combos on which to ignore interrupt ignore_interrupt=controller@pin[,controller@pin[,...]]");
 
 /*
  * For GPIO chips which call acpi_gpiochip_request_interrupts() before late_init
@@ -75,7 +73,6 @@ bool acpi_gpio_in_ignore_list(enum acpi_gpio_ignore_list list,
 {
 	const char *ignore_list, *controller, *pin_str;
 	unsigned int pin;
-	char *endp;
 	int len;
 
 	switch (list) {
@@ -98,8 +95,20 @@ bool acpi_gpio_in_ignore_list(enum acpi_gpio_ignore_list list,
 		len = pin_str - controller;
 		if (len == strlen(controller_in) &&
 		    strncmp(controller, controller_in, len) == 0) {
-			pin = simple_strtoul(pin_str + 1, &endp, 10);
-			if (*endp != 0 && *endp != ',')
+			char pin_buf[16];
+			size_t pin_len = 0;
+			const char *p = pin_str + 1;
+
+			while (*p && *p != ',') {
+				if (pin_len < sizeof(pin_buf) - 1)
+					pin_buf[pin_len++] = *p;
+				else
+					goto err;
+				p++;
+			}
+			pin_buf[pin_len] = '\0';
+
+			if (kstrtouint(pin_buf, 10, &pin))
 				goto err;
 
 			if (pin == pin_in)
-- 
2.54.0


