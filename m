Return-Path: <linux-gpio+bounces-30557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57CD1FA70
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4700D300FECB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9399F31B10B;
	Wed, 14 Jan 2026 15:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9Jr79n9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27631A558
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403667; cv=none; b=GUpYcVchJTc3eP/HuizuiXn6VsqQ/dCEipJj+ZqmDmFy0G6I5+Y7Nd5MK1+iMsEiadG0hc2rNWSpFeUdnw76LbpQwKoKzTRugoGdlfkeIl61qEEqE3oKHG7iLa6NMwVq2XohYGIt6XVEbmD5PtAjYhoiy5ybETabe98gt9FIX0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403667; c=relaxed/simple;
	bh=37ssBE3aanUugoLgxto0YwPyHpxoTGe7/lnWA6Cd1/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSed+4VUXxv6I0uZ60lpHy4KuCau3SUonchvv5tcYPX32g/l/ZvjGXscMRnWOWwSpg+Dpdc7182ghbvdo7sENbx2g/9RgV9NZs291lZVlNq83SixPx/lhAppaiNYXfbC4kfIrt4mzl5aaBRPPYZQdtKW9PaI7spgf6+4dvlBFXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9Jr79n9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so2531835e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768403663; x=1769008463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M11xPiXaInwVnEMGq59nYgno6MdcMcqZX62iafSYodw=;
        b=i9Jr79n9u00iGKFtEf0KcXHdST8yKeccRGmnphWvbiYgdVVIx4aWRfxSwviqz1HT4Z
         TXGF6mBg5voH8JWrTiThPwqPIZuccqghQnXSNPF9ZOGUnwfSwOfVEprp4pSrEWtEu1ji
         uWePaAzzHVSvzts5q5NIm56+9EjTwdK4VCnREx5UhMIyKup9GgPG33/tapHihejhlh35
         G26BNX0+kwZhbHz3kR4VnFKpHJC/POJcplvsqjdsGUbgKdS3vkBtFQzmbVzWf6EnQkiy
         LLNHavHhVY6ZgMuaBv4KIeNEKL946EeuMxBl6XJuzqzPt/ULBYLHRwlyCcNTo/seSVfM
         fFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403663; x=1769008463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M11xPiXaInwVnEMGq59nYgno6MdcMcqZX62iafSYodw=;
        b=Jo8BF6eo0QUng4k3wYyBWKQyFR0LqnRqSOe22NEDtZCTYniKkVD0ZkYxRfW1Oq99a6
         ymcMhvvT/RyLl8V9bdZol4e6x9/C0uhbbzXionrcZFnVI3VDWWgKcjUhxpRPaUyn9qXG
         sIKcA/nEua2UXrHYOl6e8vhiKaMwz+TW6SxSfGS+bC60GlOPCZl90BHHDfCQI3YAWqvX
         Np2HLmUallUIvaycJGkC83JdPzGBypEBqz6XbwkHuORbQHpSvF6AhHXPAunaTJ/BKdwl
         E90acFZp2FWqkQtQUJTpZhVF5JRY+TIn+UW1cKu2z8lTTJWjzB643i8qd6zMXGwKiIu2
         wHHA==
X-Forwarded-Encrypted: i=1; AJvYcCV4tkcah44IzSzoAUD0q5QGySB34izJk+O1rYU2ZekHv71sA+Ij6grrT6y3nJmzlu6TJiJ0U1WxfLcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCU54QTfBXK/BLXQ3HJd3HtjFpvzWQRDy9amC19d/vh3PdNuS
	gIjzrqr3GdLHdLuGodCT9rrazo1CvSgJEtjhH9udoiOOChfbLRwNMXhkS7GjyA==
X-Gm-Gg: AY/fxX6XU3wFpYKnX49s9pft2tPLjb2odoCTLIkeaGHOZVK23K4TXqXHz9XCiaAvu+D
	U5IaQf0g0BEQc6Un33gCgy8paJecfbSE/SUnrpDdHErNZgk00SCEFHfJoL4soiDzn/IWUmW4Nvf
	++r9YPLPUMjbgfV4Iv56MdwWUFRvH2RYFOOvsLilgh/T35pl0yszUfaoCjawmpaWJsspvI/jvd2
	mIZL02J2RtrQIaG/i8MTOWlkPpA9+nrcL+E47nV16BvC2w6dnC6jyPhZHP6O6X7Bgco5d17QJbt
	6MPFJ+4G2PTRsVdlt5hKwf2A0N54ekNvGlwDbJSsZZtGCKjzdraLxIM/Ldp31egpb06UDTIUE5I
	X5fdLIz9OjwAzL9g+lN5dLqaA0zJcyzi8I68o8wI01BqxE2SLIj2qABDk5nJBxUlZ0rUFRxFtnQ
	MDtgL5qr5G/PB51Befj8bDnH3Ylbn+utpakuvEiHwKAFWqkgAKZR3rhAUu9z5fBVng
X-Received: by 2002:a05:600c:6992:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-47ee3775159mr32707045e9.4.1768403663365;
        Wed, 14 Jan 2026 07:14:23 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee5914232sm40373305e9.14.2026.01.14.07.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:14:22 -0800 (PST)
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
Subject: [PATCH v5 2/6] gpio: mmio: Add compatible for opencores GPIO
Date: Wed, 14 Jan 2026 15:13:11 +0000
Message-ID: <20260114151328.3827992-3-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260114151328.3827992-1-shorne@gmail.com>
References: <20260114151328.3827992-1-shorne@gmail.com>
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


