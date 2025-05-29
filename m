Return-Path: <linux-gpio+bounces-20740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A418AC7E02
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 14:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46FA11BC5E5A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 12:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001E722D7A1;
	Thu, 29 May 2025 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZvntV0qa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FC224AFE
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522567; cv=none; b=kR34hHXQUcBvGp8wMn7iPURRKNWMnmd5G6NPjQXwy1vzgl4EiatJ1j2Fb4ZYB8cSok3HU+SvGd6RphKm5mVxDL93JJ5fwDD+VqdBYwvnXzNX8vyLPB0VPdcqE/e9MYg2LRxYWD7nBOVch6/J8C/FmO2bUWysQmEsV4sKY/nM+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522567; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GelHgrKLA2e7lufPcdNL4i+Xu30tLqu5S81VyVPPNWEQy6Vm2r7dxGoVgR3NblQWy/KMp2nqt3AL1ydFnE23Iv3vTTNojQVlHjt9zrNAnq+9CZzbBOJxnfFOVKDIqVDmF4pQ90rr4W1glPBJajmsu2ArfeA8u+wa+28AuJ8KfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZvntV0qa; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60477f1a044so1362264a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522562; x=1749127362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=ZvntV0qa0UsTFoAE+fQinBri4B3PW7NYJQB9Xf2DxM+0hBjxStavSqh+QnZ9w1Q5BS
         OpylNLrArCPZVYxGkfIq/8Cty7vy4NfKt20U9dekpavkHN/WwvIeai+KB3mST4CpGwJA
         l6fwg+wIIbV0bdTNxOIl1nhFnAzWPo3gFMV8fO0OdgFXe5ERnCm3y86csky+hHWjKx/5
         3rqFWb1xwpoDTw7ecT8XH4eD7j4AkS6f0VF2ghXYG/ei9nu7wEJI0PDUEGQuTaR4tkzo
         YeAsV8DCJCn8RIziMhwD9tlSSSlKyx6heaXECaWpy3iIp6+T3s9F7Zvv13kIfA/9iMdr
         WEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522562; x=1749127362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=dAX+5vwct/EGkgeMYlRl8hBCIAAOdKBd7boH1EkT03xOR3tOY25PzNZuN8DNZbUmzw
         hgTMuT9EJWwOP/MKjoa8hmrA4LS0t4JLgj01T94jJZTQ3f6bEl0217lhsBh+9W0Q8ZDD
         QRz3iN97qTMJiq7O3H1A/qPwxr20tBzQo/vfX1fXAPywQslB9RMDGEqkRRbiDsee/gZm
         DcE+Fissr/ynkEGy289fM4tAJsLH8bO6VPo4Sn+fPueJt3wX9XDk8YjL6AywWbc/U+ix
         uCnwbLuPAN6whYJg6vqY1lpwUJ92DdymkR3mXwhGxD/xn0TUg1cjlTcLMs4c93mWBluh
         hhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCURm8QSd/lq72vPEo9lMiDReTb3CVoVpAUdfqxHMalR9H94qvc+jbcPJISLHoMkQaLSjXn6FUdOwhPS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3SdcZPq2EWh0puI3DuZPcJsUy4st3bcPPKUy8zSgK+1h3Yfz9
	+7V/WCLZIcP8hn/XvpidcwBQUUoTy0tX5cVNrcO+tu+JiH1I4Q9f9KxV1QOBvPROPoA=
X-Gm-Gg: ASbGncuNZOe77czYUdODLqYajY1QEkiF9mJWhAoB1W29v5HBnaHZKAQja4tS4IAbRFk
	s3dESgFNoPZJq85cLY2CJSp+rlMw2PBU4raYLuA9NjPWt57Ca2Pl4MBOptFZYWZAiawiS9eWYcD
	sAXoNFOhptf/U24whOo8eHcn+k/L4JZTOTtBtvdh90cCrz2ny7tlTBgv9yR54AZh7rc0FzA52LQ
	1ehT3SSLJ4ALbL1Tt8yHzciAEFuopAmcWHw7zKFCXnC+7O9evOKc5Wc8oRPUUKQZut7YTXQs00i
	FkLAQaDHX494ZeLNkU1Z3M6IjtTV587K6lat0a1JTNHHlvDpUA5c7cmExV8TtUVwSpeC7ll5oXQ
	t/ir/Aq+gOUZq4qIF1ePQ0XzTfA5jeOf1
X-Google-Smtp-Source: AGHT+IGNiDnmL33gl89vnGs+/ABlMcodAbvG3T1PvC7+mWmEo5zj5kUpEb/gkX3S1G8x/gUNclU3eQ==
X-Received: by 2002:a17:906:6a10:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ad8a935c9b6mr486027666b.31.1748522561822;
        Thu, 29 May 2025 05:42:41 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd04579sm134495166b.87.2025.05.29.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:41 -0700 (PDT)
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
Subject: [PATCH v11 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 14:43:59 +0200
Message-ID: <20250529124412.26311-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 031875a277d7..83d45afc6588 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,7 +14,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3


