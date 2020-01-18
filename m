Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F05D141705
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 11:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgARKpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 05:45:46 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44046 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgARKpq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 05:45:46 -0500
Received: by mail-pf1-f194.google.com with SMTP id 62so6585575pfu.11;
        Sat, 18 Jan 2020 02:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jnh26NkG5gw8U7ctNKOmjaCBivNZhcgVEmqV7AwjuOk=;
        b=sSYJVqxxFKkVtZi3iXqd82Ytq2owwizdmK4GkMd98Ckv2AY64Uhn2fqDKob3TYLASn
         hoyPgDH6j7Lsf2x/uRuPHUhaowM6CM/wcl82glK7fY91RhN20bkVVdnxfA2vr1MYl0UZ
         Dv0f1cbO109In0Otp7oVmZCbPRDi4kSso+J5CZ2piLiTkl4V1jDYH9l+wbgVnVuRlBHn
         AICNS1dfIhuTuNxT4HwQKRCucc0RXXbHqDkToXUrt2hPtQueGxxM1AGwqjFiXA6Oqbnq
         bCZXfjATrMj3nATrR3VHMKeYQhyvfmAr9d2eTCKfNn4U7m/IzYgOJITOtP47TXOzHtKC
         okzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jnh26NkG5gw8U7ctNKOmjaCBivNZhcgVEmqV7AwjuOk=;
        b=e/t+eu4RHfMPw5NVcu0ShAye4wdVcwxm/UQ78VOjL/vJQXiTwkPc4NMpN/GMCnWAOA
         N13eNl/EUY70UPke84eQnXqQuyFsHlvg7fzJW9lWNHzCIj+zf+lzP0E5l3ikDIrdePtx
         9RWiqVVGjmhPy+atNx84BjSD08b4Z2kLdsh2n7zcir36k0rw5aaQpDTNOKxYwJt2RL33
         O4NuingE2t7F1c6KwmTs4Duw91BHb8/EcGvB5isJt2yEMhamwkHK52ozI3TPWbGSx2Ri
         DTh6miCM4vkrtZ7TRhtiSHl1sST3niO48/hZt3bBdkhbD0tsryhMUHnYSdR47iaAL0rQ
         7Ufg==
X-Gm-Message-State: APjAAAXSIqt5li0vcFXLd9cxr4h9TEKYXA00dvyvupey7+0WLqpxCnBa
        3t7Y9QufYFdSVa62bcYg48g=
X-Google-Smtp-Source: APXvYqxXYkpcs8P7BaaMKV3QwFGUfOAncHyJX6QXOYu0DXFU6WWq602f7U9Xky+3UFxSAxBY6KpeBg==
X-Received: by 2002:a63:6d8d:: with SMTP id i135mr50180086pgc.90.1579344345321;
        Sat, 18 Jan 2020 02:45:45 -0800 (PST)
Received: from localhost.localdomain ([183.82.121.105])
        by smtp.gmail.com with ESMTPSA id q8sm31692324pgg.92.2020.01.18.02.45.42
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Jan 2020 02:45:44 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     Eugeniy.Paltsev@synopsys.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        asachin591@gmail.com
Subject: [PATCH 4/4] GPIO: creg-snps: fixed a typo
Date:   Sat, 18 Jan 2020 16:15:06 +0530
Message-Id: <20200118104506.68524-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sachin agarwal <asachin591@gmail.com>

we had written "valiue" rather than "value".

Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-creg-snps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index ff19a8ad5663..3705cf993c7e 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -64,11 +64,11 @@ static int creg_gpio_validate_pg(struct device *dev, struct creg_gpio *hcg,
 	if (layout->bit_per_gpio[i] < 1 || layout->bit_per_gpio[i] > 8)
 		return -EINVAL;
 
-	/* Check that on valiue fits it's placeholder */
+	/* Check that on value fits it's placeholder */
 	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->on[i])
 		return -EINVAL;
 
-	/* Check that off valiue fits it's placeholder */
+	/* Check that off value fits it's placeholder */
 	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->off[i])
 		return -EINVAL;
 
-- 
2.24.1

