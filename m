Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E751C273C
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2020 19:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgEBRWr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 May 2020 13:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726400AbgEBRWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2020 13:22:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DFDC061A0C
        for <linux-gpio@vger.kernel.org>; Sat,  2 May 2020 10:22:43 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f11so5567937ljp.1
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2020 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kiho-fi.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=SQVKZYyDlpOHs6iMr+1/4kxXWmP2kmVeVd0xRrV7hng=;
        b=bvb/ukky9X41WtzQFHp9/Dyrs2Z6532E5++DYK8Y+jD9I8JPSyR3d70TLFH/0qJDBD
         YR367kJ9DuheeOwxFSmH7QJYsMNfs+eBr63gsKfXg7c4Rv8ewhk1hRlB5SkjQAFsT81+
         Zy9uYnfo1bHBojpK8wDxPhxVtMkgMFQmAPRRlHydoN8//ntvaHF5ARx1eZ2NjIGuujF/
         4RytCj/632AyHiYLyTBHIwb/uJwuop6vdCC2eipNbSTwj7eQ7m8W+GtJuyVU5LjMMduh
         ZN0UBGcqkOj3VoxFtIayIIM4Fej+BExaU+AhHQPS9eBMHllf0SjyLqJI+JMtdM8uomta
         aj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=SQVKZYyDlpOHs6iMr+1/4kxXWmP2kmVeVd0xRrV7hng=;
        b=qiM+VXHqy7UzpfeVfwCgtU25NK3fon8Jriwz58k9hxwJy7AoKcZP4nQcWDTZgoPnpX
         By74I4RvD51qBHmXcewNh/me40ylgfyY7chMs5pXXznTIKxz/ac8guQL7L/OzqW8cK11
         tirIGrqiqaoA/4TyfccHELryY4o0Fm6flq8FkS5MbCRGYgp6svjw8EJ5rGIRsXUDzGiR
         pPJvfDYLJv+qz8gyaADnIdysBIvyyRkD5r5OLcsLIcjofEIiCSnHzbWTX611Bx6JAzAt
         WnCGgKMwwdKd40Yo7D5IRuf2EiHF39hIFHdzQZxUnnPNb+pDuMvM68UJfvQ1jh6gGT1E
         ND4g==
X-Gm-Message-State: AGi0PuaeHlEwpe3wHVGHqlkyiq4L3bIlfhnRqLvDrYwTbzLShLnK1KC8
        byIhsS7U2YbFfFLTcO8o3QBSQg==
X-Google-Smtp-Source: APiQypL6anjjjWSN6V+XYxJy+PFkZKLOCHjH2Gs85AOPKUSIbrkf713J120ogeIEH7Bp6v0YgaCNNw==
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr5539992ljg.269.1588440161810;
        Sat, 02 May 2020 10:22:41 -0700 (PDT)
Received: from [192.168.100.210] (dsl-kpobng12-58c361-73.dhcp.inet.fi. [88.195.97.73])
        by smtp.gmail.com with ESMTPSA id c20sm4328925ljk.59.2020.05.02.10.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 10:22:41 -0700 (PDT)
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Petteri Jokinen <petteri@kiho.fi>
Subject: [PATCH] gpio-f7188x: Add GPIO support for F81865
Message-ID: <4340a212-89f5-8c62-db61-f061e494d6b1@kiho.fi>
Date:   Sat, 2 May 2020 20:22:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add GPIO support for Fintek F81865 chip.

Datasheet: http://www.hardwaresecrets.com/datasheets/F81865_V028P.pdf

Signed-off-by: Petteri Jokinen <petteri@kiho.fi>
---
 drivers/gpio/gpio-f7188x.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index cadd02993539..18a3147f5a42 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -36,9 +36,19 @@
 #define SIO_F71889A_ID		0x1005	/* F71889A chipset ID */
 #define SIO_F81866_ID		0x1010	/* F81866 chipset ID */
 #define SIO_F81804_ID		0x1502  /* F81804 chipset ID, same for f81966 */
-
-
-enum chips { f71869, f71869a, f71882fg, f71889a, f71889f, f81866, f81804 };
+#define SIO_F81865_ID		0x0704	/* F81865 chipset ID */
+
+
+enum chips {
+	f71869,
+	f71869a,
+	f71882fg,
+	f71889a,
+	f71889f,
+	f81866,
+	f81804,
+	f81865,
+};

 static const char * const f7188x_names[] = {
 	"f71869",
@@ -48,6 +58,7 @@ static const char * const f7188x_names[] = {
 	"f71889f",
 	"f81866",
 	"f81804",
+	"f81865",
 };

 struct f7188x_sio {
@@ -233,6 +244,15 @@ static struct f7188x_gpio_bank f81804_gpio_bank[] = {
 	F7188X_GPIO_BANK(90, 8, 0x98),
 };

+static struct f7188x_gpio_bank f81865_gpio_bank[] = {
+	F7188X_GPIO_BANK(0, 8, 0xF0),
+	F7188X_GPIO_BANK(10, 8, 0xE0),
+	F7188X_GPIO_BANK(20, 8, 0xD0),
+	F7188X_GPIO_BANK(30, 8, 0xC0),
+	F7188X_GPIO_BANK(40, 8, 0xB0),
+	F7188X_GPIO_BANK(50, 8, 0xA0),
+	F7188X_GPIO_BANK(60, 5, 0x90),
+};

 static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
@@ -425,6 +445,10 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		data->nr_bank = ARRAY_SIZE(f81804_gpio_bank);
 		data->bank = f81804_gpio_bank;
 		break;
+	case f81865:
+		data->nr_bank = ARRAY_SIZE(f81865_gpio_bank);
+		data->bank = f81865_gpio_bank;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -490,6 +514,9 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 	case SIO_F81804_ID:
 		sio->type = f81804;
 		break;
+	case SIO_F81865_ID:
+		sio->type = f81865;
+		break;
 	default:
 		pr_info(DRVNAME ": Unsupported Fintek device 0x%04x\n", devid);
 		goto err;
--
2.26.2

