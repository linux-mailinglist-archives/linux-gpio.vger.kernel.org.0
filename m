Return-Path: <linux-gpio+bounces-21198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45733AD370C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 623CF189BEBB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB8E2BE7CB;
	Tue, 10 Jun 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xenBnU60"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2982BE7B7
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559083; cv=none; b=ggMf6bsh7EyjGfjhQPp/Qwi77stWFNOVrZUkCKmkbqwJV+/veXOgVPCJ5EgVaqjZLIsExJA+C9kFKJsAYBQ1FZfIDIEzVxDHhy7BSh5b3wQLdJI40oQZYi+pekOhM1YyNWuT1jqCFG8bNHIT0n/9eC4UEPXEF2lrBWgpLLhec/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559083; c=relaxed/simple;
	bh=KwxEa/uJuk3pJvTN2X8lujDshvrYOWCdkyKc2L1pS/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZZWRk/o/B6GqTdWAsfSrghhqBcZCYx/NSAe57SWW3/Dnh+Tnf8lQVx15/rBdgtlCEsBxxKmdHSV3YUfctd1copmDO7E7kjlipDUkDEb5Y1m37wluel24cD6oCbgSPG3mNI5hi0z5MIJXCl30m+NxVgcHU+HFUg3/ywHU/1NrYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xenBnU60; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so61996635e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559080; x=1750163880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=xenBnU60b9gQp90ap5DPzJhLcijnnQdsXm2JClJGNt/V4YeFS0PUSSsnpA1dXjpvrN
         Gk3QlCfAEqP7ISc0YuVfRDOVMuy4fgnsMCUnZue4agx1vFIag8r2QopEKQFtyX+G46YP
         CWCsfMIgFTAtbArmZTB1LsHOzshRzJGODf2IJpQ6195g7cniMhWaqJ1c6c30hd1Gxu/I
         62S43YH15Jaeq7wvWlMWIyh3wiLTWBfcp38S4GnJKId40yrZbFY1rUDKZrUlUn1LbaWI
         +GGPjn1QryGSU5hBbzZ6Flj+9DlycDJpw1ngOCnG9lp4uWEh7BmgqAusugVqNAlX7uj4
         EFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559080; x=1750163880;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=WgwxWc5XSP4fUZAXsFWppuYsxg3NgTjzANb1dBggqoo3z8aCWw2RD3GheOgapCmk1t
         AspwAW3Ybi+GM7BXpDziD7IrgYtU2vIAc9RWc/1C8P4wXJgbX6UNFcWebViAtvMcTB/f
         KBi3e+hdC0yl2UBgUd7gfIMN93KV4YAtjwQVAslTTb5cSbF0nhwvj9ri9QvXqhNWg5mr
         L4GaTu9BFcf6ebTybzbebdfKkkMATA1DQ2/VQ+r5xxMMfvdmuyz2Ji1roMHJD9wNoMFA
         /wBvEF1fDr2OBuuWFo4YIyM7034YN3iSvUrV6N8eJYhPepkG00gkl3l93c3PcRGr8coi
         rMXw==
X-Forwarded-Encrypted: i=1; AJvYcCVCei8wdivpaEwKOTfVfOczMcZuGUMXXxUl6Kog0EmiT+8H+U50k5GQvEtCj0aqZllFluPxlnzgG248@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmEETLU1vmfyNGl1tXNxiyrAL+eSM0FgIdrjYYjA6SBQyjwJE
	nDTcRWoIJMMRxh4+LSG9RLWjh08sDcFlVv9yKNUoDQEZGVcwojaT9nVeTTo6aciLRLM=
