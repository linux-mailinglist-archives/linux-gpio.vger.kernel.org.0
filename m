Return-Path: <linux-gpio+bounces-13237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7F9D6DF4
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 11:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0586281523
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 10:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66275199384;
	Sun, 24 Nov 2024 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XBrJQIO6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83DB1922D4
	for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732445498; cv=none; b=WCQZaP26fMdkNt6QzdXyTGke9rGMKcyBvbesldYpQWS8AeABL26IRCCfwBqzgfGLIK0XCls20RRFLfV8lc30VJCHc5SuUBOuCG9DDUAsvBdvnYMiXEYqX/Nfs/FVc7rnC3EM9xDiJX3s2MT0Wi2SwzPaCkQUl+mVlzLKwzH8RSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732445498; c=relaxed/simple;
	bh=t5mH22vOPTQPTUILy+w//FEAgDrx/+HJYbcUWeq1WtE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFNJ71ZhTQHYtIpG5UlC28RRZfj+agvSYQ9STA6FNm5kzq64acjrYMP24xjQM/bya6eNuVhOLQAX467yEGDNfWYv0OB1uf8bJreXbNYXTAWX5guZaW/dztxN/Q70ieRWLh7i0O75DHFtKmRNLBBFd9r3EHFiHmSNu5U6Bf6TXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XBrJQIO6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso263184366b.2
        for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445494; x=1733050294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFDhd9Wyt3Hlc0wulj/fO0SlrgobJnK/8PJIrWrttTM=;
        b=XBrJQIO6TFOrhqJqChpvemq8eyuRlb8SF7xLzm22CQ3h7+Jnz8CPYYDHLjx26DX1RW
         6ApASgXuIFEm6DhHhkDUQAWTWqIAA1LDrcR1mdihtdczKBjTLNr7t4efGzMNI2+aUSoX
         US9+FrcX0s0VZkQl7ejfBesJfrPTi5WbmmAYVxRH83iQTdoN/3xu2LVVKs9V677A7BFy
         J43V9f6jGw3CbZgb3Em5S7gjohYs9BqQdBiPXl/z/I7MalBvmBQzxTDtJismy7qYlC4e
         nSdqrISk9U7hkSe69WmLgs2RGuV2F0wTXR0l2150pilqyVfkbQ1wLm5UC7GyBjndB5ED
         YtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445494; x=1733050294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFDhd9Wyt3Hlc0wulj/fO0SlrgobJnK/8PJIrWrttTM=;
        b=B9cc2wGORO5pUUXyptPXw+Yq9Bi8qctr4a0qrjRBkIvUMDvjDcfvZ2wwXY0V0XSDZc
         p8A0s/Mm1sY2strs4xndXqj+MComH0I/SeeW7YGwIx4OgRpqCoQpR5RegTDmQr7Y7W2x
         EGFRWPzhVMgt4+LhxLTbFCse3GDGlVEvsMnNigwf88q7lbgSoVaJePM/3M6xtSw99sV1
         piZ6qNcQXDpw4aP70PUapC8mR63iWBaJfc5hKEwc4MIPV1gah4rVeoCWpETPI5jt9VDW
         zKL/j7Lcv5Y92gXTu7+/VgGtx7hXMfla9IVWvxnohJULELpIzZ6CPHYn7m4uhsJdcpHR
         beIw==
X-Forwarded-Encrypted: i=1; AJvYcCXNBo/sOUOJPYb1ZVE5dJpsriCcawx4IcvyQRQsKXAf8UdE1LljzvFin0Cd5NXWqAc2ZyrAGFFXvnyV@vger.kernel.org
X-Gm-Message-State: AOJu0YyUdActSfOXns+uQSs+xRkEslO70mdBmbcIzmLi1wSCfwQ4euda
	C5JziCDI4H9p6TbN8bv3KISlcF0uOiYuA7CsUIAjt3KQEDSMij3Fs3jLbs2kmIY=
X-Gm-Gg: ASbGncvWQJIQJjSfauBHprKmz6086LsY2cy/CdGr/NCuKk1w642D6l5mRznWBppmlDa
	VKBnz+aivlgy8nxlw7qgHUhO+3l44dWJQTEWHp/slwgFV6Te+AYnzfBzq2JILq91V35aAK0ZErB
	2YpVBaFoDEpL1fz+3FRnrwSRmEgq+Uwv4fWX/cuttWHpLFXatZX1aOf3fNjqcdaaNsb+TFlsbYK
	B2b3aSZc7KCXzCT10OkFMYi2W4EanFGzKIr+kqGr+F4aFyH0C0lK/nEVJCD6CPnGPk2aN4zRsak
	yyonnA+7gUtVHX8jIEHX
X-Google-Smtp-Source: AGHT+IGkXmpO8F4Dhl0EGpNxs7dSonbb3C4mmRh0iCiEPq5mTBcYlRE2EkQKpKCjp2nit8IeufV0YA==
X-Received: by 2002:a17:906:18aa:b0:aa5:4cdf:4a29 with SMTP id a640c23a62f3a-aa54cdf4a4emr66028666b.31.1732445493808;
        Sun, 24 Nov 2024 02:51:33 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f9e25sm328892766b.78.2024.11.24.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:33 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v4 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Sun, 24 Nov 2024 11:51:47 +0100
Message-ID: <2292350a8bcf583129f93996c8a6ad5572813d9a.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
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
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..7c3254b043b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -689,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1270,6 +1272,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


