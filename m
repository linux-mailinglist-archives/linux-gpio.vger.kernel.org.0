Return-Path: <linux-gpio+bounces-21639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5DADA947
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DA7116F35A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7661DF267;
	Mon, 16 Jun 2025 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3HNRZZF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE2B1F0E2F
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058654; cv=none; b=BNL6fvDJtCUmXO7DCedt4CyeJNJLzt2gOcy1lJoWk/GZgj9eumsVCkbRoXhHnMWLqlNQV9/LDF01D0NvBBRKwOx6ZrR1rLsy7acKS29dhKTyticRg7xPe27IcVuNKs73sdI4yQaaZS3k16f6t+hP2zX/HYxL/EQTFYqs3WRn0xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058654; c=relaxed/simple;
	bh=uR2GGIFJoNUWja26+eqtvHQqGtdircsCPqOzrEceufw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ptQ+Xg9MM4xtbCQCZFGwnj3GFQKWKW81L1fcq/AO6uOuXDQMLWdmv3AIDfOHw9JCaAP6g90raVwIIm8+E7PoNe6WssjTmP2eWoKZsep0ySF6/0XN+8xZ3/MtPvYxEdVfyaGFWdcuvItmJXDyk3IrHkHzAWQ9Nkkyb/tBQgLLgFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3HNRZZF6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso825143f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058651; x=1750663451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=;
        b=3HNRZZF63Ni+q8LKEYBqpEnIv0wvPsIoqmZNEx8xvkDwavyGY+kJ/170Dq3QiRj4zO
         a7n8zHFqOvXrggBUaFaAMZe77CQ1lc2PDceLIl6yOpZV71V6TT+MiElBJ/0o+BbcMVTb
         0f8EIojqGA2m0ILx8gRit3q3KSkCVO4ri3xaZK9s+DxgJlx+JN99QMGpC2vL8rAnwH7Y
         nZo4FK8jipnqq/MaTWYnNZCo3SFbYN17TnaVe7+XZZAPhI37vFCIuTa5KbssqL6429TD
         AQd9FSnoIoZQhC3c7akx3AJumZcpF6gWuX3mIMqjTRwUk1NPqtgH779Y9lGzu7nEv8L+
         Ph6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058651; x=1750663451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=;
        b=m1QkASxmEkcxZXKovlLXVVdJFZn7VsdfWmgVjJWRW6p0IgtAC15qvYaD3iW5TNHYHM
         drzE82MoeCewh7oximL6WdsFuYUuAzSXSe1yVAuyB8DD35sOQ//cDSC5kVnVvzm5CZsW
         0D09he0F5ePNX89vvM+kaBFsK3iRCmv74bO6gpVV9RN1L0NOYqWE/dDOfMbY2eP0ZtKE
         EBhK+Sd2UTvnmJ9EujQtqdz1+IhRqypP3gUF0qZJ0N+5gtTJsVaXfM6ES2hKrlWmP7Q6
         aer8f97Y7XtXyUOOJuAn/L3Bxp3NVR8e0Oo79pv46OK1cBaV9vetVXpbIthOIVsn3MSc
         Bj4A==
X-Forwarded-Encrypted: i=1; AJvYcCW0isb8vT23ca+Gp9wgZHlNdzq/5frXkWBcxKd0E5kq+7UtvFJU9f9fwqDqmCzAt2YG1x/V3tpwbCb7@vger.kernel.org
X-Gm-Message-State: AOJu0YwahrJWJbtjet85FoSiTecYJl4oMPFVgBR9Vp9m6B6Y2+LoMQHJ
	B16GfixU+V2zfwUvW1mAgD1NGo/N2yxfo/ZqPYA31XB/8rpXm4pIKxBUha1wozXuRy8=
X-Gm-Gg: ASbGncsSqnuM3DXZQQS5ExsR5u1rfbXpRVRSC2QFkADgc4UCumkHXgWWl/RD4fiBI1W
	rSlUjyKbQMCF5QiJaW8GrrB7FyP44d3WXeW1yoFWOiEwCNGGKrElnWrWcao+Ezz79ZjTjR9ZRjz
	tRuDzRlzXVZ0dVM30omhktCJw0Giq2BRJdf6tsL9NDNAtR+EBmb5erg3m5Lhb48khhv7lxvdfvV
	YnxChTGl2uYkYjAgXUr/gO+tkE1Of50FTrpMJVY8ejIJIRlpH0rb91MKA9lXcrtb4SA79MJg0fs
	Ne61oGXTwGeTT7kG5Sb9C4SKdAbaMDojD9cX0870Ef89YvyT+gq2GxKdCxDtX5iL4po=
