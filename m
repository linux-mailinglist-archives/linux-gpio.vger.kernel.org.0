Return-Path: <linux-gpio+bounces-19150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25628A974ED
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 20:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE5D5A02E9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE31C29C35F;
	Tue, 22 Apr 2025 18:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W7ZV/8yp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7975E29B225
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347940; cv=none; b=N4WEOOnWR4OG4xhKa/M3gmU/JKgtRE6QsxMA/SWTs4RMBCQyNcz3a0VUTuzBntv9sBlp4UZHaiAir9X/zlERIiQL++iXrAybad6cIoypkpBLALlRezl5mVDtDCuT96WFyjaxr8JDhQjvlXO45KkHSOZF38R5VFTeMi/PcXHMjVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347940; c=relaxed/simple;
	bh=tljGp2ZGKwz5xKjRNtfJTi8eXf68cWZGNi4Xd9Pss8U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFqqzZPrV3/VYn9e5r212+DSYSCJqCAb09C001uAffUCxSmc4jX+IzoynNSR6PkISRD6EWFzGCCKBlGGzvHz/gDFepMucoE4d4JE0YnRfvI8uqKtCbGwaIyodB6po5kWqr5G570lnLJkJyruT+ABlg9gaeLH82tXKWjpwwHBOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W7ZV/8yp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so5950583f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 11:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347934; x=1745952734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYOOl2kWPUOmT3lYpRPa0NBvw7HXmwvyakqo8gvrf7U=;
        b=W7ZV/8ypA3lAUP1y0sivD5W/x7HWjw9kSJZz8O0bSkDfpCSyqe45zScBIx8HLcoUfB
         f3qtfyR+lvdwezqBHi+18N4YSD+GnFrRb76J/g/52mzhEtvO4Tvlx9ZHY7S4uxx7Jbua
         nP33ZkTB4vEuNE0TtiMCIJxqLlLqdXPZkJyOSE9tEsyhcC1AbJ4XS+UR0Mikv+Iv9fVt
         CYbpfkjMMtC5Y8cTiYSULPhdStrXrpX6z/rDAH3bioXlcQq1xArOQlJc3lL5Xzhl2i6O
         Sok4pPC//d53lng/Do5fkNmLr46LxDnGqFCBOzwxxQeLKmS8lLrsdo1CfiqiLuCQyC3B
         UeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347934; x=1745952734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYOOl2kWPUOmT3lYpRPa0NBvw7HXmwvyakqo8gvrf7U=;
        b=kGr7Zz0MlBIAy+ySobakL3uGU1bu7YgXVcEKhzgl/qHp9MXzZBU/Tp9gBF5oE5gGvk
         HCE67vtB6BtHt5xQvEyh6yhZDlKH6p5CYod7g4NxZsUVz5Eo3fZs52rEyw8HSLu5Y4sT
         ea5Qcl9rW7y4uIuPbF3aEloUaWn/0XYvwnL9ss+nvqQUY8LXDajHgyfeIHoxytXCzCVb
         6YX3iG5cYQswPJm/UHsRS1OVta98RtikE8PXmsWTXKMhFfZ1i/syroTJjXumd6IdjP4N
         dFsyXT76Y2EH2uBKEMRFc31bByiE2nxUxzNG9zrhtaSnr9lRNSid24HsqoYNVZYUv1fM
         pXWA==
X-Forwarded-Encrypted: i=1; AJvYcCXg1G99CmS8CSBGTo40Ohqi9GeuYOCcNfGYZah9KloU9HpAGYoYOGNDSSvzdS5vDfqjjVmQo67winxM@vger.kernel.org
X-Gm-Message-State: AOJu0YxpbsJFQvtwIDMfxjBkpRo/AFBpxuTU6gtT4H8QElT0dS+QB4SC
	OSHN4ciOz8aJO32hWVX0dNPFagItKKEcTnAtdw4jQfP2virUE1hp4STvgInYTYk=
X-Gm-Gg: ASbGnctuAS9EOyHGjKBlCkajWfsCN2BolKo2ROUIkr+7TLwZIezQiGDVmGCCNwULG+h
	3f1k88bvxXPU+bqJuC7hVQvN3SnNJgiWyajhWZad3xSx3+WolcbzfzT4C5lahxbU/CpXkuWg2q3
	RBT2zaWbx5jmuPZjNAmpaDS0x5qPukyj1UmgRTWXIRMLMk1ihDyeWPpAee/6NojuM3iCich4cLZ
	0yRmydD4ju5s8eegunCULIivUF1KYXjESMg+N2Q4/mBWj+eEfUPwcDXzdFsoBMXuOmCKHl7gk/t
	1dZB9a8tJ10+Sr2k4O4WJnB5Qs8SV5L0RAnl7LAJ9GFtjyI4pdJh3ugpoK6841r/JpLlw18=
X-Google-Smtp-Source: AGHT+IFJkUzhohlFWFD4tnJxylRaHX8kyBRjPpJLd4zTyh/XarWYhUWFDm8KDecIRtmuP1EH+CI8eA==
X-Received: by 2002:a05:6000:2509:b0:39e:e75b:5cd with SMTP id ffacd0b85a97d-39efba2c98emr14139193f8f.3.1745347934622;
        Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39f069df9fcsm10861464f8f.16.2025.04.22.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
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
Subject: [PATCH v9 -next 11/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Tue, 22 Apr 2025 20:53:20 +0200
Message-ID: <928679d1511a43b8dda150009eb023b4eaaff5a2.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
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
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e..53748ea4a5cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -622,6 +622,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -704,6 +705,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1301,6 +1303,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


