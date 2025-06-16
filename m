Return-Path: <linux-gpio+bounces-21640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20833ADA94B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96147170299
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8E71FC0ED;
	Mon, 16 Jun 2025 07:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M4VZd82x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340E51F0E58
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058655; cv=none; b=NinIa4cOHgsTcqU/AkjCNCCQ6zl5ueYXoKJcApxHOKjir+CMSS9X8mFGUOf62Via7cI2/NPfcfVXN/is7NiX3VZocnM6kkNKCLDyrxMSePn1gtsH1XbZS8vTDAoV2uOj0vbglW+VBcOYRkP2BiT2c6Meid2tPRO7Nsg2nqwvSh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058655; c=relaxed/simple;
	bh=DMxSE+KlKXo7E9j2J1aDyImW/V4iGavbbTY1DlV8QQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xfju4anCA4UHkpQcjKDzeV16TbQJ1R0Jc61wPbq/HjMX3UQaIwlkfe98QyygtlWVUzKZJpIK9DYRpUYac68/dBV1K67uzD1N2JOms1q6hGAAZ5hxBZ8xELDPId/3dzLU7oL07FRJAKvYtoOXq7UmnVD0iuSZPvqK7Ru5D0++wAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M4VZd82x; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2782490f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058652; x=1750663452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=;
        b=M4VZd82x3dixXEQsRSXnF9xzzKKGjQyDdBrwnmF33kR9nDfd/P0r+ZeBxHoCVBqZ5z
         UkTDfahw9S06HeP8zID/l1nuCT8pM8W3L4FILkdOzHJyiFMKWPrnqRahp0dIMWMXGjL8
         daO9LDXcy3WNrgITQOzbUcEUY2t+2t+RzCXjivA3mVUD/S0vsmt8FygwCwg2GAXt5qFU
         b91hPFeINE+WftuBMjtF9U7C3bs/nz97+YLql5Jtaj9QVLgvUabbeXW1v4BrSByg7/t9
         NFMg1YOfXQl2fYtI46XaPZ+g2LqMIAca7H0ZLovZBZ7+uFOopot3++sJZXpTl8/hsjiy
         trng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058652; x=1750663452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=;
        b=fpUlcP4B2EmdqDhGTOPo6EAayTG6clKXSi+HTc6pFYEnll0I+KIxrsF8rGLr+fBVBb
         xT0AiGfALCfEiGKwOFDYgAYsP5g7L4GIqaWbF8tY08z1tL8HIO4/lhWSP38JNQUljO7t
         opIPeH6Gmw9+wLgpuFN1SgHXTGG3Eg6UgRqK8/QIo5xTfNujqDtyGHRO+GLl28GtYzkU
         zHBLdPs+qi71cvJ+HugRhrTlNoAQl4mUxMz1vh1mLggiKoKs8i5np56WIIZ7G4hK0jeF
         iNQ/tJpk8tep3z/qg++kUwmGRdLPG0iHO6OSiUqAHRxhZqX4l+jzYcRETXvLZvJXvbVF
         KHmA==
X-Forwarded-Encrypted: i=1; AJvYcCVN+O6LrdXNPMA4z4LeqAyR9b3SDJYJlk9S4SikI7fiwF2H3X5KAXEF5kNw5phpWnY35pyKvxumFAkG@vger.kernel.org
X-Gm-Message-State: AOJu0YydyDLiF67irT2VghXWOA+DgOrb1ElHkAdLnoK+r5r1+jtZ4NEj
	NyKuHVvJ/jZMPveq1xcLh79CNYdPnKBEhzGnqLhldtyU9Aoxmfg2vE0HvT/j6FJl8dE=
X-Gm-Gg: ASbGncsM1R22mU0DmzAiB4Fgku7AqNnFEVu3qda+jtdHRqWKrOE+VNH0gl+W6XSMuX+
	FWad8XNO8frtM9+y3YrxCJfi6hulDXMYNLpQLKNXGEOR1WIO8XY4Kda407qOAHaoIUDK0Miuoz9
	c4gfkxCn3yphboBODdaJbqrtbuO2nO4gIvQZvw51IGtkrsEprKi/5ALOn0P1z9bmbKVT4IyVsPi
	V/steh9EuDXQPdLnVe/v7McE2GvUX2s4TgHmbFfkp8bap0at3i7w5t/cqBRrNisC8Zu+ktxXR68
	0hqKPpdOYiHtmhESvVOkUDFBrc0YHTv5qbrMeKABbv2CLdzkRcdN89nh
