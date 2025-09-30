Return-Path: <linux-gpio+bounces-26672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C24BACC1F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F03454E0225
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263E627604B;
	Tue, 30 Sep 2025 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EE/K6B2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F65261B8D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233784; cv=none; b=nGMgFnkygCZGQttHebxdB60r43vmVfPsG8TZjVnvycKHv0AcCdPq23FXlihwigHlPb64Avf2DYjm9AA+pRaMDfN7UBlCzPbSiO5UBD8cISOLD7w0P5gFSmNvfdbe0YXGDEJ4SgTQLDElLNQMeSiIk09quiB3Dp11fiLF0E1U3rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233784; c=relaxed/simple;
	bh=7nSI/CkjCix8JDPm8/B93fRvxxu9NXFIimNOCEQuL0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K1hGJKqo5q9GgkzGHoAtl2Fs5Zdr/TTy0jNj8t09zuEwIQZ07G0wGqWYOWrRS/YHHnL88qNC0P6ZNuc/SvbzSwhoBi5/7p5Df7D4KXmneFdIlLd6P8ff4qEOf1oupLzm7+ZaFKDsZzhTsnKMqV9abXvt7Tw2tQUwG+b9qdfOMd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EE/K6B2f; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-856222505eeso630686885a.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759233782; x=1759838582; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+AmQX7KZAcw25Hj0d4QbboWJ+nhUbcuOZWDGasIrcWk=;
        b=EE/K6B2fGleaBV6jKRciaqgYSw7Kr51V41fAz/nCBYEAbg+sUhZYupN26FYluMFI+e
         oyTPROmnjlfb7hDWIdhTp0feo1jUumJdf9UwFxtIsByMH2K3wrodkz7RxZL2ldqo3F14
         ZNS7XXhndLP7M2T5k14HxVz8hssa+A9ifrftUCCk6YPcKuAP07Mx/2D9l8rHr7j0W+Gs
         yHDsCnrSAJS65DIxys9Px7taHMo5GPAHHANsKAyJaxtUMCA+nrx2PCkaWw2SkAPlHLrv
         7Jiag/n28czyPiRZ9KO4Nl8KYGIiPFj2Y/MotR7NnLJ+/+KKn0VKfuzTBgmCZM6gvLYl
         bX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233782; x=1759838582;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AmQX7KZAcw25Hj0d4QbboWJ+nhUbcuOZWDGasIrcWk=;
        b=rlDxbusnYM3dL3o70r+6C3B1rXwSVf0v2CdcX7HaArRx86eR759RChNn7BHH1ZwrJx
         GxAkzL35Nc8gUmNGLvQuwukOftCGq8OZdQAVRswk3ZDZBVCdE13pc2bsCkQqL/PBe/vV
         opMtB+gynT62VJhVV7OMfB/ZhvntNoBnaibYhzKfUhd4eSbNil3sYKTDiBC7yiwuth+h
         dM4jTZPa1EF3adJLszn28XrT9UXwp8bcYeEWDNpuvEeDORxs62pHHLOrUBrHQ4ZiLzXB
         1aqM1E3MJfs/DjxBT4FO5nktjN9v8jl+xjpBK9+2x7L6i5BtuWF36JKl1IVy4b6YJ49j
         GrrA==
X-Gm-Message-State: AOJu0YwS47Q6vRmyZuA6wixdLazRxaZlxyon5wZwaG2jWizoJWwN2jSU
	kVYsH13a9XaB5DBeOsk5WmERcgmj+wMWj1kfo15A6TWo/X4/mExviIpLo5T9FdvfaLQ=
X-Gm-Gg: ASbGncv9hqp0QGor5aWp0a+wnnEnvW1Rux6SdZcIV+qx2dEEMozLI69FhLRyl4aHuQW
	UwtucDW4wTv99XtQHUHbi3GkyC0+ZEXywQ/A1X/0oheEpmBYcq3SrSCguRMfPogO7CigvUuYOlR
	Ibf0amUi1sP1Kj7cMTjXXN4i4k2f+oUT5Nc1UuLfSEIn+huQnsowgYZe6ICquvg7JHNVDYUZCAm
	v3xrtE8siK68ZjpUZscqatHdlA3tVhAs+aM6rmaq4UOZUZ5jMS3kt7YLNlO0Y2dDz0j8SV99/9M
	HgsjrLXyS8mSvxKzgo8bfEd7azE55HiT/YSq3G/TIlgCabHap1bQC086Yg8dXI+DeuOisil3XS+
	/jAKfH5GX+sN/wOAap6ALixFIAYv8HiBxkRv4CQSrnU++dPDxWfnyzBiWvw==
X-Google-Smtp-Source: AGHT+IHq7jfaFTIdqtffcRCK/gavMTarxW+369vNdlfyIrYzrq0czMqdv1kGARLDyluq1sSCbe4adg==
X-Received: by 2002:a05:620a:40c2:b0:864:c4b9:da0d with SMTP id af79cd13be357-864c4b9fb1emr1459828585a.68.1759233781837;
        Tue, 30 Sep 2025 05:03:01 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm1020160885a.32.2025.09.30.05.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:03:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] pinctrl: bcmbca: Refactor and add BCM6846
Date: Tue, 30 Sep 2025 14:02:47 +0200
Message-Id: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfG22gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS2MD3aTk3KTkRN2CzLzkkqIc3ZTUJAujFFNzw1RDYyWgpoKi1LTMCrC
 B0bG1tQBtvLNDYAAAAA==
X-Change-ID: 20250930-bcmbca-pinctrl-deb82d571e13
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This refactors the BCM4908 pin control driver into a generic
BCMBCA driver and adds the BCM6846 SoC.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (6):
      pinctrl: bcm: Rename bcm4908 to bcmbca
      pinctrl: bcm: bcmbca: Parameterize pins, groups, funcs
      pinctrl: bcm: bcmbca: Prefix all BCM4908 data
      pinctrl: bcm: bcmbca: Use a guarded mutex
      dt-bindings: pinctrl: Add binding for BCM6846 pinctrl
      pinctrl: bcm: bcmbca: Add support for BCM6846

 .../bindings/pinctrl/brcm,bcm6846-pinctrl.yaml     |   82 ++
 drivers/pinctrl/bcm/Kconfig                        |    9 +-
 drivers/pinctrl/bcm/Makefile                       |    2 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |  564 ----------
 drivers/pinctrl/bcm/pinctrl-bcmbca.c               | 1114 ++++++++++++++++++++
 5 files changed, 1202 insertions(+), 569 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250930-bcmbca-pinctrl-deb82d571e13

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


