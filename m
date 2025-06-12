Return-Path: <linux-gpio+bounces-21447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3EAD7166
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 613317A326B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8B224502D;
	Thu, 12 Jun 2025 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MpQKAQd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5632245010
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734125; cv=none; b=mU2JY9TNR7EipjNS/VN3ali6zR0P4rL3PJoipcDQ5HNd4dTHjQ/6YqIByn9uX6SZhCSHBYypeNYHOpghM6mjCWH4WUMJoxynxv8+GYgcEI0vx23l6azvmGPfaHrkhFXhN3M3j31Dmem7txTe6pP5IwmFErgAVtQtgQ81MZ86X3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734125; c=relaxed/simple;
	bh=r0qYcU16DOOXB/L65/ELIol1UcVjLdmj6pz7lcDecA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oX65ZIjx+lX3nN2eq3nrE2Rlmr/m6dep+78sZuYDmcy1vaWYXAnQ2CwbqzUoZPYhTjFbwcxpELbh7HPgSIhLy6g2H0tFsOaUBxQQO4GR6OcWb28psaG4FYmrt2UaQmv86Ot8OSJIP6UuP0wQTT7sKtuy3jiBJD/MJj3DZSIjpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MpQKAQd4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so8364945e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734122; x=1750338922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmZkKLxN2UmLakt+dPeotcVOQqoR98FTAzfeh6JlZVI=;
        b=MpQKAQd4deRkgarkX7d6Ian3Zk/MdVqgpTZlXlFZrzdPZYi0mffFFcpH5RyenSeEJE
         QrUHH2xNSlcjZ0AxocdjVVahNTT6sYgYPy0MbGZQmoowu5G6pwwNDo2PVIcm4cNBhsfL
         Is1ZogqbZxSbMIcWovDzUAN40q/+59XCuWwDlAaE9dwqpif8WN1lrLqxgi4h21LDxTUB
         VbrRdwZLSnj45kZJxKlObHQ9XK57FJpZzU2wtmpa5KicwdH820CM4tPOlSc/aIc5Dnn4
         JCUUTCGam/CeSmK/gh9y0E5bnZk6WzVlFB/qVUZ3mWPW8ANGf3Sv+1Jw0dOfH4G00+Hc
         QtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734122; x=1750338922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmZkKLxN2UmLakt+dPeotcVOQqoR98FTAzfeh6JlZVI=;
        b=EXJNL+i0FDAYMX1a4CWDAEWsQLkvBKi0BSG65Lh9MtMyCZwFuKx9ivvTsrzXTbLbzf
         KffCsaxHste0D2Al0Cfblzh3fgHvyf0ryLfuMtjdJ/x9jze7nrOwuSfhqXXpTdV3HDVA
         EwUcC9ZLjXxRhnAJ2euJu5CDl7d63aq2Y95Fvxp3vgY8FyNsSOC0XPsmGiT4KOvs53dt
         MGWDz0aiWUzDggniuVcrmbx0fIBaAsNI3u1jnK1xt4VlNDObVl2EmZwj7f3HhvfsdaNX
         VDU2j2g7UQ+np1rW6gENtQLo5mtvsHJyLQxt13jpxLQZ2wgN+QTqYSHWw5zVpceDctAb
         rA/g==
X-Forwarded-Encrypted: i=1; AJvYcCWEQXOHyWpjv1CErkri55qN6HX/CHD/ItkJCNJTQcKtidrn5A/OcSDK6towyywYId2LDdO/M+GBpzG2@vger.kernel.org
X-Gm-Message-State: AOJu0YxZSpSVAzSX7T8Q/j5w+FJsCqQOj39w+ZDI+ZwRdUyyrpY2iX83
	H1sP3t3ky4/oCYQ+Ic8zNEOZJbyZA3yaR9OWfDCACBbzmQL4MwWAzMzFQgdkBIq1coU=
