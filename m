Return-Path: <linux-gpio+bounces-10129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A9B979474
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 04:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9863E1C21462
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 02:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DD8C2FD;
	Sun, 15 Sep 2024 02:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="V1u3JKmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C28F49
	for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 02:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726368182; cv=none; b=LEPT2Btz8hyc37xespVXOIJZjyzYHSznY9G0wLCVJisEUDYsYK4D5Mqxmo/b3Inlpn/74jHL89v5KZszH5ERx9wngEwinn+oe8ficIgDXLdCx8vGCTJfmFjJ5JBksr1+Wnxh1BpiicK3E93UQB53wQWSPjWXPPMgaK69KOskifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726368182; c=relaxed/simple;
	bh=XM78yc+XjrStC5IXPqjBVtBgKWwVe/FTRPJ582NZaZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKTlmSNRgmTbic1SR+RI1Usm25/NbWZVhYu/JWSiR8d3554vsbry/9BA++blisCR6dJMDOcf3vfL3DWq8V+/MxE4BGDFR4ByBQ6qKCCOYoCNHP+qsOohzRTgElxiBnBl436w5j9UGzNCriK9T5pbHy6WDlsVh26E47FDG4DNOZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=V1u3JKmN; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6d49cec2a5dso16329927b3.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368179; x=1726972979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRW1CgWbOLN0dxInO1RVa4MCLZ/SoGKEH+KzW/Dmmts=;
        b=V1u3JKmN/nphwR8AimZGXelnPjkeD3d2369S8IB5PvOguvAyw96TgbNGQfRkd/TFmV
         rl7X1jVcwy+lmquu+OMSJollSRIa/NKFSSnqOsxG/mk37Ym1uiAAyjZHBGYGZUcDF6KN
         fHaJMdWc+NYqmHyyburtBYrncU+pmJGBZk1uOwxkOw6vjIx2+il6PNW/MC6nrJFEoxHU
         4jBXLoDvtKfEGp7g243FwGXktDAfgDvHttuaVLcfj82b4unGX4PICcE0KN2XvOjTFq3D
         kRy4aCSNt5drjAFEAZkwxzMMvJNwgF6mgVIyLX5JOngr5d1G7YuBZL+zdZKGT8uXjwKw
         Y4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368179; x=1726972979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRW1CgWbOLN0dxInO1RVa4MCLZ/SoGKEH+KzW/Dmmts=;
        b=sXLgJlyYdasGdTtSuXxpmpJCGtKEa/sfyhf25vbZaoDKm9sTyR1edJaJFZ2dPpoieU
         tscahDVB2a6+qxH1r4PqPujL5AyD4/HmwiVagokQPT2NGenjEv3euQhCJv5oIVKtDAG6
         Ny8/Lli9iaUmuJ6LMR1SGvDk6tMZU8nwM5zZzOz+okh4WZ4HuyHjXAQr/UZQ7KA/eWi4
         lKvKbsezNuZLsQaSOtEmHwQQ8LA6u9slLox3IGUtwKm6m9KzZGjrXhpRcZNRcbfdTJkr
         7tXMm+3gMo/SL2HyAZuhiYDptixs+lKamrEg/prjVLAddwPca90D6dpRhjE89uT3amjm
         yECA==
X-Forwarded-Encrypted: i=1; AJvYcCV1NIyhCTrEIRePc6wDkc7ulBDgXTzR31IuZ5/sy3Hr83VO6ffv7FTEK+5+o4Hl2a8JFJsGrE8mkvrt@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRnsuJP9JAsTVFD5IUue2GP3uo4z1btE2XSQC8wAK90a1Wgpw
	MHv3sstD8PEanFHvAyD5IL0txNi5r+uZl8U7+oaLBNp92BI2QOrx0a0dg68oNKe2+mbYSLkgdWA
	P
X-Google-Smtp-Source: AGHT+IEx8GtZaKrbGBS25oCnrlxDQauqhJwCRWXxT7EBP3CqFLy1MH3r5DNRJRFoU0qKJgkRzpyjnw==
X-Received: by 2002:a05:690c:39d:b0:6b7:a7b3:8db2 with SMTP id 00721157ae682-6dbcc579a93mr70022007b3.30.1726368179545;
        Sat, 14 Sep 2024 19:42:59 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:42:59 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:52 -0700
Subject: [PATCH v2 4/8] riscv: dts: thead: Add TH1520 GPIO ranges
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-th1520-pinctrl-v2-4-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add gpio-ranges properties to the TH1520 device tree, so user space can
change basic pinconf settings for GPIOs and are not allowed to use pads
already used by other functions.

Adjust number of GPIOs available for the different controllers.

Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 9367754eede8..f9e339d3472d 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -338,6 +338,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -355,7 +356,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -381,6 +383,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -398,7 +401,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -541,7 +545,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -566,7 +571,8 @@ portf: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl_aosys 0 25 22>, <&padctrl_aosys 22 7 1>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;

-- 
2.34.1


