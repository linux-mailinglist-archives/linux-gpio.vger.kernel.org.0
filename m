Return-Path: <linux-gpio+bounces-19958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77AAB3A58
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19F2617E4BE
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1143215789;
	Mon, 12 May 2025 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1ePDZHc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257861D9A5F;
	Mon, 12 May 2025 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059786; cv=none; b=iknpt50YE91WOFK/4dQp8+AJdyAtXglaDc5DeBBD2Yfu9o1/C4eplWZ414faSVkNSeJmk4ryTz1aWfeddEXTDKHj7I7Jau9orvhZ1K+NDYmh6f93SIH2/WGJ3gjJZAGsKO/edSeHo/II5DldrKPNGxGy/YjM5k+JfzQ7TEWLegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059786; c=relaxed/simple;
	bh=GsvNWfa11SxTItd4H+U313AmqXHn2xS/CXKvwm3uC9E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vC9bionQuLdakE0/9jvXrzEFw2SqezZ6LmW8jI1NAyqYHhZpgd5WAwr4ZtZcyEdONResVA22+jBCZJ6PLs7g/e72jDZxPHXi0oTxjJUbeNj/ujyUy5dwaLErED6si1Zn/PGNBjXZUeLPQX9ab7JEQLp1m6b39ObYZwcyX/zY+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1ePDZHc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbf0324faaso9408056a12.1;
        Mon, 12 May 2025 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059783; x=1747664583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7U/7TFFzbKxLXCoN9cY2hp8Xdg5JA+fD81iTA/+0bg=;
        b=T1ePDZHcBYny87pGh4YzAhApCsFKw6kUJEIBOsPRdwX73BDkLH+1vTrv3b2cgY3Qth
         MJrashGPtk2AOq+boBkpV3bUeEoKRqL3KAjPPzIaRtBF0/aJkgiu661JGjvga/6SiuBS
         z3mmpnlOD8Bj1s6coPVgmIkBKV/kGtknIQ9ZPg/1bDA5fuU1Fz3tsWMCmckUwI5tRhfS
         5s+gPW1QW6ryzx+8pKWBP61rowI+6tyNJqbNw+zV1i35kw1f0tezDaakbdq7TqALWeDR
         tfB1pKmVRrGsrlq9zHPeJTe0oULzAS8dN1IVn5+MjKrJ/j8zimGas8ey7q8MquO6fWc8
         HQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059783; x=1747664583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7U/7TFFzbKxLXCoN9cY2hp8Xdg5JA+fD81iTA/+0bg=;
        b=r9SFrNMhNbjqC4ZdYEa68PhzVpj0OWsvX+4iOA+mRc+elbqwj3IN4V670v+XA4kwgb
         TiNcF11aZVFTQTfA0B4Joipf5eMyHdldD6R0dCq9Z2TtpXmVxhdzofdxLwkwkdoC9+DD
         RYZbyDTRqFjgfD1XfEAZZfCwfULXOVmeRBYz2eF5KGVLEVm4EHW5ekjjXfrIIzIw2Poq
         ePpOp/BcBi8ssOxk2WYuDPyo6p8dVBEL6omxWcgieWXa6LPQaqPgxhYe4NC0paXuFdW1
         DfGFqZcquoCXMQ+Qz3Hc5LVPpce/d0UDFrmkWoLITLT69UH/nF+IGwHvpxnn5ieNoSFT
         l2kg==
X-Forwarded-Encrypted: i=1; AJvYcCV8U3d6xLmpU4sp+bYRpEupVfZsec8tgPEabyjy+/FQ3ie4oJe6P3oI0HlF+XLP0+SZh+1rnrFpmheZ87Fu@vger.kernel.org, AJvYcCVBuBlr6fLyJob37lggIX/AMLJ41hf5RMKLiR7U51bQCpSfWqYYE5rmF7J8P7S3ZbhQiGOJpK/IoIYj@vger.kernel.org, AJvYcCWBSHXu4e/phOBidISvAd04rpuyQBzvFvnq+UgDPFxf7DPRPdYzgg6zSYn8puGI7qV63OBng5eU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6NgC2CwaxCtYD79uzaaZrGvn9Z2dZPdXq1lurwymMdCQ69LHc
	m0mLlxwAmt/Rb8qhTviBezQFqy/awjoLT1zSUBx6ztTaijsAxzds
X-Gm-Gg: ASbGncvxHThfT5VUdWLeRZgl841YjXZH52YMRtT+h/O0UuQWtOc71d9s6fY8O3KtVTa
	FBExSnl5wagoDhW3/l9RYLj07fNWgonOWF1s7IBCIb7RXa5DB73/j9QTjwXQBXa/+JoNxENLZTC
	yA3A4iURIt6un2IpLc6nHW3gqghSbO996O4Jifj32NqQmXhMLEqUax9bnvLyseq4rJFcp8bBcdk
	npJ6jT3jSn3UIuZgJZY00FGKHhAzVHpkLlkcG9yNQtPgKRXir4MXs+LYp6eOOdJmlQWKIt/4nSJ
	dRglMqi2mY5xonDtYx3r0SZg6/Zi/jllEy1jqCq5egZC2RBoinigmfIrFuUQbYaJ8h9dvOybOgg
	vsPBG
X-Google-Smtp-Source: AGHT+IH5BZ0mIdqP6PVPdn96FQfatjAkMNwjVngyRgQXInUcRxpFy4UFr4q/qRntr7dbIFUCIXMbWw==
X-Received: by 2002:a17:907:c243:b0:ad2:5198:d710 with SMTP id a640c23a62f3a-ad25198d7aemr440934166b.20.1747059783141;
        Mon, 12 May 2025 07:23:03 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:02 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Date: Mon, 12 May 2025 16:22:36 +0200
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACwEImgC/x3LTQqAIBBA4avIrBtIS/q5SrRQm2ogLDRCkO6et
 Px4vAyRAlOEUWQI9HDk0xfISoDbjd8IeSkGVStda6nwYu/ucKBpupRw5UQRh3411rXaWSmhnFe
 gP5Rxmt/3A8vr7AxlAAAA
X-Change-ID: 20250512-pinctrl-a37xx-fixes-98fabc45cb11
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

The series contains several small patches to fix various
issues in the pinctrl driver for Armada 3700.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (7):
      pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_direction_output()
      pinctrl: armada-37xx: set GPIO output value before setting direction
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 35 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 15 deletions(-)
---
base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
change-id: 20250512-pinctrl-a37xx-fixes-98fabc45cb11

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