X-Gm-Gg: ASbGnctUtUe5UWdo03sTtgEkFCx5o8nPlmLesje+A3k6tESD9y/XoLPD1hiES7yVARe
	KQl8MglM+E3j0SfaW58toc7O093qJpKzJfZ7ZFsp6zh3L3KrLt1VQ4dFmKUl+auyhTkg+qT+6di
	l13v48CpC4z27ENjtE49TtSt58DA5rGx+y7ogeJaTQdffyOpUU7YD1S6WSMRSJhn8hukRoCTMWi
	bqXZZRgd+GIcRKO+JveCoVC4SC3ojj32aoA9DCAYkISSWGZxiQVMr2X46ulZ6GkLCN3NjIj3NFO
	OUQQJY2wpE/+rfKPuTWCTcq0RdyuevVoN1x/CBkRkdPq9fMJV4DUOo4=
X-Google-Smtp-Source: AGHT+IFdr6eiKmLNU1U7PCiAyyEcaNtod1q+PU6cBesinlO+7E1MRjBPyMho7YxEmPTyFNNlQJ5EIQ==
X-Received: by 2002:a05:600c:c16a:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4532d37700emr31586985e9.4.1749734122088;
        Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:10 +0200
Subject: [PATCH 01/16] pinctrl: sppctl: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-1-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LieHmje5ivI5luNfORERBIvPNT4Z77mh5n845VHvScA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk4RH7GPVp8SssQRxQJp6gzZ2YETuVm14Kq
 ofe5DUznf6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 cr/lEACI6ET2WlvZ9cyQDzGwOdmiCfZct2usLbI+rS53HlFtmhOQcNkSmaUGnwVPfPHX1OKG7u8
 dbqcNZIdDG6lrAjwrodXYH7a1vrgYl4fLrudzgfzXyx/pyT+4NJZvRWfprR4w4TraR6/W9iQzdO
 wP3bL6aoNjJQjxz3P0ey6wN/zPuvQJaxjAh+lJDMEFh8mz5P0UDMZ4D66yIKi2Cm6Ea0xZgGJyR
 KJOGz4mct+SIxm358x4VzGpQckl5dZF0hqK3CfjD+MAe595dVdFJ2m9NghpyjJV+xYYUrA/tl6T
 yHMxNVVaczWBNyvrynetjzEFh0LHJ1lK3woV+mzoiFeXT5PaWXJBhxTJeXBSdXAs1EdF5DWjeb3
 gf1xcSBfd9eqV2bTnSYtjsgobI3JYLTeFl7LT9h9GtJ4HfD39BuzyA0Ss0+ZAkP+0RbhARTf8Dd
 LNOqMPmFirJVka+ELdb1qNf56x2cFpRETLOdZ2OtNsAS151YAwJDiLLKBI8FLDvUqxbNK1sST+S
 4M6hYV9k3URKnrim10RgFTxPcQrCuW5q62+1mTRUjg7XxpIUlrSdX6TtvPqWmtMoY1zM71OwHl7
 f4ZCx+47It/Y0/pIQzZWm31bgsmNv2MW2oIhK/1QHFPK/JDVZtvJPYUtr8AXF+ZEHgJcPqFCZ8s
 MScuhzi/9MgLUwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/sunplus/sppctl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index ae156f779a16b8c4bb91c4cb0d5d4363ebd15d25..3c3357f80889a95c46557b3f8129882d2ce96f6e 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -461,13 +461,15 @@ static int sppctl_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return (reg & BIT(bit_off)) ? 1 : 0;
 }
 
-static void sppctl_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int sppctl_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct sppctl_gpio_chip *spp_gchip = gpiochip_get_data(chip);
 	u32 reg_off, reg;
 
 	reg = sppctl_prep_moon_reg_and_offset(offset, &reg_off, val);
 	sppctl_gpio_out_writel(spp_gchip, reg, reg_off);
+
+	return 0;
 }
 
 static int sppctl_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -545,7 +547,7 @@ static int sppctl_gpio_new(struct platform_device *pdev, struct sppctl_pdata *pc
 	gchip->direction_input  = sppctl_gpio_direction_input;
 	gchip->direction_output = sppctl_gpio_direction_output;
 	gchip->get              = sppctl_gpio_get;
-	gchip->set              = sppctl_gpio_set;
+	gchip->set_rv           = sppctl_gpio_set;
 	gchip->set_config       = sppctl_gpio_set_config;
 	gchip->dbg_show         = IS_ENABLED(CONFIG_DEBUG_FS) ?
 				  sppctl_gpio_dbg_show : NULL;

-- 
2.48.1


