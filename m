Return-Path: <linux-gpio+bounces-20710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CCAC7C2F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 12:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99241C043B3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 10:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B6928FAB8;
	Thu, 29 May 2025 10:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NicgD0hc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1EE28F506
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515696; cv=none; b=UVPafryroEO6a+vrH2+aTgVOkHP0aXnADR1J2Pf80kNDM9D27yk+iRO1jq8XSd8fvqZN2rDiOiOaJRdFZ8pyuKngVT1iCxQFsxN8wb0hzlbZslQ17Ds11V1V5RpWjBhmyGNcJoV+xdsIKW2jeU/GfAU/vjLhj1qdKinbJAlw7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515696; c=relaxed/simple;
	bh=tcS1OdtYYeMI7g/XHAbOHs513PqKnIFqXgFxXuW43MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxIxf2tx+LlmhKdbYGhnlAVrqlbdyOODUvgzLz1YswpZ3ZvWNo/fkB/bJqhXLKbtZzRQRVyKXPQsIsTvUejGQ0U1rriDfW3hZHfqDA5QJfX7sn/EsgO2GHZ1bIogd6fUdw+19whN0REc8qeqyLsxNVGGGq51+RGR0DPT7k0Y1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NicgD0hc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad5740dd20eso107508666b.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515692; x=1749120492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=NicgD0hcLgy6HhP4OZp0J0IkRCXImymRLlH2QGUeKC0+SkJtpwN60jgVSpWKp060vD
         6hoTDaU6VBFNWiAihQJFfpwVumzupQpN32vH7wXyqByzcN3wGkRRIy4IilRL9thniVMz
         JfU1yONPVIrCOTdJvveopWTUIjskKZFnoZsS38pya+5ZFg3KPQOrAb+mKB12XDcuC6sa
         ujUcFUmkMVBgWs+PthQ1BUU8iwqlZP9YjFE3fO4o1oZQ3Cyq0lD/eJ5Z7fP1wlfih8KW
         JPb0UMXTTS8ORaCHlQinep31n//VxOvpe3ka5IHPx/fskzgTk35+GmKH3h5SXf7r60fB
         b73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515692; x=1749120492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=VzQBfbDv5FjTBNGYhlPLVIxLh9EhTM6RM0p8wb1hoEadnGBSQIy34P0aSRX89dsBnk
         Y/khl6QKLnLNEomOHtHXHlDi6yJIc6rwkwJo20g8MVyrXTRf35wRk0Wd8yPY02sC4Y7z
         SiLQbUqAvIKVd5bJUXO+vJQWK9hofbPIx0KXKhckakuLljivwMKC4zPH0/nlY5thw2fX
         aCIEOeZs5UWLoXxfoHg+JQrpygtQMnGtagkLzwaOLmkg1oUXNJdzDLnNXSGPXQ5BfYYP
         5iHLAxpkKYBYMR3XtCy3q2X7ByOQSbl+hWNBNdE42I2ZE7n2A6r3Wkwtpvi8bekZcbXs
         x7hA==
X-Forwarded-Encrypted: i=1; AJvYcCVz51oxhE+Q6rAazZ6HgpU4xqJGEbMeLTIL+VMoZXM9OZ724CKLB+XSw3dvus5EUWW5u5Q3lWhQvRpb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzktl9YOlB4OOqY9PNQAteAVDJWbu5S7B5mLkNt9LIcvXJZummu
	0qJCmn4fYdMZ1Xf70MELpubtvjNfOxxJI55vMAOjJw3y6VaJliOjaEsJ7GNuQunPnBU=
X-Gm-Gg: ASbGnctdw/Shlztp40/sl2XQaM2QuzsreStItyOmceK/sX5eBSIDBIDsLgk97gaaiFU
	C6iS4CNydy+y0hcXj9vbNKFifrBgbNKFUKop02YjzO+LL4CoZpI42SEKlbFAiN3yg2+A9fZv/gU
	8/P8iICDOpytxBxebaN5I3h7S3OI76z02x8ozNWTHlDweC0aL3o910BkTXPwMaLDTDfjLYSXtUL
	lSUFEk2wzJdwiHg7/VFuJwB+CgXZ66dVT0CJKVidfkITmbtBV996l0HrF9kSyNdEyeJKkETPh+o
	Acq5r/8TYhgA/xeXGaDUWPNKbqFaaSdEilU5a/hnG4n9N4b236i0m1ukfnDtd4BMzx4hbZAqU99
	88xxadrqDi9QLBmP6J7w0lg==
X-Google-Smtp-Source: AGHT+IEOw5cpXlLDmXIJhM8OBLcgF8g3GUa1YjbEQIaeSF9CfzHeg4v+PZD6a/l5I2bu7UALxAndOg==
X-Received: by 2002:a17:906:2809:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ad89997ab7amr545955266b.37.1748515691621;
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3acf4sm118421066b.150.2025.05.29.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 11/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 12:49:28 +0200
Message-ID: <20250529104940.23053-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..f6e9bb2a3578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -620,6 +620,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -702,6 +703,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1299,6 +1301,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


