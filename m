Return-Path: <linux-gpio+bounces-21710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BBADDD55
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 22:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C64640170F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 20:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B2E2E54CB;
	Tue, 17 Jun 2025 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7zK/KYH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698373207;
	Tue, 17 Jun 2025 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193062; cv=none; b=jSNyqVVDeAonuSXOjDRgJHMVDqQAY25bUjxSGIXlpKLtE1r25gTgD+T6g7r3VkET/hNZTeF6UVkJm2LaUWlT/N+6s9+TxoMUvsAov7MdI1iHP46vSP2gwZ5K/09fTilNNgysmsDhWe+eucxU0TYO4aLhJP+rTv8ITy1GQF+ieeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193062; c=relaxed/simple;
	bh=eud8+9hBr/h+CvlE4nkoKsZa4yq/N7FYS1PjHN6b6JI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRTZdypLKuR2PutaSYnT2NlzTh9rndEKFSM7sfl9Z0rFj9EP9wHz/XK0NSbnhyOWEOtVHI/aXHHFC25Miv0I5SgtAXP+PfsfYyovQ5hG3HW5f2tWxFozBY0h99TPmH++H8G73JeKSgDPiS7T28GvR5iHZ99gWNZpKho2pKYtfDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7zK/KYH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad572ba1347so991603266b.1;
        Tue, 17 Jun 2025 13:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750193056; x=1750797856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ2wdMA30iMLFQIHflx4kCA4CDn4/hP2CnpEzLseuO0=;
        b=S7zK/KYH0fFds83SmHqAdkqzlk5cjusn9RnlQTGgqOcNN37gKUtF1oC5h/5YrJxvxZ
         Zw2e5YcEVKgt56XiO3X+dXG4Z7Z/llDUdE2LD56sowSdYq2uplO2g2IeGhFq4xLUI3FE
         ZRgb8582v1TQsayb1OCe+BJ4JiQL5x0tvpL6oriQVhsZITKLnrQNo5X2OU3VZT8lg0X7
         5A/2apusl8cxM8XrubqUtVOBVe0k9QhuSTafcgYi63XER9Q44XHxapNe3HjXjBA61sKB
         vSssGBKhHa+ulX2xFRZ7wv/yA3QhFRJlCwh0VhoHmBRoUi/1i2YhMdFwb726TSPy8itD
         pOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193056; x=1750797856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZ2wdMA30iMLFQIHflx4kCA4CDn4/hP2CnpEzLseuO0=;
        b=KWA5l43l4d16kbSBZSTaQttXJvuGKCuW69nP6/Df9Bym8JNQW+Kdqbehn+XU/ozzzV
         J5fAoIGagGEYysfuHypSDhf//GsDNzeGbkdJ6d7WE7rKSILtRcJLCCxs7pEOkyysozLQ
         C3/b71xesihNsvYyEdIoA7If0jg9CUxghduOu56HHbByBrOgZ/SLyCyMz6FJYsDHO8Fn
         QnYWKfcVjYLmbEK6BYB1HTfDFCbCLufur8gUvby5rSHKt0q5e3jOJwOO+rgYiaRvnRXq
         SPwnUfe3XJpDsJtbr0JAtzPcYfgIlLK5qmF83wuOWkNsnQH2Ob7Ab9wpqyz26Stdb0XO
         tnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyEfhw0sM6wLMYoREENsHuE8/fxFvXUd53jHAfchC3jDj+ATH/da2UmEq4TmHSu2PXGWG9j/Rn2dm2bZFB@vger.kernel.org, AJvYcCXTmERPmeVm//z/0psO+/ZsVSCFIKJh8YoWYYE1rCKRfuuk6WNro2j+3CHc4V2MAYCZBbsBC8XFR2mW@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZummAmcH0uPCu9GZSZVM2C7nTJT4QSBmx4yFO1Wt929Neka3
	y0B6PHbkpJpdp5x4vIALIHuigS4oOSlcqOg5Fj99sOR3UEXs61y+ZsoNRWyQo8be
X-Gm-Gg: ASbGncti+tlPQm9BgldwIYGepXeln4hbxwDF9FGGZesrcPYcsg6OqejiKOQlGMT8cgQ
	3i7cuoWkEbTuzbkKrZD9do/4APtgYkVKBzwsKAxfio1FwPwvTMHin01fe/hCXtpAYZRqJZqAssS
	cCweFcJynkVm+7om+oct+Itfeplh10BTfLcytd/j5tkFZvfTEoTOphdu/TG9182J8uDszrAVI68
	/qqd3UjiBYWJDEG72qFeJMYSxVqUQTt0An/6Ro6cbwXPOLo8s2zBvRr9H2UEuruuRoZK7YwW/Tf
	1MxsHGUbN6Ga9Im8AASrdmNzBuXnmKsbk2M0mB10Wo8dMrPLgSg74gg+NzLWcFg3dXv4Vppzj9q
	dhlRTzRj5qr+NxxKuutaGXg8H6Biz
X-Google-Smtp-Source: AGHT+IFfQM1cqbFD6eGFnqg1mn5mmuRAH3iBv3+M8HBluw5mINqhhx+vaOZni2Dka3msD7vASmKwgg==
X-Received: by 2002:a17:907:c1f:b0:ad5:6969:2086 with SMTP id a640c23a62f3a-adfad437e91mr1285998166b.37.1750193056252;
        Tue, 17 Jun 2025 13:44:16 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec7b8fe73sm911857866b.0.2025.06.17.13.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:44:15 -0700 (PDT)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Maria Garcia <mgarcia@qblox.com>
Subject: [PATCH 0/2] *** Add support for TI TCA6418 GPIO chip ***
Date: Tue, 17 Jun 2025 22:44:00 +0200
Message-ID: <20250617204402.33656-1-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the Texas Instruments TCA6418 
GPIO expander chip to the gpio-pca953x driver. It also includes the 
necessary device tree binding definition.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
Maria Garcia (2):
  dt-bindings: gpio: pca95xx: add TI TCA6418
  gpio: pca953x: Add support for TI TCA6418

 .../bindings/gpio/gpio-pca95xx.yaml           |   1 +
 drivers/gpio/gpio-pca953x.c                   | 110 ++++++++++++++++--
 2 files changed, 99 insertions(+), 12 deletions(-)

-- 
2.43.0


