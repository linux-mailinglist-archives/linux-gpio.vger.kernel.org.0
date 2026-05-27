Return-Path: <linux-gpio+bounces-37586-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI3VCMYIF2pB2AcAu9opvQ
	(envelope-from <linux-gpio+bounces-37586-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:07:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F075E693A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7342430B9868
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276FE428822;
	Wed, 27 May 2026 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ijzMGwo1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F141426D17
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893868; cv=none; b=oB6HgPHxbQEhVKc5KlGylw8ofOCTUXoL5K8Bxn417BPDlqiqQMr3qXoOFgE8PkqRBWRo302HanLLx1TXBq0EHUW1l6d3UeC1ATvzSAr+dMpBIc/VmJDiTXAK6epVeXeGx9yLDpBcGMmQjVqwVlTzRW03+bwwqF3ymkGjXyw6O2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893868; c=relaxed/simple;
	bh=vQCA0xy/RK13te7H73tl2LO/O48/qivp+4DR1mKFKdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kUMn2Ksct8FIc+dbkJtiskh//8hr0BKl2zr9BOuJIwpnO7tDKv/ZXhQ4j/3SmUhY8Mu9whjRiFrUJsHiFiIC19Xy2PyLnmnYdbGwj7t5Roun1F3RawWeOCZx16uUZTNbTn1DrlCgoi55LVFGyTKoI4DVGgu4FxADqGea9EGXtnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ijzMGwo1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so70061675e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779893864; x=1780498664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdZix5ZL8DWP4XXKmNmZnm8sud2uFubqPqpDqHG3z9U=;
        b=ijzMGwo1ql2AjKRJQ0Vuk658pEbD/bdIzg/J0Y0wBv5Z6wTe7RBRAfxhpVNf2hVcLs
         4Sg7QfeFWp4nW1TbUT9NYDxC69xC3XQyoY7J2svXVF/7fxEzTr9jQYjdO1eWPe2F2zGf
         tM/hT7uLwqhTWFBJT18sOj1SQdsq4ZdGO3SNZ1RXAmGD/qV6DIyReZN2DxiI9wnLDiIY
         E26poTYGGQ+xW4wJQEXnrGjwJbbprHKBt1qQ9CyUaSn/muk/8qpedJo+P7v+AFdn5rKF
         EVKjonrCeFckcsWDiyO9yg876RRI/THjihqrUHL1mmBDcQlXGLspSf3t/O0GN8MPBGdd
         YAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893864; x=1780498664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdZix5ZL8DWP4XXKmNmZnm8sud2uFubqPqpDqHG3z9U=;
        b=HfMyOsow7Ghj/CQAtoQm2/+egTKtF6EPa1mZhF/52+e0G64loMAYNa55n/I9m7G8CB
         SIFZXoQfqA4aQZCv0TWO4xy4rm2lwqCzI0cTUrW3GcpQZcYz9tgDpfEJKFUmwkBSBgnw
         s1bmtq2iIYwN7B8NvnxQ2hKnMJZn5BFveRVLPDoLybeVNsFR7LszdvH++SojgEy3kMVI
         pmmCcIzcjOGt/3HgKcCVBzulISiN/h+aFBO/zJJNhPS9i2lSq9R6ZbE5F21BLWZZDWL+
         UySfTQb0+dv02HNTysPHWLXUQFEOC7udG74mT/hy6VsSektno9J+x3XSPfT3P/2VV/Yu
         khOA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZVmGS5lZ7UnkqMpsU7EfIFqbvZvCFhWiFExhJeP3uoB5ZB+xC18jB9hMJd2KD2Iv4JJ/j4tl8cS+x@vger.kernel.org
X-Gm-Message-State: AOJu0YzLZb09HGbC1JkpHNuHwm3ucngh/K/oUyWGTk1HQ0qAkqHObd+M
	UosccucW1fVFW53gWDApykojjEoKcD5wanF/snfBlMJXbyAQ5Ov/mJaqE579DlT3aMY=
X-Gm-Gg: Acq92OE6JCjIR/Gl4rUGio88nc42MODoaOhWCnnJR4rdyhLUDkuKRiRVmiVa629/SkK
	sAoJAKUR++LeX0fq6T73xXUzkwGLA7AF9VCZGcTRrVy7pMjVV/auOXanOnarenmzQNyQ6WYHcTG
	JACM/RTk0GdsC/g5xCg3c0r283XkQQm5P115eNropj0lqS5QzyA0bG+z5k2LY5PbsTgugGaX1u4
	SzBCtfJFQBwq2OCwqCdpaRUpwJ7FhUqkB9v1tF8CmtpYBIpnLi3M36z1YfCT7SwguyJMj3eYOK0
	RnlNdp1mWR8SLhjdtqmVOkXiocio6IkjLm+uo7sHKeYTyXvO/gMIETbucTUSbv1u2d93A1YneoL
	aGSdob/eb3wSgfjhgusYiwGAWBwe66Q9Y9AGFc9nMtOVEbnyJ3VxZCwDdzk6vW8Nboz0UpsOxNN
	bpYf+uXaZZjciRmwLBaBgajvHORRLa7Z02IV0EGDA9XykhX7g/8dMBVJ0PearUoo7VsX78uuCRs
	NWnzJB+PFUaBU14l+dTtnBgYA==
X-Received: by 2002:a05:600c:a402:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490426d3f95mr280122195e9.24.1779893864097;
        Wed, 27 May 2026 07:57:44 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb54959bsm7244394f8f.1.2026.05.27.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:57:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] gpio: cros-ec: Drop unused assignment of platform_device_id driver data
Date: Wed, 27 May 2026 16:57:27 +0200
Message-ID:  <06dfc8d1df46467269ee6113f161edac234e51cf.1779893336.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vQCA0xy/RK13te7H73tl2LO/O48/qivp+4DR1mKFKdk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwZZqEXMfe/Mgb6+8P0bViKN93EGfrfb1jkzs 430bK8rx4CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcGWQAKCRCPgPtYfRL+ TuQvB/0dSJbIkmZfCV1oCAhH3VvwY4v9jGHUMC4B/M/0raObaWNw8zxDF+MDQXgaevUXHb2j4tD 5vN/gmDTvZcqcf9cxEQAJP/SPuEaDWM0llUBOBjx42Ui4agjCmTlgm1X7JR/j6V2UlXiK7ZNlql HsL8zRvojrleJ2FVuh5ykDusdrr/jGFigymIHfDKm6mHfD3NrXXxTS5tw6amS/QgoALIfb9DFP7 IYy/puDYQvtnoA2C2cenxJWyvjllsZjGVW1jSnSnPtr7nk73lCq0SERURirRL+ZmjGAwWOEvjqU iu0IbbJ/SqHe96yQz4gtBlgpIeoie1Rtz3e4/OOitjO9LXcE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37586-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 24F075E693A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing and use named initializers for
.name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-cros-ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
index 435483826c6e..9deda8a9d11a 100644
--- a/drivers/gpio/gpio-cros-ec.c
+++ b/drivers/gpio/gpio-cros-ec.c
@@ -196,8 +196,8 @@ static int cros_ec_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_gpio_id[] = {
-	{ "cros-ec-gpio", 0 },
-	{}
+	{ .name = "cros-ec-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_gpio_id);
 
-- 
2.47.3


