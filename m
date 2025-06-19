Return-Path: <linux-gpio+bounces-21842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A65ADFFCA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E0D217BA6F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29F2264F8A;
	Thu, 19 Jun 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="22qiFnFa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153E2475CB
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322010; cv=none; b=S7vLQbbO79pThCd1txp0EayflbmpilnKbebQyUrmIF86C5i5UO0JX4wnx2YWPtdphF4DHRIfpHbLMfwtrg0KtL8/wpDyzNsaODnvcB5oPnyOi8BN/JmRnJwSeRrFkyEHb8u41oQOr8j4hc0KGQfgASFZnVF+7IpmMjgpR0tDx3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322010; c=relaxed/simple;
	bh=RPhkT3IzDcFi1m3smXl28iMPiZa62xWz+n4q9CIoNU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELbdIUYTCNzIGojaDubnmKPID+bhkk2Rvy+KXbt50GGHYc7NJAHlRBiTEsvxixjAt9boS+YUHml62ffmSbo0t6NzEwkTZxt3BWVu1syPugfxLwqyE2Fd+1hrVEJC2GouxVLDV+dZjXn8usrQFiTrmalxeNNvfjYzcb9ecvMG5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=22qiFnFa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a52874d593so525564f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322006; x=1750926806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=22qiFnFaH+7yYTD1WPpTHi25yDE8TMFCzdlMQGwxA9/uqj+5xdwK+e/xqNfUMPjsSR
         xfFihPDRfOYrkWrUI986FYZPR9/3hoj65DjfOeEDYuLAU6OmuBgH2QneGL/Ti9cRPvDO
         6B3NBKyZkcrXrnhGNPEvq+upQJXLsCHmv3btLAALo6oUlj0KO2A1CWl+3gyD8vGPpwyU
         P3N2uqD1rOTxdXZFj/t9WvbL4JX97CXG6Gr/cYm2eLoiBPHS6MYrjjB83gzEaOfM/HA0
         E8zNCP+DJGQuo2/vbVB6q/UQIB7Fv+q0EmtW+aSu9pz9vMN1HCpKFjM56v6OXjIGAY4M
         TCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322006; x=1750926806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=kzakAuufTAL4ww4WZ8smb20EPKWEy/5J1yY8XC8x2QcL4PHVRGfkCpzg0s9Pr8KYet
         rNYxvpmHaoZohU3u0fVL8tNYTPxm/Sh1ADzu2sm2aApmcIwqfhz9VickjiWPCrkLYfM9
         iXU5hsiXBedHwUEM3Y3S21PW0NJSnNIRTu5XRhMAKlQ9nWOsFdLeYHEIZ45VC13aKqkq
         ks3i9Hq7MddmHOl8uC3Ss6EPdjSj5DrsYDs7x7aqPF0YESjahuiYTaP3zrgJKlfXRXQ/
         Ck+dP7WD92zMuuJWBeW+GzCqBwZVWJO0xAvToJRR1Vbc7d2NTssSEGlSHgxXakNbdQZH
         jTrQ==
X-Gm-Message-State: AOJu0YwWwE+g395I148j7JAMsfI/ih/KYSgc9LzZOLw7vR+VnnPSx1OG
	p4fsEXKpuOJSExBfhdZCFWtPJopGxj+/n/VA9aJYQx3iqDC6HulisuYVipzVp+2zWdI=
X-Gm-Gg: ASbGncv568bb13TspVsp+nmSZBkerbqLtdYCAZQKLbJYE/FLtsTQLC6YV/aBMqDUri9
	65S9mFLK63+eorc2xi1EGJlwU2iSPqbmXsw2Azgyyu+ZayLhocd5LBYQySx6C0VExCtGYBKz1eA
	VnwXlBH1hZxGtUnYT0CYXZ+oyI8np0AsMgpHa38G4EO8HYngeHG7yjl7IROYAfEZQy19+V1en7x
	zXW1DjZ7ZpcgWHlIP2r8mqn9smGLNK5iBw/EKQ6yIAfCzFZkbc/P8eG0XX880R9iIzJLnvl/aD0
	YndKlV81sqHBO7VLuqLWCjNhYC1/cHnLB32QaU1NgKX8qeS/U4xa5v3I
X-Google-Smtp-Source: AGHT+IEiED0mQ4+a32MGCQhlzyMcTjNqSc3s2m6eXgPGOeUaueHu67jN6I+lpA1Wnn2Ut5FCEP2y+w==
X-Received: by 2002:a05:6000:25e9:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a572367d55mr15222705f8f.1.1750322006052;
        Thu, 19 Jun 2025 01:33:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:14 +0200
Subject: [PATCH v2 01/12] gpio: pca9570: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-1-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=t5r7nMPMOl/Fqhu7blFrjnyYOcc5SoneVJWT0UVvyG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRTHJhon1ZuCnCenmO49z6Bq3Wu3wOrzICX
 o4RpZQLMR+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 cq8LD/sF6228YfnMmyZbE3tlZK1iFMNVyr5c67b6FoDsGs8zrAd40Lx5oCbTsP4Im25mpNB9Nly
 Ezf6/TpCHbwpLVGeCuUl8xunzUEtaXQU56bxevMxjgvc+/QmaDQbQ5ZOn8xBHc6cLHLZt5AfqLr
 Kc76zQB/jux76D480JbJMZM4S6zFEpAn2Ey3LfaBXrNnIRgIWFHce7Rb9DS/+MJDbjWF7tjUlg3
 SxGymF06crmm6xMLbzkAYcozsGRun/1XntMRwG00CcswvE9JuR67I2SDFHFRchOJXDVYhjaaZhF
 PI3R0uPx6ZoQ4Nj6GyULy2Wg6l5am+JImsMhwb8P7hjA+eGiZJVi1kcyvSPXBaDy2n/bf/VlA8t
 j507rlA7XprBb2k+4iBSv9Uf46wUQ8FOudWqHDC8M4BcqiVEzgOLfQcdB7Brhz/6Q1EBGbXQW+/
 N5GPOEY87jwj4jlXUe7NvKnmk2eC79EAeWoS63elxYg7bDZuoG7n+26/J4V2iNOY1jyfQRpPRri
 d81T4MjJp0IRjO5TzN492JN8CLSFWVt/6OkZvduQ8LYmqx6NDXoN/v1Tt4KUNFZERDEZ+UWlko8
 OmZfykAWqmgKXLrp5PTD3mov5S6owsGQzcDGn9zirpSQ9Vxz4NrxjvMVwAhjmewsTMV/QCC+aXB
 E//DPkJ2ybu9CIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pca9570.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d37ba404936835bca160822ee361604827976e9b..a33246f20fd838a57abeedbbd7e58259bf073a86 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -88,7 +88,7 @@ static int pca9570_get(struct gpio_chip *chip, unsigned offset)
 	return !!(buffer & BIT(offset));
 }
 
-static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pca9570 *gpio = gpiochip_get_data(chip);
 	u8 buffer;
@@ -110,6 +110,7 @@ static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
 
 out:
 	mutex_unlock(&gpio->lock);
+	return ret;
 }
 
 static int pca9570_probe(struct i2c_client *client)
@@ -125,7 +126,7 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.owner = THIS_MODULE;
 	gpio->chip.get_direction = pca9570_get_direction;
 	gpio->chip.get = pca9570_get;
-	gpio->chip.set = pca9570_set;
+	gpio->chip.set_rv = pca9570_set;
 	gpio->chip.base = -1;
 	gpio->chip_data = device_get_match_data(&client->dev);
 	gpio->chip.ngpio = gpio->chip_data->ngpio;

-- 
2.48.1


