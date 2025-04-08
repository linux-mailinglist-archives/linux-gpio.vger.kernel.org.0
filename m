Return-Path: <linux-gpio+bounces-18459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F1A7F6C4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41B79169792
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A6F264FA1;
	Tue,  8 Apr 2025 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yvwqgYRb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79223264F9D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098126; cv=none; b=SVvXqDYgdi5CIbTOplOXgtadw58XUDk9ytxIVJbz3RJ6OTPG4LOd0B+m0c6/YTqQe1VikxYpTmpSBO+P/Om0Bg6zcnT2QoEs7CxjZFYl8zUFT6NVeZlRiQzou6DtA2gZRDH8uib/YXn+kYf5jNvHerGJrma0XdKrw4ZN6Sq3nWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098126; c=relaxed/simple;
	bh=lDs8uuZIX3R1BllHLsG6wX7t4bhweRN0/qgCa0AtwY4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXzdX3R74XE6Neoq6Lkc0ElStVyY5plzKpAQrDyHRKP51sEuCiKLx0Go0xVv8rnCoh30gtGeDch9tM7cuuhlmDOFc7xpvIHVHJwuqU6QhR3Skq91zzvrntoY7Mbwjqfm9EjHWmu+nvyQw0kxx5S+WqCpdeTC1dw/61lcw7DnKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yvwqgYRb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso41886345e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744098123; x=1744702923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5KSliEoaziBiXlj55FlhsxOKjSAwpZNPBiyshYdPCKo=;
        b=yvwqgYRbI07YXo1L1czS2a3pK0tMQfgCaUPgKfhSiT9luR1Hanqex0cc7Bfe1DoqOR
         418dSX9vaQ4umGB8ZUlPKddTJ09VeUTbaznfxG1o8y119RuK9iZQao6Y1UzEVB3tFyWi
         MUkjHwd90+Pla7NW6tfJzgbULUDhJEfnT0M+XUE4CraDsvhMRBKrLNG5n8a1ukqNUMRC
         78Bjwvh6nn9+ob+5P7+G1jNSb4c2ltduKAK2UmDF4sQimGryJhmlKbBibakJTalN8U0b
         nr/Hxrdqp0zqh3nXWNFBATG+nsJCpoZARte0Z4agiziFBw/Ll4oH0IBuDvExL2QLZMB/
         veaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098123; x=1744702923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KSliEoaziBiXlj55FlhsxOKjSAwpZNPBiyshYdPCKo=;
        b=JfIFAdNhGUtfIsG9W35EIpvAIiKD/xiEVDuy6taUwDU3Yiy8mNOiAmE6dtWXyJ6gXT
         qc/y1clwzecAlFiNUhTwICh4S3+en8DHbPAHelLMMcpLZn0gi9zb+cDWQsDsjQZCbbmN
         KUrsaW374C/9W7feAcFXliC6RK1eEe0160MxVkcKtjD5hlxhUKvgbqo2zzet7Z3dFEe4
         xqRQRMSd/a5EH64wGTyfThNAE4g2MFJcgIHy48HYJAEPQ8O4mQdcUFcZklBoPCi1beZH
         LKG4iMo6m3QKX35uNmOs+6+WvVJ2OlZjrTK8/WV0f7sIbmJ/CNeohTnrZ6q5Q598yICZ
         Weqw==
X-Forwarded-Encrypted: i=1; AJvYcCXh/DBmRCgu6cmCiMsilI3JlOYQpBzrjOIx3P563tgeSR6Y29QBZdCJDTfeJ+tWXT1OYX/nVT2off5v@vger.kernel.org
X-Gm-Message-State: AOJu0YwO6dTw74xaEhqgqYvdfP6s8a9YHj7mdGRKcEv3n17uG4Kpj3R+
	EqbrfHqC/3Bz0bUz08+pga/gvwzYOWAM93FP9NEt1PxAUjlYAFcybipgA6usb1o=
