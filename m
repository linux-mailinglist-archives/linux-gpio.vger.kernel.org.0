Return-Path: <linux-gpio+bounces-16062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6BA36DBB
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 12:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F59E171269
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 11:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3201AAA1B;
	Sat, 15 Feb 2025 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7q3HGDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5A194C61;
	Sat, 15 Feb 2025 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739619188; cv=none; b=ECk7NrGChb+90d/cjzcY74s8I1u9ru/+h23GM/w/AmOjAfWD0Wdn1YRX8rawrQjdx+743ElbWggmVvEy8A2kIE2+EHzRa+5GaVJfi9T4HX4ffTgwPnv+Gbp+1g9SqsEWkMcWRxJIin7I4AUvlQURHQ2PcrJ+4mSK6uS6uFuF7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739619188; c=relaxed/simple;
	bh=0aXkkETEfzydD+wuCQodo9EH259mIY564Np1Y3qqLlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYsCjPZ06yeG6utIsadC3BhfcqFn+3lC2Jbgre4aAk95aggJLvt9l19vDpvcCHijK4h1bnPGV2zlxufLfmXLHPCQvqG7ulruwKdnJzeMRKezOYWEbpiULeOOJeb0NPC6qtLHaeORvZjWlJBAFJS3G8vG0B6Shgc/D79aj/ulnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7q3HGDn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4396e9ee133so2619805e9.0;
        Sat, 15 Feb 2025 03:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619185; x=1740223985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ4h7/VfporGRJI05sMYLRTIp37UC/VZX1ejowPlgvU=;
        b=B7q3HGDnRXgSIKyZH4EDJA7gadPpu3dY95jb0osG8xYItplL0aY8IwbHraSAL8JfN7
         kB+xrwAG0+bDFZfQ0ZiJ9U/pBn4tiaI3Re4DGWMS95wdJk95jwRUkrkdGobBGPuCiA9z
         itvt7ZjLw4PKAaru/HhSJuHcWy6+lMmvCL0PpDtdo5gqzzXsOXnrmRNXS2WIZiTGFCVD
         bCL+lmFuxAGvp9ATRNT9XNZkxmXHvbq0xKmylsCKFMMh3xTGSHr0x9otz+PuWPtolL0b
         Hbeo96eZBWxp6x/B/phmKCpcqJSS78Xi41tNDv6T/1qiH1nQmGSBA8Qzhyj6d2nAZyc1
         +BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619185; x=1740223985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ4h7/VfporGRJI05sMYLRTIp37UC/VZX1ejowPlgvU=;
        b=F2gHjJXzlc4XjsYM0nEVaATFinBcm4vHSixrmz0upP6HxqeKr61Q+9Y2Gfgh+u0uGR
         bAKKN99MvYFMAqMjmAxp8kiIwhIpE0SYyhvzmY9OZ99AQl5MjkrLz+LJj4GqotB/p8YK
         nf0dWsh0ca2Y7eE6Qlkv+4PmEn9t8Cj608zVeNSeCi8kAV/DcwDGkPqAZE6TgHz2L6Nj
         aGlPEz+hsItDGF/LFxReSKbzK6FfWnSLyIYhU595AJLVqr0ZpYctUbP0PPsmw6fAF5VC
         ie0ocuqaBJYoJVlq120rH8oh+9dmsdBRhRITcOn/GVkgP+KHTcUdmjBvVW/P97zLU+ZL
         7s0w==
X-Forwarded-Encrypted: i=1; AJvYcCVySIDLl2WmI90PjnBO6DVLhozaGUm3yT61aziYUZH/eTejD5Mw/99ICrCjy+2B9uPzMOuctoa6ob5gp3T1@vger.kernel.org, AJvYcCWIkWhc0lCvSg12ZY7R3mO65j/nUfKxjmd78ham43g3Bz0nFXJMrNimiHjowMw8TeE+htALzNAX9NEReXch2XlsxOM=@vger.kernel.org, AJvYcCXtrlfpzO3tGAvOz6LKXdD24PDllqSGFEkdq6T3DQ8HXlZVHMRBzJCALFmm4ZnBUoAGsezAXGwD6XL+6w==@vger.kernel.org, AJvYcCXwB3jzAgvKYfp73C3D5uyOsElBS0OARXTV/YQTUKygBOmNgMjy9pkKgailvTyICMWiZ3KZCGURBpnn@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9ZrxpJjIiEpVcsAzSlL4wtk2CEWn9TG2K2LN4iLfDfGdGAyF
	EU8UVaJD6s2iXr0+kZI94rEoKGxMDggWQeKLbZDKHArLIy82lMsV
X-Gm-Gg: ASbGnctHfR6ejQ5H/6eiMvbnItbtCRekkDc8IvPWAw3CH3bNsG3+QZELD2/EoyslEzV
	DlcB7DLxyIqCDVp60YEGE5aUIVCR4n9cvSLIR2Xe4UAhuQcjFfbC781hWpMHIFAUeRG/VK3s1et
	teXIRxVWHOw5VJUfvNXQ4nlEfSZya0NsZDTmbnhuGvRKqvn9U8FrNPSdHcewd8y+u000YrEhG2A
	WcuccgwPKYQtGF5IRNiibAudxCE8DUIWCvMTogVm0mjMiYjVj+g5/I/BrirSZsqXJvQ7nNVpsqC
	oqnSu6JVs9P3Fg06lv7+vBnFtTkc+QUWct4pPzaiYsDsjOolziRj8LSxVBjo1xi3qVg=
X-Google-Smtp-Source: AGHT+IFYiWapyROaWFGJrtPpnydYDug7fSPS0XbGrBAzQyfn9wLIe9lWK3e/1ZvQx9E1whB4ioWIbQ==
X-Received: by 2002:a05:600c:46ce:b0:439:5fbd:19d2 with SMTP id 5b1f17b1804b1-4396ec7c92amr28910915e9.10.1739619184524;
        Sat, 15 Feb 2025 03:33:04 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:03 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] pinctrl: samsung: add exynos2200 SoC pinctrl configuration
Date: Sat, 15 Feb 2025 13:32:45 +0200
Message-ID: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for pinctrl of Exynos 2200, as well as
documents the pinctrl and wakeup-eint compatibles for that SoC.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
  dt-bindings: pinctrl: samsung: add exynos2200 compatible
  pinctrl: samsung: add exynos2200 SoC pinctrl configuration

 .../samsung,pinctrl-wakeup-interrupt.yaml     |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 168 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 173 insertions(+)

-- 
2.43.0


