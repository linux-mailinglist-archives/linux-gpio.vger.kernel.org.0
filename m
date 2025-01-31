Return-Path: <linux-gpio+bounces-15150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDE2A243FE
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 21:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67AAB162AF5
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 20:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE9C1F8906;
	Fri, 31 Jan 2025 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xfWVISNq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902791F63EB
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 20:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355119; cv=none; b=FbuzkC8D6T4KUe++B9SuXsO72jhKse2lJb48o8uW8niSVCe2+/aqw1QxUULrYX2g/9ASULACJ4YfSRUUES1TsdSsldnpfoUkyHyGAqZwKkoIU5uaK6RqykjddY4aPw6BYi7aK7MlVLiMCKak+vngTCgqLZam95zMDaskwIhDIQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355119; c=relaxed/simple;
	bh=5lFciV6sDtnvvFQNJQrSdhN6LDbuB2QD+esDyLXoYWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPArG9gMecqcsIqeVvrpDWRMoS2POfUSVaCb19/9B2AVfmoZyHASE/aoqSHO1u4gKVPjVu0KwpW4oGDigetIljjm+FfSaWG1Auijdy0rg3ByQDCMGYod1Rg3YUfZHziFiJ9+A6zlWcxbClKFd7jVsZsr9csvyqjUyJmG/qHGfhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xfWVISNq; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71e36b27b53so1320669a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 12:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355115; x=1738959915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59JJI4CO0oacXanEEbv/QOEs28IMbairlUQePRWumA8=;
        b=xfWVISNqGvmJvPxCnksE/Yz1kneKNWKaDoiPyVLVuJJqQz0AQds5/lIkpGqMh16iAD
         ZERvZm4NHH8ecjtnA156EOdT+s3afBz+65DNdZt3iYc6HqEWYMjMyPm8Oa1Zu3dPVK4n
         CbpaQ2ouRcwZeE4GRJsuUuze3SLPEEZf4CyvVcS6g/sEFkP/lEB0nbmevg42OYuehQjL
         4ohqvG7FisQgxd+xvcJN/S6d9ahf31PmA33gG1nKowgQJgD8P+e0HjR3kWZiVVKkuPUD
         3mdj0uy6cgk5FRaXgawn4H7fxeN9x9oZP6o3ixsNVrT4QqFTpirkBPSGe8iZKk7Ez5iQ
         nxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355115; x=1738959915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59JJI4CO0oacXanEEbv/QOEs28IMbairlUQePRWumA8=;
        b=fcol4DOsOVKu1hrl0er37A2iAXkWJLhQw3X66iTHVg2sHeMx5DCf7ImmR9Qzhrzf0m
         mkWYq6Ssfd/BmwG4MHMWbNHcaIhC/wHV+k2w6TxgXDxgUAdhvnfDsluyJiUVhCA13mkV
         0YKQttn7gQHxXvvCdjA0EpJsCSi+FkanOkVwQko7qIOqgjEgc01bAFzBh0ZxkQl9YwUB
         5MICsn+o1QW8e+QxFIQ71gZMnd7Z7eV0tIss7EEtm47v30WtqdAMEG+wttEDBZkpwpEZ
         B+JVhfRX6bONqzChqkLG2U6TJjOCzWXg7Xm/UoNfccgT6+Xiu1GK763PAFoWdTzIBi1J
         TrAg==
X-Gm-Message-State: AOJu0YzGSdXw4K15UvpqIo4KVArlt/0pX8c+mBujgv6NCVPXwYCcmb2p
	QZZmleCcoARfOX59/kkiD3+MRxpL2SgSl+u0e1bdekpNbOMXr3AJKnki9HU+3o4=
X-Gm-Gg: ASbGncuswTVSpnDvqShwr8NShHd2DS+FdzEJCbAbnDvMWHd+u42Xw11uvtjY0RoJzL1
	qxUkZXx5beb36jDVMoKuDN0AHXygNrd8M7kIBGJPPpu6bTjmX/ZgH2xLJK+iDy/rnxHXA/bV4k1
	khaIoD+k+2vnB7XpYJ7TGN+TSB+aU1NHjDMtJIB+v/b4sxXSy/59440erfbGDD0pX3R3+oHvupq
	Pdyjje7p0M18vD9zM5snH5twXvNLzVofo3n4UQ7Hmf4QcS7whpeO9vuH600b0odYxa/kNS/UMm8
	gSpNhXP2FwToLtPc/YIaDPSaN3WU7abre6CD1Yc84MTq6ws=
X-Google-Smtp-Source: AGHT+IFrVMAfd3Y3wOZ0h4O9q45j+fMg4Vw3AAmlNZ9ZgYIq1KVZZxWHseA00ADe6a66eu+rR/ZJMg==
X-Received: by 2002:a05:6830:6805:b0:71d:eb02:baed with SMTP id 46e09a7af769-72656774376mr9460293a34.8.1738355115546;
        Fri, 31 Jan 2025 12:25:15 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:14 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:51 -0600
Subject: [PATCH 11/13] net: mdio: mux-gpio: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-11-991c8ccb4d6e@baylibre.com>
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
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

Reduce verbosity by using gpiods_set_array_value_cansleep() instead of
gpiods_set_array_value_cansleep().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/net/mdio/mdio-mux-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-gpio.c b/drivers/net/mdio/mdio-mux-gpio.c
index ef77bd1abae984e5b1e51315de39cae33e0d063d..d7eaeadde2873977606bdcb5821dba18aa4a578f 100644
--- a/drivers/net/mdio/mdio-mux-gpio.c
+++ b/drivers/net/mdio/mdio-mux-gpio.c
@@ -30,8 +30,7 @@ static int mdio_mux_gpio_switch_fn(int current_child, int desired_child,
 
 	values[0] = desired_child;
 
-	gpiod_set_array_value_cansleep(s->gpios->ndescs, s->gpios->desc,
-				       s->gpios->info, values);
+	gpiods_set_array_value_cansleep(s->gpios, values);
 
 	return 0;
 }

-- 
2.43.0


