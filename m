Return-Path: <linux-gpio+bounces-11367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5999F294
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 18:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD585282ECF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 16:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8591DD0C1;
	Tue, 15 Oct 2024 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOX+3JVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8D1714BE;
	Tue, 15 Oct 2024 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729009285; cv=none; b=KTw6okwYVssVWdP0A3ehbxTq5GIwEct0406Q2FGEkhISoTjULbGTrOtxbCbph9IMta5bMnFE9o+gRkZ7QPaR7gmmhQGjYaHO/yI30SaIl9Fs66eD/8Bfllj5cNPlS1qCniZ1mTNlwG0X+omwj3aS0zwYt4cpAs1ktWA3r3Jb0qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729009285; c=relaxed/simple;
	bh=6NEO3vbuN+t5fT74F3+Wb2C+YHLJ0N/rpcZ6snYcpbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGiEaJKVInozAO+639VMmkRbHDG5TqlaNW6eatVW8HWn1CBizRNm7PPHqZRvFbJFPh4Y3vEmlxrp/VR25eiMquTPr3g8sjYd1xpexKBxvmov9n9k1XG0G0l+eDyCtV0K8G/5e1im2QjmJ6PsVkYRbohVVvopMJbCYwe8kSSxs+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOX+3JVU; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539983beb19so5968051e87.3;
        Tue, 15 Oct 2024 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729009282; x=1729614082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAWUM9s5lyGhWTb1ehJ6NHCU3ChMEB/laYBZwYTZb00=;
        b=hOX+3JVUmocfB5aSVim+WZQnuoYrAYO4qY1eFS0S/kWgRty3NRrRj47z/naehLhCcj
         9yG+FzKGyWG8AWwxkWlK21N+aBHs7qg6oepqFXKWNogrGSkj5mRuFekhna4R16gPRAE8
         33GuqleRiJZP2a4RJ0Y8kLQ31WMONLCl87jXQBwB1FHJ9X0/x9tEQyKnN8StXAcp7Gsn
         DnM5kQjENf95XZjuPY0tPvwS3E43LUYlqnOAvL2S0WVuBc15kpsv3DCzIGAtr7S7k0XJ
         mi7v2vSwdSTmUCsYSRYMfoutE4bXiydIRFbvqRR4azuv9v1UZhTP2t8GN8QamFnmIcMe
         wcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729009282; x=1729614082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAWUM9s5lyGhWTb1ehJ6NHCU3ChMEB/laYBZwYTZb00=;
        b=qYQiFgVy1gkiXqOBRhrm36/kJrjcI6V3hnkVGAEY+/+YGNILP1T1vGHBLYuO4dRpHb
         J26ra2fmV5hqukEjXpOHUoPXCb0aHZND+vP2Dz6QQBST0QAEZjKA3qNJEfG//lmRK0cq
         VkWtMyTqZDXtf93xhkw8oTNPrtQUczj/VE9omBuRyrvuJjHvC6Q9aVTWtKbwMqxBZOZs
         kCr6VsT9DdLAa4f+zN8OyvgAjDSNmJ6/FD7viTlVFgLwGOtdA1x9PsF5CobuxNMKYstY
         8YUCEaLjpdMXk7Sn0woemI4fZ/k7vumOSZZZgr9jJUcIrUN9pojCj+2X7GahDajjBc7L
         WjCw==
X-Forwarded-Encrypted: i=1; AJvYcCVHkwt1QvMV440MbSnCwvt0wmpeTa9eT1ZdCK4FTEclz8ve9GYjDDx8rN4EEFIZaa3jP99W0Vsnv1OO@vger.kernel.org, AJvYcCXlbxB/dF8NopZ8E0DCZbq50Q9CIa09svZuSqlfPHaZtOrxqaa6nEgRDcyeVDnyQKq+SX8GLUTyQcTuh545ty+iZoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXOB5WaPS/qGR3miQ5nTrj6U/DKqk9UX+a5XUgi3TIYJsPTy4k
	zFHvBbwp8hB+dTrMPT/DOl5DPTo1Hyazj++Y3Zrb+r8m4KNHDUrD
X-Google-Smtp-Source: AGHT+IFal2H6gY5olqIuu6+pF6H3H9Cp0rg+2bZLSTyU8liwGiN2tKc7WP1k4NKaLVIwTtSUr+VchA==
X-Received: by 2002:ac2:4c53:0:b0:539:9720:99d4 with SMTP id 2adb3069b0e04-539da4e2598mr7779312e87.28.1729009281639;
        Tue, 15 Oct 2024 09:21:21 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm22288325e9.26.2024.10.15.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:21:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH] pinctrl: pinmux: Introduce API to check if a pin is requested
Date: Tue, 15 Oct 2024 17:20:43 +0100
Message-ID: <20241015162043.254517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce `pin_requestesd` API to check if a pin is currently requested.
This API allows pinctrl drivers to verify whether a pin is requested or
not by checking if the pin is owned by either `gpio_owner` or `mux_owner`.

GPIO pins used as interrupts through the `interrupts` DT property do not
follow the usual `gpio_request`/`pin_request` path, unlike GPIO pins used
as interrupts via the `gpios` property. As a result, such pins were
reported as `UNCLAIMED` in the `pinmux-pins` sysfs file, even though they
were in use as interrupts.

With the newly introduced API, pinctrl drivers can check if a pin is
already requested by the pinctrl core and ensure that pin is requested
during when using as irq. This helps to ensure that the `pinmux-pins`
sysfs file reflects the correct status of the pin.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/pinmux.c | 14 ++++++++++++++
 drivers/pinctrl/pinmux.h |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 02033ea1c643..19c68e174c36 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -99,6 +99,20 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 	return !(ops->strict && !!desc->gpio_owner);
 }
 
+bool pin_requestesd(struct pinctrl_dev *pctldev, int pin)
+{
+	struct pin_desc *desc;
+
+	desc = pin_desc_get(pctldev, pin);
+	if (!desc)
+		return false;
+
+	if (!desc->gpio_owner && !desc->mux_owner)
+		return false;
+
+	return true;
+}
+
 /**
  * pin_request() - request a single pin to be muxed in, typically for GPIO
  * @pctldev: the associated pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 2965ec20b77f..550cb3b4c068 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -42,6 +42,7 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 void pinmux_free_setting(const struct pinctrl_setting *setting);
 int pinmux_enable_setting(const struct pinctrl_setting *setting);
 void pinmux_disable_setting(const struct pinctrl_setting *setting);
+bool pin_requestesd(struct pinctrl_dev *pctldev, int pin);
 
 #else
 
@@ -100,6 +101,10 @@ static inline void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 }
 
+bool pin_requestesd(struct pinctrl_dev *pctldev, int pin)
+{
+	return false;
+}
 #endif
 
 #if defined(CONFIG_PINMUX) && defined(CONFIG_DEBUG_FS)
-- 
2.43.0


