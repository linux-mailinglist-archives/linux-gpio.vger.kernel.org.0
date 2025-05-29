Return-Path: <linux-gpio+bounces-20757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5AAC7F34
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE941BC6E8A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25E5230274;
	Thu, 29 May 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JGjzvJw3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BEE22DA07
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526573; cv=none; b=jQUqnTY703NwXm6ax+iETB4f0yqRo7L3hWPePbtuZZeS9lr9/2w9XWw0nD2uks8W/PuxSh298P+EFygdSdr2I6qpKia3Tg20pJ8bFzWNUc59q8cHEnOo2k1q5qtM0qoWdisQ9mmiQF8K1pyNif4I478dxbrFc5i6dtlxeWiIdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526573; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqWtVNyLRHlfyQNsGT90HsSy9p7/0Mg7DGnSi9+jUXaNYdacaeqA8XQgn1BpLErLNxknyFFNsyBaqzT3BA7dHld+qeDJizvJOsQGqoXhWeKfRpQuCPmaA554/FAt2gt7SaoKd/pL2UAXll+DJYhUiEUVeWRFFZ7t2BSF3i9ne94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JGjzvJw3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad89f9bb725so179173366b.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526568; x=1749131368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=JGjzvJw3+nuRvpt2PfYG+hCuvGaJQpoUMQvBk8zQGAt5ZiRT6sQm/pbVGdcQVXaHQi
         hl9APZs7Hef6GfDgGRota/TXN+9Ew0QgJJ/0/NSKPZgWWYw5D6JGitDNogdcwn5GZtvN
         eLBEwfDOmdWAm5ZJUfZ7hQkGVIJLQfJXTs3dFbwYYssueJ5HsfISb6rfgbgshAN/6Q+x
         +FcvsmUYltKuO92HHX4J7PImES33JEiQTAXK8G27xaOBT6qnsWPW2YBFNPr+GEV0eoNW
         n636Rv4iPh5ipC7kjzMygqVk3FnrS/AZ1xbD2taU02kVvOZVP5eDEtgkAPsqyxbzWnSc
         NHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526568; x=1749131368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=cNKJPo4siuhUY81wDeWe2S+U3qoc2hJg0zaMIxiYtjXDJmM8fWyGhAkagF/V89rXaa
         aFpnKQ0hSKwqeke3dUE6OSt2tUIKTRXuwhEBL4ZqP13gcNb1LkaNKmJc9ew2ozeThl9E
         0QqC9NWoQS28lXVO7B7arQvGcpQf/M2Td1DYbNKgJZEX2B5A6DVJp6aGVmfaM9/68/af
         fLHJRYO90JoPSM287rlDxYRiiM/y1yiHYXzQrZC/nuhGP4tO3wUgMJA2pS3JgmAcXisy
         vH6dLaV3JbFWOaBQWMNFGr7AzxJkHRKQtHctR7/I+wbOa6lsDbfKPvbytzXHBJDs8x0v
         2m3A==
X-Forwarded-Encrypted: i=1; AJvYcCXEUw8gSSrB+3C3RcWA0FR+p3m8PhjuNxhmkcCR1EErKlVdTDyMeHGhrcKiH3PHFK1BoasnMVLgvNuh@vger.kernel.org
X-Gm-Message-State: AOJu0YzIe/dLOOCIUiGUv64SEhA3enVDDpBTV2du4YiJYypVVTmfWP+l
	xGJLUesx74Xf4NqdeIxHY9Vu/zX+LvtT/Zo+JQx6VgvMQPvDIX9hqKXib16Hc/CH6Dc=
X-Gm-Gg: ASbGncvUnyLlVM0KdMWSJLy3g9pNNihcjdEmn3HBUNMSqF4GWEqSoQttUmOjuays65Z
	JNd9beBKLwWpGTOqXBhPso9ZcbwPDVMuE1D1x08wM0ggo0h2hkZNtQ5G1JMW6zyN8SYVwrT2MMs
	BZ/RFCv78BFoX/ORF9BBwzMagUBxTqH1g91IH3IIIq/9lYSzUXqJgMWcMD48wuKaTTkcyi8cD5t
	1U6PKxcAFxsFqmaM9m83sqONCXfXc4SHqjwCG5iDK+4VUZTNnPAjU8A4hNd8goA5Y2DJJBd4K4g
	ekgj7JBAj57ixmTRc+K10qUUTvGg4Dymt6sjmtvm6Hf6PyKj2NwfA+JED8f+2fuSkM+iCV6yiMh
	LvrxLhEZewEw1V58WgIy+9Q==
X-Google-Smtp-Source: AGHT+IHauMo4PO8x+p2QJnQMGgglReuXaviinUw97Q2Scu+s04RkVaYUYy8ri/br/b6wUWptGayevA==
X-Received: by 2002:a17:907:3f9f:b0:ad8:9c97:c2da with SMTP id a640c23a62f3a-ad89c97c73bmr736928566b.40.1748526567679;
        Thu, 29 May 2025 06:49:27 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e88csm149038466b.62.2025.05.29.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:27 -0700 (PDT)
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
Subject: [PATCH v12 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 15:50:47 +0200
Message-ID: <20250529135052.28398-10-andrea.porta@suse.com>
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