X-Gm-Gg: ASbGncvXRWIs5eKfUJGl5zd4JJqtGnlAYTjv3f0jOV2EZDoYstqOuyUEHkY3jAEgCRS
	PbZyRdCpYChAVHf1sNnyXmP2tDk6VK8RnCOVqB5i4to5yX5NFBCI5OB4VvaFZIp5ZM7e4+Lk8UU
	PzjYJ8zB06tNRacLj5ZLixEwfxpQovttheQsImrFNRfofWb327ibOC7sedT5mdYWM+G5+hdfV/M
	OzQIaX87AeZFLbRTw3Tp4nC5C8pJCJpxJeKRmD/Mjz43KD7bXaxrs1s8qGfaZeS+6zk2QCPcZiK
	auklxEFyTJu08MqpHxUTYOQRAeyPUVZOcMAVsLaEO3I36zyEbECyQbhap3Mo6b4o
X-Google-Smtp-Source: AGHT+IGsSDaRB1hqZwU1/G5MCu4Szr+Exf9GnhrFkMwxOumN0QR4RfbCMoZmzXDX0IpoSo9pzctkjw==
X-Received: by 2002:a05:6000:26c8:b0:3a3:7077:aba1 with SMTP id ffacd0b85a97d-3a531ce677bmr13926248f8f.48.1749559080359;
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] net: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:37:56 +0200
Message-Id: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQnSGgC/x2MMQqAMAwAv1IyG9CgFP2KOGiNbZZaUimC+HeL0
 3HD3QOZVTjDZB5QLpLljFW6xoALa/SMslcHamloB7Lok5wuSMLMF2rBWDGy3cZu7emwDmqZlA+
 5/+u8vO8HXLWAMGUAAAA=
X-Change-ID: 20250527-gpiochip-set-rv-net-9e7b91a42f7c
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KwxEa/uJuk3pJvTN2X8lujDshvrYOWCdkyKc2L1pS/I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcm+33A95fkBlAJxBo1vos+qspK8wslT2V1V
 Wh30tXt2cyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 cuYrD/44rRjrB6mmO6/fNfGeJctkPA103u6ffSW8zmiUHtgIJ5B1V5Qasz+jhTr2tg3lUTCnbYe
 w34O88SipckwpEJoWpdvuB2hboyNKzPQQS1WPa2E39MYGaJw7fYPsbvFVVrtxBCZ7RzWFExW3MQ
 3TOsO1fEzH+UzzX4LwNR5DYvCTbc5uo6WA/tYEj2Cf5UdkI3ukiMfJB3cxEaZgW1Xhv0oVIOX0C
 NpnbvH/9zY+5TwvO/xjSNoOdxotzl2H05KRpJ5Aa5WaeU68D/TlijfF/9pB3tsq0N0SK4uPITOk
 1nvjFoAGwO9zoPERN3DQ+sB0Tp5RHQXfrfpo11vUn9qqGhDExZAen6z8FlYixLirLMdzj+UvWxj
 XBKO0O1hoZfuK4ZHjVYa5tdLT5ofLoIoKxVQd3n3UENerD2HXefvq4tvwtxQ4+MVk9r0Vwd8BZL
 dweZ0tHZ/7Ntl8kGYNe7A7JtI42JgVzJXVV/t3fa7pzQBU+ulPgswxTSNIeYXYxETT7g4cYWjK7
 25FpJqsQrKFCE9mZbAaj+kQt6QKR7ceIUa3pe0x5mnErUjbysE7QUJcphFy2dh4QZ+YpI328z8P
 Z8jaeoUcMeTqO8wIjnMJV4NBzsCznTgTgvtZ5EFwA8JfF2IN/tWFT0I8wKy1PwzioUBgGqzP1R3
 QGBdUz7g9snOoDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/net/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      net: dsa: vsc73xx: use new GPIO line value setter callbacks
      net: dsa: mt7530: use new GPIO line value setter callbacks
      net: can: mcp251x: use new GPIO line value setter callbacks
      net: phy: qca807x: use new GPIO line value setter callbacks

 drivers/net/can/spi/mcp251x.c          | 16 ++++++++++------
 drivers/net/dsa/mt7530.c               |  6 ++++--
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 +++++-----
 drivers/net/phy/qcom/qca807x.c         | 10 ++++------
 4 files changed, 23 insertions(+), 19 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-net-9e7b91a42f7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


