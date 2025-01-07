Return-Path: <linux-gpio+bounces-14582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6332A04AF1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 21:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 399003A28AB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 20:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09A21F63FE;
	Tue,  7 Jan 2025 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="YjCvLC2H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD631DF97A
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736281511; cv=none; b=Xe/s+ul4S/+nhYxSMqUWJ/GXKP+J7uJo6tFw/w5bTXcmGxkbpCXTLOiTNXAhv8PMhTfsLYSQes6VF8dzDXaJxL4c8SlQsPNfGH/PqecmSvFMbZTz1XbjP9mBUCvX9lxCH8CSRavkuPuYdhss3a56TgaFzi9GifUSHCsHGs7+xk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736281511; c=relaxed/simple;
	bh=31kjLyaoVOzIAs1m+zMi59Ia2jUwYW56Jp1YE6hLflg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q7miNkZBtMq3dcxL5HMjUpP3EFdQ7/xU/WnWIFVl6MK4rszqphqvaziMOK6avsn+UA5pAx2JJV8bDY8LfNhiVWwZtPfxbikjjZFm1HYlCDWmGudasM0b//K3/On625L4iqFWmVmLUdEdhvwIkJKSL4wTfN0OMz27EI272o5ygLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=YjCvLC2H; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 1E18459A0D6;
	Tue,  7 Jan 2025 21:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1736281022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yNGIiTe7uonx3NZIc6+B7LVjvR8RnIV2zq++EO7NLhg=;
	b=YjCvLC2HqArIGWGFkNYmh+oloGi7ZFo7WZGlTbxuHqrQVJ6mLNoLCTCkPkX1EJWEQyNysD
	Jj+7tBnAYyCrJ0NuSTD9CPW1+KwKP4wlvWpBUlayCdUJyU4rzjqmlYAI5vJ1UX8FOnvEpn
	KeWjgjbeMI6dvIE7ATPFkDvMrDxR9KSEe/1pfzY3E5jh1T8tcnTRMQKTll7hSUBN63dVfJ
	U7wnHRLvwx8ESIjrHDKOlsSohmV6lyQTrgEeE2RCM6SpZPNoSpPVjTinF1kPuMHNWHV+Th
	6eDOblXxt859JECDowM0NjF87XJqjgph22+A1WUV4iaePO4GIWo9DQ3KhP/Pyg==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	jonas.gorski@gmail.com,
	kylehendrydev@gmail.com,
	florian.fainelli@broadcom.com,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH] gpio: regmap: Use generic request/free ops
Date: Tue,  7 Jan 2025 21:16:20 +0100
Message-ID: <20250107201621.12467-1-sander@svanheule.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set the gpiochip request and free ops to the generic implementations.
This way a user can provide a gpio-ranges property defined for a pinmux,
easing muxing of gpio functions. Provided that the pin controller
implementents the pinmux op .gpio_request_enable(), pins will
automatically be muxed to their GPIO function when requested.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
Álvaro has submitted a similar patch today. My implementation's impact
is more limited, but I hadn't gotten around to submitting it yet.

For the original (short) discussion, see:
https://lore.kernel.org/linux-gpio/20250107102735.317446-1-noltari@gmail.com/T/#t

 drivers/gpio/gpio-regmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index f716eb069b25..82da0f1d78c3 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -270,6 +270,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->label = config->label ?: dev_name(config->parent);
 	chip->can_sleep = regmap_might_sleep(config->regmap);
 
+	chip->request = gpiochip_generic_request;
+	chip->free = gpiochip_generic_free;
 	chip->get = gpio_regmap_get;
 	if (gpio->reg_set_base && gpio->reg_clr_base)
 		chip->set = gpio_regmap_set_with_clear;
-- 
2.47.1


