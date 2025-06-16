Return-Path: <linux-gpio+bounces-21642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DBFADA955
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61F111704A4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4F620E011;
	Mon, 16 Jun 2025 07:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P3aSlgKJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1CE1FF1C4
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058658; cv=none; b=IV+F7Ut2MjkIX2ANPoCQASvDIHOg2+V2eFqgxxBil87rsYWhpJfXosxSnhYhDlzS4kkl6HU5yWVOjBVOBltv7Ut+CHSGioNwsNzTyGGAKtBe1KzGaUq8YVKswhHFdqyjy9LBIvbiXpcYMgsO8fjcHnVCjs1GUF3T0vk9/PHcYkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058658; c=relaxed/simple;
	bh=Yl+OrShKybgGktQ+kbAvNrti8ByItxmFOhxh8elUoMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wwg37c+nLCvzpSltvuzsWA8U5oKnBQuEu/UkFhIdZBk+7MuOOruRyAbXXyfaLArsRL1k5Nn0n9YOwzGJkRjs139EentJ2wlKDgn0moW8u892Ico57+zTwxYMUtQYxxfZK99VwHH/WS811rpRSyhiK87KcK8YzwS//Pa2tSjp0lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P3aSlgKJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2390311f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058655; x=1750663455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=;
        b=P3aSlgKJbdDaG6Yn6SNFubplfYERLj6RO4hIPmy+6xmkF2vQyxSvBpG19zNf0cXDuP
         xHInndB5Bur0UflhHoGz4ajfsx+ZCAn8J9dRHFMny8Sx88/6giYgbCUIDV/5w80RbNgb
         Q4hoCcB02eLj56S4qY/xja2JPqJ3huV9ZYEblSYfAWB3BPZ5pRrZjW9CnZ4AmYYaMBU8
         yLrTYZYQToMK0qCX+c/iAEytu52nahXMUpuVUKv0tgCDugGjfgUNV+KUzBD3TtG0wQdM
         ukjhpeK+oVlqWbqUvASa6iSs99Lc03ReAllbGCKGu4XPZjS2EBiZ+4E5i2zLh6XBTUBv
         GxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058655; x=1750663455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=;
        b=j/RhxHALN/OH8NDF0p+zRk8PwtjBKhZ7Lg2e9IPF+6nsGMT+RmMwh8rxYR/ljMd0nC
         C6/Il5u/O0w08+E7TXhP9jK+I+fPXVWxJSR3jdp8M4uUCoSSRhMSjhDbU5ptn1CYeE7V
         JzXRIX6qZ7c54M6TOOCVQBLM24AXL5YxuKTao0up1HcnRG7hwvm4dbQ2RwJS0e8wd/4Z
         T/WW6uJQWYFVBUTDJQiMK+3q1bhkzsE5DQT3f7N4f4i0DSHX42P/RZjXn57NG6hLZMWT
         xB7GYfNX7On3uniU9m0gTZX3kXeIxn/PYLBrtfBS2GTsyVYarYNNAMF45XFX2syqO0/D
         23IA==
X-Forwarded-Encrypted: i=1; AJvYcCXjdXkqQ61HcUa05gj0htAt1IMIB3DngNPrM7I/bWGuJSvN8fY5r23DYIo6Q5/CSII7E6rJska86uBU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/4vSHBuM+fPMCxEd5n/jNH71VCl4d+tXkprgsvfaW+EvSirpF
	foO3v95XXWAVgk06/c6edZhWh3bXexBCfWNllS7AgFVmnlN2u5SrbAWLx1upsuc9qaE=
X-Gm-Gg: ASbGnctrhcmoBmS7GnQvvf8BqLOWkzBvH5n0KvRcnUmDnW8vrsAOyCd/mjkH+IfvE+j
	gU8l4qzixvUwjY5snEvyY9j4ZhJLVownQ19/ko0kTwGI8vi7d8AhO75UOqnr1jAkzXUqGC9/4MS
	GvrIMpF7iju1DYFyfSHHV6Q+d2A8+QKHtgkJMCoAgqJaSlD09xYLEvc6GGfT4krTO1YW2pwOULV
	zC/Ipj4OPvVOWBaeh5QK4HwRJ0iToMWdBzpICXmPGnHRlkLuE/voU+VyQgYiSbTUTrAABQ31LNT
	Y42FMuKLMGhCG1wyFQDnI88LV33aUq+a93wGASXNTgK80PueMVKSd8Wx
