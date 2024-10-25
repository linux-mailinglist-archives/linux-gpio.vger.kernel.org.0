Return-Path: <linux-gpio+bounces-12086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A39B01AD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B72284635
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D1205125;
	Fri, 25 Oct 2024 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMgoRo6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4622038A5;
	Fri, 25 Oct 2024 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856975; cv=none; b=r8Pnohkb90ZP5VrIVkhG3DLYQu3ED/kGzf74hXD72cM31RCh1bw+qk90REwSCAQ/oBUo2G3rdf24l/CR7igqA/I/VF+JuPrsc7IcvKpJOixmD4aY2cnrh8IoqQddsOTwvtyzPtv8Gv9qBeGJXdbhwdU/6ODDWM0UW+cSYoeMiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856975; c=relaxed/simple;
	bh=3g7b5GOmv692vGg7/3yVQcA9gvqk1+NqU0y8jh1A/KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFM6ZMcAw0egV/OEGZnrq+KLWDEbiH1aG3hnvR0emXHJ1ddiBW6nKq30af5ufOrwBGr35GgVqJkN+ttN6V2/0zKTtAVp01Zl50ZTEgr59IZBL+eHIqpmslwq3RSXQE6ROub37Frn56RZN9lKRPWq1qmFQkWsnmRZAx65yUnzfpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMgoRo6i; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so21195671fa.3;
        Fri, 25 Oct 2024 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856971; x=1730461771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pw6x7l5AuN4o5c97yCezR04TZd3IFBzsNnyyt25aGPo=;
        b=VMgoRo6iQ7GPeAtOU/CNP3RYNIkrkvUtj/X0euGejCo9pFvSFdNgLvtJEFmqHlKkV/
         Sel02UjGyUJnNkey/Tw7cBsXaifnFRAqN40kC00JRjP9fWOQoiT5NL4VLd8I79+CekYE
         Md2W2RodccR2ABaNMRQXiuV6awrgcEBkj/FEjcgaVRB8BH3tpwxwF3eDYV1yJnmty2mL
         BNMdqv96k8JR4N4sfUYTrfw/jNBSYGqwHyVUvBjGz7CUs14yoSR15XcOPVno7O0mX/V0
         7Fh0aHtwZdmkkDelkf4hc+L/+BWrogLBKdftxKS8COEVFnCkR/GiOXpMo37SrZtP05fp
         ihig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856971; x=1730461771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pw6x7l5AuN4o5c97yCezR04TZd3IFBzsNnyyt25aGPo=;
        b=USwh6TtPZgPEkE1QV5L4QbMYuVy9mxwxDc4gFaAOjnf33gWZXrNyzFd16T3qptaWIE
         TLlv68kF7P1vBSUUTA1YSGQcpGNKonX51zrZq49x8WA4+3h0KVOS5Em4iKNzAv0yVmRT
         bOBmEFqEYrJWoMmH5ojcZKiSbenv88OfDCbksJzoY+ARDjBvo6dVaf2YG80U8ONNp4x0
         sp7DhPXZYwkKx1Dr1GmZ6GK5hNuybt79o/0iqYm4zOCKpavi7TLYbB8d2wAXHaUCTLyP
         ZoqFgTQ74pE1QKlfzuW4BvTM6hchizW3EJ2lCM+uQjfDgs9ACuTkYC4bo5Xth36VeYVw
         Yeew==
X-Forwarded-Encrypted: i=1; AJvYcCUfsDNOUPv9jDpkS3MbRfxMqIbcjcvC0kms38UomPenWCcskJ3nvqSsH23XHhOIpAYgYAG9otZbl5aM8T5i@vger.kernel.org, AJvYcCW++o/+zcu/iZhYZ7Eqvp44Qql8tAzfv7EDGfZObv8BZkHJWvjNdQcOg89Fh0AN/GMw0RVZ+lfHvpZx@vger.kernel.org, AJvYcCXVj0ec3CUP2+6wyfwDyxEhwHZDxDW2OxRnJJMJkpebt6wbPtF8B0+4LurHROytmgo5Jrhqew4lJqLkpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyG7ORdy6jM7sbCT2aE4jjJ36hkOUL87zRZkh/EttezohizCi
	ATSkP92r54CM2ZiGAaBhefGU/sGnZGs1TPvoH93WKnwfwIbpejaF
X-Google-Smtp-Source: AGHT+IFnU5j1cE09Hk/oUtLcXUwzGhA3hZaRMS9pqo2liLR4Nwl1OGWojpryufo0e+rIKC/CLSJZTQ==
X-Received: by 2002:a05:651c:210e:b0:2fb:565a:d918 with SMTP id 38308e7fff4ca-2fc9d2f5eabmr50101371fa.12.1729856971121;
        Fri, 25 Oct 2024 04:49:31 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56741fsm45109785e9.22.2024.10.25.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:49:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/6] pinctrl: pinmux: Introduce API to check if a pin is requested
Date: Fri, 25 Oct 2024 12:49:13 +0100
Message-ID: <20241025114914.714597-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
v1->v2
- Fixed build warning
- Collected RB tag
---
 drivers/pinctrl/pinmux.c | 14 ++++++++++++++
 drivers/pinctrl/pinmux.h |  6 ++++++
 2 files changed, 20 insertions(+)

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
index 2965ec20b77f..df44dc4c8b84 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -42,6 +42,7 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 void pinmux_free_setting(const struct pinctrl_setting *setting);
 int pinmux_enable_setting(const struct pinctrl_setting *setting);
 void pinmux_disable_setting(const struct pinctrl_setting *setting);
+bool pin_requested(struct pinctrl_dev *pctldev, int pin);
 
 #else
 
@@ -100,6 +101,11 @@ static inline void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 }
 
+static inline bool __maybe_unused pin_requested(struct pinctrl_dev *pctldev, int pin)
+{
+	return false;
+}
+
 #endif
 
 #if defined(CONFIG_PINMUX) && defined(CONFIG_DEBUG_FS)
-- 
2.43.0


