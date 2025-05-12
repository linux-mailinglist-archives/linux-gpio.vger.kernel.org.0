Return-Path: <linux-gpio+bounces-19963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B825AB3A69
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B4F19E0FD6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABE421CC47;
	Mon, 12 May 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQz9LDL/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3383921C170;
	Mon, 12 May 2025 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059794; cv=none; b=E15ibERLAqqZvKN0ZL0CCYlU3Sl4Jb7ktXLfYJHHVdVWEt4kuL78q8T9xv3IstcymAf3adFulssjlaWkTat6siaFw/ZH+h8q2lCr7FP4o6tsJUXYlhB97kfpeh5C0C0ZAaXrBYc4AHhEHRSDnIt7/CcPOdM+49Y5xwe+stS7tfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059794; c=relaxed/simple;
	bh=XxFOzwpfwLxWv53veDg6BCFF5Fv01aAKx6UgAlPxEAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwlyB4baBzDRtIDsMHMZmLSYQsaPoAEkbcFSuxd2lt1PyBY17+EodcgdIQdV25sOgLXtsvMFIJluMe9+QzqO99mRUEbLNPqWAcxPtgmSbFNodET2iCUHjgw9cDxjV2YnN3ogWaSxNLeMUPNMhQgy3H1W56bCtEMHDkrc3+vf/s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQz9LDL/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acae7e7587dso701503666b.2;
        Mon, 12 May 2025 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059791; x=1747664591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CStQ3me6L+6+JT5UQlE0AR5A7HHsIVocJn1DO4HPocA=;
        b=DQz9LDL/jtmD0Oavzf2K6YSBMbC5EEFeZV6JBGFbFzMtKOVCc05wQXL7hYDvuQN3sU
         bBjq77h6HgTnKLa27mBTe1yoftP87HsCUXZdURovs54/SzmmZnsG5+WHwcP5DzwUmzpd
         mIVnIGi0UMP/Z0ASts12IcDkqvU6hMz8rI6Fc7EeI7IRFC7ufxV+VsFSobHZ6raZTTux
         RqJtfZofjbBXY67lMTM/YeW5Xpp28a02PPJgS4AmjpkNTlU7tG8zFInFiXANkKfKFFo0
         ImLXAddh6WjKRJZqmaGXOLun1fb0o41ihC4fiUink8S1JX0Q8inTCp0lJHwcmWjHee4v
         dV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059791; x=1747664591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CStQ3me6L+6+JT5UQlE0AR5A7HHsIVocJn1DO4HPocA=;
        b=pDh7YIJ3HcYz+f9tIOHWzcX8UK9oeqlKCRmdjGiae9JBupuQlVo6PQ049LKiBO7HGf
         1yk5OEB30HxW0mhBKRJwZ1tAtlhhdE2eW/5rMDEISkBx3ESarj/9WDNBNFScy1Ng9EXr
         2KQ2hM5U8v+rhBh7tIV0DOOvMuYLGCBxlPQdVrm34Pe+67vnV6DTKFtBeZFzjzs/wm6y
         51TULbFwO0bb2IM713jMVWPbhSq5lYNxIXe4YnEZUIFKowqb90cW5FN0teiisv/H0vGM
         gL4snHvSQxF3jHaDsKmXFg9d0UeVpVEkgPz6ASJD/mTlFa+Wtja+3HFjrTHUn2qcOrd5
         p3oA==
X-Forwarded-Encrypted: i=1; AJvYcCV9qpEIJLmd7diyxDx8AY9ppa2VXvcomxupgDm9+vedOIgO9y1TNluMo5oBFh2bKQZ+kRH2ZVB5@vger.kernel.org, AJvYcCW+Ii4NM+59hQKjOiH+cZopoiXrtayLrNEweJ1mbphuUALXDdxZIHcAz/KqRb7CowK/cw2QupLaSSgI@vger.kernel.org, AJvYcCXUWcKlOxCHks1YVNQX9pMfCXYOMJKvKwvgmUYMWwPRHn3SY7uBjq24g9uuPjj9EZjzDSC80dTlY4Ui1XSb@vger.kernel.org
X-Gm-Message-State: AOJu0YxPwUP8YOexM0boM9f4CvrdVuKKlI1vftJAbf4hNXFtMscEGBja
	tr8loKdFg3aEdf08tmDIO37twrQBA1iwYsvCpdqDTf/0UmGvIwiw
X-Gm-Gg: ASbGncsDJVrzv1v45nMmwQK9vNZ86NQvhkiUIlbeNDGtWcYk+cu9obJ3D1IcIpUyaIZ
	H2610VqFJpMMPEqzuwmya5sz81Agka4NN7vu9yC701u5NEf7DtwG5T6YI5OIU/Od4te819RO9mn
	Gzm/753VF7iNmcmJzbWehLUzQ6MhQL4m2AzWyGH+11728chdDjc+qD/H0Zt2f/leM2jIX0cnMDO
	4g1v5D2+aG3HrFZaMQjFlCBoyq5F3voav+4D8hQ2q0iWgC/ny0XANvoz6Bn4D0AoULhc9DmwDJ7
	ZitRV/4TQPRy+yq6HfrIp3mWmCESbxg3BxhUkZRhGxE3RlU6Gui4YNn6GSBJzE/nVkQ82i7WIHe
	we+cF
X-Google-Smtp-Source: AGHT+IEJ8JuqYsFOPLuXdkL4qUNKbfTaZqb+fmyTLkZmdZyKkJWiwhPAs4Y4Rf4gMO6EJazhHRUlCA==
X-Received: by 2002:a17:907:1b1c:b0:aca:d6f0:af0c with SMTP id a640c23a62f3a-ad2192d4a49mr1292462066b.59.1747059791258;
        Mon, 12 May 2025 07:23:11 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:10 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:42 +0200
Subject: [PATCH 6/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-6-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Cc: stable@vger.kernel.org
Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index aed0069b085ced5867993e95e0244df7ccda556d..18c6c5026b26c294ee65e3deea02d2e852e10622 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -402,10 +402,13 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_EN;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	if (val & mask)
 		return GPIO_LINE_DIRECTION_OUT;

-- 
2.49.0


