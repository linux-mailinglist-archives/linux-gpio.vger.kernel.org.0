Return-Path: <linux-gpio+bounces-8874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0C9589C2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 16:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23522B224F3
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 14:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F70198840;
	Tue, 20 Aug 2024 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YSLifkqK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD401194C91
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724164591; cv=none; b=lpiMWdca/SLcm0mXpdTBxSdyiRVoDvxmbcvn1kusJHqFfzG3SyWa4177zMswypjQcRaCXIaj/SyOeivN2fi2Sx5zxCyU/DtzTvkV2Sv3b8W2vqHQO7v+iFqfRxywdwkKp5BAtqrg9+XON1QjYTqU4zRwCcXH6jYGCFVtpANsnGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724164591; c=relaxed/simple;
	bh=rqRJWAybH0BXIttqUWZDoJAhQfObjtFcdpdNsbc6tZ4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpjg65HTxgxopEfUpCFxtJH6pjBZfiFaJW3fGvtjo2meecbfbrrqjM+9CrWxt9T9Bkd1q7FzzgyH6P3RR0cr2oWc6ayZuD+eIFJn1tSGbC3AKN4HpiF1vxPNFGqfjmIXzrP13w+sfT72iikapZWskVyceVNqlijpzUf+IsSn5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YSLifkqK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8657900fc1so64300766b.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724164585; x=1724769385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2Xgg30vYhCxJ1eXmEmY/H80RrAwzg/J7u+AAMEQheA=;
        b=YSLifkqKVWA/KeHBbfhq2pmwmCTWDyKL5wW3WBSQ2dQMOmWS34QncqhmMKat7cxWd9
         5/WCyReOBCqMDfnPs1hzQU9k3ddmOp8Nerb+y6IJr2CbettwzfbSdC41Hr8/lr7isGgK
         DtdVWqy/YG/UGMMbAzEbVEZFhmfm5KEQfkjQydFQOMBRWPgqA9eNuXU94lX1lUoFnN+5
         KUhjbVHCNHCquCMJ+AjDGlKGdBrxbQVyHXbc2gdtkWiyH0GsiXwSgBj6lqbvXc9uLiD9
         bMyIx0hMoAlez93553EMQ2emwSLH+zk81fj/0Pv0hNb6gIdiNIlhU3jLkwBcyRXWhi3k
         Qrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164585; x=1724769385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2Xgg30vYhCxJ1eXmEmY/H80RrAwzg/J7u+AAMEQheA=;
        b=T07O87dcfUURBdvFthnH1oCEO2H1zu03KXSJTzzxo+1aFXyvucTAOnR5/vGNTZ02Qo
         yKanZ2ExLPV6KqE4i+DAwFth3xaEFeEClklwX+J4nYCUn9KU1Q9lS14ajw0fcjba5jhJ
         D0E0NJGfyMrku2g9LUsj9yciKKGNK/sMPkRm5TnfLVKHXW/mkv66rDxy8n+uVUU650nF
         dHh9IX46VZKYIWFzCqnhVpv+EJ2LzwerBOCzrctkGVOs17a8aKOYrKAauSIA+tMENuA/
         iuvmQHOHprqKpXxvzESSyMDrSJ3gE/zBV2faA+OLRfdTskV9SV4Op/GhdO/PM70lEDmg
         fjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoF632mb7ib/OcJhL7micIw7eqeDwJT4UIItHmQ334ugMCHcG3FgK6O4UxHMAwV+52haE8KR7jBEvI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Bytv4DSqpKbGJW5jAPv5q4Zu64LgrjU52Eaz7Eig5G4ORGpL
	fHUz7JV3V+Sp7LMIJuAaLBx1e7FUdr33ZRYIcZ6H3+/otxhOXkqlcsM+ZghTib8=
X-Google-Smtp-Source: AGHT+IHHwb3kDEyWmIFiefIJfKoeZp5N9YbDUkPf5M8lEPY+UbF5lCIpL7IY1EOzpJk/o4jN7+373w==
X-Received: by 2002:a17:907:f164:b0:a77:dbf0:d22 with SMTP id a640c23a62f3a-a8392a4b5e8mr1083160066b.65.1724164584705;
        Tue, 20 Aug 2024 07:36:24 -0700 (PDT)
Received: from localhost ([87.13.33.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfb18sm771023766b.60.2024.08.20.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:36:24 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 11/11] arm64: dts: rp1: Add support for MACB contained in RP1
Date: Tue, 20 Aug 2024 16:36:13 +0200
Message-ID: <a3fde99c2e522ef1fbf4e4bb125bc1d97a715eaf.1724159867.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724159867.git.andrea.porta@suse.com>
References: <cover.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RaspberryPi RP1 is multi function PCI endpoint device that
exposes several subperipherals via PCI BAR.
Add an ethernet node for Cadence MACB to the RP1 dtso

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/rp1.dtso | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
index d80178a278ee..b40e203c28d5 100644
--- a/arch/arm64/boot/dts/broadcom/rp1.dtso
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -78,6 +78,29 @@ rp1_clocks: clocks@c040018000 {
 							       <50000000>;   // RP1_CLK_ETH_TSU
 				};
 
+				rp1_eth: ethernet@c040100000 {
+					reg = <0xc0 0x40100000  0x0 0x4000>;
+					compatible = "cdns,macb";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					interrupts = <RP1_INT_ETH IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&macb_pclk &macb_hclk &rp1_clocks RP1_CLK_ETH_TSU>;
+					clock-names = "pclk", "hclk", "tsu_clk";
+					phy-mode = "rgmii-id";
+					cdns,aw2w-max-pipe = /bits/ 8 <8>;
+					cdns,ar2r-max-pipe = /bits/ 8 <8>;
+					cdns,use-aw2b-fill;
+					local-mac-address = [00 00 00 00 00 00];
+					phy-handle = <&phy1>;
+					phy-reset-gpios = <&rp1_gpio 32 GPIO_ACTIVE_LOW>;
+					phy-reset-duration = <5>;
+
+					phy1: ethernet-phy@1 {
+						reg = <0x1>;
+						brcm,powerdown-enable;
+					};
+				};
+
 				rp1_gpio: pinctrl@c0400d0000 {
 					reg = <0xc0 0x400d0000  0x0 0xc000>,
 					      <0xc0 0x400e0000  0x0 0xc000>,
-- 
2.35.3


