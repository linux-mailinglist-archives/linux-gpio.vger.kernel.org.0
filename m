Return-Path: <linux-gpio+bounces-11493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C339A1AF0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FD8B1F2393C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 06:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAD11925A5;
	Thu, 17 Oct 2024 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3ozVM0U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81130192B93
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729147579; cv=none; b=iyFLCAdLkUvncFVmYbMMI4wII7Lf2NmkkWmEQEpTfN07nyqaF2hyrupMfMlgmONJQVGt/CXEqfMGuuOQ7JK55nkZ/lV1fH821j7G1SuWmbGgVcUmYGP3+95s5Aeg5NbJ+1rfkgijdrHM9j5BruSrjWXvaRQxyzGgWBbV7iJKkMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729147579; c=relaxed/simple;
	bh=WK5EPmV7WngASMqeBmHyX5PpSJNTzXHByZjGEFE0fdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZveGFKwqM0aM3vqMCPO+z4pwuwFTS86uGOUo8dASwkv3w9kVPXJv172abzlBz/pT9ZhpUXFGv80jhODBv5JPCi7hhbptpNWYSahscswv1Gjo6RmeUZDIZhHEmOCzkoJZKYUb3crOE9Rl+cs2E928UzCKf2nxDRPwfehwkjjHQCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3ozVM0U; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so6959431fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729147573; x=1729752373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGNRld3S8W8LlBkvTY/OIcIgC17GXHm3X72TTL8w02o=;
        b=G3ozVM0Ux52qwCzkB35px6PyDw36HhvDI1+ldlneGbza6S2PBMrf6xmdc6xxTXya7u
         Xnfvjuhsvw19ObbdOdstqBZ1lH3joaoXuFuBaZxtm7Nv3O1EpHLZwT9VAjgMD9B1Ob5s
         EpGL6tZp2BCOneqVolRx4YyIFiQQ5L+Y2E5EhVlWIyEvCL7h0MGGTLJsOkRLXqvBgKu1
         R+1Z/AwbSvyc1QnxycAUEiKCP1pp8X8MVdCAbFPLtWWKv1dX0aI7NChLvz5YtHVVuibe
         QePCHsYCIWcILpJsc8AhHtROhLbMZ/5Bpn/rYyLxeOFjQGvrshl2KZoFT15e0ROOMl40
         logg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729147573; x=1729752373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGNRld3S8W8LlBkvTY/OIcIgC17GXHm3X72TTL8w02o=;
        b=JthkdNV5xFVfzX/REpXRUGk5NoMBrsDeDXROHrihK5eHJnjDTY7lNX4575/RXSz2cJ
         JGGLfprG2/NB0TjxQh76HiyBubRSgd65NyJR+vLgAU0BXcP8enf4bucp6CqDURX9EXat
         R0wzqrNOw99klvX188uQecp6huEeMb7H8E5mNJuzS5xD95p1co7cyFC9egK3dy3TFUjl
         RCR6V8QK6TMYKgXmVIqyRRPK1+tiezPfmeRY3v/HUEiqMw2sPZ1sSTlFGqsT0UUXVtjk
         lluqzm/9tCItUPiznyB9Y73oedOmAmDCcwj8jemnYvb4vwAGBEdpLHv+oR9ltQlirO2c
         bh/g==
X-Gm-Message-State: AOJu0YyHjX56w+q+A+AaGir31sfbHbneLTspWC+UDTIFkb8jR3FfUICv
	KsAEtZgDnyjYUpekMPfDsuSxl0O+RMKw8LI6RzEwjGbpue6iGbWUOolhOtOInxTMeTxSUn/8z0v
	1
X-Google-Smtp-Source: AGHT+IHAWC2AfrdgMnBPxkVe399O1NRIOBxPAd++OK4Ow/03rvfzn3jtm6nRI5ty9oynrslTPmimeg==
X-Received: by 2002:a2e:4a12:0:b0:2f3:f4e2:869c with SMTP id 38308e7fff4ca-2fb61bcf5fdmr33787591fa.44.1729147573249;
        Wed, 16 Oct 2024 23:46:13 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d1a7398sm6139271fa.105.2024.10.16.23.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:46:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 08:46:09 +0200
Subject: [PATCH v2 2/2] gpio: mmio: Parse ngpios property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-gpio-ngpios-v2-2-cecfdb38d40e@linaro.org>
References: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
In-Reply-To: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
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
index d89e78f0ead3..c772f1b6e694 100644
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
+		pdata->ngpio = ngpios;
+
 	if (device_is_big_endian(dev))
 		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
 

-- 
2.46.2


