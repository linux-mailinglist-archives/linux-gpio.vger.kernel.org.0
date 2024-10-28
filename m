Return-Path: <linux-gpio+bounces-12252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799DF9B32D1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33DC42821EA
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CF21DEFF8;
	Mon, 28 Oct 2024 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OAydYTtx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2E1DE2AA
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124456; cv=none; b=MgxdF8MtfsZAZUxvxTpySq1fNoVmVdRuqUhqUH+YV9ErKC/I8vlCVFJcWIRZj7Cw0TzZ6KJXN4eEW4CwdaF+azsLlOVOzsXH/Wa0d2JsIdIlqC5o6UMf8/YwqfAbLOUhxDa4bTqG2Ek0GOQZqIKpcShmbf3E+qUUlQuMU3iFGaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124456; c=relaxed/simple;
	bh=mkLhLwSMHZ/hO35qXKlv3paIFazWoum0UehyHiC/QB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=To0OXzROSyinnfGdljb4kHdhTqkMjpPn4u4DADI4C6NAs+Plr4nn/Nr4wEHt1SbvUtvAdedg3JkSh5HMB7a99/3AWvIAyPNTIf+bxzGzXWeT2SxQDFlr18bhgliFnlapZ47lVe5pfc6J4slCsiKBgc9Ohj57nUCwysZkUnxEuaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OAydYTtx; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a68480164so603345166b.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124449; x=1730729249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxqlkITvdCM/QWIQix/9plieOyS0wK2Vm/r1GXcM7hA=;
        b=OAydYTtxT6dF0EJD6oJ2Gfci6sL/wr3lJitPSXu3cOeLjqixfX2bMIw3u6T6bVOdkc
         IXzif3HHy8MK82ptdUmZUBQftf1Mpr9y207rjJTvxzYGXHaSUmA3/4b7S24lVWGwq1Z4
         gB+dNI94oZMOz2hvgNStNuzB1Il5SvO0jQFKrprX7BGZSZcTnfcp6wdLnB0tmbTMNK3H
         MYEFi2fJPlG+RY3tMmKoiWteE87gUntHgMGnTLXL/SwCFAeiOTFSXhxN0pm4I/LqlNws
         Er6+pC7IHlzpMxvrDdSVRg858gOWkr8ZfkrWTuxG0Dg3p7xkDd2Lni9rnypPFNe8tLNd
         nZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124449; x=1730729249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxqlkITvdCM/QWIQix/9plieOyS0wK2Vm/r1GXcM7hA=;
        b=Wf8T30LUagGHKb9Q3u9/inKKSO1hhumnHCk+KXTcaRaRinjNQKAXPXoIklmeW8b4AP
         2JsAAzHjW9zybE4UV0enjq4pIBICKgfse6Q4VjH2FMt+MptJxj1OHoA2VSBz5RzC2u+O
         s58O9daD++B3lcYmpGI8rpEUqSC0rTU80ybOc1j6o2rXrxUYNM+aiPOc6xhZxm6zoyF8
         6eicrbO6/fOA0rpfKsjpFRHu13kSclLp5ErHufAfn976MpaP3arxmNZ2AmazckmI1zGo
         58s8MdTa3eTqIaFSIP8q88EIsVyt4yOg1DYb1r4RiJsJTJ5hZq2VlxR8H5Qt2yIN0LYG
         8TeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYqs7q6NnGJH/Nx+bY6wnmM/fXEejBeB3/27feX9sNQ6uPZW4bwj57w2LqFaMww3H3xVQk17CnEG7H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz276guwgBgcZalvVrkllxXA2+dxKML67Ds5VSTkXwFI9NGQ16Y
	8k2UWLKxTr5R8mGIxPe/KyrhByo8J4U4+IEavLdrIwlwNqXLiSg3HjmE9ba63Tk=
X-Google-Smtp-Source: AGHT+IGqxvdjrDjtQcNnn4jWGuT849mWymPdjWEdlc16+0LL2sooJ9QKroNYPN94MhkXvqI/l5IquA==
X-Received: by 2002:a17:907:970a:b0:a9a:4a:284a with SMTP id a640c23a62f3a-a9de5d8690amr826616066b.26.1730124449033;
        Mon, 28 Oct 2024 07:07:29 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297a9csm374074266b.126.2024.10.28.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:28 -0700 (PDT)
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
Subject: [PATCH v3 12/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Mon, 28 Oct 2024 15:07:29 +0100
Message-ID: <53f9c2cc91403070475ce01e2f1491e09abea72e.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
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
index 5fdbfea7a5b2..5fcd9ae0d373 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=y
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


