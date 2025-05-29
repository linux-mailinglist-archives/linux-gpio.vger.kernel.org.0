Return-Path: <linux-gpio+bounces-20724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA630AC7CD0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7986166196
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 11:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E716F290094;
	Thu, 29 May 2025 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HHLi4Mt9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2928E610
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517752; cv=none; b=I6tH+d/EzsTKy8RiEmmLqsvXgy5me0a6qHi1lm8hm/u55PdpW2zYjaaNCuMFA0TF0dfHv1V4Py4qU9LH12ssTqK25prAeQ82PUun7pwbAMdH5prPzjPSAuV+WZNtaHFbGcjwxsSv4tMfJ/HWDcYJEwxFAZhs4DIkJoAcjt0Yz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517752; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+DJyX0VuR2iIFbVnFFtR1o/LZVUHUmXIerOfnUwlklXrnHtIj2HkJFyrGFQQP7aUkF5kXLK1nSDLxQ33IIFqlKMs5kFPkCqCrRKE+0mjXrzi8UFlGiklmXyMF5DZLveqpWoG7cG2cNO7Xq4+QnJw7SCc4dEcXqdHoEFN6E3BKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HHLi4Mt9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so138501366b.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517747; x=1749122547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=HHLi4Mt9Lln4pcT4L6Xd3N1GXlHz7BDDoxySer0woUvYIWJJELGO7JIf9WfjPJ6cXj
         4ImFijnm6NW4NG/QdWxxQ+dqQX6tMva8c8ePW/oGJDM63+4kxqznmvI+Y+sJ659VNfQt
         iG7xr2UmH4UZ3yKjPwAc3cWWA2WtlRB4tddY7tyhKzR7tbsMG31Ogx2ioz3PBPCEJu5l
         c42yOzi1oNHglAKZpSH3WKjgnQhR+e/E/zpDG3nRtu6SPQPbREP+8Uc1+BVLpZSFkYwk
         2MXQio55tNHFjCNCxyXA76UWkVYS7/ohn/hF1oTRUFTx2rgbofgzhOJ238aknY360kyM
         cb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517747; x=1749122547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=rUdVfeG70duQMRcfGMfOjIfaMYDxPduSs165ahaTFM+g8dUVAN0deCtZDIQFyAlsdD
         beNwSqYHDFT8RHKJ+h3WeYIKADHOLdPPoQ1wK6K9EQY8IW4CyoaxaXLiaH63yQGADYTd
         OntEklInRDA6yo5oG+jNzZ/T2mD8MjJFAHLMSTecZtlAfOXOzv9/TcmdBg8EIl8QaBH8
         97+mYCHn2TQx0A5Z/BIrhWI3lIVxz/RWdVwhs+OTl2Z2ZuUNI39ol+yIYNn3/Tesva0l
         jggh4H/1ydQORvRQ4j0iaZ9T+lbLVppYKF7QYSnlkNL/eNU/eiMt0YnaEi3CLhPF4SH8
         CnDA==
X-Forwarded-Encrypted: i=1; AJvYcCVO1ufapMT0+MUVXWoLUK7DMjaSA/gE//T4xPv254HgaJu7t0L4zmCY+9IdO5g1aDINPrPTYdc/ZPOU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ExTEWFgMcZNRyEBjN7zVRlOZaVivq6NZB4GaOxBVFND2bemc
	bJsGDeBQRK8XHeJC9CuIKSWgfsDTYgLWonsVEE0JfY85lO+6Nd35ggcyAeruGslLFfQ=
X-Gm-Gg: ASbGncurEurk3V56V1QpYCZKCp8oCqgPQ5LkS3lNom5kHvtJP4JXyr0Y1IGn8eDVfme
	8xXwlIAHOKjUOyUwtYi8prSXg+2Ug4ibcOhSQnjuq6QZIwcLqTxUOP2+MVGUJcGkS/8/A1fm0yP
	Jq+HsiBiCpwrkqAqNDeN8UhHiH7AcYHXMTNtHQv2qVbOROkzFVO9F9q45K2eYfKA5kqhDYXzBa3
	7vlZL3mDTXy5fMO/NEHZzfGfPbQMeAJNiXgHDgvcpF1p8p9i8+3jRXtwuirF87FTKMWXk771CE/
	9TuMQlJcFm7mq3prOwrot+xRSYvELjoYNvWYu8XvQ3gOv4oWPapcDotml9bji1i5yKe+AztW/pP
	ahyiogosxB3+uzWjCwmGIvQ==
X-Google-Smtp-Source: AGHT+IExbV09IZHdmSyIO8/MZ+aJ19yLFTdRAcaGW0FODNSxn4P22MjKjPsKbpNd0Snebf8CqktlXQ==
X-Received: by 2002:a17:907:9495:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-ad8a1f3115amr539658066b.29.1748517747202;
        Thu, 29 May 2025 04:22:27 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff0d4sm124837666b.31.2025.05.29.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:26 -0700 (PDT)
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
Subject: [PATCH v10 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 13:23:45 +0200
Message-ID: <20250529112357.24182-5-andrea.porta@suse.com>
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


