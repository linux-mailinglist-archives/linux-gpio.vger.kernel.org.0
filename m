Return-Path: <linux-gpio+bounces-24329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3FB24060
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 07:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8899418814CF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 05:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64142C17AD;
	Wed, 13 Aug 2025 05:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Df9ARZeA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1B62C15B6
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063513; cv=none; b=gfL1N3+pRMCTNlYvLJcX0z7z4xosK1Q1k1OTmB++b0DFZSYTe4CftkOhXMBYp7nUk0erikoZoS+4tyG2UXqBoBBAeW5/NMMtyNyMLowOCaD4RdEDdtcpqhWcat5rvF/foxHSZgxM3WTodKvsWofXMJPzwSYi32ogskxgCM6LYFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063513; c=relaxed/simple;
	bh=fzZFTkI1YBLRXgkGQyHlhNXlI5c2OYsZxUptOiBrYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jU3BcKBaqtaj8YK+b0QxRK8jHuE0d4BfIJy4sRJP5bTTimzyAeMLo3lFOgkuhb6ZE+Fdh2Rh9ule2DuKGm4YbnK57BXmn5QfpsOkSC+ogfMG1J99bcLkGYhCygnRIn4m26iU/Bp+ZNkpOEuWnf/AhuwXolxSc6zYFI1+jmsOmcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Df9ARZeA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45994a72356so3169025e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 22:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755063510; x=1755668310; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSRz9abu5aQzELA0uOlQhCMedyzZapyIkMjBs3LXrH4=;
        b=Df9ARZeA3DrLHSWNEEnxWrQ5gIArFSjE3/zj6q1D2rwFo1m33TqPayQF2RPq54ZPe8
         FSSgSx4BwtVqIW2h2/2ORogkFKfg0uevKKLsvHv0BJIwQmxUPeFVcuk6wdrSbxfNVq2I
         owUPYrAhzzfrBf/Z198xYxwtlLG1eeSHovTXQSK2UPCpVOJiERyOcaG5SrdAkwmx+P+y
         YxHR/JrZNeVsnPA+d08HhkfDlOOeiU6X/qrCjtmkCnCwXeLjWo0UMQHDEsYDpnczpBlD
         s7hRvPeK4zpF5nLqh7p+X+FWDfjoK3FXWyWu+0f2e8WKRpYMvHqgSqD4422ifRkb4cYh
         Et7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755063510; x=1755668310;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSRz9abu5aQzELA0uOlQhCMedyzZapyIkMjBs3LXrH4=;
        b=RQI9mWyH8xX0mJvFiLGHieAhx4KkF62x78CQZ5tORoVV1DXAOU4w52r0vnq8RsOV94
         k3l4WUKFPtTS68lXXaDLnqKGdtyqvLPBGblCbrqdayT3UKxGnJ9GIhHCeHml2JfcliIY
         LJQ9WZvJiHw8RjsrXH3xSQrUuvuMlKwcawLCZOEJMEjDXSGJCZIDmtUMY4FpIgRk5A50
         O31frL0i9oDULUa/xo9fkLFmVQifNuXaBHFvkfjXnJGxgKeLk2kVJ2L9aa2t5m0bx2xi
         KugmDGeEIu1h+YbV0UOS0NyCwqkwk07eiEp4zJlbQihTqCMsb70L6ehOioG/GpyzslGX
         fgKA==
X-Forwarded-Encrypted: i=1; AJvYcCVOS1N570y3A8N6i1peQryS/doQlL3g7kN9N/kjIvk8tm/ggGItS8FA1Mr2jLb6e6OAX9sEK0HAJ50D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TM3QVKagWl49pV7Jq1v7on3Kjm9CkZ0D1+1Xcio60IIcyZn6
	GEHv8WhVY1L4SBQ4gO05BP/YlIChw5fFH08CTxmx8pxJEqs2BJSm68Cu+uw4Yi80ln4=
X-Gm-Gg: ASbGncsqe9YKnkIbjdjiPkz4o+bKn71YVGoSVvkZPv9EbMCtUngXTF0R37UmOlQoSpz
	DUhLtb4SJNJG4A47Qg8lMcIVNqvY90ByBEIwIhUbR/DKsu0RZNGeZ/W47mYZbNL8eArTqjzf+Zc
	e/NAjv1KBr8VjlH/hsht/EqBFTeG9qsqkApaK/EFM3tPQpKIdSTHXshBXVGM48yboBgNdv63Err
	u5Gl+GUm1NNhfkb+bz2h0A8SAKMtpbEyQk1rwqxtWQsEi00xHYJjiwWnxLQfZVilChewfKKaQNT
	VhYFOBRhgMQSQWEFL9hiUBBCTz6gJNKlFhiPRq1UwQ+ffYV1m0dn69Bzp+r/X5NbxvU7hX6cFyw
	LiisFSYYXEelrJdu4EnyuE1WEi9zW2GwONQAeW2PZuY4=
X-Google-Smtp-Source: AGHT+IGMNq6WH1GciQTu/GojZM34h++XkL1Bi0HrE5XDg11LZyg1kX6e3Xci6YYgAcoFOrKZq5y/RQ==
X-Received: by 2002:a05:600c:c097:b0:459:e002:8b1e with SMTP id 5b1f17b1804b1-45a178db0f3mr2971585e9.13.1755063510347;
        Tue, 12 Aug 2025 22:38:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3abed3sm46298579f8f.10.2025.08.12.22.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:38:30 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:38:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: aggregator: Fix off by one in
 gpiochip_fwd_desc_add()
Message-ID: <aJwk0yBSCccGCjX3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "> chip->ngpio" comparison here needs to be ">= chip->ngpio",
otherwise it leads to an out of bounds access.  The fwd->valid_mask
bitmap only has chip->ngpio bits and the fwd->descs[] array has that
same number of elements.  These values are set in
devm_gpiochip_fwd_alloc().

Fixes: c44ce91b8ada ("gpio: aggregator: refactor the code to add GPIO desc in the forwarder")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 0ef6556f98b1..37600faf4a4b 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -744,7 +744,7 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 {
 	struct gpio_chip *chip = &fwd->chip;
 
-	if (offset > chip->ngpio)
+	if (offset >= chip->ngpio)
 		return -EINVAL;
 
 	if (test_and_set_bit(offset, fwd->valid_mask))
-- 
2.47.2


