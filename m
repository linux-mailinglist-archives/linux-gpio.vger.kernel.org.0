Return-Path: <linux-gpio+bounces-15198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F07A251A1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 04:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 652607A256B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6341DBB38;
	Mon,  3 Feb 2025 03:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qyrkX7SN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD31D9688
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552379; cv=none; b=R3K+9XaztDrwf3uxkP5kyYZADYooZkVtPPhnvuQFWqbBm3hw7kbfbvd91DhlRQ9CTGA0OFPrQqqmlDHGV8a1ml+xl+mCtcbOjrvhyEtJvIb+g9YsuqkqMUD7wIg7nTH2qB4ov1hGifNEZ8qhe84MA7ufVWKYO7fjR8CIyc5ySTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552379; c=relaxed/simple;
	bh=xO8cH1CFMF4UXApKu8/ysA04MUGZtHuGSgRmuumTW8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9RUqn7P+JBEz4P4zE3V4dW/FreQB4JxuchC/MDztjHeaaaoZPs6oy+rm/6HMU5uy8M3eW4JVHjkUPSbxxzr+50aqtI8BCWLB5ju00mD/evqdpxGZZzTyUEppYAeXSth5OFV2g4Dz2FyPOiowA+5O/JTO8PBmvhb4EHYMnNbNLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qyrkX7SN; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F0B193F171
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552375;
	bh=Q1KkqwEQeDF8kvWjV8IZaCfD/CB9EQIzfOrcms/yLv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=qyrkX7SNiG5+UBZmg2m0u+J4XRBZxR+mhq3gnud1m4LmekLgOR6Wh642RlPrEnc4o
	 5URDZ3TvcIv7rKZNktJpePqsHmWx0EAP68A96p2Jlfm7+ljulNKaC7UEfZrBR5r4BD
	 hgypIHwnRLCD+m62CuB5SuDJnawGpQFDDplLPGok4FRwIc+2mIuhXUJSSHSUcXNZ/l
	 uJAJie3fPWj3+aIx0imD/n8kFAChurKlKApqddP4SQViL78PP7bPIXnwUCsYY6Byyj
	 nanz2DcuC5RRpU59V+8iiliEmZXZVAeDWpXZ/Jc5uOYnM4u4eHDQO1a76CbrW+vl57
	 lxQB0a5Zi9xoQ==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2165433e229so85615365ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 19:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552374; x=1739157174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1KkqwEQeDF8kvWjV8IZaCfD/CB9EQIzfOrcms/yLv8=;
        b=eE+XgT4TrrkBKqqP5dhl2SNrTMkXaT82CuBk0/vC1eMuQebBN1Ltex2M58bh+InRW/
         LhFVnr9lyIbXlJdi5gmvfqkT8YXyYkMaaPfFX6r3Xe3gyVpu0J++uat/PzutRUkkJKoq
         DqCzQG/Q4EZP7k3Uq5UE9/AtUldE2JECMvgU/k+ZDMOTm4aQH+lIzA5jnjruvKhiOYHn
         05rstc3yhLcdNPgyIFh97UbV5WpXAMWiWvPFXIi+6w3F4LEPLJov7lAIn19KouhwF8uL
         neeO9SJDrFvJOiM2pMDUGRNCMY49bAjEtqFbuntwNiYbIDd6EqNVIqKCZv/6fytWfne7
         I8Zw==
X-Gm-Message-State: AOJu0YxTvIPFlG+R07CmUTMx3yRyFUu3NR+sjk3H7iqvV09CO3ipKQnz
	ROCC/G9ZB3Ksc4GmkxNixx+4Ck84p4i0AbLHeqCPzV54z5Sn7aMXVrcedLlnRfjEIcZBKSaIA9v
	YyRiK3lkWTtrKnfkQbtJQD6gB3iFDN9nqP+FXXpIApkmqaCwb7DmPyl6/MQxqhbplXumjR8r+17
	KJ3e+43uc=
X-Gm-Gg: ASbGncvn7q+l6uuER3JdqwNXi0sFzIe8CEz5Au5B2QYzgl1jSVjSyeGEKCWs1iVKmRp
	VCm5TUKQDMcnUXIXpJ+Kg0y22afPLxUqGIoFEeOHv+l5KPVvUVf6UIWOjGCTEqzpcAQBv3VTOAf
	G6oZxZJB+Cam5KfLgTzslOWG9pIhNi8Kt8QNBA8Ts2lj5NRsvGMMgrr5zi8Oghxd4YIqv+35yRJ
	F6R6QAq8GJcMWWldxVtWDtGyeZlyGwzb+3fR22nNxphkvvCHB1xWagpfMr9dEiDDjP/cyOUpZIU
	K+Ie
X-Received: by 2002:a17:903:2447:b0:216:6901:d588 with SMTP id d9443c01a7336-21dd7c66599mr326364315ad.15.1738552374125;
        Sun, 02 Feb 2025 19:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR9MoLCLJxLkNlFxcqA8WCKNHLXRd9lv4QEaLuhYy1EVJ2xo3+n+a0zlf35BvyGIVKprQjxQ==
X-Received: by 2002:a17:903:2447:b0:216:6901:d588 with SMTP id d9443c01a7336-21dd7c66599mr326364135ad.15.1738552373836;
        Sun, 02 Feb 2025 19:12:53 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:53 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] gpio: aggregator: cancel deferred probe for devices created via configfs
Date: Mon,  3 Feb 2025 12:12:12 +0900
Message-ID: <20250203031213.399914-10-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For aggregators initialized via configfs, write 1 to 'live' waits for
probe completion and returns an error if the probe fails, unlike the
legacy sysfs interface, which is asynchronous.

Since users control the liveness of the aggregator device and might be
editting configurations while 'live' is 0, deferred probing is both
unnatural and unsafe.

Cancel deferred probe for purely configfs-based aggregators when probe
fails.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index e101b78ad524..174078e02287 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1313,7 +1313,6 @@ static struct attribute *gpio_aggregator_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
 
-
 /*
  *  GPIO Aggregator platform device
  */
@@ -1342,8 +1341,22 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 
 	for (i = 0; i < n; i++) {
 		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
-		if (IS_ERR(descs[i]))
+		if (IS_ERR(descs[i])) {
+			/*
+			 * Deferred probing is not suitable when the aggregator
+			 * is created by userspace. They should just retry later
+			 * whenever they like. For device creation via sysfs,
+			 * error is propagated without overriding for backward
+			 * compatibility. .prevent_deferred_probe is kept unset
+			 * for other cases.
+			 */
+			if (!init_via_sysfs && !dev_of_node(dev) &&
+			    descs[i] == ERR_PTR(-EPROBE_DEFER)) {
+				pr_warn("Deferred probe canceled for creation by userspace.\n");
+				return -ENODEV;
+			}
 			return PTR_ERR(descs[i]);
+		}
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
-- 
2.45.2


