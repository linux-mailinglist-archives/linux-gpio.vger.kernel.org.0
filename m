Return-Path: <linux-gpio+bounces-24826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBF8B31FCC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3581660653
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E7E2550CD;
	Fri, 22 Aug 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cn6D0j5H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E764247283
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755877603; cv=none; b=OTSu5HpTn3PtptzHzw8lcQ+qV7E3FyCqtO9QWGn5VZtGMXwWdYqQC9+G4lysAqbgCRJzoSEQ2nRMKYhK4TF7ITzg9HHeW6hashV0hReDeDYzGqr+sFdip265ix0kQLIdYuEvkzV+w/4E01u6Iop1OOMCUFB0dlcOyldObLe9hWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755877603; c=relaxed/simple;
	bh=5C9Cw6MbKNCQyVtWzlqvzZV4YhvuQBxfCGDsbT47Af4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUy9mA0MMfzda3/ZiHqkMlYXlOIzFlNoE8bcA6yc2K9IeY1tMsq9AMGY8RWTek8Sq8aNywVrgovwUc6P/yIgenSOzsCV+FWkSCD3Y0zFH0XSRaF3V4qhyetaYaQdiR5NIuqEF95/yuYslEXyEQwuThdou7hCs99NR6crJ2FMAHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cn6D0j5H; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-333f8f0965dso18436711fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755877599; x=1756482399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+BEjeTymJl53+LtXk+0qEyZUOBzNtqD78OrGPM4yjY=;
        b=cn6D0j5H7hchR13XfAsDMetKosFi00Ik1ozHYV112nkKZgu97pX60ZE5PFQecBzC6k
         lvEk3htrQyIXp5lOUpd8XiBdNXWNVR5Cd2yCrxoLt2u8aM1VuDfVoiJ558hyeN3KVH+e
         SFbBX6qh1HN7cdMyl3oLw6QkF3rKTbBf8kv+6PPoPVUpm1k4DQcmACo6CFNyChyt9iJ8
         DZlTyEiwrlAW+2vaziqrpJgqS7MLKDKVLisKShiGtXE/4+FQmgTgQezqP+tZ/DsDnswn
         nIqiXZwjLUBmTlVo0i0RdZ9KAPTd2E7I0tysBoIMtl1Hs2meTFUluBPG9t/rNCjZfd2G
         NR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755877599; x=1756482399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+BEjeTymJl53+LtXk+0qEyZUOBzNtqD78OrGPM4yjY=;
        b=l5j5uo3mLQN9ORTnv+fKIHrl95+orw6BcKJxLYtlVInt3F0Q/hpS33if4Ee8KUbvCD
         LeWsFNlJio6aB8QUlOtBpqFIHtovz0/LkNmJdoD3wrdQCe6P0rFd4L40q6JOwlqOl61a
         FaGv2Am+g6o8e4DZPz3OfQNRIqFPyMloDiDM3bcO1oAbGRFui2EaNnDjhUU8thfHEOnE
         WGpUd44aeEc304IwuJCaUOUhFYFlN5J8nIbJl687aO0eVtBp18XTh0KoTDDJ/7vKOPp7
         A78Q65jjWOFKlppN6WkOw1YM+6JdrV2fr10pt7fxkPEf8ljYs5+gW4C3XnHeUVXFaJht
         fafQ==
X-Gm-Message-State: AOJu0YxzjBMumq7Fs7sPb+Vl5f5JqNkSYB2vSpJ5kh5qcAvBg+f8XIT5
	+yuE//ZapvJuwkXhj+uKwcYmYcH2f7VST7RD0xSgLo/lraiyFp97mRnlUVJ+Z+UjUko=
X-Gm-Gg: ASbGncv6wBrXN93ef0tSh1yWasXoTWtCSICzXEBPgdXUKq1J0SKxStFbghM+0NYC73k
	wa+ZfeJ+3eHR63elf+JJ9XjyTS6dTw7tJCHdt1fooZMpHeqvNBe8cRrC0ERM9kU8DSLhXgAeDL7
	bN/OfSrvy68+QzdSjEh+/i8Unw1/CkQs5xdbYYq0uh4LBNxUlu1Lt6sbKKkIFU1XMCekjslIiq0
	IaawxmBCaIEOkC6f7wcR+ejpBj5x3Lr1hrbe+Bl8WLQZhw3q38R+Ce5kKxJjVBOcCXrn7GVU8UF
	tY6XWlq7Z4BwJ2CsObUep1mAVA8RkQSzMJVTiCaKMFXsPNxu38eJiApcIKt6MVZUEJlLY+g1x4G
	dJmTLYXrOvetZ/Ow+T0ReE30ESJeCBUzm
X-Google-Smtp-Source: AGHT+IFEbI2BGLdGRwL1YH/N+bNM+eCNDxlLpyMHk3p0VQ8FNc/icQupkvTg7vsweOCiczBNqqw55g==
X-Received: by 2002:a2e:bc04:0:b0:333:ac42:8d6a with SMTP id 38308e7fff4ca-33650dc2b31mr10645201fa.3.1755877598976;
        Fri, 22 Aug 2025 08:46:38 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5d1a6fsm56541fa.49.2025.08.22.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:46:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 17:46:28 +0200
Subject: [PATCH v2 3/3] gpio: mmio: Add compatible for the ixp4xx eb MMIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ixp4xx-eb-mmio-gpio-v2-3-bd2edd4a9c74@linaro.org>
References: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
In-Reply-To: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

The IXP4xx expansion bus can have simple memory-mapped GPIO
on it. Using the proper device tree bindings, support probing
this directly from the device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 021ad62778c2f49f0819b767a60112945999f572..79e1be149c94842cb6fa6b657343b11e78701220 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -730,6 +730,7 @@ static const struct of_device_id bgpio_of_match[] = {
 	{ .compatible = "brcm,bcm6345-gpio" },
 	{ .compatible = "wd,mbl-gpio" },
 	{ .compatible = "ni,169445-nand-gpio" },
+	{ .compatible = "intel,ixp4xx-expansion-bus-mmio-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);

-- 
2.50.1


