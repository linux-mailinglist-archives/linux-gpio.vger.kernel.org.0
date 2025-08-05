Return-Path: <linux-gpio+bounces-24015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A576B1B382
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 14:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4D318A3C99
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 12:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5F023C50F;
	Tue,  5 Aug 2025 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2G+0A1N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FE9E55B;
	Tue,  5 Aug 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397220; cv=none; b=Rn/gu4tbrehSv9IsrWp4rAeT/K05MTpryfPBr2XqhR8wX+EzX8qQdzL7ySR12yb5l1oqZNQNbTAlk110Du1M5aQOZrR5thPf1yjTczpYp0QUgodTad0TB823abBOJdLD8efOS1AQk9Oi+xTUhrYOHRd9brBgoiuf4KDKssBSf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397220; c=relaxed/simple;
	bh=S5+mxpdhsyToUY13XUaTNc7yBfgW6sdTKlGG4nJ8ITg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b3/RhuButClckiS8LTSMhuF7X5N3v5hj+V0V11Oo/IByUcYosZj7f88MbKc/RnXLNZF4FqReZV/HLWF8EL2OlMTrxqXGLXBKm6PhobPHN5tonimnnoZBnU4VB3cgo0tVs6cllkDKiIvFQz5tqzkNud6DsRlS3nlVGCo8Zd/Hjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2G+0A1N; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so2806980f8f.2;
        Tue, 05 Aug 2025 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754397215; x=1755002015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7cfRCIAFgWDKUe3WGRq4Wj/+PxAtl7dnJ31QZ3jfdA4=;
        b=l2G+0A1N6TNpx84MB0rVljOMI0+52xxc4iTmHZJqkbJzyXUkuCPhIRwSMRQLNjtzDM
         2cy5B3gWEnGhAW+qJlqXju3o5iDdUM5V54BmJ5YW8mCUJqa9GVJhGEEXQz6+vdaqo4UK
         bJ3EPKxuJw8Pi57bbz6M+2Yg44KbVnPvgRRj9iuAlqft/+NQzSoUfg7GHf1CoUqp3p77
         MZpZ4uKc2ydVQpAejCqTK5+iMw1TzPFU7U3RUMuG0AKvKPxu588ChLNK3NKMhJIz3FZX
         FTpALtM3+RUjIvGGHk8C87T8XdQi2zrRXf2OxofocMZQ2+wk2AjSnV6JAjzShEWUNjZ0
         ctIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754397215; x=1755002015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cfRCIAFgWDKUe3WGRq4Wj/+PxAtl7dnJ31QZ3jfdA4=;
        b=E1hvoiC2Luv4f5YyzZc29xpZAgB6xlVBZG91+XZDq73hjDcnjj++MKn+jnCrOEqEhx
         U9IjakFLHUmttl5Fk15npWNpvXd1o+Phw8zRAlfSLhK3YH0RdoDB/D7DsINFuIS/52Hq
         n9SFlyB1S2tGudu6Dwigp0PHZYF1QMz4MCwCgoN1sDVMbcyh9mW8sd5KRvS0RJAs1y0N
         i5lBVDuJY1jggkWpnNVN55SwDR3pXpF2IBd6Y8bEnJCPzGv36cF854oL5fvx55hReQ3p
         Xs9vG1fOt4xOp0o7ZlbnK+MEmJOWWxnb+4Kzu4XAhcZQOlWyXM+ClgaRp2lg+Aub1wlt
         r2rg==
X-Forwarded-Encrypted: i=1; AJvYcCVSydcEaZBxv8EVFdTbcsWqMACG8j44KPRF864XYGzD53H5prnswyZ32iivslJlV6Kb2D6CeO9ab3bQJ6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoQN363PTMlnTf9BjpuFuNCPinlUWMG5wYmNZkklCYdrTN7veT
	S/yD+r0I9SyrjjpjSQIXfzbWntix2YiYv1quc1T9k7ArYUxfzdOL5UbE
X-Gm-Gg: ASbGncuxo4L/L+ZsV5zv2KwdnVTqdT9X+JnJ7GZD+xNBabUlIgE21leJTLcKLUHAB5y
	CHraaGdJdNboFoBC+HMgIR4smOnF1AQ6wu7Y9fLLB3/uyaChonyf+gpaLHqzazzWFICpzk2mW8Q
	KZbF8itL6cJHGkA1mnkic+M6EvMGXlf5Qaru5555E0itGSdbS73tH449sFVzpTPGfWETR4qJbq8
	WPXlcIdQYYgwUgRTTE3yhWJkkyGROxhwrHBqW+69aqQs4zdV8c+KrHs9wAUr6htBwJyYerYJFf1
	g0kt8vM5e4VKSPoGtWprbrgNWXRgP7zxnumSYgc82f+nxknTpnvJ8pDt4eUSwJVw794J5ee+G84
	Vu2I0tlOXqieZuLgQfB32FNjQrZ/ReJetP5g0evq2WFnLD8gTJA8h
X-Google-Smtp-Source: AGHT+IH3cNVeouVZYvhhRDTRj8ShjwiLxfTA/S2jhQh7NF8Ghnjr2qWUu1n8BlZL+yHQ0QEFGJ3w9w==
X-Received: by 2002:a05:6000:26ca:b0:3b7:944d:e5e6 with SMTP id ffacd0b85a97d-3b8d94b6c55mr10716663f8f.36.1754397214551;
        Tue, 05 Aug 2025 05:33:34 -0700 (PDT)
Received: from fedora.. (2-224-27-56.ip168.fastwebnet.it. [2.224.27.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm19768290f8f.70.2025.08.05.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:33:34 -0700 (PDT)
From: Stefano Manni <stefano.manni@gmail.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefano Manni <stefano.manni@eletechsrl.it>,
	Stefano Manni <stefano.manni@gmail.com>
Subject: [PATCH] gpio: pisosr: read ngpios as U32
Date: Tue,  5 Aug 2025 16:28:56 +0200
Message-ID: <20250805142856.18360-1-stefano.manni@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Manni <stefano.manni@eletechsrl.it>

If of_property_read_u16() is used instead the value read
is always zero.

Signed-off-by: Stefano Manni <stefano.manni@eletechsrl.it>
Signed-off-by: Stefano Manni <stefano.manni@gmail.com>
---
 drivers/gpio/gpio-pisosr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index a69b74866a13..2dc1b1e021d2 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -117,6 +117,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
 	struct pisosr_gpio *gpio;
+	unsigned int ngpio;
 	int ret;
 
 	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
@@ -125,8 +126,11 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 
 	gpio->chip = template_chip;
 	gpio->chip.parent = dev;
-	of_property_read_u16(dev->of_node, "ngpios", &gpio->chip.ngpio);
 
+	if (of_property_read_u32(dev->of_node, "ngpios", &ngpio))
+		ngpio = DEFAULT_NGPIO;
+
+	gpio->chip.ngpio = ngpio;
 	gpio->spi = spi;
 
 	gpio->buffer_size = DIV_ROUND_UP(gpio->chip.ngpio, 8);
-- 
2.48.1


