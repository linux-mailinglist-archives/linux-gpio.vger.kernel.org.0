Return-Path: <linux-gpio+bounces-10789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CE98F01A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 15:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72312282229
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2961494DB;
	Thu,  3 Oct 2024 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azabhpWE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34947199397;
	Thu,  3 Oct 2024 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961244; cv=none; b=WWye8ejsirtHG85hgCSlTAYHBQ2uFHZbeVcPhmZoTNhcKNCnMoBfI2L1B9YFz9v3G2EABc/cCI0JuVwvLiUUJf+aIMhYY5ggbP7plMTsmGaV5pTzKezLbxxorXlJBzDoZhJplgvfY464CxO6wnBJN9Y8tyoRXk/jB+QFW0EInKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961244; c=relaxed/simple;
	bh=H37t7jF8JPa9QoP6hz9mRoYu/q1kywp+62CUyAJ1xG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hiXCvyY5JKoo/FRD8p8TVblsHE9mIg8uJfu0KfLfNt3Er2MeI/PrrhFlHAeNwTI8seY788ToBiz7FMNs7nUFGJB+ilV5czgjBp5eZEgyEVkScxlW3IJ82H52+Gh03Hdo/+8onCFXV63fWftpAI4F5l1wBaRA1ZHDHJkCYdLeq6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azabhpWE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso189569266b.0;
        Thu, 03 Oct 2024 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727961241; x=1728566041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykJIKgFoBDaBht1oD06/VH2LsvMsqWEds6+rHumtGW8=;
        b=azabhpWEb+tmwuqtFDTNTEqHEUaCsOHyMlcnmQ2EPigh9rNLtUVkUzYQdZuKGhXI3k
         MibJZmvOcmC5htWsdQot/+6Ly7s45D2ge27wSuSolgaiKkNOtVWWc3TsYgfKjaqjz03f
         bbXJd40SzO+9DwCcSgqQ2lNX43acBe2YRNmSOGyba2jAe1e+uCggfx2zNzIDBoqCmgH/
         exNt2LOY7mpAani1WsLSzb6w3/WZDZZoysoeyiJcKMVBMRDvAOQEnlIxdNWtqASKoT87
         jK4PFg9ZlxnQQO74SZ9NBUGqbK49JziLYor6IkSF9yH1pXrm8RouTD8IrFBlUVBjz7LX
         Ce4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727961241; x=1728566041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykJIKgFoBDaBht1oD06/VH2LsvMsqWEds6+rHumtGW8=;
        b=DuQBahwMyOTYogfUipAn4Fgivzz6NGKmhfs2cXrakNvOAbe5sHz7jMEYNPZtfl57qv
         HlGzdYwol9FHJ0110e+sesAh8cBONTaC7BE4wYqEVzqWJJPUBg7A9gWyd9D3vz9JyRch
         rCGRLOrppLDAW+62YakusLAl0PaJsC0vJGHmOYRns6VVS7+ibgQkzp8h2c6ntpeajNsr
         ckGyXxNP4dbacJ2XZ/Y4fSS07GYIn0UIF0hYQajLJFfdqtKx5x7bmnxJhGk+1jm4iRJm
         FYmBdfJtXEQAqAOsJCZZT7nuip1+zyGnmj8xra5d9dpv0wgIrJlYgMqIMwjBus70JoHl
         mfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2eWoOpeo9eUgEMcUvmvzhOPnpPfF8O7EfwqCwIPDxD6oAC0w8+IIjbvKttLGlI9PXeAMX/O4YjYVq/TE=@vger.kernel.org, AJvYcCXE8EGMyh+d1YcadTM+Z8ptPaFE2xM+fZbuRVNhhIQ0gHPEUAvOfnR+fYBqHeMBx1hpHZHC7qcQ5wQWwpFplTv2xMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH79zCnlLpDqEE5xUt87TKhPk+IUc97nEPkDLgRReLDmf0viHv
	5N+YmgBK+OzC11PIRRSKbzUKlRY3ExIE8fabbl1qooCvZfMkC8FbsN1ueA==
X-Google-Smtp-Source: AGHT+IEX5l8uCZxcIF+kwYUxASuzMCid4bVjFIwkJLo4iQcwUUma7+j1JIaX3qvkeLMW9/GlZY75qA==
X-Received: by 2002:a17:907:971a:b0:a86:6a9a:d719 with SMTP id a640c23a62f3a-a990a1d701amr338347266b.29.1727961241157;
        Thu, 03 Oct 2024 06:14:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99102858b0sm84721666b.40.2024.10.03.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 06:14:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()
Date: Thu,  3 Oct 2024 14:13:51 +0100
Message-ID: <20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In `gpiod_get_label()`, it is possible that `srcu_dereference_check()` may
return a NULL pointer, leading to a scenario where `label->str` is accessed
without verifying if `label` itself is NULL.

This patch adds a proper NULL check for `label` before accessing
`label->str`. The check for `label->str != NULL` is removed because
`label->str` can never be NULL if `label` is not NULL.

This fixes the issue where the label name was being printed as `(efault)`
when dumping the sysfs GPIO file when `label == NULL`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Output before this patch:
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep P2_1
 gpio-529 (P2_1                |(efault)            ) in  hi IRQ

Output after this patch:
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep P2_1
 gpio-529 (P2_1                |interrupt           ) in  hi IRQ
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c6afbf434366..d5952ab7752c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -114,12 +114,12 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 				srcu_read_lock_held(&desc->gdev->desc_srcu));
 
 	if (test_bit(FLAG_USED_AS_IRQ, &flags))
-		return label->str ?: "interrupt";
+		return label ? label->str : "interrupt";
 
 	if (!test_bit(FLAG_REQUESTED, &flags))
 		return NULL;
 
-	return label->str;
+	return label ? label->str : NULL;
 }
 
 static void desc_free_label(struct rcu_head *rh)
-- 
2.43.0


