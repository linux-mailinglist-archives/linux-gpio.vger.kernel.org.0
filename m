Return-Path: <linux-gpio+bounces-10594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C33CE98AD50
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 21:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 247D6B243D7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 19:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FD719F139;
	Mon, 30 Sep 2024 19:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="YkSHsbYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0407519DF82
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727725874; cv=none; b=seLnO6VYE7VDR4xz+Agh+tCKJ5U/pCekXRkLug6oYxrQuWwOC8cwwIN8l+W8Mjd9Ha3qh+kMrbwvDEP1q9vdkWfmltznGcmBb7lGFDpPTjaBNscmbXjbcv+4tUFrj34PoE8bcV72iPB7opshWYnV1Fo8UXEau+fXLwtpy/06Z/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727725874; c=relaxed/simple;
	bh=Fo9mbzY7tB9id9Wihj+7T0FzxmjzQji5RtLdYH8WSOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIjVKM9qouHMtN2dpN7GnXsD3zynttRWunQyeB4E4McoEC8awFJVBNQrcgwalTqYV7abIUjcVZAYdZgIZsfz1fxk6CuGQA3Sk2L8X+PMus0LSL7rUCGMCU+HajYARWij/TK6gEOb6qD2kvaS51Yxs+pqCX1Z6O5vdhQ5dSLzw4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=YkSHsbYv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71798a15ce5so4406274b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725871; x=1728330671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+zkS9utG+elVqaNRPa3m7+e8A7ib0BG9HxHBkPLUws=;
        b=YkSHsbYvFQHX0NPNARyl47QZC0P7YhlGa+V8FmKbqI7bMCedgb8pc1E4knm6x6sC5V
         NbagLjx+Azb1eepAsC1I9lmfinR4q7DAZOsxb8yHCHBjRVTCbA+NF9s0tm5JYOZ/lmnr
         zNPxiJvksria80tNLmvhkOvcQH51R0vUsaQDj3GX60NQtamouZfXEBUgmJccqHac48uI
         5v3/TP5jsaRh5DMW4i+JZplvhM9svt+9Uly9mFZsyxNheyTjeevtQE8qKSqSJ8ZnqMZc
         gHt6hOkKcdP3X3bq1QtBMOlNysL0lNIxyeOjrUwV6nx+lJVNafTRid2LeWYmmEya8j4c
         Fn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725871; x=1728330671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+zkS9utG+elVqaNRPa3m7+e8A7ib0BG9HxHBkPLUws=;
        b=eZlJ/S251bsYBSTbn9S2NQuvrOpFkpJh8QDAv+Se2nHzc5mkTpSU6kxm8/uBHNlc8c
         HqzRfvB5qJHmUEhvRqMkHfPr/G3u3xgMzZ8l0PAU7tijHDpCfj/2wACM1dIi0+j5y8Vw
         kQsWmDZGOU7wwnGeOqQ8AAP5JWzYR8iNg6YGyghTNiMMAjwRD+FNmuXfXdz1yTFHHkDC
         ViYt//+FHoGeJ37eBnS+iwAW00ZzHN8oD5KR/pMBwVZz4ueQ32mjt3JtNNsXFus54+rD
         oGv8JI4eNV78pj/UmJPs2yCe0WLVNzp7u8W2IhvWTUCX4rsbJxs0KHOaKGU8bKtoiptX
         yGTg==
X-Forwarded-Encrypted: i=1; AJvYcCXft/EVS5hE895MoCrI0C9uxVOBr+l/xeLy/y/i3M0sSRBwJY37RmI/CyZ5biBd1WhLb1Eh6hf/Tz75@vger.kernel.org
X-Gm-Message-State: AOJu0YwDuBdtPtSZH1J7Wudq+EB/HcpLys0xhzdSjI9KxvGX19RABa9n
	zL33VY6AqKLBCy2lCFihKnfj31S7l58oJvHRWy2Rjp3wmw00v/wNhfh8m1P9LPg=
X-Google-Smtp-Source: AGHT+IF2PKvsM6PB9HusoaPkI2XmTv9Pzg0C6UKFCwW+Q9Ek7QSJq0D9CPuTemm5tass/l1zHCN4Rg==
X-Received: by 2002:a05:6a21:1706:b0:1d5:1250:44b4 with SMTP id adf61e73a8af0-1d52d19a5f7mr1108919637.24.1727725871417;
        Mon, 30 Sep 2024 12:51:11 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:11 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:54 -0700
Subject: [PATCH v3 4/8] riscv: dts: thead: Add TH1520 GPIO ranges
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-th1520-pinctrl-v3-4-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
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
index e4eda2a76595..7dcc250ee1d1 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -334,6 +334,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -352,7 +353,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -379,6 +381,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -397,7 +400,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -550,7 +554,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -575,7 +580,8 @@ portf: gpio-controller@0 {
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


