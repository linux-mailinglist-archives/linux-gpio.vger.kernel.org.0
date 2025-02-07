Return-Path: <linux-gpio+bounces-15571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB77A2CD6B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB47216D3C5
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352C51A3145;
	Fri,  7 Feb 2025 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgftQXcQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7D519FA8D;
	Fri,  7 Feb 2025 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958571; cv=none; b=CNde+R2YwiHVC+VsLi5xyoSUR6PSl1OFXnYQ9Mn0zcdpuCOgXMR5JqVBKHvdJ8N61ajZKpTxL9oUZvs0DTo2fu1ZLcDC7/Bx2R8hiPokrrtJlYYo2w6HM57WtKyFXm/s/yNcV8vHQhFCmdMNn6lGexT2SLoI+UijZD1zA3+T8LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958571; c=relaxed/simple;
	bh=yaA+1Xx4ejt9Q5AC95dKbp7n1j1IN1zcvm8KSM9DNA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMbI7cRrHR+X4HCD6IoD42KpvC/G7LwbIQKjXkjObcNEdO9UvLKkvRQpbYHrtXpFrL8jEgtyunbJYPut876cf0Ub09mzm9OelJG+CJAYDrl1hdzPG0Kz+2l2SWNyiwRCbdZN1+4mDTh83f6FfblBmJ/cGN3pvIjaW3Fq59mYxD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgftQXcQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so1597523a12.2;
        Fri, 07 Feb 2025 12:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958567; x=1739563367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUllOVoQWt5TpL/p8/hvlyPScQXI4Ia6hOAN5diMcKA=;
        b=DgftQXcQi0jDu4KsKg6nzt3luKdg7A1+waIk+jo0S4+Lh3DTXh73wT6u8dCzs0ptdA
         6t7GCcak5cLSUspIliNRoe+f2P+4/kg/oIJ+fAok/vU3emwsh5dzMPd2z2bEJc/m2xUD
         RT/keDEMypLKBmqG3JZiaIzS9w9TaeTcBXl6PA+Y1zsUb8bN1jEVcDSJb9zkagipmjfm
         g3AmhmcMURJqmS69ya+hcNkzzACftSiYuxlgCvMVzxCkiJYP6DQzNkcsDkwuu0shkS2F
         z+318/FmmaDd+Hn/95bF3bu0ypjcRRnHTipIxxjfDsT4LF8TMif+OtC0sjR1b886kB5n
         /6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958567; x=1739563367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUllOVoQWt5TpL/p8/hvlyPScQXI4Ia6hOAN5diMcKA=;
        b=EFukc4/R7mNyzm8itQ3agANW/hMrJwgx5s1ekmthngSXVyVuJZCbbrdEMB0bHQudXt
         F9Vu9xWl8/HvU6zODUjJvWB8Jtd2LZRN/4qJQJegyDtFkqvTo0RcTBqrHUw14/RO0yCs
         JdsZCwOZyyP78zxm8WL6rjizgSSl+PJNXobJqGENaGRV5ipBIXA4CROE8sb5DCXX4CCx
         jtK1tskJf3lR3epv06l9fWuTTkUYQaIVHq11ecAM5waakStZVxYnQswBmJ3wFqv+i/8U
         RJmGnPv5FLDaEHvTHoAsttQC4KU4fcox9Fb5L8MBOSCafIAx1LVoNluZTYhT2uLaTXJ5
         kB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJssotnIpUq6YESi39ikYbaC4m7Ewg6k/yQiLpmUrd7Egztp4daBqOufZ2X1wuKp9g05GX6TUg+HOfxXbj@vger.kernel.org, AJvYcCWfsaxryNPoViBGweAHPHVJoswS2NvZnaI7qHQ2aEEDSqizsrsaj4fsqmhed86mgySwjXyQ+mkSEq46@vger.kernel.org
X-Gm-Message-State: AOJu0YwKoXrUX+QJDEQ6e/Q2Q4rOrafTLuDg9zbbBeHNpLBHS2bwYqN/
	2LQf9hyooq1mS+1MUq3U7+iyUgjW/2DtuiTtzYZ2ZVnvcoenBmjkfUv9Cg==
X-Gm-Gg: ASbGncvhp1FpQuwonydr8Di+HRRR3GwMZmwB0ZAjLXMqjXvom9sLj1A0xHKXhdgKU1x
	SsH6n5ziOod9pio+z6d+8CMuRiOc1lr3U5x5SW8s056bxdhORYNEwndPRSZHRZ+OW/rGkR5yUxG
	QzBRS0aQSD5v1A5eXU5yOHXFkutzrpK2gQfpi82zY+jiBHSBqTEicNiolMFBUXzmbQXJJap8rz7
	mCQJOEC+Op8EB7h6fYC70GNSQcfdd4iwM2SUE/WoZbYTCt2HXoX3YThla4BSt4a+7gR4TAiQ0oJ
	E/Fn2o3MYRrATQ20Oqn9D3gNoEY24W0VkHJPJsG6J1zDfR9wIVtSwSgy
X-Google-Smtp-Source: AGHT+IHHN0ZnaKhydyOaLPxKDsHa3CA/i1kjMOcuLsVlh+u9S4xMjrVpvyyFysCFlzWlTF0P3YpXMA==
X-Received: by 2002:a05:6402:3903:b0:5dc:7eba:7832 with SMTP id 4fb4d7f45d1cf-5de45029345mr5635286a12.17.1738958567441;
        Fri, 07 Feb 2025 12:02:47 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:46 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:41 +0100
Subject: [PATCH 2/7] pinctrl: bcm281xx: Fix incorrect regmap max_registers
 value
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=1089;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=yaA+1Xx4ejt9Q5AC95dKbp7n1j1IN1zcvm8KSM9DNA8=;
 b=Zb49rdB/eQos58j5aV57evRQc6TfTbLNsaU4PNCSruIsW3ukPqwmlboB2cueZeZDAjOLIwLPO
 329UazjmwphBIFoDIHkqKmzezzoM4wlOpuUtadzO/CjEOQQ0GfTbV+l
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The max_registers value does not take into consideration the stride;
currently, it's set to the number of the last pin, but this does not
accurately represent the final register.

Fix this by multiplying the current value by 4.

Fixes: 54b1aa5a5b16 ("ARM: pinctrl: Add Broadcom Capri pinctrl driver")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 73dbf29c002f39cde71352c1bf806872dd218b62..cf6efa9c0364a1ad65885c982e7634f26d19c944 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -974,7 +974,7 @@ static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = BCM281XX_PIN_VC_CAM3_SDA,
+	.max_register = BCM281XX_PIN_VC_CAM3_SDA * 4,
 };
 
 static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)

-- 
2.48.1