X-Google-Smtp-Source: AGHT+IGOQ/05R6rCvIZwn3dIA2Nugc/IsmfEl2HAgh9BK3DzCi3R0HMyStiSUVCIGzVyM4FshOI6yQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a5723974e2mr7184735f8f.15.1750058651143;
        Mon, 16 Jun 2025 00:24:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/5] net: use new GPIO line value setter callbacks
Date: Mon, 16 Jun 2025 09:24:03 +0200
Message-Id: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPGT2gC/22NwQrCMBBEf6Xs2ZUk2sR68j+kh5pu2wVJyqYEp
 fTfjfXqaXgD82aFRMKU4FqtIJQ5cQwFzKECP3VhJOS+MBhlalUbh+PM0U88Y6IFJWMo0ZB7NLo
 7m8F5KMtZaODXbr23hSdOS5T3fpL1t/35rFZ/fVmjwlNt7aXvtXd2uD05dBKPUUZot237AKUyb
 PG3AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uR2GGIFJoNUWja26+eqtvHQqGtdircsCPqOzrEceufw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aYW4MUwvKOocqHKQFcXvihCO599Xx46HuuP
 BdHcdXSED+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmAAKCRARpy6gFHHX
 cvZBD/0aIizVMfAcrRGn+eGFgxroefc64UEncpO5XRYZr4fpLreEOW/l/6kJdsUC3ln+H5m7qyd
 afXzJbi7dzgzaaakQc0F1Yl+Xk3ybyaO9jL9EijyiRnrThzoYCuJEn2/uLHV+NK8n+mMWa6/vmU
 4iKlPXYrPpKMMp4vF5r6UBKlFKQd68CXKBqaUvLQlq5NK4K8hFyMVxGngeVomNZJEOs8Xb/RNae
 CY2grMseA4NDMv0+JNPAEoFFPvYDyhLjm9jSZdwXItdJJJ9Hxs4SoAo+hrS9mI1nFETaXK95JII
 K5lzvRb8Gaciin93TS4nnmpboRPiyKHjjNjG3f6G9bMD9N4O1ZhsJdidluXfoYINmbuECVCmhBo
 oI8F4ba9fca7wCeBSvTpopmVe055GxvDiUoX1Pf4BrEEqXdIU1O3d2yadpQcrNqc8M2NJmnuVwe
 HcEjM/EZiESaur6u6pva7RjUNFK0AyVWHaRy1BQO66SK7Z867KEhTyFW4Ktc05qPpzXJY+nUvV/
 8RMUio65JmAVSUOsG1GzV48Zh1dlS46nqyItSAiEje8/saGqMuCqVyyMK1jZT/wYP576NtkqcXf
 +iiCZPwC1n6roZHDTuirFnU5fInYX3zemFdlV9BGW4VaG3RuwHRHuDuP0FlLi4HraM9oJSfXHh8
 Ez87K2sH4EmaVOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/net/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- propagate the return value of mcp251x_spi_write() in the mcp251x
  driver up to the new GPIO callbacks (and the old request() too)
- check the return value of phy_read_mmd() as well in qca807x
- Link to v1: https://lore.kernel.org/r/20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org

---
Bartosz Golaszewski (5):
      net: dsa: vsc73xx: use new GPIO line value setter callbacks
      net: dsa: mt7530: use new GPIO line value setter callbacks
      net: can: mcp251x: propagate the return value of mcp251x_spi_write()
      net: can: mcp251x: use new GPIO line value setter callbacks
      net: phy: qca807x: use new GPIO line value setter callbacks

 drivers/net/can/spi/mcp251x.c          | 37 +++++++++++++++++++++++-----------
 drivers/net/dsa/mt7530.c               |  6 ++++--
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 ++++-----
 drivers/net/phy/qcom/qca807x.c         | 13 ++++++------
 4 files changed, 41 insertions(+), 25 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-net-9e7b91a42f7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


