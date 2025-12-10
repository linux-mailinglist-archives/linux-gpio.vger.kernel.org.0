Return-Path: <linux-gpio+bounces-29419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D319CB222E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 08:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33343301E5A9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 07:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE26299AAB;
	Wed, 10 Dec 2025 07:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ksvc98Jf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DAE19F48D
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 07:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350186; cv=none; b=dhXHKIedLkEnwoqoR27FVYtVT0kTRrM9mRjVXxGn2tDkmnWB7VGuW9fmlnUT5/NhvpNbIJyCvQCgTRk56WaPTWSgFo34j985+cwqa9yYMd6dcw80SrZZJgLoAnNA6yiwQnGN9zh8BGug7yU9kyxOpTpdcr3U+2nP+PvzvsXINoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350186; c=relaxed/simple;
	bh=5s+3HiWhzu3NRLilBf22xiJfb7UKXxe//jtrb/Jd7L4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gtuIOMp017Nhv7oQdAk1aG8hjwGyzG3JfkL1P61zhkTIskeNjxs50dvsmvOwTV3wBRe0CGwm9LcJxtUUpSWZyL/PAgIzZt9sLWFuL9sxULVyEhcGrPSveIELUhnBZ6ulx4YgOPS3mNuVkYGjt6zLi311ZjIe79eRoPjyTEOR4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ksvc98Jf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b713c7096f9so977576166b.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Dec 2025 23:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765350182; x=1765954982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAKS6wUuXEVpkGzfhxKukhXAMEOq2kI1HF21t3ID/gQ=;
        b=Ksvc98Jf1j3WORNuK6haK02lcyYFZ/8jNkTRD58qU/8UQpYo+cVBIo0JAOIF+KhFvv
         /TfI5cpB5h2plLVbcmtP53kn5RxyqXU+YntDC5VJy30cd/AGZNmOmRm50B3B0YSnzmXf
         UwQZuHoPitbn5fFAwfu/5Ldc/pu5XXzBgDTWICLqz62rpi0sjga31Tj+X1aV/AFe3X44
         HJWEYcOk0SwT0UJwMbfZ/9czWtP+Xd1dPNgRzgY+Rr3AmmckLoQ0xRLsQOWPCHiljYca
         2Q8JAOtH+widF+usQdovp/BSogXhc5RHHWRixH2OfMcO0dlIPkBlDPW3PgVPFGTFkrEb
         bXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350182; x=1765954982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAKS6wUuXEVpkGzfhxKukhXAMEOq2kI1HF21t3ID/gQ=;
        b=BfXhQp0lNH1xmCXX4Addq3gkn1OJFUG9ZtSIFEVXXipSILf179NkFFTr7Cs+Dq6WKy
         Zo9UnWyN5UF1Qph+DH8D0pKj01phDC77TzJd6DddwYAal0NaXHwmmFX9VY7VS6esND+P
         qyBysqHyhtOZ2dy7qE4sERT2PR8mqdozsUEP0IREWgTfxVpqGnWygNVA8NoLwnahWk7v
         5SAlRt0p038Mz5Ce/M73WBkW2dhiZI+Ua8/CFEylWElKq4+IA4gdPkJpBd9nFmTjlt+X
         lXQxOYwZ6hwlM5OsRI+xGhHmtMFpBh1YmlKNPwg9lBK8DTQVFFgd/RgmizghckbGBbce
         VYZQ==
X-Gm-Message-State: AOJu0YwXyEmyGMf/HV5PiUYBFcJLq98dl5gJA/TO/j0MyHTCm26Ogg4C
	ZPYL44JnwOhkHHX9O2x6zm3EFScFejMz9HIfytKOFcXArquHzqc+S+qeqYwLpIo/bFw=
