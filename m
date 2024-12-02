Return-Path: <linux-gpio+bounces-13397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1B9E007F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C076162517
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F45D205AD4;
	Mon,  2 Dec 2024 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TRUClMXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0582040BD
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138361; cv=none; b=Rilo/A+eJ7t4jBakLwLFCA4681yM9ZX5AWTnUp7vclReLGfu0ucw7eHv+pl95K+fEvF10IDXGHaG8nWdGULsy00oWO0l1zzr9mXRCroetSNFzHDVJ3BnOEyJPAkoyMIPo9AS7Nd7PqrPjs46RQxtCoe8S8RGYJotDWNaSeyACik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138361; c=relaxed/simple;
	bh=QMBFXNqBpFgYP2yitTOgzdsfZItshvzAST6FqjQRjNM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq1Mgqg/g5T520U0vrUXygfHHsYEURkNcvDpaMNqgHhs0Ndpj/tl+YNTueSYMazSr/m0hZVU513lMBB+1k6vFv3fMiSt145swaayg70XDd1GBveVBOMZ5iSmfc+02W/vKyY3E+gFLdEYm9aEgQX8Kdw/jwpos4cBW5QYddCuIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TRUClMXb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d0d3dd3097so2583220a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138355; x=1733743155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=TRUClMXbT/BkEMucbnwqj8OcamE/lxRppa4P432szv42fzZY4uemRAU6iOZ7lsvAc/
         fwPFwx1PMfCtYKXQ8kfySDfXiki98a6L7hP2mDvg6NYBTSK92eHCHTkM5/dxnsxhnDVh
         9czhw0Zfjc9gR7ITOO3D8PJRVXyqkCwRu6VBq3gKr4fkkTBa4pc7n1W7bWHGio2Gco/l
         4cnH37V3kw8znEEAlmF3wv2i8gTG06ijbVp8lk3WHkawjM7ibZTM3dLei6KNr/FlPGx5
         jlA7CO0nA7UDUIr87WQu1nuM5wSUEZQ828yYv958AZPjqFj8pdzljNItiO9x4OfVCUgK
         fHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138355; x=1733743155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=mzJG2L//R1xc365QZcoLXZ9unWaQn7EP9Tb9ppDV+LOdtJi4KNWEZpe3q+Ro7xX0Rx
         gJri7gcW0WMyWXJX5tBskwjZ0eM/1UdjxdfW+qtfuekTFFVUCLyYh/sVDTypQAQAfobP
         VHoDjvN6wNijg+QbPvMLefQeLK89UWPyF/KeJkkyjXiett/JFXR6x/qjqAFlGD8uPcqr
         kO1zBngnvbdJ9AQP6ekfMr44Tu7grs32HMMOH4NtdrBxlH7tAm5yY4bxtLRkkhP10fkK
         yPE+FeO1N0k/TV4BomJ5+jdybH8VJMM3BKQfQyzPWHObAT7YZ1pjL3tlgE97d9u1Xr+f
         1/MA==
X-Forwarded-Encrypted: i=1; AJvYcCWlA6LfmzmqmdUzZme719phW3nsAE8Wh3O183u2ZHj3iGaASQZJIKiGy7n338SvntmS6hoNO8G/Kzbk@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJ4HXrGUz8BdRz2GdIzLzqNzfpfXpZ2H3+Uinkf55KzfHiFvY
	YH7g9/jU7XfqIMzyqJuuxg0bIOeIGYZg9I6MiW73d4SHGPWHHP7n3ZLppy6Qo0Q=
X-Gm-Gg: ASbGnctASwUDQgcI1m2RHRuoM1IskP46Ig6rNL7UpPewrnwdfOkWjUFx614tRe1rOyE
	WdSpI4J+ebYBvfkCpOst6ZaILxRpjZr12mIooRVIZmCdiWnw3Eoyo1yJZWtael0Am+AoHLoAidy
	cqheQ26mJqB/kaIeVliycz2TSUKDbsj/X7kAR7jlOULbhLFPoa4Iqu/9T63ZGHeAyCb+Y+1zRDp
	GTRmQwQ/x5Lx2Z1/+sIgTvDFYfK9BrbSEWuchGGs3cqRr6zrkf2IYsec6ps4TlYV6jeFugoPltM
	ZQKi99FMHLLGpgk0i6bk
X-Google-Smtp-Source: AGHT+IEh8VAXDJC3bTBBrwDpqq8+bh66QBF8HuQqB3DA5Y6Ne4IKysOOgMjNIKrVqzCRG1epx5t5JQ==
X-Received: by 2002:a05:6402:3484:b0:5d0:904f:710b with SMTP id 4fb4d7f45d1cf-5d0904f726amr20592659a12.34.1733138354832;
        Mon, 02 Dec 2024 03:19:14 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0d2f0652bsm2371980a12.25.2024.12.02.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:14 -0800 (PST)
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
Subject: [PATCH v5 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Mon,  2 Dec 2024 12:19:34 +0100
Message-ID: <2dc27b08d82e5257a831026c963ac148d11cb6e8.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
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
index c62831e61586..91b39026dc56 100644
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
@@ -690,6 +691,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1272,6 +1274,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


