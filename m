Return-Path: <linux-gpio+bounces-12251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 836129B32CD
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D781FB22DD2
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3721DEFE2;
	Mon, 28 Oct 2024 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K8FS8A5p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B831DE4F1
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124456; cv=none; b=Or41JeJqNjDZP0wYY0TPqJnpRtyxg6tszpPzaN+TgyEiEslV2ZqCfsllkmXiTlqbUtQjEhK+bM/b0gcaWPQTCNG0gxCyQn19ZC+T/EKpe+0WLW7L+NxlrYyPxI4VKqqbI5yK8NcO3XZxpe7E9L4dCzHlLwbYRy/6RcRX/sc4mzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124456; c=relaxed/simple;
	bh=rKJ6g2zPe+AmVP+2VuYqwsDW7Vw/1jwj4Zek+anRIcU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFM9GYR/i1jnbt4oY39VtMRfETXLi7hE9q02mwfP3hL/nLDtyxk1tUQjgwf+ypvAkS5IM64xoOG4z4bMEy0rk/VL2hVtYcdDEqROSrhClfX298xcBp3HXkVXsGHS+7Yz1o5VOsZjfS0MH8jGFU6UZq64k6mua9gaTKkETmkQohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K8FS8A5p; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0472306cso596324966b.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124448; x=1730729248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExSdnw6SFXuTqFss0pRdd0b0/LidGX7ZLflADrh46f0=;
        b=K8FS8A5pzi2HL1uN/tNmS6bsPHpWmMmY3ix81otlH3SH0FMyrYmuR0M/5e4rwS4nsi
         BxOMelx4sWzG3IsM/Anz3uSIGX1DczEkCG0j9kd1clHRr76+6ei4ZsFv0coMInojadhT
         alBQua7+yax9fgncMlHN+QvJ1s17GLDJdHUE07sVdJdqPttZGcLCO2DSNTMnSStd7kRO
         mVuUwiOTqgiIvn4ijywa6XQvsHOK/AeULfKY3oQ0ejRQwUb4vZFbwz1RK25tTAkaaAFJ
         X+cfLitMl5FGX2viMmU4FRh3qnZI6I/Xcl/KlBoxmUJhb9non9TZZqNtIOcZgx2tTTtt
         KCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124448; x=1730729248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExSdnw6SFXuTqFss0pRdd0b0/LidGX7ZLflADrh46f0=;
        b=OqlghZNynwfG5y4RHPg4S0waqZCM7oixQz1rQ7+Zv5vDlAji3EsHqKQIntp1iqqWfk
         +n3hJ92uFMiLs3YjLBXpE0x1yV0Bvw+nzTBI23gmnqhbWwEzrYNluGJ4RTzbn76exlvI
         LHT8yggXp8jpBj2ZQhXZpxuKJpgoX3N5ybTHam83sbZrA2WZSTaKAvf8GvGri18UKdT4
         92d8mK4WINvbCAilpc/umcLYLOAOHHqaUyJ/mLKs5DkTiSqTADfG0IoAyqmlNCUyTdRU
         sQz/fC3nX62aLj4SfGsYVAh9owZ0GvKuxw9OGrYssulG/mc8IsOxda0YdE9O+bHPSW6O
         GPzA==
X-Forwarded-Encrypted: i=1; AJvYcCWOKVHeyDTm46PvLaEJZNzCgpPz12bXK6E22oqsZryCInIiXgW8qrtsBqJAi0s21WUVwTzipB28k6hT@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgfqTbEVRWGLmRwjLm8UDCFXJ/+5soEd/ywgxm/xBqYPChQRn
	H3vV8wSSZcSu+Q/Cck29VfhkzCPghK8MnblsgaJW57KHTHFVF+UIxypCQFQOkhM=
X-Google-Smtp-Source: AGHT+IGfZma7X0ezVVYvvMm++bwyKvKeoZexLczbfZgPE9InzBp7Q/p9irVjhvXQTbzMj3l4IWc0BQ==
X-Received: by 2002:a17:907:9608:b0:a9a:835:b4eb with SMTP id a640c23a62f3a-a9de5fa6071mr718089466b.38.1730124447425;
        Mon, 28 Oct 2024 07:07:27 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029559sm380642166b.58.2024.10.28.07.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:27 -0700 (PDT)
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
Subject: [PATCH v3 11/12] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon, 28 Oct 2024 15:07:28 +0100
Message-ID: <13ad41f172cc8605cb9b324ea0f22296c4c97033.1730123575.git.andrea.porta@suse.com>
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..efdf9abf04c4 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_rp1_xosc: clock-rp1-xosc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "rp1-xosc";
+			clock-frequency = <50000000>;
+		};
 	};
 
 	cpus: cpus {
-- 
2.35.3


