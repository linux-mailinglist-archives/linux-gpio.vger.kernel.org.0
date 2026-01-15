Return-Path: <linux-gpio+bounces-30607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD8BD252E7
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 16:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28EC230072A4
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 15:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6852E3ACEEF;
	Thu, 15 Jan 2026 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awqxOGH4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395163ACEF4
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489833; cv=none; b=djhRxb5Gy3Espf0nIj9YXkR3LM4w1VF7+5gOfFE9JwRNFANks/Od5Frb3x/qq+q4ofZ59ERt61wdoBkMjCx+7XarOKM6LT7jxVNt32z2+Sak6IaysjYWVm8evZdzreoOgjlDbUmjHUgNwPxxn0xIRwWioykI32zI4d1qn2cWE08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489833; c=relaxed/simple;
	bh=37ssBE3aanUugoLgxto0YwPyHpxoTGe7/lnWA6Cd1/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8hoiffbMiKIxnNpKv4H1GUpA0HNQ0P662+i4Wh766/JKcysIwECrnMf7QWZEO/xRxriBgsXQ6o4VNN8k5VSmVPsZFaKSryji7Mz6ptKz+AqHzUWJDyzdZPBYXCLTqPDT7OMmzSEcS97cdygFQ4vbxG2pbM+xJulOAz0Lady+HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awqxOGH4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801bc328easo5166775e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 07:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768489827; x=1769094627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M11xPiXaInwVnEMGq59nYgno6MdcMcqZX62iafSYodw=;
        b=awqxOGH4jxKzmyKtx/4jGpeWy2goEGWU9FqwGpICyoFZX3OrjGqnWcZmvCm2ZoB5lo
         Q94rUkiyxftm3E6tNFPMITfwYCW6nIqofYHJilDDZQepErzvcRKmhWtC50DnHDaYwUIZ
         JokW1sRFd4m3J1HLdXJlW9MYRXEKQTGeLFZqqcDOdvDY2k/xzSNrH1NnXFiCP9FfcZAT
         DcGjOaKUodI0X0C7hsIcqmGfa/SJ12ZaVSp3BEU+Q3YblYq5NxAffJHPGkS6xGdlW1Fz
         4J2gdYae2M+fp5ggzTJjXq62VmoZOUvWcTQC7BTOkg39uMoAJtobHsRYF6efIXmssANM
         ApVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768489827; x=1769094627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M11xPiXaInwVnEMGq59nYgno6MdcMcqZX62iafSYodw=;
        b=sSFYZ1ifpOrJotRKAf/zDdCKncy/aj1PKWijb11bFjV8HLveIdID1O9a5ZpLjPLdSn
         P4AuXjRhiyU73e7nRdyPazDMntUv5QhBQNKEDO+arAi5K/BMPFSdepR2FMe8NpTbkzIK
         3V/6VDXAut8jrxoqWB/vaXERLIGF8J4S247gqmiEHHaez86TbSykEcMP7lNzLw5vgVuQ
         R8YcH3VhLs8Zw2ELn1ISB23cnKBNtskyZ0FGafY0KmuBnwirJzQ3O2/W0wltWABOsTXg
         L0fzSzJaPZrPOMRmbhhtHAxMJirpYE8KzFMmz3PnVLaeXqQ39uLbijHJ7bJCH6Ia7b1U
         lCnA==
X-Forwarded-Encrypted: i=1; AJvYcCXlzyssuOYk2mLLZm2ZIQtrBo/Zu898t4S/EChX21HH3FU/2MhVIOEopB+PcJYKL449hxaJfHX3JJSv@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsoLWEZcajNRnW6m6aioQSbrkDHQiQI6F76omAxDHMgcO9Iz1
	HoDa6QHaofNob2ymiaPwb7tMq65FBgKIygRsAsag2nosJevXb7AVQnbn
X-Gm-Gg: AY/fxX6uetHjVF9IQJvr6HXPUtM7CrnApCfNvSd1emDpoidlqs2/fBBpRjo2+6ldFnZ
	qq4M1l5a/u/RQYALfDrn/zO1ytlI2eF6d+H29mlZ3jQEFup7Mf+B0g/2yG3b7aeSVTMhPfs1gk1
	NaijmR2y+m1Nl9uIzJvn/nWS/vp2osvdQaE9h1jU8tgcR3iUEfjF2H6TndqBRThz8nuzwAC9B04
	BgcVIYmtbKUPbLInQA8ikMVe/sAN63gbbOR482QRSHYfKnBH/LpROefH+6UVtd4x4L7PBa3V2lU
	81WEcC84SGM7tmTmB6V5HPzPyooRLNgSO9h/NEZOYwKADSIvHNlqfwaQ4fKKdV+5J/cGjJg9uf9
	6pN8rOnmacjlM0A+wfhBz5GmjEbGyw8y+aXQ+cmVQaYlJfSYHc4aSz5ZQR3fDGnxAmEwQpvwFD5
	tscy4Ih1gtMH1JSMU3kpg7XtoeFN0ZRT7ZwX6oC1xVd6JrF43V9MiDZq08GyBNCVH5
X-Received: by 2002:a05:600c:a0a:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-4801e34fd4cmr521465e9.32.1768489827187;
        Thu, 15 Jan 2026 07:10:27 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6535c7sm7011861f8f.16.2026.01.15.07.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:10:26 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 2/6] gpio: mmio: Add compatible for opencores GPIO
Date: Thu, 15 Jan 2026 15:09:58 +0000
Message-ID: <20260115151014.3956805-3-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115151014.3956805-1-shorne@gmail.com>
References: <20260115151014.3956805-1-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On FPGA Development boards with GPIOs the OpenRISC architecture uses the
opencores gpio verilog rtl.  This is compatible with the gpio-mmio.  Add
the compatible string to allow probing this driver from the devicetree.

Link: https://opencores.org/projects/gpio
Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Since v4:
 - No changes.
Since v3:
 - Order this patch after the binding patch.
 - Add Reviewed-by's.
Since v2:
 - New patch

 drivers/gpio/gpio-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 5daf962b0323..edbcaad57d00 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -724,6 +724,7 @@ static const struct of_device_id gpio_mmio_of_match[] = {
 	{ .compatible = "wd,mbl-gpio" },
 	{ .compatible = "ni,169445-nand-gpio" },
 	{ .compatible = "intel,ixp4xx-expansion-bus-mmio-gpio" },
+	{ .compatible = "opencores,gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_mmio_of_match);
-- 
2.51.0


