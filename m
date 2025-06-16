Return-Path: <linux-gpio+bounces-21641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22723ADA952
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CDA3170301
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D2220459A;
	Mon, 16 Jun 2025 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x+JFU8NR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB361F4CB2
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058657; cv=none; b=MwmshDQgiHf2m8tzwVQ8ctHDOpxtYF7zbTdQT5NG9ABqp5qO5sy2MdtWvi4PKgH2B6AsjgG2tLrPsQbTtadGJAPiOQAIAZVK7xhzTCLTDU+m7QlbZdH0PAcsImtyuDcAeQaMiZKH1l4+PXwAYpHUksmeEKlsuhMLQGcQoZaAVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058657; c=relaxed/simple;
	bh=Or2j7o3D1slLZ5D8EJTGF6KLpMpv566+WGN2+SIZWMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJynk1tXqBJrqtoyt/egHiDwQ2FGxV55zulNduN80cpdt+Wm8pTGdRmkHN7A0GCDJzCo0FBqZpTAzfjb06Nui6WxCBtPGkHmzoewLmjoPWbT1og/mzecoeP/tOwp/+B89vNJTylHz4K1ThJBiZJI60SyLRVwn/NZKm/38KJdEb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x+JFU8NR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a375e72473so2332538f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058653; x=1750663453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=x+JFU8NRsb9/wyvkeWVy3WowcnPSq3w9mA6ydmO0+eoRF6W1Oz1gL22Gigcgl/Fs2T
         ZCaS949Xo8aJ1N9E7Pku/k5X9EO2rEB7YaP9peemcJ5WCPGWgIQW40WfxSRbZuQuh1SO
         izxRijpdlom+/6ZgSawjAh0epOvi/p1A79yJYLZDRlqDOTQmXceBbllVn5PPUI1X41hJ
         h8fJwaH3UWQ5RnuVOTIHq8PJnuX5pEzaJy6pgRdISe0c+HY7+XLLOAE7MhaGJggjtSao
         +3b2RuaZ+ggSY0CK0TgoBsuhO6MRfTEzub5xnxh2QV9bykXWCqjb2oKCm/c+c8WaZWhw
         /dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058653; x=1750663453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=dAZnHaUqVs4cSvfcoxv+6Tx8g0udQZy/1/VG8waj7Kr2UUYpJ2+tpBszKaxaTyhwIH
         89AifsW13eNCjzQigyjZXVE7a43wFeoAJo1HU/xxK93myL1flFJ38dmkqSQdnJOIzCyP
         ZgrrcWkbhh5Hu9ydQygGZqh79culr0QrtDIvj0igQ695mj4x4B5AQqHevf6Bk0+DaTGb
         hRLLwh+xMkYC2dniDKHUJwcLiq20Bb10NXXYaBzh8jJXoHE+ZzkhTJQW3SaTkLrZa+/D
         opobWoPFUd7BJaSq/0DCHIYABlEDCi5Z430HUIdz1sOInK/M1TCZtlAp1pDDw4Lo0jHf
         tGDA==
X-Forwarded-Encrypted: i=1; AJvYcCVZACvV1McNjyO5HmhSM+ekSGsfRsVgJPp2xItyTCqDTDgUlGXXNTgy/LTHPhWaxDaU1FwADjCeZfuY@vger.kernel.org
X-Gm-Message-State: AOJu0YyHYI9vi2685p3IFF8PemwgDIhGvMyQbAP18fiCE0wPPsIxwVfi
	PV2XWIJWFiXIzHGSKmeSLgFAt9zt0DNeubxJPV6UcVDeJrfB2+1svAZ5UuvuxpZYkJ4=
X-Gm-Gg: ASbGncsRPsPwvJrNr+a8VZsRbZ8GLr05OyCkz04azfGJ1wMQq1YrArRjXDPBECjNs0W
	HBuJg/6t4ZyBmYILBVi2ihIzBT0cee6ucw2vxpIytzn6SSTYusz9D+aIrrwbPeMx4TYCeHuo7lP
	445PNcDYXVTtdk2PYqICT1KxCOZ+668hyvSQTL1Q0qoh09dTh/VU5JH+iyzoUOdZd7/7Lk5I3wj
	jn+Q54JkBo8Ar75AlsIRHN+mPIxLkcLxR/i9N3ZXOfSE2yQMysYha4FqXj+AAqUf/FvJ0eOg4NC
	iSJs3A/KCgKhSlMMou14PUH9ONJbmJ8EyotzU270IThzv0WcleWCk3H2
