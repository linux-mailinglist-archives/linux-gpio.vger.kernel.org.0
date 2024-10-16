Return-Path: <linux-gpio+bounces-11407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83859A025A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B542842EE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 07:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCF01B6D00;
	Wed, 16 Oct 2024 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJUxM1eO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6EB1B218C
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063319; cv=none; b=FdiJTRLhvkZD1dngPV5UWnR/8R2dpFjEhlE0gmQGncKreSHIm2YYkuToE/+pti5H1y9PgPUl57E91XwavebcuTo2Qy+jgZTndXYtrwykAQQoc1rg0Xh82c+eSIxZqaC7px0bVD82G0Z8k7vxvIFCM9VhHYQJEjpkDY1kMaYGJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063319; c=relaxed/simple;
	bh=JBspCVFtpJjpthgUxIJaESpNK6TktgdyO35oURkfSeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YC1L0ukqi8QntwxApQ7DFgHPDn4RQhHqciUsFQvoV7W/jzMRNihRe280qXUQC1f2pc8R1IpfdsSOdW+x7en0FGJ4Og2m8Fn41dQFo2l6XDshjc4rs2AjrsBHhlLtrHSLFu+P8SNYYbXmd4+hKJg9vOMkMMxp2dU3w1GVVyNwpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJUxM1eO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso78540881fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729063316; x=1729668116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX2MWErp0/u4Uf4asG1ORKJB5iRHzlOAqYylAI75SY0=;
        b=fJUxM1eOn5AH6DMuTs9HKCViQfduKSUesf9fxjQELZTRaCcMSmAeUMFGh/EhYG547t
         A9VeqoA7O3msTQ2i1j2x+kV1Tl9n8VS0jp98e61A76ddb5quWeEMcI0BG6V7c/5MEEIi
         M8hLhO5G2bMKAQ/RrOGSm1ZYvB7bZnTzG3VtqiiIYQ+A1EgOMs6bGU/FuQkZwS6XNHSa
         MxI1+7nwYk1szaxLUED4XNpd+SD+j1Askn06hdcd5uoGetCpnUqayLhk+ZzdA9559H9g
         lWw5IZNcmOwt7aT6xysDKKL22NLP0YOCSb/3QANRgO+UEwngg02syB0VOOYWNP1ATbbj
         Kl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729063316; x=1729668116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vX2MWErp0/u4Uf4asG1ORKJB5iRHzlOAqYylAI75SY0=;
        b=f+mb6wWXVxc2/t0JNQZBb5eMRH2st9Gwgg7q+QjmIKrHU2RlsJaovanqM4As4ARmu/
         ySrxC21T9nH+xUaC+02162PQFd+rajoqCXQJcCrjxy4+18ALhK1g/EWWtmVcWbZstjbI
         +bLFLP/Uw1L/1sT2pKn1ZDhXb1wWG56tkpTSKurUkZ5ywe0cXaJ2k0z1dHWDgxwgNfkM
         NwHUsAlBK5B194IYetjj2upIEgB+1Oaz6xdUL7MhdWhR78v1CcNBRyDEh/ZTbnL1ofb4
         XeA3Ft/9MREUEzWKZhc02022TvNf6vlUHHiRotRyGj78w/X/u2syOZ61gjV4ag8K4/TQ
         NZ9Q==
X-Gm-Message-State: AOJu0Ywwh9Hcj+fkrWn/mAKyfoRSVmzk9CX0x9SRCIeDJ5J+DX4vfflp
	TDSCM0lHKW4CX2RJr7T7uWswW0NXKTTHTayS6mxbTPa/pX+tnoON1fJV04LbL2c=
X-Google-Smtp-Source: AGHT+IHbasEV4OEbnj6oWKrBr1odwTwS9/GUyVEzEp30I2Bp530ocpSedDMrkezLwO0TtyqXQOJKjw==
X-Received: by 2002:a2e:be20:0:b0:2fb:5c84:929b with SMTP id 38308e7fff4ca-2fb5c849623mr44326191fa.36.1729063316217;
        Wed, 16 Oct 2024 00:21:56 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb642a8fdesm1289761fa.5.2024.10.16.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 00:21:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 09:21:53 +0200
Subject: [PATCH 2/2] gpio: mmio: Parse ngpios property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-gpio-ngpios-v1-2-f16cf154f715@linaro.org>
References: <20241016-gpio-ngpios-v1-0-f16cf154f715@linaro.org>
In-Reply-To: <20241016-gpio-ngpios-v1-0-f16cf154f715@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

This makes the MMIO GPIO driver parse the ngpios property from
devices instatiated directly from the device tree so we can
further restrict the number of GPIOs down from the number of
bits on the target register.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index d89e78f0ead3..9e944c191551 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -694,6 +694,7 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
 {
 	struct bgpio_pdata *pdata;
+	u32 ngpios;
 
 	if (!dev_fwnode(dev))
 		return NULL;
@@ -704,6 +705,9 @@ static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *fla
 
 	pdata->base = -1;
 
+	if (!device_property_read_u32(dev, "ngpios", &ngpios))
+		pdata->ngpios = ngpios;
+
 	if (device_is_big_endian(dev))
 		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
 

-- 
2.46.2


