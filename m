Return-Path: <linux-gpio+bounces-20708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF398AC7C2A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 12:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29CE1A26C49
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 10:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAC328FA9E;
	Thu, 29 May 2025 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LBJ2Zn3w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770BF28E58D
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515695; cv=none; b=WbgHwV5caFcXtgpAb4hvWhgFzOb3sfNxBy4Ly1/kMgbDDvscz+YEV/VZnxceE0dPFw2jueWXhJnCiI0UX6TQibqj2WRF93pWR3Z42/jfCqlBqHCCBsLz+szsGr5LdSDwFtnsAfspLuKNW+TJArdJdScXFbsSsLWB520H0cJJjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515695; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAX8xxYDeSjQ4o988v5QUlbcGmdHDnxrYbvjLGTS/eH9otefRcCYQFCzmO6WNKYiE0VFnEsUWYtzxBAGr/bM6hFWo52HX1RuPNK43377jE0q39VJWrdpwkibD2XqX3cuKpMAlJfDdRM0DrhmmmaOieIUzv+P2TQ/OLx9imeZTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LBJ2Zn3w; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso1223043a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515690; x=1749120490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=LBJ2Zn3wfuElg61hcinZcwDrGkFTxKVEDrpHD7NuT7LPJPTL6tXZMPcuSZ+7eS1dNQ
         0EsAiEBEzj6poeJ/fdLnyS68fR6kydz1f5KL6KK8Okp2T3MmLA5kWhZRTUPe9npUvf/e
         05ZdNIMrmQMtw6PusbulacDbZ8L/Imqdg+QUSAHxqE3O8Kq+BXIW1F34yM54ndjHI4wj
         b49A2Nt6txEnhmITga8MtpymdsihkizpU6a/AP96v+S32kAItRIr+rw+dXWPNt135Da3
         SMjRhwp9YBGwHnx+AXZBl/TJlAKJT6kWC2IEtQHrMlznA7f54nIUrPUHTSdvWix/VL51
         SYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515690; x=1749120490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=In7tqKvpLb3XrcSKNvg1ouWPh78yURcObQCGHtRNZY9O9x4KyLt8S4a/iavuXN8EGS
         dx/Fut0mBURNRsh+mRhv0b1vLEAErXyhjt3fCSyhCJDR7Sk5QKtiNnqbsiuFI5c6O56C
         sL/zIpR9x+Kxwv2xZ+cJN8js8p5WrjCE7ndqLTG/rZMSfPF8s6+PNWlMPiKSSiDRkYVB
         uaINrAM+U5f9t2TrBMZnmfdqYrywCy4dKYKCzc+ttHpNnCG3q4r/oNUpz/5Brimgz15h
         lMAw5XxKGh/D+BQdTzBkqbgd+pq93Tnq3tYGxOBunfN6S4tFbeA6SMUfsDxukA96ZrDZ
         Aelg==
X-Forwarded-Encrypted: i=1; AJvYcCWlZd/mbN9dPFIdjV7CQkADtwSB99aLAO2GitziXxgN1wV+PqSoSlErCkK3HNdyRFvgIYTXoJ2UagJG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjey9vW0nXB/Z8UyfLI0deF/mch5rtEKJkqqSRtAVkB5hHl/jo
	MEFG9OirVy146Gfbm3v1MPQvOMYcrk33O5U/do5cBwM+TJQAT5R2tw6gADTn6mRdZL4=
X-Gm-Gg: ASbGncuLyQ3SyM3dw9EFYmA1C0p8DCmDAg08X8AYkDB8jBvP2J6uWi/nLLiHTFZgK6H
	6y9A+Es/hGjCDGvx3pBnIY0zMiiQNTreWAwQqgs1ub2NpYG686D4ZAMB7GUfMimuE558+2P2z8L
	Q/vOn/x4rmdkajWWoOVLVmv0NhIBdZSdU6wOg7DQ38o2+Tf0j3PnUzyVbpvH4iQFYynOzvahhDE
	Qa8tJEs3+iXx8DAPfHzZNOxmV9gnWEPZX9GLcRFxAiDltv58QsNuFDrh5RY5NsjQMcMydV7LXoW
	AxRCAhzTfW1cbQZYm63cLrW7UF5hHuOqSQSFOg1LDQK41piZUIMp608L89Gz8Enn1SsuGJSgYj6
	GejvJj0hyV48mbTgg86VWqQ==
X-Google-Smtp-Source: AGHT+IEvqDlvsLAy+T6fI+vBgq2bdMThjlvuZRnUHLwEn3hRivUFxx6+EsUGWC1RvaIzLQHDhitSEA==
X-Received: by 2002:a17:907:7245:b0:ad8:9645:7965 with SMTP id a640c23a62f3a-ad8964582e8mr902544766b.42.1748515690473;
        Thu, 29 May 2025 03:48:10 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e8780f5sm119453466b.95.2025.05.29.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:10 -0700 (PDT)
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
Subject: [PATCH v10 10/10] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 12:49:27 +0200
Message-ID: <20250529104940.23053-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
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


