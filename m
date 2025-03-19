Return-Path: <linux-gpio+bounces-17799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C82A69B6B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 22:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDF9D7B02A8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 21:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547FD22068B;
	Wed, 19 Mar 2025 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MGJ1OZhB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040621CFFD
	for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2025 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421101; cv=none; b=NFbAjAGea4JW+U2q2Kxlra9d4FmsnhMSP25miE4Dv6+8w1YRFrPmnsXD84rsdTWTkfrmpkC7XMkIP5jDoKOjcV3B2Ajy9YyXUm8mwt8y42stgLTDN9I3n7uY1SgGsHuJVJuTlg0vvU2OwIDcN/yLEuede+25eDS7wF3ErONz6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421101; c=relaxed/simple;
	bh=omYUJp4mgEUXzyiZYK7c3kt1jhwp49oxdlzadmbl9Ws=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3W573VN8xgxa2DbFg8fx3b/X3NzpjTE3cyG+1cbVqpiM7lfAFiAxQHEk8E/BXFkHp33XSJcCMEUG191MjuezYEIvduQD4Ehd3CwhTs18tC/80XeuDsHw1b7m25U+T7USL4Hw4I5LYyTzO9qWR+P+d28Go71KeCa5rH+OHZWUYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MGJ1OZhB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbb12bea54so36455166b.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2025 14:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421095; x=1743025895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2XvbyDVSJskBo7PBHWzTkL+z4Zi7bc7qcFOJ/Riokw=;
        b=MGJ1OZhBEwNhSK+eY1FISpuYIl7v8hA89ECiStjjhiMlNpb+++4w4/qeIFYXZIP7ph
         EH6WdLF+Dw2GjZRknbOM6M1lTsrFonpndhJPx/wmiMaKqh+xWCqJrzGRMHVcjNWAoufw
         hp6DvbibyITFDEx+2buM4DTcWumR4IJ0hYqHVnvatpSAgResbHp1xfpV/sZA0ouPP+qQ
         zuVm6C0Rr6+TT6wZ7eoSVa+HnG7+LySWgWJOT629idvIz2bCDrO43mKHtrXwf8fQpPcN
         8joJlMrM/PuthfJgb/1J/JW0eEQcOZ9moW/q2Vpo78Z8KB+3wPylp6aBHMYjO/1lnn3+
         hrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421095; x=1743025895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2XvbyDVSJskBo7PBHWzTkL+z4Zi7bc7qcFOJ/Riokw=;
        b=mLcVP9yMM+KLKApLmt5/YmA0aoMYqkr0+nZM0KL2qfJfDgPsBnboF6s7GoC3XAIi6V
         qTsfxGdJ1ZeyIInYAoKmuoqbVLVNnuHcPkpRK272JKyxWViqNFhh7v1m3tx6rKYygMAH
         Z/wiRwZrzqtiit2SyJYKQ78tjwd2Wn4us9diMXXMyzAivF2zF+0Z1IeVlJLR7pEHLtZ4
         acAgaG2xkpSQP09EN77jf03ZxjZ9R+N/4colMSpn9X0YF0JvQLMn7A5CjGjV6pMZsxli
         YGK7NQ1sQGlRNvZ28E1GfSmI63dh39virXWIMK/mB4wPBtAjQpq/zOscHOFmKRF1EEG9
         REMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0FFsk+iP+2ShQSgX3EnU2WFe8HXV4J2mYEQBKKH95ahBx/F64pEX44DLQtyHOc0tTo38ICC1VvzWo@vger.kernel.org
X-Gm-Message-State: AOJu0YylixcRmb0xIMl3tSLIZkIRvUxWqODaTwSV1/0/omi3oLNTCmGI
	ApUXfDLNM517VBGHh7D7YVOYMQx6ANV3qh3ZGHXdLzJO7sA702r8T63ELc/lu0I=
X-Gm-Gg: ASbGncsH9kQPBE3yesI1pBePxnvemHdfjvYwfRG2y6QKRMOwYMrUZ3LipQ1CWTQ7NeY
	pLxZpCvPkN4Ulj6T3vzlHAAJ+uXdI1i5aK3ATDf+k/qhMNxAbfJQ0W6QouRVPiGWjHbgctRTh4Q
	8VF775du5yZg80Y9+QAkcSgKlypFQjtp8kWRrnhqGZ/iI/v3RqxvPXcN508x/1lzJdEW6beb/zn
	8oupZ3rMigjVBNOAjCjeQE6T6wqb1lbkkMrODzLDE0DxHfd1vENyUzbQ/jqaCjas5OtoUtQydJg
	HfcbVSPVQsk7vIz4F3v16ObWUQG2rsSyjjEhbYCzbhMM39wduuhhUg+ytdgF1WLjrzchGOdreZa
	0tqc0x2qtTA==
X-Google-Smtp-Source: AGHT+IHX36RbKmsmvvJwxpoypeNS8StLR82JyhZ5gIlVadrutECZV5YTLilKd9dggP+2xMa9LYkB2A==
X-Received: by 2002:a17:907:a58b:b0:abf:641a:5727 with SMTP id a640c23a62f3a-ac3b7c49f8bmr574608766b.7.1742421095156;
        Wed, 19 Mar 2025 14:51:35 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0f5dsm1084175966b.63.2025.03.19.14.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:34 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Subject: [PATCH v8 09/13] arm64: dts: Add board DTS for Rpi5 which includes RP1 node
Date: Wed, 19 Mar 2025 22:52:30 +0100
Message-ID: <c6498d8cf8dfade1980b566e99a9a91551fd8b53.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the board 'monolithic' DTS for RaspberryPi 5 which includes
the RP1 node definition.  The inclusion treeis as follow (the
arrow points to the includer):

rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b-monolithic.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b.dts

This is designed to maximize the compatibility with downstream DT
while ensuring that a fully defined DT (one which includes the RP1
node as opposed to load it from overlay at runtime) is present
since early boot stage.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
Right now bcm2712-rpi-5-b.dts is the overlay-ready DT which will make
the RP1 driver to load the RP1 dtb overlay at runtime, while
bcm2712-rpi-5-b-monolithic.dts is the fully defined one (i.e. it
already contains RP1 node, so no overlay is loaded nor needed). 
Depending on which one we want to be considered the default, we can
swap the file names to align with downstream naming convention that
has only the fully defined DT called bcm2712-rpi-5-b.dts.
---
 arch/arm64/boot/dts/broadcom/Makefile                     | 1 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts      | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 3d0efb93b06d..4836c6da5bee 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b-monolithic.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
new file mode 100644
index 000000000000..3aeee678b0bc
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "bcm2712-rpi-5-b.dts"
+
+&pcie2 {
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3


