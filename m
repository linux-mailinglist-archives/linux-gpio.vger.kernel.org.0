Return-Path: <linux-gpio+bounces-27447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5994BFC0F5
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4A40F354C0F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204E634B42B;
	Wed, 22 Oct 2025 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bH98ofeG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F81034B1B6
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138682; cv=none; b=EF63+q0YTtT4T4oCf72DFYTJwG2jp7W/tz6vUQi+aouvy2J+9CYEzfz8P8JaarpKJkcMylDM8Sp5AWLpbcyeADpVxT3dvuhQEtCoGIpn6ZgxVDZi8+4TNhbqQrkgmRTxk+faiQQ/SHz+GGdV8M5CVO7hkNHZ2InJ2NBTZLq9S2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138682; c=relaxed/simple;
	bh=o3clotEVXCzqMxW1qJk3uiRPSq6aP6WSAmpPzr7h58A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuWXYKVGeblroWi3YCG4Jf7qGVpEsQjENgZ4+MQnMGp1vvmDpgm0ohLGVIrrHKVRKW/Xepxf2FcOkdQp12SQRNXoG6CJtUUmXf/powc9nuRStP6r+lUfjnR2wvlwF/9leelLMOedEUiKBobyj1zTiZcVB76qcrYOZm7dlDHeb4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bH98ofeG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so64950665e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138678; x=1761743478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=bH98ofeGq2B5sIlsDhEpNKiEgLvnAByQsql+1Ix47/u/jivUYJEbsrT8P9YiFrTpEx
         5QRFklFfg6HQYPlMSw0Jz0M3SQ+i3uW9UPM0eA+G6ez7L5KEGZ5rjPa6i8EG3LdZxV+/
         Lxz2Ci1eiWgt7R8rovUwdXwMkRGaVArP7USx8CluvViXqXSM2fha7ds6mkkTSdpevI/B
         SBjTWf858h+7jTtF8sUeVz15kZKQ0gPuGwSDxS2Q6LRfH0rqs8/wNpSAprQHGWEL98lv
         MW+owMZqgXiO68kAH//wzUV5UnZeIphtmzeZxqYt3e/o2Jxi1gA3p5ky3CXjZWNAcMA6
         z9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138678; x=1761743478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=M57PMWDW6ay95xAEUQraLdjW8ln0MILHvtq9bQxrCMqfbpkwUtoeJvXGU31ewOyHTC
         3KgdIyHiFjvEoSJEZoEKHvTsGeOJU6YthmAUgSOUBSgQPnDVoNYGmCMvodbOmoEcGvrD
         kOvS6L8ytGID2v8b4MIMFo6oRNvWbvjKTqKG6uHISLRuUho4SQuLzYRz9viP32ogCyt2
         i4UAmOh/hRL2oirNyHUiRx6VWCIBImPn7y361Efr5+fTn/2QXqvf26GZWWsmEbKJcFdd
         FIC+e+uMpVtSuS5uNmgTiHqDOGhCCxbIchB4e6aqS1TlpUkqkPEcEk87JgDoI5r53DM+
         l/6A==
X-Forwarded-Encrypted: i=1; AJvYcCX7KsGRkEGMWo1GZVYwe3zKeeoLGfEO7rKjE+hFI3xAJ0GwDUiaT8nVubviaffLT5lks9YlK0c1xVIt@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzsuzlgA0ZkXDB/zvKEM9c9N0B6P/zmf6NF91hr45y6Rg2IPa
	ClEUVRMLQ3lx9Oiq0ow2tKp3n+C/kPmYdJ8BRtHk7gKpJg415p3hLkV0ZMo1EoM2OKc=
X-Gm-Gg: ASbGncv+03Sgm4xxDBvOaYSiH6Y+aMxVhVzcGLcYZ5X2ZaGJg0JeQ7eOmPM4iG+pRId
	pa0ceAgxjp735yW63IeMiXPNbTMzyfsYlSKM3g3bXpUcOH9rdtc8jMewq/s7HOSloX6efUsQjS7
	CIxVXbHs8M5mFLz5F0PnFH0ubEXqo1g+5qr8gxMn9YKBsJwXVBLyqW8qf6PttsquKmQxnsi/Z4v
	e0i5UZCuF1vy1EkvhlRy4xefS933157vS0fZnnLjHK1sZYyA2buvcMM3+8xxcmuamUExle1aNrq
	aDWSzdXGRkQK+MzAr3V5jz2qLMHFpyikUpz/3cF/1UieE95HtwuWGHdnkYHWORQ9pdrc7sb2RPH
	efrwYwP/6IYwBBei4dzjMebs/8s/2KwoG9QwFTPBmwfOv8xrGBBUGxQAtpF9Mwt7NQiN6o58=
X-Google-Smtp-Source: AGHT+IFPbcXLAtn4sbFkYplsW0U9MyKC7XwA3JcXcQOZluMyTLcgHp4ST5MfcutgxyGiqz0u3cVNNQ==
X-Received: by 2002:a05:600c:a214:b0:471:ff3:a7fe with SMTP id 5b1f17b1804b1-471179123b8mr105019195e9.19.1761138678192;
        Wed, 22 Oct 2025 06:11:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:47 +0200
Subject: [PATCH v2 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vspstOLquen8UYYEalfT4SF6xCukX3qfgdJchdoYapg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfeRZqOvOB01WUMzaKtGFbfDIcDIo9Al+qfC
 +wjKxE0T0eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cqOBD/wJGzpam5upjt4XFG3ZtnI76Qt73nTbQAr6FUYWgq99m4KBvN2kA12dfb4qlkwNn7EoUjW
 SRmIlbN0zVeIoKGUrYP1ZX2Td4/d5eE//J5BAx70ZFkCnbIe2cQQdyMR3Qml7oKKdtE63vg8dCr
 Qu5FHzCdTlgUfT2/2uIPdU9r6i0ALa5XvaEjLLC82mevOPG1gtrUf83JWiVqWWwZ6msRsyR8GY2
 XrTb6OI6XEkj3q/1E0iIviuAujfBeq9T1Ownl5xR7pdIBs5WOa80hNH447+vcOFh7AzkfCBK3iX
 6dwc9e7MuhS5qhlfytzC6kern1Q2LyAbPgbSF0K2lTcpStRr+TL0C5u+/v/u2dlWaiQV/5vgsY3
 M38/d/+SMR9NIR6RIIk+gmsuODW5tcXiet+FSnoN/NdlEC6CgSZxjOwHiOrYi4WnmtXcBEdGzgE
 r5xh4lhOWKOX9bb3Om8wiUdg+R24dQXyNu8yvSMPq85qlKROmlzenKwAeuC2YAJy++X+TSWMIgj
 4lglVWusNTJscQ4jiIfdA4WEfjPwEeFljCXRMAex66b/J+Id6R/Z2yCKTeEXey+5tirG4UwEmbN
 6fQ70BxWL5mmJU+NhsjvDwKCH7yVfWqNhcvZptN3Ji+1XZMmeTXbss4HoAjdl2x6n0ko6/T6ydQ
 TFgFaXpvdEUEjSw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 636e59abc3772fc0b333873a329b65f4213c3ef3..92a1e3bb8371e178571a6c1ed6f1185fe6c2e757 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.48.1