X-Gm-Gg: AY/fxX5/e6yFoswWmRnu9yrlF3RGTB9VaeKRs7TMHrdg8eJj4+9DHE8S22TPNkkOKTd
	rCNg74MlEM3zQ55MaAjcbv0jTsU/lsz2nbYw2hvjoGcLENolDKRBWnimg8RAUehcv/KDQZwUJZ8
	m/GZxIivGxue5HhVeQZULQ7Nnx5HQ4Hw3cf6M8DSrlX+2FCWAklAthUUYh10xL6YU4yUWZ8Gi2q
	W2iizHpMztHyXa71er4vRQjkNF41DYWBrKB8faLFfjG9TLG4FyzKzu3Hq7srxrpGAw+i6/+ozJd
	rErXjf70HBCZJSdDqRZ4RjilQsSlG5Of71haL9XcpBne5BYOBMqRp+/jirHdZ6BbKS2w5+nvzQJ
	XQuMA7OknRjOWEAi0HaDwL0yJ2Ig3V3rjXgsXOFItAsw8j4ZNTdKkasyPAhjA0SugRUeogktd6j
	ZNcopC/CQiH6hGsPhy
X-Google-Smtp-Source: AGHT+IE2R4as0XL/HO16DMuQlBySWnT/0WKBVZB+9vp0mjhFybjuhFa42fS6/uJsLd2owAE7J57TiA==
X-Received: by 2002:a17:907:6d0e:b0:b76:7e90:713f with SMTP id a640c23a62f3a-b7ce823b57amr140779366b.10.1765350181580;
        Tue, 09 Dec 2025 23:03:01 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f49a7951sm1640508866b.49.2025.12.09.23.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 23:03:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: stub: Drop empty probe function
Date: Wed, 10 Dec 2025 08:02:53 +0100
Message-ID: <20251210070255.484169-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=5s+3HiWhzu3NRLilBf22xiJfb7UKXxe//jtrb/Jd7L4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpORsf7WwbHs+jXaBVBfU6irBFUPtQm48lnX0PG 0o7l2XrFi6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkbHwAKCRCPgPtYfRL+ TjdxB/45Syaq5YftrVO+0vtVE8NQEVI6fPr0gOzLZva7QIpjSwJjLFGPqE19+m1Dtrnz081moFN HUixpNJefwDP3boLJmj3NhXN3UJy7qdSvoJwBp6JbRjrr1q216IaSQYOo7KMryDKhwa86G6h/QC fzndHoKo/tAte62UbyPsk+J/doESw6f+faeTxa4ffiGTYRao3z3USCBrIC5juP0zVTp+scBlyai rld3QGEM5BLcJ/nSAk/Hbov664rRLx5nDQrGQKN6NSRoKOCSjY6LxakD1GVxklIaO1HB3dNcO3o 62iazoomh3rgFKKoX8djZdsFLm8hC6goQ6Mc4wx3j7JZLCI6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A probe callback that just returns 0 does the same as not having a probe
callback at all. So gpio_stub_drv_probe() can be dropped without side
effects.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpiolib.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cd8800ba5825..662e611834bb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5183,27 +5183,21 @@ void gpiod_put_array(struct gpio_descs *descs)
 }
 EXPORT_SYMBOL_GPL(gpiod_put_array);
 
-static int gpio_stub_drv_probe(struct device *dev)
-{
-	/*
-	 * The DT node of some GPIO chips have a "compatible" property, but
-	 * never have a struct device added and probed by a driver to register
-	 * the GPIO chip with gpiolib. In such cases, fw_devlink=on will cause
-	 * the consumers of the GPIO chip to get probe deferred forever because
-	 * they will be waiting for a device associated with the GPIO chip
-	 * firmware node to get added and bound to a driver.
-	 *
-	 * To allow these consumers to probe, we associate the struct
-	 * gpio_device of the GPIO chip with the firmware node and then simply
-	 * bind it to this stub driver.
-	 */
-	return 0;
-}
-
+/*
+ * The DT node of some GPIO chips have a "compatible" property, but
+ * never have a struct device added and probed by a driver to register
+ * the GPIO chip with gpiolib. In such cases, fw_devlink=on will cause
+ * the consumers of the GPIO chip to get probe deferred forever because
+ * they will be waiting for a device associated with the GPIO chip
+ * firmware node to get added and bound to a driver.
+ *
+ * To allow these consumers to probe, we associate the struct
+ * gpio_device of the GPIO chip with the firmware node and then simply
+ * bind it to this stub driver.
+ */
 static struct device_driver gpio_stub_drv = {
 	.name = "gpio_stub_drv",
 	.bus = &gpio_bus_type,
-	.probe = gpio_stub_drv_probe,
 };
 
 static int __init gpiolib_dev_init(void)

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