X-Google-Smtp-Source: AGHT+IG/lAGJDXz/7A3CvJT8e5vgl3jiY1Lw3i6jYgkiFDTNWEgx2Zv5/09zy+DHigY6izksTnVhjw==
X-Received: by 2002:a05:6000:310e:b0:3a5:1266:3e96 with SMTP id ffacd0b85a97d-3a5723710afmr6864057f8f.15.1750058654687;
        Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:06 +0200
Subject: [PATCH v2 3/5] net: can: mcp251x: propagate the return value of
 mcp251x_spi_write()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-3-cae0b182a552@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9MP33N5pSy3OGgT8wnmaqvxECSreBBEZS21KtQDntIg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZLt+zmsPfXHGowMV7wiRrZdvT9d0pjybCs
 eRaNCJ9eEWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 cr8SD/98aDqkM/VGj5uwtBE5gFWYPj5Z1zIx8qY+nCaRVn2DKwC2Kg4yMV70J9jSdq4ekrRinZV
 RnyJ7ds9/3L20t39TnghIi+GiIxnfHsIawEWyCLFFyEa+b4Fke0iOl/kx2jqaDSFM0C1C3u3ENG
 GbhKATNcf7F7G6DJ2xccIinHhEu+mBXrCrceO+kijsDh6wbut7AtETdESfZaIpQQXFCqwzKl/XS
 6Etd4fE9UpLJ2bmyzW7Yn1/TFo+/OBPgyujTYD2t7FkbOI4ytp4QF/Wl22eeoB7lysoWLzZyI8n
 nA6GYs2OMox0U1nnMmlIEaY2L/73AbfJwzTOV9wnUgLFPgZSW9JGRtzYINWTz9/DrCHmlMwljUE
 VNcYSKhQL1LOduvDgcp3j2z8rI9/aOKxIVCFkXTr0FVHxM2Y7rh+JPFN5sV0TVIDNX/H5h3LMl6
 OvVOPepI/+66wgHuOlV4dGNmeV/6yi2RcwONb7FHZq9wYxDJZtLX2fk6qLjQw8a1vXBfsiO/+Ci
 YULlo87CssHva7nhnuEC+iTL6EiiynLq4/MDVFCaCCFyAz9/cCdRcbyQx34tL8jxS2RAtH6OV48
 dm/bkqz6CxfJxgmvOTb4RBiJdfLXyyoctwXbW/4h9irmuYzMUuV9rctiyHDtoR/H4R1bWJ/dhf1
 u44dRSvvUN2+JGg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add an integer return value to mcp251x_write_bits() and use it to
propagate the one returned by mcp251x_spi_write(). Return that value on
error in the request() GPIO callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/can/spi/mcp251x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index ec5c64006a16f703bc816983765584c5f3ac76e8..60b7fd3040d02f114693cf66d61c8a075a32e278 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -388,8 +388,8 @@ static void mcp251x_write_2regs(struct spi_device *spi, u8 reg, u8 v1, u8 v2)
 	mcp251x_spi_write(spi, 4);
 }
 
-static void mcp251x_write_bits(struct spi_device *spi, u8 reg,
-			       u8 mask, u8 val)
+static int mcp251x_write_bits(struct spi_device *spi, u8 reg,
+			      u8 mask, u8 val)
 {
 	struct mcp251x_priv *priv = spi_get_drvdata(spi);
 
@@ -398,7 +398,7 @@ static void mcp251x_write_bits(struct spi_device *spi, u8 reg,
 	priv->spi_tx_buf[2] = mask;
 	priv->spi_tx_buf[3] = val;
 
-	mcp251x_spi_write(spi, 4);
+	return mcp251x_spi_write(spi, 4);
 }
 
 static u8 mcp251x_read_stat(struct spi_device *spi)
@@ -441,6 +441,7 @@ static int mcp251x_gpio_request(struct gpio_chip *chip,
 				unsigned int offset)
 {
 	struct mcp251x_priv *priv = gpiochip_get_data(chip);
+	int ret;
 	u8 val;
 
 	/* nothing to be done for inputs */
@@ -450,8 +451,10 @@ static int mcp251x_gpio_request(struct gpio_chip *chip,
 	val = BFPCTRL_BFE(offset - MCP251X_GPIO_RX0BF);
 
 	mutex_lock(&priv->mcp_lock);
-	mcp251x_write_bits(priv->spi, BFPCTRL, val, val);
+	ret = mcp251x_write_bits(priv->spi, BFPCTRL, val, val);
 	mutex_unlock(&priv->mcp_lock);
+	if (ret)
+		return ret;
 
 	priv->reg_bfpctrl |= val;
 

-- 
2.48.1


