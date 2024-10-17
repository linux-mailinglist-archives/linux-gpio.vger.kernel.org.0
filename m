Return-Path: <linux-gpio+bounces-11527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 850239A2139
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09ADB1F27CA2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503351DDC15;
	Thu, 17 Oct 2024 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/dzBKe1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C91DD0CE;
	Thu, 17 Oct 2024 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165201; cv=none; b=goRd7bZwJGKGE51LZxruwENS65kzmWU5n4AF6+74gsInXhBDmE9J67YHIhQUCczgkx++/UXAj0psAgX0butkLvW6GUKf7GJFHvsHJYHpvqlaInDfDpfRDK0ZwiLMv70hHzztMZSRj/hvw6fpo7S+2xmgCxG+1UXnXDZLQ5PBFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165201; c=relaxed/simple;
	bh=J17cwYEUk/0VfgZ/An0T78TA4MFEUliUrH/1NuF0mEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMZjYe0iBiBHGnc+RfF4QmVz/j7cuPSwH2Y7jH7D3ylXYFthdv3+r6yC831DcEx7xoMCFj3SOiadPPRsvo60k7EUEiTO8qxqkaPhQfbGLsNDsi6TBOUynIf8KJC1xF8MAITvQWer5nbJB3obmpttVVYBH1q8aWkRQSnP6Rnixw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/dzBKe1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d41894a32so592399f8f.1;
        Thu, 17 Oct 2024 04:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165196; x=1729769996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IVmjAgeZO1gt3OMdhZzqgBZDY/tE5DnUFAsaQfCRaA=;
        b=R/dzBKe19SFxhv9/fnOc+vq4/Ugv2stcBiKcvnj4fBhV2rAwGZC+oagPq0r57VKNk5
         sX32ToLjdaPFDQzwlEi2P/ONj9Pvcwa1WqKccdcy2F2meAD8lIKIdv1hh2O4vEjCavTY
         lCzM6rf6fWoNqR7g+AR59HRgrusR35WzoZa6pfOofEr1OzXTltNIkcjBl2fH6KeDJG+2
         jcQxcZnSCK+E8TVGFbXvdVfmnLumo38l6XivpdRtzLHYHl29mVPMMYs3G33bPTea9ZzB
         WXYBKXSRWppadqWU8z72PsHDWJEC6er78HNnJ0nz9z66Hv7jkBkv1kAum4/Q9U//uLZl
         WiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165196; x=1729769996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IVmjAgeZO1gt3OMdhZzqgBZDY/tE5DnUFAsaQfCRaA=;
        b=YLSUYmyOPu82/JwPuW54ebv3sXhMYAkSWdTIp31VTc8teZ4qTgCfj4PaZFDA0PGfnp
         +XeBQmNoYLaT4l9NW97yPAeVk5d/XdOhCjg7sFugGhu7xdclfJ1mtxlxjEMZ6+syao92
         qRwb2MW1bOwnd/ddb+eo3XukYEP4Old9s0UuupxzdbG2ujsa7MCED1K9tBY5fYZ4asy9
         oqpUJUBKFUJTscQMq+SqlQZefgurmC7y7QVPspmK61EcXn/tSYuGteTtSSPvsgcDgHat
         c6gqn6Z50FaGEFsItfKBQq5x35BeHCTGWAmA9BqIbOMznnuj2+aNzXmP/uzJtwr/aUGR
         krkA==
X-Forwarded-Encrypted: i=1; AJvYcCVgwcthEDX3bAQ1Z0aoyT7HSGPoh9NAoQegvmB3+9WVqThqEesc7QFnwE1w+1qg8OdRLBZZhcW3VfsnBw==@vger.kernel.org, AJvYcCWuz/a2eotP0viCvvEkVQ4tTQaRdv/hUTqZCkg2Wi+XQ73R5HSjpC8e7OtCHepoXoaK8czeBghtxs1pkswMH+ERb8E=@vger.kernel.org, AJvYcCX84enKEKM6jHenbkL3jjpOrBxY97zFWmHgON9ArZYV4IfiYINzvhA4b6JFbiXW1kNsuPWk3VxTjp9n@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyDgGYncP3V7qsZ5CsPRcuo4VZvYpASMF6WDqOk+X2YWjw+d+
	TOndo88M3ijw3PmZdPGRfk3FPQ5VupEBpNS6Sycdq29GpWW/EKnn
X-Google-Smtp-Source: AGHT+IHA1Fk9Onw/spwGNct4Wclqn5nvY5/56xW83ouDwAKxhUBJfZPIqbtHW/ALsNn0rMEL0OdlUw==
X-Received: by 2002:a05:6000:23c1:b0:37d:3e42:be32 with SMTP id ffacd0b85a97d-37d93b61d8cmr1830547f8f.0.1729165195655;
        Thu, 17 Oct 2024 04:39:55 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is requested
Date: Thu, 17 Oct 2024 12:39:41 +0100
Message-ID: <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce `pin_requested` API to check if a pin is currently requested.
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
index 02033ea1c643..6c3d18b162ad 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -99,6 +99,20 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 	return !(ops->strict && !!desc->gpio_owner);
 }
 
+bool pin_requested(struct pinctrl_dev *pctldev, int pin)
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
index 2965ec20b77f..6d854eebaad4 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -42,6 +42,7 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 void pinmux_free_setting(const struct pinctrl_setting *setting);
 int pinmux_enable_setting(const struct pinctrl_setting *setting);
 void pinmux_disable_setting(const struct pinctrl_setting *setting);
+bool pin_requested(struct pinctrl_dev *pctldev, int pin);
 
 #else
 
@@ -100,6 +101,10 @@ static inline void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 }
 
+bool pin_requested(struct pinctrl_dev *pctldev, int pin)
+{
+	return false;
+}
 #endif
 
 #if defined(CONFIG_PINMUX) && defined(CONFIG_DEBUG_FS)
-- 
2.43.0