X-Gm-Gg: ASbGncsH1WSCHFtmxSBKz1FOkzE86UvWABPrSHZe1XG14T1vJOeFtxwu4k2Ycppss24
	p6hkx3N0ZmlncwPHZG5ICzWIFFqz9rSqinh4Z/QycfTE34G9yVg6C+OljCgisTGIeroDbScuA+P
	kTBGWfFhTIjDJRE72hCNJ7t0779GXuCENi3RxE9XtATt6HPLb2DqskRT/acWP0+nkRmUBAGeazS
	qK26Qy8Nj2Ys/JI2aHHzP1Jr6zcxRzc9DZFnUWW+9zZ/W2rm41Mo9HlGUmia3f0BAkh2D4ufyQU
	1J5LvyUMirp0jnqZ7zwLyGOqPCmPlcwfT+KQUg==
X-Google-Smtp-Source: AGHT+IEOwLVOTlI4m4uj7zOwwVtrtm680vmN2VG7dTu/ruWCUt9xbSA2/3fAuyKxU4vnMQjWrfnPCA==
X-Received: by 2002:a05:600c:a016:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43ee0613661mr146416045e9.3.1744098122886;
        Tue, 08 Apr 2025 00:42:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009644dsm13876928f8f.6.2025.04.08.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:42:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] serial: convert GPIO chips to using new value setters
Date: Tue, 08 Apr 2025 09:41:59 +0200
Message-Id: <20250408-gpiochip-set-rv-tty-v1-0-fb49444827d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfT9GcC/x3MQQqAIBBG4avIrBswK4KuEi3Kfms2JSpRhHdPW
 n6L916KCIJIg3op4JIo51FQV4rsPh8bWNZiMtp0ujE9b15Ou4vniMTh4pQe1jC1w6LbFqBS+gA
 n938dp5w/x05rD2UAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lDs8uuZIX3R1BllHLsG6wX7t4bhweRN0/qgCa0AtwY4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NNJEvZIMxQPI/OdfZHz33PDWuvxwthdor+4N
 7Kkv0hZmRiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TTSQAKCRARpy6gFHHX
 coNXEACCDtdktaflEawsexSUIwVZ8sTv2djibKqe3xiQN1nbQHEvKQlMWec9YDEwFepuP+4Qs+q
 4ldDiM/F4A5wV5vrsMsb5AmAasdACVaSRCZagqJWAm4d1/T7KH1bDLGY3ZMQvaGFDPtHPv4lpaO
 ulKEFb4CLRUlx7w/sZewdfAQ7y+lIzlqZb3yUhr6uS2ZRhprQCxFDxRuNKssFTF2NYpVsL3a3SV
 ioh3iQGxvqV4/hzl/qOscMMpePkt7kG0GhMc4059nDnz7DkhZXobKQwqCB8zOnyFk6joTb53SC5
 +yb+XR9wXvfJoUSYEGFcdQKbOdztxtpDuwV3xyPifky+53N37tm1k+AHl7jvhIk3mob9agd/W+f
 iSYVve6gvmI+GuFIIaeuJ7l8/YC+Kug207n7o/DJXeYu0odl/nKCfwadWquj6Aufsc4RaMmj+Fe
 tpE4Yc89XmoTU7FEsgyne9fXmRQr1clfrHRFccnDdeSXS9EUGkZBNJ8/ZDjtN3dNXvbW11eUDzy
 RcNTnIL0WQ8nquxadvHhg9XvGzVqnAho0yzfBPz3Cdikb9uYvCBiulgcrpv4EvLwtwueHZXGtsS
 QGfTAQVFIJ4sM78ZjmFqjOCnShk3nHga8KDuXJDMXmNtsmwRkCcY9ZC6FaK+h4ckbTCBay/wM1G
 IitRcqGfkKdP6IA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all GPIO controllers under drivers/tty/serial/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      serial: max310x: use new GPIO line value setter callbacks
      serial: sc16is7xx: use new GPIO line value setter callbacks

 drivers/tty/serial/max310x.c   | 7 +++++--
 drivers/tty/serial/sc16is7xx.c | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250327-gpiochip-set-rv-tty-0e21feb044ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


