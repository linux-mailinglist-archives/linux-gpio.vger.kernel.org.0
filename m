Return-Path: <linux-gpio+bounces-13236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC99D6DF1
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 11:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AE71B211A9
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 10:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40891193084;
	Sun, 24 Nov 2024 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cfKgL7pK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484E01917CD
	for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732445497; cv=none; b=fV4I/KrRoPlY0Do7VW/Jqeqi+G+PRFF7cNahusBBTGzG02swAQcwfxWqClZi9yunvqZUxKoetZYQGxYQ2AfBCwQeLCibjkoKTbFCuB5ycYHUjg0rl3Dvk+V9RAmIpy1CfS8sWMaOSzvXp9XkaNnY0mcl4cNPZYxHNHJ2R2IbJSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732445497; c=relaxed/simple;
	bh=klAcgY34GqH/PvyTJL1b7HVfq12XCJbjYpuQRIMPiP8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STQdG2QoCWGz5nstJKPpqEqGTTJiVkRVe2ZcNEc952IUWYsg9GSFhd+E+9qZvL0XXoUtX9TYK7vyB81UjDEspxPaZZn2h/GlOFJfNBxRWCkqdYdGBPiSUo8J75GSNRwZN8ANlsYaigAm1sQiOjHc0lafLD5i38AlOiBH+NNDqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cfKgL7pK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfbeed072dso4417407a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 02:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445492; x=1733050292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfS2J6Orsal5tO8fun4tykDcHfrxbNiOzjaiamwU+4g=;
        b=cfKgL7pKq/TaeQyUHQzJgNkjjkSa3R0EUFaYbgm/qmryupMcUw5dH6jJ/vj8rODL3B
         uQEJIzOaq6SNFluln4Ejcw3YuFdTFBxLGgczCxLsM5cm2Qi165T52gS022DqfT3CsjsF
         wh3O3q4XgxLKlOvOi2ze/GRal/PL4IPRRVxjb37ucOg8ywRn6/5y4dMRk7p9OYfR+SWR
         hg9Z4Zn5OQ+tDrcsU1o+vFEdyHx0OJG9u3XLUVBt2pnKL5/UiAPWgTh5S5bb/n8DLeoW
         Rg8/NaOULEhJwz2DAuMKzzi8Oj9icCkcYF5tDmOqVMlowMalDpg936TZbHbeSAGGxYSO
         mnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445492; x=1733050292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfS2J6Orsal5tO8fun4tykDcHfrxbNiOzjaiamwU+4g=;
        b=f88W+3RTNXIdqNQ0vXPybIrPOEblqAdW+FSO3s9EMlgG2gKF6Lv23Fc8FawYQ0P2t0
         tnQtrB1CdTkEmUBkuTYtlY58TQK5QGrAQIWcG8BbPND4K86/pb4k6Z1Y02VHT/hihRyw
         N7tVjHtGP4XMe3nT0ZuH8+Gsf89WpkjaWsDAqeDunp6vPJ0z85vkhoQd+AfoHswZgeLP
         G38R6MAjCzPE3hdT3WcZho0M01OiSka7izKPi4fLBCWn6d7p8KM+pf75L9sQ+h4S1jyW
         iLhb9LUk3mwdC2gcGHhxfJGjx/mOrtRvqfznosTsG8UMuybTWxXZub+pMQSm+YCBFyw/
         UBMg==
X-Forwarded-Encrypted: i=1; AJvYcCX801nDhXMVWh/oSJZYNiZkAPLhRRss2Tx13GSBeJumjuDPIjMZ5iNjNO/6u3UwxUEpg/gVreaLRyN2@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5y73Z6keh7s3HuWulTYrODGpXx8fNYwwo8+Jpz0BO4gqMDiC
	134+7kqmC3gIlyAu7yiFKleZYPadOY0lG7adj48KtAXVj/vgO4qKUWI76KSlQzE=
X-Gm-Gg: ASbGnctRnEyLn2iU3h/JQSWqGsvp/xNzDkE5it6bORAa8QdYddor56esPGPJ9DfjLRv
	C+aHYNdG+tHzcyl7O2+iA+ALOei7+FfZBbc97XMBECViheUxvtwLlY0cqvv3U1tuLdkjboaNu30
	D6Ut9pC+tbK7xsU0pUsVuhdsnTjWLQqGHjMKnj9+Bez3vlNVCsB3LX2bkV66OHqSvZSIMued/F0
	0FOdmN0GO0OA+1KRdltchjLVLDn9w1y2UmvEqbrssyfCh5wlHaopADjtvCnBVTfz1IBScY8wcGr
	cmaTtWzMS08oQj/QpyfU
X-Google-Smtp-Source: AGHT+IGSDpSzkP9o4gSgW32myd8F9uUlg7N3TWy1+co5rBtWhujU/hEjf312CRmk2+jz+0sdWz9GeQ==
X-Received: by 2002:a17:907:7758:b0:aa5:3591:420f with SMTP id a640c23a62f3a-aa5359144f5mr387240666b.16.1732445492516;
        Sun, 24 Nov 2024 02:51:32 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa53d1e1279sm129418466b.162.2024.11.24.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:32 -0800 (PST)
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
Subject: [PATCH v4 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Sun, 24 Nov 2024 11:51:46 +0100
Message-ID: <8deccbd7ab8915957342a097410473445987b044.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
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
index 6e5a984c1d4e..b00261992b71 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_rp1_xosc: clock-50000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "rp1-xosc";
+			clock-frequency = <50000000>;
+		};
 	};
 
 	cpus: cpus {
-- 
2.35.3


