Return-Path: <linux-gpio+bounces-20753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23660AC7F1E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8BE34E3E34
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4BD22DFBE;
	Thu, 29 May 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HATLB0e6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2222D4F3
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526570; cv=none; b=sx8FGpLsdM8c82XCeLbkEy4Fo24yFTK1h48WAQpr/ank4QQ1NS8A+vKPLKWU414fMGzb52LX8c6y/vos3QI4bp7O8HQgRHLlBct2b7gcK67RoXqXHABvT/KIAmGyAwnkw/ZIHJBwfJDtdjIYMIpSIfMDKhsjA6pcX3kYKjDXoU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526570; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nE8f1z27becWYARhxLq1gbjs8ioHoAhT057B8GK+20sMLTeSstQJY5Qmrb2zfV2HC+lBnp1PsZ7F7OevWjllj8Tk3kPhlMIJCD2GoHtMCEUv0T6PoLLHHRhBoUZsFjdmP7bnlemxXRD0Q0Kg+4TIrBUVKcythVUEzaytr0O76KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HATLB0e6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad5740dd20eso132403466b.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526565; x=1749131365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=HATLB0e6dVjhkr7Z8px3MKY1ov9tb4ftfukTCoh9i2lksHUn6WyqesEt/4Fov7CRvZ
         MkA6P5VO5/4RPTZc7kgaA81aWRoR2NMogJgH5HHxq2MVCbxzGPfhHGSQdyIgH4x/HZQy
         NAPBKY/h7wZPJMywNfWBfo4CLuVi+lsvRmFXOMkSupLaj6rh7CiuADjLdzZu/XXNd95l
         xdao2BdhRP7NmsRk03rlK34bsI4b3Ums/D0l3Y72+TiqUEEtJC+D32vUPoB5O2665xCy
         UwmRmGxr2XrT2PC9uhVRYxGmQTTsuVwDOVXRIwnz07lDvONk8mWCNA+SjNdDnhLB/F2E
         tSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526565; x=1749131365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=ZHzE//IJIyM6LpWiHYI1NrUAlvXS5SJ+hK+EpJsllr68TqqP0xjlok0mDtHTE019yx
         gfs00dXiyNWciMvgsgO8pVxyp1fuwxwO7V8bXCPtiPXDEBpUbg4Aqeom7f7BDwmAH7bA
         5gAtvIOO0x7ddvXvX61V09wG3FvBXqOYoA5RvKmwgfhqEE3kK+0cxQ5pgHEBx8O5Ehk+
         +HxmSOSTXg+YBZN6UGraN1iVcfIqi7zfWACAV5vpDnFH3CuhjMzwB/ZUNTnOY4szXYNQ
         X59pid3CcS+QddqnBUW4YhMo5B9S/6h0FrClC24WpKf5Ff7xKzR6UoP6E7aT+3ZAYlSq
         8g3g==
X-Forwarded-Encrypted: i=1; AJvYcCVK6n0ET6dHdBQAN0pF+jvAiKwoBoAkUmndbgtfM7hycmnxQMj+6UhLGk1hjScEIduLyJ6uFm5owMwW@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJBM/HuAiRCxauyn9eVBc/dixXwp67wevB7PKKCuLz0QSZblQ
	SqKyNgEJJdh4cnWY3+qQhaNnUcMi1zzdkUQwCQLMTOuRh4JyNNX30p+ZM6jq2+anwB4=
X-Gm-Gg: ASbGncvM/WfAHhguwGhLUXNQn4BiZCp5i2aXmviOOf3YDEQSkrUAHPvn8QRpSbnKGCb
	HaYALLd8w1I1NHKhULwiAS3UjfGIfv62p2nbg/+uotnbtvVbe8PDqtVrxi8YVx1Uokh5vUZ/vn0
	XmPhQdjPbI7fR8YpdTVdumBEFsJtM6kIMIF6EAtZiYKcvdO62jqo2KAhsKy8PvgPieDU+V/fGQQ
	hGzxJLvTrl6cKQGlm4xrbZjLvEuYeMqkAKHce59PbGUiiXY+DOCWqXMYBE+npE+8cGW7bXJHR1q
	EBVfa5TcLn30+dw+86+Aq3Y4S83tAewnuDCp6brG211YIKuJt1wXDxSFFXim4pHekn39bzgqtCL
	JL0ZihqfCj4qMF3uyovOEEw==
X-Google-Smtp-Source: AGHT+IFaYnKDP4OR65WeNJFXd2Qcwxypx676SRlwxR+m7cKcv9QtiqthZ5su11rGaYFNLwt9bEtnuA==
X-Received: by 2002:a17:907:971a:b0:ad8:9b5d:2c2b with SMTP id a640c23a62f3a-ad89b5d2e71mr801614666b.25.1748526565369;
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2fb63cdasm4600266b.120.2025.05.29.06.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
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
Subject: [PATCH v12 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 15:50:45 +0200
Message-ID: <20250529135052.28398-8-andrea.porta@suse.com>
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


