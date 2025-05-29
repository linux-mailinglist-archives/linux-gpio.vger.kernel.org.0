Return-Path: <linux-gpio+bounces-20722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5EBAC7CC8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F6F0A4088B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 11:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC2728E5F9;
	Thu, 29 May 2025 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K50Z0Xg+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36BD28F520
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517750; cv=none; b=kWTmLY/g2zomuM7LyEzd/Cfy3qfEsb/o8zTmjD/tGbdmAHnaZ6IXI0zqJ5je4hz+05XGPNioyGUq13pX5b2a9NB/fvOgUtRuNjtm7zPFRr/RDOM0C+4Bn3tmPA6/NZyT7SGRrLED1SHz1EzxrCu/23MGrTdKlMe9mlmLPaRaZ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517750; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwhr0z3dnqE9b9XMQOUEqYoOYvp2q3DYwJZfeGx24z04gfoMHK442q49bYMtJNd/pdfCeDImClzM/54gYPsM6N0fmPM2ziJl6n2wnwhoaphXMOyrD2u0RyeOqXnHeS7E2Rk1RZA9w4Batf5dv2LYHlBgsHGS30TROGQz25/QQzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K50Z0Xg+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad89ee255easo132408766b.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517745; x=1749122545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=K50Z0Xg+CHM2azmv0AFN7GhTqb09V8EyWuKTbfFTAbgY77+iX3AaibJ/06OPuJ8eYZ
         8RXIlaujA6ssulfUpZhs1IRsmjgRZyW+m9ohE1XlL6b30Mh9jtXr0xEx9IaVHscg3tHd
         3jZzxzkqycyvEtk+hVW2g8NRwjOTZMYDhiF3IzCk7USbCD1rjoO3PvPzCx6ygXbK5ect
         ifC09+Jv9YH1gJUFxQ/W+Q+1HzN0ox96rdRbH4ntyjzJOt4MGFKzSui5JFKclIIM/u1o
         ajLUaUl9sy5UqsrVLpmvZgJ5zc1fl/CXBa4eZLg2Aoh2jIKqetkHEtI0Lumq248aPgJG
         Gg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517745; x=1749122545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=Bt9yC8YjNaoIDjPy2LVot7QpiU55lWKZfDMnlAqk36KNN5+eWp8VqG9J9o3jrJ5Uv0
         zlU3gOLnClV8kkWGzrZol0HlM5EakPCG9BvyUiExs/JvylNIaHznod5EscsFjSJsECCx
         gIj/nSk1cX2WiYm7t6nF0txsvvSmYizPTMk4mtWavBIGZ+4+oP55YFz/wFqCluW1DyRM
         QoDI1CYme+kLmE+cfzZVMyTbck1Cnvz2yspBTY0VaKy6Q5fbkYXdwLYp/FT0fDu4TBeX
         oFHXCoSgEixSq3cZ+Ba8x68isR5N0Ur+DWfvu139SI3bLSjRlLLhT+VekYLvJhJkzVsI
         GgOA==
X-Forwarded-Encrypted: i=1; AJvYcCWKM69BU/3bnjO5qJkER0BcmZQSwKkXYRD5omYWqqx4jvMmHD562FZQ+r3T+4sJQ57rgxJbjMK2JuqH@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6uJd1wHv7ay8MCegIGeLBFdPqo0/e6ndFOuL/XR2+oD6CCU7
	DYgg6nHgLnvuUT92XO6lNHyTo6dbAga+9xx6STl08NZwcTCaYOQJdOIB8PyC0P6jI9U=
X-Gm-Gg: ASbGncuCB2siZJHAAcWCuy15yWzHNcs3VvHAE95tQWYNmBHWVfrj6PWPILBo4G9Tb1G
	/A9hOeomd+FvavFHiQYqpiDrvs/sioARFZdd+932pIdUD/5AT9yW2s1Uy4cap9H9RNX5MrfPvQY
	nxW1akrrTWCw6r0xyXVKIScZKIjjntuhjzjRlJElmmFJjrfyFmQ1pn54hG9iOLXKPNhUdBSx7vv
	/uwn4bl6x1v1KkZNNfYUdB0boTY/0drw4vueCLQaTVj5iXBXe0v46ThjptodQuaHYtXnuKOQB+9
	WgpcCfcB71ekCj8obfkA2sWkOXoAHieBTM5LQ+VR5/6ivZwHzq8trZgdEo8LrXytmTydIqMyDz5
	uNbNMc6O2gMM3NkVqaADUVA==
X-Google-Smtp-Source: AGHT+IFK5HrO5YRWLbTpI1CNg/Y9fsCVsm6BLAVkF3nAzCYZI0eN92baPbfeXmfhmf7aUJkZcUs+uw==
X-Received: by 2002:a17:907:9806:b0:ad2:2146:3b89 with SMTP id a640c23a62f3a-ad85b185b5fmr1536323266b.47.1748517744799;
        Thu, 29 May 2025 04:22:24 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2befaesm125684166b.104.2025.05.29.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:24 -0700 (PDT)
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
Subject: [PATCH v10 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 13:23:43 +0200
Message-ID: <20250529112357.24182-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index fbc56309660f..1850a575e708 100644
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


