Return-Path: <linux-gpio+bounces-27800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22FC19FEF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A0B1A505548
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AC3334C07;
	Wed, 29 Oct 2025 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nRdhor2M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41989331A72
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736873; cv=none; b=QXfHpiIL/yGLdCfTHw80GK/e7sBNogT38P1oAoZS7CqgwbMFnKFgWq+Vk9XGbN3Fn8fFjuDOBAnJmbBvAafhwl6FqxXWDw16FpD3qACsbduYzKFQxWpZOdfCb7J/9lvCT5zc60tu6ARy0EfgjP0+mu/xVi+gnHY0WNVyEa6d8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736873; c=relaxed/simple;
	bh=qcX1d63axfEm3RBwV296f+6+sRglnyR7jSQ67K8y59Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWANrlBCpKUQJEUQyTQN4i9p8ukqA8Cjl38crpTn3ow4ZprdSx+jhWqgMnN2m3z/1vtGnD60cRDyuiBrJwG1Ku3wIoi3+nLAQ0zkzzxJciMHbJRj77+u035X+jJUJPZMHXOgBkmVEDqA1DzxT1C/wmPuhDwqkIzay4YHjsta7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nRdhor2M; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4298a028de6so564385f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736869; x=1762341669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=nRdhor2MBH/H6treB7LnroPg7WBzKVkYr/IxZzYUz+IMjN2rKbNsL1CGsS8HAs70ll
         /gAegqiuKvsuFTOSQVtTrNMNLEib8/rZgxrYTzdX+XZd+12lkRG+xyCQhsxmRn37LdXY
         4N/JDna8fWqFxrwAMveKDPGPbomB0aBQnwrlSEBCCYk9JW4IKDNUxLo/FyAnRB2vD63x
         Ir/0O8diIntZ423u9W/sPiL64y1p9dsC2J+X9zcu9mrPOe7X2siDjuQ2W3fUTtnVXhky
         lHwDifzLdptSXRx0NRo/FdZL3Qyh1C6pAMHORoXJdK/VwoBLAuxfJlUV2If1K8bdM6y+
         j9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736869; x=1762341669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=tv+piGFCEpRWQDA9s0v0FzamnrlEpvHP8L+yAjpJpxbcpPy7scOhE+GNl2cD/B1Vh+
         whv2jadqF1xk9SdPRI+XNyf1nZsCIi6CL1cTNY4kApyKz4Jkm98DacLK8XyBUVVkXY4p
         FF8JfVbFfg9QHmPDTPlScTVmonzbIj/Jrc4xJYtNmQE4PdRZ92V9p5wfVwMHMTG9xz+8
         m7/qnjRekyYqb9aKuiix4xTdH51H67kCYfwkuyDT9c8ECFxAHBvkyk326EuIkpfwNrj4
         L/NF1UGOcTY+UpgB1+nBphvfrRTepUusMSCvlRSsjDMG14BvlDn2g9GUunMynnfPZYj4
         SlYA==
X-Forwarded-Encrypted: i=1; AJvYcCUhcCkmEN1PcDY0GD78GPfFeqbKu+oH2TUN7MZEZnToRaXXP46gNfBX/ZrKeuR+TLtvtZXUKHilTvNB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+lsFESW1PtI1+p9c9c4HF5m6ydPuV0Q86XQ3Azz0xtrem2mhK
	iLJ4KUhIQeeJptaLWkISw7yLYXqabWnYhl1GmuFi7EEFQaIUq5hauOGeHAY8vKUbn00=
X-Gm-Gg: ASbGncuIyl0NpWBeYJ+SbERCVs+CO3xOmT7esiNnyZ4VX11ZVgspsrq7tC4T3uxyUyu
	cBl90EnLV+8WpVDoaOlQ+A46kV75S94gjK55aZQ6yiZcPobmrMMVLAZ+UfSzh9bvJ2rs1n2lpRZ
	FTt1goTGHPOT5EW4o1uowlz5hKx59rgY5h9hoOTOp9Ia8Q8EVD4NwHprTWqrK2e5Sblz7RndDxO
	cKfyUMQBDtmFmb1xESprdugvvNw+eI+xSL8tlpJF8DvvenaFt0046QC7FZRTLjDE9Ja0/nGtmWi
	KEI2zt+gBhqnC8gxQ3FnQiOBoWHeaKVBENUobCVmMm0GY4jjXnpEHOFxk5FxFgE75iWvfoZPhs9
	H7+YBUDSXkaOM9iPZx4Brn8Bcz+tNl6miqF17D0M9Hb0yXL0SYB/IWBJv7jn4YpZmTkJB0Q==
X-Google-Smtp-Source: AGHT+IEH6NN9LOg6FLsVrk8zgYabLR8BtA7vsvA+Q2uvBWc5oO4/7h3wh8g96410ssV5WtlYeIfHGQ==
X-Received: by 2002:a05:6000:611:b0:426:dac0:8ee8 with SMTP id ffacd0b85a97d-429ae8edeedmr1897555f8f.10.1761736869351;
        Wed, 29 Oct 2025 04:21:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:43 +0100
Subject: [PATCH v3 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-7-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LQ6GmHpD/iWFySPYiWNs4nA4WFevXV0FDAv5KxrY5e0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXPD1vu8+WNIIVkn145b8DPfphfMN9ZAQUf
 MgZmrowGRSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 cj+mEACXXeZt45Hp/bebUUP9FRIuCOwBltkwhyGWvMMx9PTg/virvsZSWrsbCDKwVHowTsugvBo
 ojQt+rBZx4fjXjEfaPniWVCRzIZBwM5eYEiyARKHMY5e8mRvLiwdRsDQFE1P/9IHy14ZVveXK9F
 dUGwyeOmdmwcXT65FhiDhn9+GIvNQ5BxaVKUqvfpeN6WThs0dx130XdGjauQ3kIhUdVyXmBpKnw
 L6jROZWZ3HD97GiGvKPDkUW+7DY3DMnl9Zt5F4ttq5ABoz1gUpfpo4VCb9E35lERHQkhJfIL9cI
 YyOMKGpPyeZ+MD3y9yb71MS4rRM+nKqK3oo/G4iYMZjaqjeDM2SgUI6QlOLfpDn5w6cabuHYD4O
 C2EiSXMl+dAzgifvoBldvNEZx1WtgR/sT3kTyxA01JX08FpSCP9pSbhJteuinINVnQALoyg10/f
 aho6Yi47ZdyDhExR8O7KyiLsjZkxPcDpP8ZymCQbRCn98lEVrYoVodLR9uBZE6ZB9yaijXt0m9f
 WkipfJMeZToVjn4CZRYcOkQ49nDv4C2+sgpy1+G6xu6Aee84B4Sb2fqa8WEKntpKBqBiLkQWT0o
 wLWY9t5n/E2aWM8d4UQ5uLNXLRj1PgYGAiX3df6Vv0NdL722eiMaLZj+DdSEmMK4s4zG2rQFsi6
 IakNBGvF+FN3/9w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some qualcomm platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -316,6 +316,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

-- 
2.48.1