X-Google-Smtp-Source: AGHT+IE48oE5eDJIxJr49h4oPA9YTDo3yEljfvV96IR3ebuis1Y0vz3HpGqAPiP6g2TbjN9gjF1/TQ==
X-Received: by 2002:a5d:5c84:0:b0:3a4:eecf:b8cb with SMTP id ffacd0b85a97d-3a5723a2912mr6781229f8f.28.1750058653481;
        Mon, 16 Jun 2025 00:24:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:05 +0200
Subject: [PATCH v2 2/5] net: dsa: mt7530: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-2-cae0b182a552@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cOyYyWO13YQfp2ycss27bUpedNvkM8EVvpF8/6G0QtI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZqs67TKrhqmdTVUjIoXv47OQEQk4qYQvii
 bxg3qrFa4uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 clNmEACl+OMZ074SDpTO5quUC0oukmH6+JnHqbSET6X0mc+EKoxRFJtNYk1S7dEVI7pnlXXHqFJ
 EYqqyONv4VGeyya19QXIVGMTQ5YxveS8KU9oJqadT68LaqtzeN80I/jytXGjosU13hfPq7ik3Q3
 VK0wciohlIegPmNaiWvGcrTEq9+N2kDt1z2tSvqOOa8YaSJRsjOaVdJ+33G69qAhVeo1QpR0sFy
 27L9k2LOm1kLkB9h1D+eXYXdd1/zxNirXig639IS6937NDqd+qY1hREQVFfRxmukLIBEfqBPhoC
 hssFvyR9bfn6eUhrAIbdwRlaedEal8z8Kj+Q8c+5TFfxhwGAWYl7kHPvF3VpEglD2DRjfjSYRdF
 Ec2pHhXTAk5RLj0pI+h5d7zfLEM3VHxPbjWduO8UuYxRW9xxG/wz0djaFo1b5l7/+GiBVg68xuA
 nzpCHL4yltPGaSEHPgi6LM9spinJ0ltWp7jLvZNpjon/s7g9JNyd9l4IZ8tke3r4oZsQcteNgnq
 v0AC3pvn5aXiElHgDk3A2UtMmDi5LSNT7rwwmH3LPr7eZ1S54gUIXzS//yw6rBXShyicjaMI0Ys
 J5HE8b0C3wj5NlYstP84STJxDCgmHrH7Q9nhez6HSV5b0r/fHguIQzfuT89ndCGVn9QazsU2EQD
 exXyAvqd8zwLlYQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/dsa/mt7530.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index df213c37b4fe6ab85fc5b01c62297a35b7b6b2ed..e5bed4237ff4c46457b46598f07b65d0daa84ae9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2112,7 +2112,7 @@ mt7530_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(mt7530_read(priv, MT7530_LED_GPIO_DATA) & bit);
 }
 
-static void
+static int
 mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct mt7530_priv *priv = gpiochip_get_data(gc);
@@ -2122,6 +2122,8 @@ mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 		mt7530_set(priv, MT7530_LED_GPIO_DATA, bit);
 	else
 		mt7530_clear(priv, MT7530_LED_GPIO_DATA, bit);
+
+	return 0;
 }
 
 static int
@@ -2185,7 +2187,7 @@ mt7530_setup_gpio(struct mt7530_priv *priv)
 	gc->direction_input = mt7530_gpio_direction_input;
 	gc->direction_output = mt7530_gpio_direction_output;
 	gc->get = mt7530_gpio_get;
-	gc->set = mt7530_gpio_set;
+	gc->set_rv = mt7530_gpio_set;
 	gc->base = -1;
 	gc->ngpio = 15;
 	gc->can_sleep = true;

-- 
2.48.1


