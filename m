Return-Path: <linux-gpio+bounces-3475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01385B3F0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 08:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C584E1F21FD2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 07:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605E25A4D5;
	Tue, 20 Feb 2024 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXo3GbTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D65B1F7
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708413968; cv=none; b=BuqSpGmGi8+UozJPqx5lfHFFWlKjKn70bGtmSzhyYKJTohbJqcSPVKTeDevn8gDtfvABUDUMFy+LRd6mYkfh3WxDOWC6qeWvS2jVedesFqhZEnFfFyb/VTdpfNliz6NC9fCJr4e2RvhQw1UZkODKLyDp2Rlhp4Z25m+Sgw/v7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708413968; c=relaxed/simple;
	bh=YpdDPE4DHNpjlxayuYwJ05aXc197qWHMII+/6BTCr20=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AxVjPLvCTXsAjrN63miolqikCeIx2b33q7TZ1ofizqaqhwCbZdw93KdEzAmIn9Wl9Ps3xp+O1WZZMEQAFyayMjcaI7qVmI84fSFxxCnch/DLaj8mR5q0D+hevXzPKYNd/y0LCwQn98Y1mTFhyh+lcsRItVw3XQrs2aXmZbqFHCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MXo3GbTC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412698cdd77so7615745e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 23:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708413965; x=1709018765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNZwyQYwwvICpVqiadKXVsWK1U9SxtGQafHP+lcYWv8=;
        b=MXo3GbTC/E1fra2Zkdj+3871qAGxmu+7uMLEFa9NiFhPBQ4tVQCd9h5KuR4KjnIknq
         O8mfd62K6ambsTQOOA87x405o7TSvvZ/e7wiLrskeYz1ISK6sj2w0rXdnWU3eYMRW7h5
         rHP8LdiCBKR1FU0w1uBecTBlrIQwkVvqb/Wvbu7CLMc69bwj/+47D8rYsT/po9Fr4HDD
         1M1S1WUnl2gLwVN68ymOz26KA5IHVosBGXGYyCbLy3nrO/ru0cmv74ChoX4CYsFJ1kzk
         8wG2qV9G5VElFrlT8Zh0yQ6VyAEFTNAwLQ9S/81OQjWh5jFeqKDan5iWyaMwv2QBF2ht
         Pgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708413965; x=1709018765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNZwyQYwwvICpVqiadKXVsWK1U9SxtGQafHP+lcYWv8=;
        b=QfaT+K/vnDbMi0QRO1JKuBFDBHLzGcXukwXdRZoQ5sLen4YkL57Lx+u/ZU5Wnpr/Q2
         5+XLUDAC+iUHiCpRH9u3sSbnuVWbm9eDi0gAV5oFl82d1iNCCnwzaNRoqZFm9YnqEaAa
         7eiUEum1AXhrs00TYpiaVVLYEdKJEakyND5ij1MrMLFoWjzY9qI7hludL2Dql2tgQTd2
         vmwQBoTXIjoSXOOZUpomBYRAv+PCO+jIlBCbp+/3m667zBUJmyiuzKHO3bEJgOOQYTWN
         riPqkapkKgCJg69TaT73He7pjD0MPpb62hAjbHlp9E7MzPr8x9+Z6NKiv/fy5qj1XHmq
         1HSg==
X-Forwarded-Encrypted: i=1; AJvYcCVLTLBozfeMsLWsCSbv37VAVQsItS1MGVP3fQMEaLMPFz3EeQwuVRkLRjXkGjrVqd5sBEQnoIAy7rUHKE6k6EqPXsxU2CA1t1hApg==
X-Gm-Message-State: AOJu0Yz619YyZYz3vWSOyhG6nZzUEN9fJ3rHd8/wGlrfknBZnnDWGexv
	dk02OeuXmFZQykBep+16MWArWpQtZrbjdRqb8DGPpGeqnG2eFrIn73xihpdgA4c=
X-Google-Smtp-Source: AGHT+IEw5KgIYzeU54cJUVtTf8fT33VF4MIb5EKCpcL+XJ4gOKZdQ1NEU9t3SR6QWnKAVWfVBx8hqg==
X-Received: by 2002:a05:600c:3ba6:b0:412:3a88:245c with SMTP id n38-20020a05600c3ba600b004123a88245cmr10902902wms.2.1708413965005;
        Mon, 19 Feb 2024 23:26:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b004127057d6b9sm398668wmf.35.2024.02.19.23.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 23:26:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: constify of_phandle_args in of_find_gpio_device_by_xlate()
Date: Tue, 20 Feb 2024 08:26:02 +0100
Message-Id: <20240220072602.36111-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointer to the struct of_phandle_args can be made const after
gpio_device_find() arguments got constified.  This should be part of
commit 4a92857d6e83 ("gpio: constify opaque pointer "data" in
gpio_device_find()").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I mixed up chunks of patches, because this should be in previous commit
4a92857d6e83 ("gpio: constify opaque pointer "data" in"). Sorry for
that.
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 523b047a2803..e35a9c7da4ee 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -129,7 +129,7 @@ static int of_gpiochip_match_node_and_xlate(struct gpio_chip *chip,
 }
 
 static struct gpio_device *
-of_find_gpio_device_by_xlate(struct of_phandle_args *gpiospec)
+of_find_gpio_device_by_xlate(const struct of_phandle_args *gpiospec)
 {
 	return gpio_device_find(gpiospec, of_gpiochip_match_node_and_xlate);
 }
-- 
2.34.1


