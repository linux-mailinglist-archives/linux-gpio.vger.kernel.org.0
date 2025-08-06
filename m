Return-Path: <linux-gpio+bounces-24020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E91EAB1C125
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 09:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E0F17EEAF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 07:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7821F21018A;
	Wed,  6 Aug 2025 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH6E76xK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3763171C9;
	Wed,  6 Aug 2025 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754464641; cv=none; b=S2eDCx9a1EE6WBLhUp5ioSlAdwly3dvnmdQRxMYnf+3mkQF6eyvdz8MIlQAJXLr6xQFsEX87iT1dzGfcObz+1H3p8q/eG5Ftn8QdntsgcEc+yJa+tlQO4JzeDLFFtOZXNXJRmqR9UDnF7Z2B+uUgc/lbYXFYSacug4ohofZOAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754464641; c=relaxed/simple;
	bh=+ZSEZt1/qGc0bONBg5UvVIbjulkjZWa5CShPGSmjrNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aKmOYUO6AvCOVTod/518GRFP8912APZQ864Nt8gZLZK6m3agFKWlfwD69PZKNQ572u1QejkbriUMClBdeoit3D2t0UhguP/B0vuCgg1SCUchYzIMJ0CkqrCRvfC9MZhMGpT8Spf6x4MXnM8CoCd7B0TZy3TX4j0wsWwPA2fw7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH6E76xK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b7961cf660so5188756f8f.1;
        Wed, 06 Aug 2025 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754464637; x=1755069437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wo4xsl+HmpnZ98tpENwxoB2b6W1lWZeHKxTz5AAbIiw=;
        b=TH6E76xKTx2eY813CWqaj+9iOpTNz8QvGQKDEanrLofg1Tx8hfwzGy+4xgOwN45C7T
         737idU7vPL95Tuo5FNdd7QuWwkT2rc9e4J7nyX1Wi9DkKjHaVpntkq/gyNzLz1tuitOa
         7Q7fIgib+bCcsk1+BWNBxP5uf4U/JVGNSdNeZhIUriWZentjss1I45+OGk1+TPcIET9W
         SK1fEwXM/k1q1ktRKKpLsRzKpi3CtDCuiTYhTA8YViiNkR/ZiZF1nq9F1jU9FKYoU2iy
         /xcDKH7ha4pZda9LIxAg9QtCNz2xOQCd3HXI71DKYzKqc/S+NlT2DaGVRlVYH8nD6qaM
         YEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754464637; x=1755069437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wo4xsl+HmpnZ98tpENwxoB2b6W1lWZeHKxTz5AAbIiw=;
        b=OLerRqte1fYFWMcLxBup921p4S5lTTQ61j/yHWui0L5kk/RuNCnulBgZj1rMi1Cnkf
         aIIIxr2OGIzXAj1ZOGDuexwShRgXz4yIoEA1kTgOGhOSmWEIgZ0qLjPJfFA4//4Ze1yd
         LxH4AZqi7JX/fdQddi9adG6MqLNZ+WEOpxYtZJ9wmmhMwvnRxzEHx3H0ScXqHC2HFQdM
         nhR+2u3J+X9ZOlUpWdAMM5mAyF8YSolaDom2+FN6xfRyciLGlEQDYl50U7bnS5+kMyYn
         EqMry2RGRVU8RG0Bit2UKMAylMNsA9s5yE3FpY05g4iwrpIeS57S9pcRJSzQShsNqu1K
         O7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Po8a4wHYbSuA2uZme7wugHkt3eziDaOnwnP5R3fsHu2pBIp+WpZywlMEwUFxidDmp5Vn8WIp8rhJTkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOIoE++UJ/jxMxhobCVvAxLtZABN0USOfTPAn9nJQyy7Uw1oLN
	Ci0EClpA464IsAElN31gMc80w4FIcI+UU0rWUlZeLFs7paIp0P7/Zv5h
X-Gm-Gg: ASbGncsoinsmL8y8iKBxbsDIqKqe9Oq9S+BJbkq6b3rC3HA55600IkwNu1FNXbhFHmp
	Bx/PQyt0O/YESnNAA4oGL8bNlkfrQrxT+7m26/z1rsstuDM1qw2sByqNvUQtJl0RLMOqKPhjPx6
	BeMCdWSbivjsLk/HrTDwn2MoGkXTjtaaMqQUe4geQxqPEqSUQtYtQkdjPOWVIJnj3cVvBOSPy0s
	TnSwCObjJRYi/KsZkBcTU1B3DkcKkKtHsu9zwA/Dh05b2s+8bZ56H8aUYe+adUIsfHy7omPSCe5
	yjCIdDVm/f6Qf6HDQ9K1NLimRWRbTYH1IDYab9LZPU/aEWAwFxYOMweVEwQOwjYjdaXvGM6KygL
	XvXNufz+jbq5taaCQl8+Ft2OhGCLJerckpDZr2lq090t+ChhEWJsCh8wXwQNNknKwP48=
X-Google-Smtp-Source: AGHT+IE1VozE6TRjJmvdYRd8xRsd8rh4BSZ10qW1RGndwXSBK0udQzTjTYb9p90pgVh5YOO0hXN6YA==
X-Received: by 2002:a05:6000:22c6:b0:3b7:8832:fde5 with SMTP id ffacd0b85a97d-3b8f48ec1d5mr1168238f8f.13.1754464636683;
        Wed, 06 Aug 2025 00:17:16 -0700 (PDT)
Received: from fedora.. (93-38-186-193.ip71.fastwebnet.it. [93.38.186.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm23016609f8f.46.2025.08.06.00.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 00:17:16 -0700 (PDT)
From: Stefano Manni <stefano.manni@gmail.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefano Manni <stefano.manni@gmail.com>
Subject: [PATCH v2] gpio: pisosr: read ngpios as U32
Date: Wed,  6 Aug 2025 11:15:31 +0200
Message-ID: <20250806091531.109861-1-stefano.manni@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If of_property_read_u16() is used instead the value read
is always zero.

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


