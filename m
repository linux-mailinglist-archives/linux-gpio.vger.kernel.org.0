Return-Path: <linux-gpio+bounces-30500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A4D1A29D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 17:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B88CA306BF1A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 16:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C26223D294;
	Tue, 13 Jan 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeWg//FZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECAB255F2C
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320921; cv=none; b=KyiQSC4pu0CZkAsEMN8uYlaEKXA7bd/okWS+6l6yFGPnTlOdH9acALVgpTsxTr8ufwNruBzeP02HuwZ9GiOJLRd0qnkHkJJHvfjm9mulXyEH4vw1e6rj3DcgtMvZ5v9nLyQhtku2t17HTNiu/X4m8yiwCr3n8x9sKmjF+tj+ga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320921; c=relaxed/simple;
	bh=FnV3NQEZpSrckq7ZRbBQNezPa9LjdzizI84I9YL8+Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTF/HenwAbqlgSK2NfKc/G+xYJgYF+gxTv5rNiqi8bFp8SUW088wVxKXuNWShNl/0Lhvx2l3Lqyj43g06KbjcOdo2yQBQ8DUt5Cws015u/J0e0YDjTu0w8/1KFT5k5kS735F4hj6OPpjgIxjBgYdRP+M+uTFXiErO1t2/518/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeWg//FZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso35630585e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768320916; x=1768925716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KrS+lv5lwDbRvbVFcdtMBkDtiHuhxyAyg1FHmuvd6Q=;
        b=ZeWg//FZIeQ5P5Q/HgM8xuUr9VaP0c++F2pn/qTYyZ6xPCAXlejHI6LudXakkiE1r/
         MWYPj/WBWKSnCDox77Wn06wfe+ds3IrFzaaYPDfNR+pNK08xZ58DBnuwtmYUhYRQ+Afs
         KCaE3xNX14mGn1AGIH3taswtS4MLJK2vE5sDAp6w0yZx7ZQywQg6SbnBRqsqQYb+odSd
         SxWVaHbnT9cSBVkaebPQaezhKrTzhCZo+32rtyFTOK6hNXrsMwVbjQhiZwPhJeswxxDV
         ASk21IRmEnWXtkSuGhhZiVX8F/F4x4ewQgXLnsoTRx++XakJ2WS8Fsrsy67A8hewUyMM
         uH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768320916; x=1768925716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KrS+lv5lwDbRvbVFcdtMBkDtiHuhxyAyg1FHmuvd6Q=;
        b=T8W6alwivNY64LKre73VrEtNu7aeIF0fcbz049JUtgvdS55HpVWDFmxa3mz2dvUzvz
         ICS2KDqHVuUyImfUF6d5GqLJi+BNZ8eBiZr93dPUOp61IjrpFjwCDoJpTU/btUXm4lek
         FwCc57KLKl0gNjUT7dK+avxkybl0oSwIJzt90Sf89Y9Agm/WI13nnASrZx6C3Ri3mf/X
         eyrcheZuJPMd+NzlTmFJ97V2A4RU9irk6KMzTV4HG6UXA0d+UWs4W2NAosa4CwkVr/vK
         XQthZQ6D1MeJVIIYWhbGc9nHTHuYiLkVAoRIAMQGn6bi2xydKhFTaro0Zhz2FIWLfGTM
         HYag==
X-Forwarded-Encrypted: i=1; AJvYcCX/8Gc74u49ZLwwJ7RK6zB89VUM77vEx46QaM28doDPPUel3frShPnZi6PQZqVsMkdripeGvBR68BBA@vger.kernel.org
X-Gm-Message-State: AOJu0YwFt9O3Ti56Vrx0tEUyU8hJS9M6RMdUKiW6c25quuDGdRLLw23C
	aF0NX7Pl+yCKRXuV5d0g7SBvkW8lHtZNW/GRTfk6UcWsdKo2roS/7KUze4Fj4g==
X-Gm-Gg: AY/fxX4o+vmo4zP4Q/qGt29vqTwF9T2uipUiymhrofjbiQwhWirG0YQdAXWSHDVUB8l
	jMX6WpkBuPWYzNIfLCKH2mZ7TVm22Pj0Ozx0tirvajWTy/vfk2XhKIgYsUcAGM6ox2U2MEPFH3F
	AIwZ4+APVoMYaZ4uSG2G2cBef2T2hGdn9hioe6zNKQtc6cCx0zqo7WYoTwXWrg3pADdKt3SL/vn
	shjGMQdh61KWpFXV7YyXdujIpsHbGTC+N8qNvRtV4HN6rW5iccXBT8fQ8i+tJNJ+JZWVpNrzTQL
	xhI5Rhxy5mvdlrf7+DVYCykBypwKnuau9h4a++9jZ3QSCyAalCccOWrDzqQydbzesLqys4vpWzD
	z4XPRm2dtwMghwWAXGMS5WaKNoRQ9L8KZw1jl3EcgLjL7Rhcc3tlawtZ1y23St83O84QYu1uoM0
	X8HJGYjwfhU9M4WhZfNekHIp+WBd7tB8NJVdYEDjm41M7ebRYUgoqTLAqe1yY1glvS
X-Google-Smtp-Source: AGHT+IFY7anv3CNwWIMho0+cvlpNv8144HIzUKvGLCKenedti8elP6yPkg0qEPScLVQhzPLK3UPXeg==
X-Received: by 2002:a05:600c:83c9:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d84b3b719mr285114485e9.31.1768320915920;
        Tue, 13 Jan 2026 08:15:15 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm44182976f8f.4.2026.01.13.08.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:15:13 -0800 (PST)
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
Subject: [PATCH v4 2/6] gpio: mmio: Add compatible for opencores GPIO
Date: Tue, 13 Jan 2026 16:11:35 +0000
Message-ID: <20260113161152.3688309-3-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113161152.3688309-1-shorne@gmail.com>
References: <20260113161152.3688309-1-shorne@gmail.com>
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


