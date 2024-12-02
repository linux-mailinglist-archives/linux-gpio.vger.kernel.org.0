Return-Path: <linux-gpio+bounces-13396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D649E0075
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C3D282DFF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB6D205AC4;
	Mon,  2 Dec 2024 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NCFyGBHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3A2040AE
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138360; cv=none; b=DqcpF+jtrabjwQ1kCSBwFBSzjC9h+jQzQO7KW37tcYVKXWy9AZkXeCC8YCy4d8FWbTdB2u3JqoRSQO/RrAgcDCIzKNcIytY9/LmSbcxQuzsk1M7vTNLIHxwdBMh/nwSnAuhgzfCUFloNy0jtsgxT3bI0WmXEwq3yAhMqcklWqwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138360; c=relaxed/simple;
	bh=5wKv3990qTqArMWxDC8JoNsA96O0HLgsLUAOsCHU91I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQHKfXR+zFui5QHnf/AbXTmHrHqxcKSCY8nUE0CakXBYIPv2hbqSY/JJPYRiv/9Yzgan9h5XcldlyP00XSHcVm9rSpzdrLT3BnIGEPNT09ViBI/I3FfokXKthiSl/qQnlNzeDKFUGohsAX1Ch3morvC2sct4w38jhWQvJfJKoJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NCFyGBHm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so4896160a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138354; x=1733743154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=NCFyGBHmPbQC4JUKeBrMhZOaLAN/tRkmQEf4rq9AA0EF05KaaLWXSJA5PNxHJGfzMZ
         oM7omQU6QTQ4yBVY+t3BXoO6Xeb2/HyTV6tIFBwuPX7LyZdjYBfTBMMgTcYffpBmLW1Y
         bdsKZm+f5kmiqZx9zR2ws2rnoDDRQlsut4UD54zNmnYrN4ZnYIxwUyuvEg4/ph4L1kyp
         LFFGo6LdYu2ihJFSYeGLmprgVyIlBOcQPVbaPsRdS9dMAmltZ32VGjLPVg9+e4pnUFFK
         XEv0jGt4Ou99JJWeJfp1a4F47uP6FuHwXzqD+gkEDtEciLESka60XQ46nhpuADsFqjDC
         df8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138354; x=1733743154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=rZAUYLgSi9iir8L+naEqyImp4XUI4YoG9pOb7n0o52gDFTuplq9+DJfm3Dgs9NAOX2
         JZU1Db1CiqqU/HOmM2eh0hHbvG8lQlMuzkFGfEQzipfHOlZ2+qgj6DN4Ks6+3HIHf9Ml
         7/BeYnA0zf7/xn2fq1Z/qfJXM6+wO90hZDd9k2OAmS29s/x463eJvS1jsvmPeBlUyFZ8
         /nHG4SoA4AYF6jvQrBpIEmKCqq7XVvbOmxHpsmPv9N5i8QpHEh3Pr1fEuz6FYyW1wYBX
         cAPqjKKYxStavt4vmq3c2p/ZevitbeThRdLPIUo4Ik0gp5ufqqZ4UINfV+jEHWySP7pp
         95XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPx4WxwOg5sMkLcPClv27i8oJWx+Dk6EXNVIcOw3e13gjJZk3zxuh6GvMrbm8G8OLudXWKRaqW4ZIU@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCV+zNOMN7L4rz0UjK+KAo7UKtA+/0HePssgjSzX6K+UzPC1I
	0PVHUMoW5ygv1Pjnu0ILqiuOVq6/aszHvjqwaBXRMazpmlXXUY5B0gCtvpn200c=
X-Gm-Gg: ASbGncv6kmn6Lnd0gDbSjWlQ9pa8VgcOxOV1HxPAUO8Dss4yQFTCv4zPJ8NBmHuOw6p
	URI0NavUKv4TPYOHQQzGarHcPQGF/HHPTkRO4EtaF8xE/MvmM5o7tF2wv22lXZriqPKoCY+/aEq
	lBYtQYHLP12rXRMskmOWDbV8p8c25C315UegFgbsEc/FdFvtMkSZYBp/LM670OJJqx++jgfVAQS
	rMNia+HrsMWNchfgRBFxhkfjXgMKmRZ4abOcD/sAFR42d3g4MkC88oL6kfpJ2Y9TNm0Fg2ASfNi
	ZviEdeS1SSmFIMiyKMtE
X-Google-Smtp-Source: AGHT+IHeFnhQVvvNV6Unz5SbIu5RmIoxGk3I5zBFBtPc8jG8aJ1mwarpKQV7x9LB7y94ybUWdyYebQ==
X-Received: by 2002:a05:6402:5206:b0:5d0:f088:c675 with SMTP id 4fb4d7f45d1cf-5d0f088cc59mr2379116a12.21.1733138353742;
        Mon, 02 Dec 2024 03:19:13 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0e1b6903esm1763679a12.19.2024.12.02.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:13 -0800 (PST)
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
Subject: [PATCH v5 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon,  2 Dec 2024 12:19:33 +0100
Message-ID: <8b4dda91fae156a7f28f2807cd6d64ac2ec07dd7.1733136811.git.andrea.porta@suse.com>
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2bdbb6780242..ae3c0c153cea 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,13 @@ chosen: chosen {
 		stdout-path = "serial10:115200n8";
 	};
 
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
 	/* Will be filled by the bootloader */
 	memory@0 {
 		device_type = "memory";
-- 
2.35.3


