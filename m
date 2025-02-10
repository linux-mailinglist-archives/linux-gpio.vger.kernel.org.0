Return-Path: <linux-gpio+bounces-15673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B75A2FD47
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF5B3A76C4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158542586FB;
	Mon, 10 Feb 2025 22:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DLi0qjsC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E6257AFF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227061; cv=none; b=hfCWLRLfsxm0wAFgA5CCUEOz77Hv9InJS420czgggVakVMMbIOEv33/1V/wHXWkBldM1AFQ/4OFbUPaah2LsTDF1xamFZeuMvEcg5L2fw9DIWbbYR7v9BPm+MvsfK3+9+zFq+51Mi6pq+XQnqDeuf4BnJHmqcCVr5UUXaqcY0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227061; c=relaxed/simple;
	bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1SJXutcHn9frOhcFXBopO80D+crc8wjxLLb+hlDbXSDlk/q2xSr7zFL8z6qMwn8yj0kLqCs/Xv3n/XXEW/pzPbFpxRhRQSkBBGcq2TdOsWMYioMi4l1TZdsXoLRatoSgMIIDOcc5XpEyNYC0hi5N41jyknLtWIQ2YWepKr6R50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DLi0qjsC; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f3a6ee569cso483969b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227059; x=1739831859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=DLi0qjsCM9M4kRFPV0vlUdPq+P6jLzFdtm9bQWFR9JOodzbMazE/Al5tiMqScDd179
         pvG21zG8gsruYL+RhrsqoWBz2CLpUZri9iLyCTr7EfFSboiHU5ObQHmjPiv94bzGs53E
         nt1g1NTy78XMuXkKBbOf0kPO6fFpjjMdwAZ7VMQ3F7ugQGcgLb8RmgfYlP8lmvPZwaQk
         zw0ooUfpLst7YQwUGpU+N6/O9XahJdKy++vUMqsQD6CXFZq+HM9RC+6LGqNFjkH2gYTI
         ze3Re6J/b8pCBOJhbniQUGBkF0OSBApxd08j/OUhCH0VnLe0eDNsXPNekRiOmn9KWXTc
         zhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227059; x=1739831859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=UM4xJayiLHmCBtRncZRLkURBj/Kruw+/aXtdLvf0sRCquQ2ltuJIEiAMFOhEGOrwEi
         V3iwYOR/1inuYN3l5MkV9tp3t3xlX1lEzere3/vMlg6NvwSnsFk23q0TkVQdTqX2yEhH
         Uy08GkV6giJpah4SmfSHWG7EKOI9s/a3l/mSUS8ojEXWkkQPMKH8H+0i2mq13EPTxcwR
         Gyd5ac4t+iMpDLP/sZWNtpFsjIghWc3x7w0jtUDeuG+DOSDTpxZTXFklB05nN8yhVCgr
         2iW5hz120vZA5DXy6dgjwdOiNthvOOmm4ia8WzPwRRRiHAMPNlmx6lXPzaypuhIj8aFZ
         efAg==
X-Gm-Message-State: AOJu0YyDvSQGV0hi+zdYqyOwIiO0E4+JM2VGnsxWK55V58Q9o1gUCa0A
	tw86POXJDjPCCiq0vVa5zNOYJKwmStUMUEIMbawDyforPN/phgkTAfZMBUVK5vc=
X-Gm-Gg: ASbGncs3YzSkXKKvOZWfRKNQ3elL19mz73Pn3wvtDAl4demlXncQDJGwN86NuS+2WVm
	PSofXazrHvq7x0RQ65Mmw2IZ71gYrGx6+dy1KW1Z9vSxQ6BYQIokJO4vuUU3Juq+bBclfkVP7us
	kXlUZpGH0OEM2TeB7pb85d3FUmjxzMEGcKrLD77aCBQ8NGvyjiSu3fqpxglsW0GI7DrnJRtxTdV
	vVPlXnzHisFBfDnJXtGmoKXgfPff7M7xIDAL8f4ywrBUb3YPz3teUFIpc0HYVNvLuVloxOOcZ8h
	NqRvu6Ni2DnCKznwhP3FonCN+9iywjVCIeKISvHEz+Mmqrw=
X-Google-Smtp-Source: AGHT+IFW6c/bCwKZFJx1mUCSPW7GBmt4Y2h9+oGTyfDUlc4EaqeUGtPptBQHkkXiE7A01fG2q4Y7jw==
X-Received: by 2002:a05:6808:3095:b0:3f3:c370:4d65 with SMTP id 5614622812f47-3f3c3704f3cmr548358b6e.20.1739227059360;
        Mon, 10 Feb 2025 14:37:39 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:37 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:29 -0600
Subject: [PATCH v3 03/15] bus: ts-nbus: validate ts,data-gpios array size
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-3-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Add validation of ts,data-gpios array size during probe. The driver
later hard-codes 8 as the size of the array when using it, so we should
be validating that the array is actually that big to prevent possible
out of bounds accesses.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index 2328c48b9b1260e805c631f2aa7379d620084537..d3ee102a13893c83c50e41f7298821f4d7ae3487 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -48,6 +48,10 @@ static int ts_nbus_init_pdata(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->data),
 				     "failed to retrieve ts,data-gpio from dts\n");
 
+	if (ts_nbus->data->ndescs != 8)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "invalid number of ts,data-gpios\n");
+
 	ts_nbus->csn = devm_gpiod_get(&pdev->dev, "ts,csn", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts_nbus->csn))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->csn),

-- 
2.43.0


