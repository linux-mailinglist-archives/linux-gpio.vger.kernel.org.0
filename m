Return-Path: <linux-gpio+bounces-24186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C87B20B6F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 003973A24F3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E4D220680;
	Mon, 11 Aug 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c9siHFSz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADFF211A15
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921454; cv=none; b=S+ZNBz8hxeUpFcHgf4xk+a/k31keh1Bqyu64pJnUOIyTPGUaMY/DgMJHkLiSsmvNmgEwXZJ1lWnCNkDWS+EJPQeKTGBRsgJRQjb3az1Amy6BXKcMaTOOT4XbNg42zBVhpu72AQikE+sM7z3LWcMuhFG+2KsS6WFY1pQ37okQW4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921454; c=relaxed/simple;
	bh=4QCFtRW/MxF9J/+GsGpUTijni3ULMWgMsH+JZsz8La4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlDC1e4iA0yhdSwtKCT2YqkE02p2CBnTS7cXY/NQQNvkuSxwqR8BKC9Shku5r7tzq0wto++X3EMjEz90I1WEgM2YCQfmMRCoT6yTpyQ6C1TbPDFQLhT5GFP6tNLvE3hKv4Gc1IZPOI55KrJ8LsOAU5mo1PbQq3F9TqO4HjZTt8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c9siHFSz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af958127df5so663436566b.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754921450; x=1755526250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63J39CyFqSLdGcoY+lFnsbjnjETWfUjBwWRQVTsQ3ZA=;
        b=c9siHFSzeTYLdZdarn6XHrmrahFZ+2fzoQ5GVM1QNqaNmqvdVbbpLyOvSlbvSorGCl
         aeQU2wkMqyK3cDjKcuoFDAnDNEYS3w7KO8v62suzc54O6PvAdDfvl/izbWndowEMp5yH
         pHGDltoRLF9yEjG3PPbAy7+dJUXImyls+lzkuESrClSFH5dhuU6ABG7j+FnPcjEf3U3D
         WcyKJM0DEjTU7l2QWihBzKmStm0WqsEQ+Co1pB70MEynRtzTNX9Ia5VjKXeMucQ/Yh8X
         aYEOUMXxEOKbXA/4Ep/afb9PFxIvVvuW8+YNzXPoHq3gB/X5yDCuKFUJfKB9O5ZMkusi
         NB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921450; x=1755526250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63J39CyFqSLdGcoY+lFnsbjnjETWfUjBwWRQVTsQ3ZA=;
        b=S8UpC6WessklayOekN1uN+fHOrWoIoj4cFhWDDtX9hMa4EQJXzOwijXDO35+XwUkv9
         AL3zpF3ia2ettzMJAoH22ZbTAkNUvnSxjwN8ms8Dp+Kx4PJB6TvKr6jo6Sv443ZYLqAT
         ryybB4NRfrhifpDQriUUQWH++NYqXpxZ3fpl2okh0PRZfik2AY2B3IA7XkNknOcy+Zjn
         OAcLPaRlGIwcXcbmXAtwqyp+Qn9OfZXB/KUeS/afiGevGjWMYnoqeGVRL5mWUjw5ffEf
         oKEzZH0bqhGUnm+8N3BEEYo/yJK+KlsY7wy1eO3GNy6PePkA6eg0eGy6oPFwHVo/twWX
         mu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf0dhAu75/co6kpyoyIzX9L3yZ8Wk9cmrUZkbfaBTlq/lrryHg0M2UIVQAsiNUZVsJ1o3vK1nS6znC@vger.kernel.org
X-Gm-Message-State: AOJu0YzVkTpAOnM6SFkhPj+76Q6QCWdzj/ZXWv/WytHvBHQRePzR5DxZ
	ghIHut59HPonKgTlQtOvADXrLaz8TDX1IH1NQw7Y3mJqwtrSvDKJgBIaSbQ7G5Eew4A=
X-Gm-Gg: ASbGncshATKLbKJhJ/BoNMfuk/YpmpkuxXjOxzRfVxE0PvbaL+hxkj/12wLWEh7oxni
	7OcT2pqDazR8zb3OKsmbiJPOqI0dNDdpOd26t9oSexoYYUjYwlYENZpmbKNLtoYBs0tWrJbIFSp
	pEWnW1S8bRXvdpaR+bGGKFNz/Aw1U0RacAdWFdOsJQy5RFCps1Ve03PriSUkJBe+w0bwf0MZyIl
	fKjzSxlIbrowzGeclA8NFYIx2WEV+3l42N5xW0G97vIXy+Y6U/B8F80TCXXkWu4dumpxX+MCHAB
	dHBpP4YnZZDtx+eMrpVq2NsTbawQuMO7Kpp3aBAkA8x/MLdv9RLVfKfX3NLVaRWe3/zPRDs+GJV
	CjI8XP32/cn9mVADHAkd/tuLNcsBNOzH3VbAlN1nciX9qaxWAilT0nl/PIU9+cO5rmA==
X-Google-Smtp-Source: AGHT+IG/M8+ibyfZa1rZEJRPdNDgrfy4rJ6HCiKO3wMUuimZDr1wETFmlPT6yaYQrOBYlXmZ2auvCQ==
X-Received: by 2002:a17:907:3f1b:b0:ae0:a597:2959 with SMTP id a640c23a62f3a-af9c6516d10mr1108890066b.32.1754921450120;
        Mon, 11 Aug 2025 07:10:50 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af9383590desm1818429466b.76.2025.08.11.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:10:49 -0700 (PDT)
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
	Matthias Brugger <mbrugger@suse.com>,
	iivanov@suse.de,
	svarbanov@suse.de
Subject: [PATCH 1/2] arm64: dts: broadcom: delete redundant pcie enablement nodes
Date: Mon, 11 Aug 2025 16:12:34 +0200
Message-ID: <2865b787d893fd1dcf816e1c96856711754d612d.1754914766.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754914766.git.andrea.porta@suse.com>
References: <cover.1754914766.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pcie1 and pcie2 override nodes to enable the respective peripherals are
declared both in bcm2712-rpi-5-b.dts and bcm2712-rpi-5-b-ovl-rp1.dts, which
makes those declared in the former file redundant.

Drop those redundant nodes from the board devicetree.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index a70a9b158df3..adad85e68f1b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -15,11 +15,3 @@
 &pcie2 {
 	#include "rp1-nexus.dtsi"
 };
-
-&pcie1 {
-	status = "okay";
-};
-
-&pcie2 {
-	status = "okay";
-};
-- 
2.35.3


