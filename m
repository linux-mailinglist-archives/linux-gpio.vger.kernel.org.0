Return-Path: <linux-gpio+bounces-37607-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLcfHk/AF2rYPQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37607-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 06:10:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2E5EC773
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 06:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6216305EA6F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 04:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A55305693;
	Thu, 28 May 2026 04:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFEBeZJE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAC1DE8BE
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 04:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941451; cv=none; b=ae3PlrJ229rKdzq3mciuAxXlQEs9B3PXd9zHEJQroast06hD6uvOeMPStUJi8G/sMqWabwiDQswlJeYxVsUoUWNyb1eA708zQbxAQwAbpgeWePm9ToqlSukLKInKL+ShwJEBz2IP9yHxAbQSAyD8/r8Is20ufiGeZU6yzb8lmWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941451; c=relaxed/simple;
	bh=/3MMEqm4M14GjBxVJK9EhWqPKTz+G4TfU2/8owR5LHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JnpWUwrdEI0/2+W0YSD80HpIUwJKxKMzOr90pwGgmC0Cw5yygfs3y+RpLRYfEe5MIn/M415NeC6iciYzUwz+EFn5M0yR5AkhEl6tktEoiwyXHSQDq+yVNvAN1QLBFV8ECdrrQEfi8QaIjzVzF4+5xCGZrNDtRvs8xSq4eXFhWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFEBeZJE; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d8e3bb72so337909eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 21:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779941449; x=1780546249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGAB/TxEmw+7CDJOQwbGl6yIkRdSS+2SDEoF0TQVYoE=;
        b=jFEBeZJExkLlzT7RqNZVGzEixwt5ny0zZLE3rZhLTx+IS8u9veKcY0xpzdE0GyRFdF
         +1lWWjtoqQWDiGFx+dgmDl77txBYxjcw05qRa7dqh3UALVBl51onspRvyDuhNsfwHqY6
         Xx1urYvLXr6+OPRQa7kjRCfYFvieu2wQd9iB5WPJlYVA/xhpiuuKoEPuSc7zUJmQLocR
         r7HRjxq11UVlE3UTc6Z7Uklm8q4x0AdAwuYI+NdYdkZiYjBfJ91fpgGGkjFWWyS36nEV
         ADBxH5DuK3a6eh23Loxw3SmdV+Nih4uO9d2aaLP0djiZUXyVkwr2BY6xrsqz0WO/pm5m
         z9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779941449; x=1780546249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGAB/TxEmw+7CDJOQwbGl6yIkRdSS+2SDEoF0TQVYoE=;
        b=QhZLewUJS8usL2bmUTPEl7w/9tD5ciedx6P2rGtJPxcc7uFt1o9Pcinx+r07Uymkqr
         Nd3J7DcHx+HAXjrZNWfRTPjy0+Y9nYRzfHn8Ov0++TFmr+XCsnuu8jkqCarDg6baHan7
         oyeJXXqCE/yT2vX1sNm6NnTslwIXKmaH0SomBiHRZKvmjDEszCm3XjPye7FO/SstQS+8
         SDpGC7Z8O9BNGg0Cg9Gd+VfZ42TFlxOMGEGS5H9kVROh9OfK/FrWUOGBdl+/muJYuu63
         kNMxMVVR9geut4qrUsOwEvGsZnTSXyRjSWHpF/sI5zkd6HvmOtcrVA493sq5wqQUHLCh
         cbcw==
X-Gm-Message-State: AOJu0YzM8JmpbY9C/J8lWDWKEs7kr+kVd9tChPqzugvNrZWw1462oPNH
	VdCMh+HLHyS/ps2rAkZGwlOpIhyWao0Rqafpu/werVWBA3nD4+JCgdBWyBJ9ydm0
X-Gm-Gg: Acq92OHRK/EixGYvwiBQpNb8HQMdMoTSHFeKUz/Hk/IzbesA2JpY6gYtP1q08Z897h7
	RX0czOzHylwHb6/QtdZibKTbGCpf0CgM+hyPPGKq8g82+4d8VKpIYNwEk2hleaMKzinD7qSQdzz
	O69o39EfhkcScSPfJpw8wVIU22IP8iJTPP1PPjfiSYuFjoz89YE3iGDCASgHRL4f5sJAuMHQM3b
	65w/sMrdjc3929tIfqvjj8Oc9T6h77UwEE+05qhJa3TVcZ7EC1xnCzZjWPh1p5tSqK1+xrBB3bH
	tP3UbJ2ieWJtPTJMThl3LONuOIWTDa+RcWsvVzX62OtXsbiuYXS072bTpDK/EyMSCfWCR6LnFQ4
	4xFL7y4lSb4Kb23WWUkjn0o48AAh8RRgRoYOd0f64zrz0U1t9KToxQ/BheCAqmIVyUKE/VvyoQz
	lwwg0Mh/z1tnetO9J5GQHfew0F5HK1LaJhKJG752JhM4dtjG/le0CSvfRQTGYfPIe0s6dMIfwAJ
	n7KUeWZTEYYb345eJ2ct9lddJRAsjssV5mKUH5IN1I/dA==
X-Received: by 2002:a05:7300:724e:b0:304:d75b:f5f4 with SMTP id 5a478bee46e88-304d75bfc2fmr418943eec.16.1779941449547;
        Wed, 27 May 2026 21:10:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:b235:9fff:fe2d:7319])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230b25sm18574374eec.15.2026.05.27.21.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:10:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: realtek-otto: fix kernel-doc warnings
Date: Wed, 27 May 2026 21:10:31 -0700
Message-ID: <20260528041031.728557-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37607-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CAE2E5EC773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing 'struct' keyword in the kernel-doc comment for
realtek_gpio_ctrl, and document the @cpumask_base and @cpu_irq_maskable
members that were added later but never described. Also fix the
mismatch between documented @imr_line_pos and the actual member name
line_imr_pos.

Fixes W=1 warning:

Warning: drivers/gpio/gpio-realtek-otto.c:66 cannot understand function prototype: 'struct realtek_gpio_ctrl'

Assisted-by: Opencode:BigPickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-realtek-otto.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 5e3152c2e51a..37ef56f45318 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -40,16 +40,18 @@
 #define REALTEK_GPIO_PORTS_PER_BANK	4
 
 /**
- * realtek_gpio_ctrl - Realtek Otto GPIO driver data
+ * struct realtek_gpio_ctrl - Realtek Otto GPIO driver data
  *
  * @chip: Associated gpio_generic_chip instance
  * @base: Base address of the register block for a GPIO bank
+ * @cpumask_base: Base address of the per-CPU interrupt mask registers
+ * @cpu_irq_maskable: CPUs that can receive GPIO interrupts
  * @lock: Lock for accessing the IRQ registers and values
  * @intr_mask: Mask for interrupts lines
  * @intr_type: Interrupt type selection
  * @bank_read: Read a bank setting as a single 32-bit value
  * @bank_write: Write a bank setting as a single 32-bit value
- * @imr_line_pos: Bit shift of an IRQ line's IMR value.
+ * @line_imr_pos: Bit shift of an IRQ line's IMR value.
  *
  * The DIR, DATA, and ISR registers consist of four 8-bit port values, packed
  * into a single 32-bit register. Use @bank_read (@bank_write) to get (assign)
-- 
2.54.0


