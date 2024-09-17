Return-Path: <linux-gpio+bounces-10214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE497B04E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 114231F21E18
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771DC173357;
	Tue, 17 Sep 2024 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lemAkq+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C21714C9
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577093; cv=none; b=DneplypNaiWX0CYVnj4dMTjAgr0WWFNULeWH1pg6fcQfEQco8K+L9ud/Enj7hOemnmcCur8LapfqTPJuwi/8WAONTBWgZOo5zw7ImaPbap9/HKqLJFJyyy6G/q3CTmK/8BEPnrJD1Uy15oQPGMjbGG+iNXcAbsGs6TJ81hDhGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577093; c=relaxed/simple;
	bh=nXHnldG644VsrdOSHjncXVqPmLG1B3QJ365TlI8J5h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBonuBCQ9sRbFvRrAVu7Nsftouka67xWqP1lnClpjBGIgJVAZ1owPfcXJO7G7M5koL8H1x9Q897N9MBdea2DfVZHgLGerB1GyXdIrvVIiQW2peiQJtuYAnQaJpl/cg9EAQ0Ch2jIxX5o65/8das7MAYP6Gw2zkyGcpfQ57qJ5vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lemAkq+6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9018103214so782008366b.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726577090; x=1727181890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNih/OpkxebL+Nm59FftF8rR7sLspIHRp1QflSm/SJY=;
        b=lemAkq+66ghIT5dNVhE5wjLbWHQK8ygOSb4hTAQ2PRDW+2dyz1Vid0kHBxrckNpFqP
         Dwil6HMg8/lf0s21uZ+IIdX93k+chTlaaNCcZlkDG4wXFq65ytIAhTiOiu9ZbeBfTDrc
         Q1S0sjnS1mnMzzhXlvjU49v/cx2xqAg4pIBxcLBouGVQzLe3KYbvYi7LCZDOblSh1M9T
         mmS7mH4bdPCmmHiMrYqO02aQIKc9lwIU1MSU9Z6Wjaledd8xYticDSr61MLO48/DuHHb
         AL4f5Q4D922hq8mbw9lO9v0n3OjxpJaxF4zh9HxoeuqeFlxCE0KA34iixdvvAtdoT8Ib
         t59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726577090; x=1727181890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNih/OpkxebL+Nm59FftF8rR7sLspIHRp1QflSm/SJY=;
        b=LgNI3QvQbGTmYe4hAwRKbfMTNMcRsAji+i2mgN/q9DSxZcMsN+2aO0idoxyDa9r9Kd
         qzZcrwshROv+eifDqoGP0mUIl6PT/k+kKUqZ/ClFqGUqYQoJuvcVvvv6qcw1tUtaDnyk
         aYZjfwZNq5bxwJhvPXWyW87L5eXUJxFqDkLJFyjCld4tAMV5JgqVTLxaUL+tMYl6VMAT
         OykCwy0ZrJiuJEOifvWxfi+5a075Xe/btvBDqMTd9L3G4BHc02hjvr6wpKJtD8AYFKX3
         GGS5BzJrJqfjFf7koqliPbO7DM9vd40zimPLQl0O7HIFpEEujgt/eo+VQikcF8jt5de/
         dyew==
X-Gm-Message-State: AOJu0YwaZA27MgZm2i4OO/uKBWZuV1tD94qUlqgGZPUtIfFTbi1xeh/1
	ihuSEGESX2niCQ8cFoAwfqRtq3DIvAIrvDEWpn+u8CbdAv/WBAKZFPayymdSuwU=
X-Google-Smtp-Source: AGHT+IENl7rof5KL9wc7qpKXnx+V/yAilTEirjoDfWowSqojJYHbm0y5QxjvqWSp6Iy28dC6ey4FPA==
X-Received: by 2002:a17:907:e61c:b0:a8d:2faf:d33d with SMTP id a640c23a62f3a-a90293f8ec0mr1673277966b.9.1726577089903;
        Tue, 17 Sep 2024 05:44:49 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f453asm443317666b.88.2024.09.17.05.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 05:44:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Sep 2024 14:44:40 +0200
Subject: [PATCH 2/2] gpio: mmio: Support BCMBCA GPIO compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-bcmbca-gpio-mmio-v1-2-674bae8664cc@linaro.org>
References: <20240917-bcmbca-gpio-mmio-v1-0-674bae8664cc@linaro.org>
In-Reply-To: <20240917-bcmbca-gpio-mmio-v1-0-674bae8664cc@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The Broadcom BCMBCA (Broadband Access) has a very simplistic
GPIO that can be supported directly by the MMIO driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index d89e78f0ead3..af095ddb3bd5 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -685,6 +685,7 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 
 static const struct of_device_id bgpio_of_match[] = {
 	{ .compatible = "brcm,bcm6345-gpio" },
+	{ .compatible = "brcm,bcmbca-gpio" },
 	{ .compatible = "wd,mbl-gpio" },
 	{ .compatible = "ni,169445-nand-gpio" },
 	{ }

-- 
2.46.0


