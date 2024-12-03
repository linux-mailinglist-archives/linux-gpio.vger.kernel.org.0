Return-Path: <linux-gpio+bounces-13461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC019E27D0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 17:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E24128552D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 16:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035451F9403;
	Tue,  3 Dec 2024 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dG8ZLu4m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC41F8AC9
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244112; cv=none; b=dRmnpaclKpcU5vLJlrSgJI/uvoCBycnYI54ZO3ETGCF/Ng6UGBPWvUcBrWXmpBoIqvlBgad4eXHzdqK4HVVCfCgmrTkvCLb2rVK8ZfGEYYC23TjOSChvzG8y1kUNboVm5O3vKAnP0MNyZEsMvwTprvPnCJmF5pP2vcEE5IV4Fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244112; c=relaxed/simple;
	bh=79lvtbvvn5WeBGU2jOePEenHhsByMveWov7DNrhlJkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLEyg75a3uwu1wbpAQma0hUGEP4utq489MqOWESXV7MxPA63hJjh2dO0QAi0iyx/2RgMvmSR3+XwqZzRyYouyfuvK0Bk+viOGlwNLQBI2OAv89/awSyGUTg6jG+qJzXGF69jD15SjZYy2vSAXAXQn/NTiNehFegDNMvWHjuXtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dG8ZLu4m; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so60388221fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733244109; x=1733848909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E78siUumg37DyNEcnTfFgRjM1O430FWuRK5MEMvIBtg=;
        b=dG8ZLu4mlAbl7q7lRFVpfPhuaUNxxUL6RZmeXxS36WjwAQkU0T2S8C5rxQX8uuV3eU
         U4IlCSIVtrSZkmK+eurG1t7Yfmt0AqQGfgOQIygNpfgue0K9LUkVWEbNHSrmgaHMdEpi
         6TXT9KZqhTJpeW9OIxRI28Bu1uFMkpG+3c+Y8QWVioIDmnYryMqFiuAbBHdzu8eJOG5E
         Pq3GueN/iS0GC5slvsgxlHJI+Pzz2Qgkl0vkCHZMPZa76PbjBrNoRxkaf+zm62I81izO
         mrJ1dsBk69P7wQitQyuJ/A/iuX62oP6nSS3nBKGqbtABMaFBXtHsc08HXF6D+L3I9swu
         zSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244109; x=1733848909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E78siUumg37DyNEcnTfFgRjM1O430FWuRK5MEMvIBtg=;
        b=VFaYxtbEKVx0juTg9Vh/uM+Sg0KzexDIMgNc5BfvCyOWb1POsO3H/fgigRiEjAvslI
         nEiXUTqT+Am/t4mpqASvVhil1fd1HQjyLh+ty71nMF5OfgZ5zsa0m5L7wV9BkLstdP8y
         7kdrMPswYCzeEPPE9JxPY6AwjTbG71gPvP7+G7xvGdkMX8y8yqnrqVvRQ6sg+RFAfyHC
         8FcfgOOgVPmkGGdrXPt3HwHZYgLnkqNNLABM6AQ3Ve7sbK4ILTVln1wfo0eB0GW4FlCB
         2a5XuoP2IjWZ888hDiIG23nsD/P4s9rK4U2MpEA2nMfdnCN+0TCUHXr9lPt/w4fWSzFT
         zkdA==
X-Gm-Message-State: AOJu0YxXaNKugCytYty8/zMypl54zmBLQUL6/S7N1ejTDM5JoxrSLnM1
	wey2CQfUE4lO4QeHrpHCdb1O7VXM+K0hYcovef8wsbvMrlakgmM4vEo92XWWD94=
X-Gm-Gg: ASbGncsRch/GoO9PCopy51QYyHidS57mtoY0Gw8s6kGSsbPhywGJjR+FkwFdBloSg/F
	J+uN6dwg/k8hlMq21pNfneKCDbIEPjDggxAKzpyq7Pv8aBflhFnNNWlbWLB2lUs/UEqwyqkB+rV
	6ujmBLjloyUdPd/NbrG7dtAvBm2ahhZHWC/7nuVF1TopEyR52gY0l/NeHPFDaAvDpGJ1fLTogsw
	XXGCGFiH+RV3/griinJOyK1PqOjT7hvK/Nx9AB7/AgFmSTbxaXfzoTaBxVDH9/kxBxzbS+Qbvy4
	tEVgC3MnP9FFow==
X-Google-Smtp-Source: AGHT+IFx8bRQqNDnslqD1KoTl7xzEuIl2AL3peCZQQRxuOaindczpYRpHJlgrK/K9HMSqBDkd6UiiQ==
X-Received: by 2002:a2e:8e95:0:b0:300:1558:7db5 with SMTP id 38308e7fff4ca-30015587ffemr4110501fa.27.1733244109275;
        Tue, 03 Dec 2024 08:41:49 -0800 (PST)
Received: from brgl-uxlite.home (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3000b262f32sm2482161fa.4.2024.12.03.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:41:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: omap: save two lines by using devm_clk_get_prepared()
Date: Tue,  3 Dec 2024 17:41:43 +0100
Message-ID: <20241203164143.29852-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203164143.29852-1-brgl@bgdev.pl>
References: <20241203164143.29852-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We can drop the else branch if we get the clock already prepared using
the relevant helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-omap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 54c4bfdccf568..57d299d5d0b16 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1449,13 +1449,11 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	}
 
 	if (bank->dbck_flag) {
-		bank->dbck = devm_clk_get(dev, "dbclk");
+		bank->dbck = devm_clk_get_prepared(dev, "dbclk");
 		if (IS_ERR(bank->dbck)) {
 			dev_err(dev,
 				"Could not get gpio dbck. Disable debounce\n");
 			bank->dbck_flag = false;
-		} else {
-			clk_prepare(bank->dbck);
 		}
 	}
 
-- 
2.45.2


