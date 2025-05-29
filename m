Return-Path: <linux-gpio+bounces-20758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A1AC7F39
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536063A06D8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6795522D789;
	Thu, 29 May 2025 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XZuInRcD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B722DFA6
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526574; cv=none; b=Ibca0mIv/pbPxKj1GLHLlJHNg44hKvypO/sFNNIV+Ve7xbiwlFopLsR6W6TO4M6PTKNj9J+Owfao0SOpJhZk28HplrdDMc2Yl026yLfD5pLwQ/yd+BaEkHtb2avX66YLaWMi1K2CjkbNydiYg4QrlT+idqdNe6yAfVYZg+A/Rns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526574; c=relaxed/simple;
	bh=tcS1OdtYYeMI7g/XHAbOHs513PqKnIFqXgFxXuW43MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsIskuscIzpnKF9rFAjry6Y4MoGfhDR9vd5lnl01FlFwdlOYdikscOGDJ3iHrg7ZyAmPyDiXvHVRwOv6O9Tdn5OcAEaTfG05rhE0ksXRgiQ+eqFuUC1s3Ra1sUtJg1QJbKN5m+Ikeimqt6/ljThUbrS0nba+cNLfdi6uTrLXe1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XZuInRcD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad572ba1347so137958466b.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526569; x=1749131369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=XZuInRcDEzGWFNPYuYg71y3LUCbHB822XAXmtr3F0XXTI1wyeblNHFgyIMe8vqovL+
         UMapZzqHD9iqfdaebnqTu/NBleLBFKAk4GxNrXkhi7XHMb9kw0pi4wx3cDZGe/TzXozL
         CRYenAlQ9Yy7vf2kTKPZ6e3RykHIdgmhnljXPdQ9H6til0uJbO17mwL1wXvteJcuu2yV
         v2T0ywPJAJvN+CXFB7lyJyhCfKCCjNXHgYSfROQox04A1KRe0sXD3iuifVoE+8n/TE38
         Hfv6aHFGP8BGoNRS+dmWdqA3ImwUk8JNRHStWLhNFqCJJ9csFdzeiq+zL3k42uk2HIKv
         +rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526569; x=1749131369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=p+WPsw2RZCNPRRn+jyJE8E2oA8nz2w4gqfQWUprwmbDWzwnkJetKKOixHvEzq1wieZ
         LptTjDZ5EX9AqLnngSxGdmAdNZDV0WbGnI9tclwGGuERmI8qeIdSghDtFJZ/XbQzvlmj
         H/AhvX0vs2DpW+DgiCVRyVRHPf2OM4pVwyKMHwrt+WPDS+gywALUbLm9I40aqOETh2Mh
         v2N+ADHvQFzj5/vRUk1R0rsWbLlH0+701ohW9Xv4y6ba8pY4CYsUJq4BUhShVcsWGeSq
         MGzq0MdKxRf64wIJ7B6e2C9yTPrXhcaf4VmDvG9eEiYM8UxfowjJWvHb0ioI4nlni3FC
         aEHA==
X-Forwarded-Encrypted: i=1; AJvYcCXEyNsUT45jJ4rYtVbvSIMFiNQ0HLuhlfvGLRiicKQGs6sh7gKAlXZXQFQ4KE3E0Eesf7LmJHFJ5ssY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9sl8BmWT2onBt3lnH7pgsS/WJFvmeW+Vp9zfWQqwagv8HNOUs
	O1T+N2DFh/yzIr0WmSEvYvtJlRrx8HL3JPkotyiQKEF6238LOfK4boA1F2dvgIyRrd8=
X-Gm-Gg: ASbGncvjJy8wgO0r2ADDP4I4PPqJfKnFlGDt6Jo9CNfOE8HWOI8tFygh7SuLPPGBEKb
	XVFLWX4FYEozs44Caw6EVHW2B0TEEEdrKU+6wfUHwDoimraKU1UyM3qN6y6YEOrLRFQcgoUQtpp
	dfCsIZPAhwpLmz+bNSwjWHaIfI2uKpU154ETEkNEkhXTzVTcdhaaXymHzc1WplwvLld97zaXaiy
	Vmww228rI5OY6xkSaXR31V6uP8NEWaTu5SLwyOuoWtGa5XyJPvjh60MHVE+hJH2qhbWO5XPlwIM
	vMlY5gRVpmNcBvh+sfRaFdZrkToD5vOVnZKqR5HLawqy81PF/wVmpb+XPy9HfA3J2L2hb5phxT4
	KffVnhcdUA+y72KJvFi6HWA==
X-Google-Smtp-Source: AGHT+IGVz4lZI380iOeZ0sAk76r1bOVlu9hZAX/4jbO1OiKLTkmzMHxAI8gYVfXoqODUDof6526HpQ==
X-Received: by 2002:a17:907:60d2:b0:ada:99ed:67a3 with SMTP id a640c23a62f3a-ada99ed7fd1mr251769666b.27.1748526568650;
        Thu, 29 May 2025 06:49:28 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2e220548sm26619966b.109.2025.05.29.06.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:28 -0700 (PDT)
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
Subject: [PATCH v12 11/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 15:50:48 +0200
Message-ID: <20250529135052.28398-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
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