X-Google-Smtp-Source: AGHT+IHPFBPn3Zq/nUDkUy4oRevEKPyumefMdGv6HX3562iJJprMTS9/QcD9Dlx1hTdScj4u8SVCMA==
X-Received: by 2002:a05:6000:4202:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a572367c45mr7317623f8f.9.1750058652323;
        Mon, 16 Jun 2025 00:24:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:04 +0200
Subject: [PATCH v2 1/5] net: dsa: vsc73xx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ooSfZcGlJ0aY63V/ZbHM5psbxtwwGfSHGbKlKX+V14k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aY68phhJHUiYmICb6qi2PtnsxOrk1Qj26di
 Sf0oPxAjkiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmAAKCRARpy6gFHHX
 cmsID/90DiNKLTStA2nd+V5BqNvhGiL18/ZS+yk4NDv771RccIIvB08RD8O6h9mQk1BbBx2PGDf
 8uUGoxxBYkl6SrCrU2WGXyT5gq7YAtwvpGuDWz0TgdkbCAT3B3FeIFwkAv0ykw1t7oPjNhRRO92
 FzNqC7ddptm3fGUK0ZyPIj55GA9V5mNR9oNqWMYTNQJFzLbGDVfi5+hEZx36mWoyXue6bGO+ByG
 zjrOM+4AbcL2OsTpAZhuMEHFzWlQ490Tw09iu2MGvdzydWZreBvSFPJm2HdNS7qI181vxwc3Pr0
 iEpTY3DJjRuIAXnAYAErCvz4amgZHJ2OSlcUWjpEKs7+57LZI1hfaIAyTfQpsylp3Fn8ucQZ8Bg
 FEL861RY6dMUJvPo7bz3gmb6bEplPlC7RHjimwXhGXTBqvG6WJCEn+l5JiWQpGzFgsf+QmtA6pr
 SFOwZQv/sBjz7nrwKkUExa74MUFw4w/5zidsXfSMokGQgAOGp3U90lHe15KSVz2BCIkXGTH0sDl
 KPagWn/xrxQH/6uqohnVTmdQmCMwgQ2o12ftsnf979MS5FTIOo+lqMFShb6yHBUdu0B4RluVfIT
 UAR8LI5viexSWvvxWDxg+sYDa7kv5sWzinYOHjoBh1tpudIlKw/Sj09VEzti0RhVxW57ynoPS9W
 tyHSiAbzSI0b3dw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/vitesse-vsc73xx-core.c b/drivers/net/dsa/vitesse-vsc73xx-core.c
index f18aa321053d75f34544267528d68ade37264e89..4f9687ab3b2bc1cc61946eef33b7d08f779db8c6 100644
--- a/drivers/net/dsa/vitesse-vsc73xx-core.c
+++ b/drivers/net/dsa/vitesse-vsc73xx-core.c
@@ -2258,14 +2258,14 @@ static int vsc73xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void vsc73xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int val)
+static int vsc73xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int val)
 {
 	struct vsc73xx *vsc = gpiochip_get_data(chip);
 	u32 tmp = val ? BIT(offset) : 0;
 
-	vsc73xx_update_bits(vsc, VSC73XX_BLOCK_SYSTEM, 0,
-			    VSC73XX_GPIO, BIT(offset), tmp);
+	return vsc73xx_update_bits(vsc, VSC73XX_BLOCK_SYSTEM, 0,
+				   VSC73XX_GPIO, BIT(offset), tmp);
 }
 
 static int vsc73xx_gpio_direction_output(struct gpio_chip *chip,
@@ -2317,7 +2317,7 @@ static int vsc73xx_gpio_probe(struct vsc73xx *vsc)
 	vsc->gc.parent = vsc->dev;
 	vsc->gc.base = -1;
 	vsc->gc.get = vsc73xx_gpio_get;
-	vsc->gc.set = vsc73xx_gpio_set;
+	vsc->gc.set_rv = vsc73xx_gpio_set;
 	vsc->gc.direction_input = vsc73xx_gpio_direction_input;
 	vsc->gc.direction_output = vsc73xx_gpio_direction_output;
 	vsc->gc.get_direction = vsc73xx_gpio_get_direction;

-- 
2.48.1


