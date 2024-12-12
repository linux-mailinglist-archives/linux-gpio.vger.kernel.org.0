Return-Path: <linux-gpio+bounces-13841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4129EFB2F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07B8716B318
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223852288EA;
	Thu, 12 Dec 2024 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KOHtoC1K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D64226165
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 18:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028609; cv=none; b=cAnU6i1M4rICHr4SvpdPEvfMdbRWjw+Gza2C+GANi71z/LWtZ9lK/ma9G9EER6X90fIl1PAMoP+NpynsWKulSvdzLvOSYsORJRG8DGDYLRPsiOHmyQFrjT7AESp/CnUPOAyzU9KOD6FPHihBgqLrtxo00YZeRv3aD54iNTwcyyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028609; c=relaxed/simple;
	bh=FBDqCJYmfxkJaZt8Un7aPuYwrUM7R7Q4/pNQK9op6mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsILJzuesP+HpZot9nW9nPEGze8I/uZ4lZ3EIG4UDraVGZfNTioMigDQ8xSZhdYq7CFActarPCdOKSkpiUx5uUt5Fq567ji3cRqOAaeBrVhUy17MaiPwwcZax6ewD9vl0pVCPACtgMqa5o6hLfXl7rZJXelbgqUfa3XS1ULXA3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KOHtoC1K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a2033562so7042115e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028606; x=1734633406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=KOHtoC1KCJeeGZxjQqq2Xtz/CRudTdBmaTyl9ISAPZG/SjIzdEkzwuxf98qSeHy9Cr
         9cVEVlIWv4ftQljnUZd5PMxxTGge3Kawu7pKbGaMksyuMnP6nRTUOLEZBzJZWEvMqYUT
         HIbhVAfkXlciNuBfB9jBHus2a9z6+8tfiRIo73GrA2ZzkvSTrn5JJUH46OWmeM78TiyF
         a03arhGu7abYOxQUfxlgFJBlRF6gLkyeiDLQDTNgHAhUECCOwzW8JpdsXX033c4O2CPt
         EvS4HOTi8DyJu4Hjymaby7zmp34N60Y70QWOyz3XJY1U5v/+61n/p+ERixDpSb/rxDbG
         TYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028606; x=1734633406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=i95/apLIfNePPjm5cdN+7BiOsj4U7A2hupt78ggD+smeWv+26VP1GN7nSbrGpbEnuK
         fFjFi6+DbQRtkyrbfRfwSD1mdLlxQEGMUITqNpvVcyVc77kGOBurds9xfWVDkjjyxPHC
         MYpUHvXq7s5//HW80bQAA3C2BLUavAXV69V5NcQ6NLp7xiYW5xV20Xqoqwt1ZtBQXlLr
         DACiUzSOF3/ey/KYiZy3Dk7VdQebGSkMBlcutZHVmgxgXwaSDf3M27AdgWu5VaQYgadI
         Qg5+IhGXl/hFRuBVATVckXni+3l0eBEWCEkr4zbF+CnMqDcwp1LF7x7Ufe29XE+QdRmF
         1vAg==
X-Forwarded-Encrypted: i=1; AJvYcCXiN/cZk5vexFxdUuEycWsC77VLaQMO8DNLWS+tgho7gbbntBvI0t10Pw8eT0F7bAtsLneLTfbQDGUM@vger.kernel.org
X-Gm-Message-State: AOJu0YyleGGE2r2pGFyzgHauWgfdycVuDBlTnqE9cWm1TmDlzwV401E4
	d26Q4pzSHsEB2UioaAzOErZKhaSVGk6ObQ4SYsTZF2hv7TsVp4bGwwEcM2PE9IA=
X-Gm-Gg: ASbGncssdvuOwa7HdsPHoywP5PA1DUz2HhleqKvTFI8XBhC5UMX7iKFYXr86ORvfz2g
	crdgF5jQ35olzRjNNdl+ePreOFJMOWMFWrVIxhHPauZaJFobsYNDM9jlYgDIrvXIilObEVm/wUp
	smrvhfGPu13OYd50H9c59UAZa05tOw4QRT0q/Qg8O6mbKcvnf+lZsy+cnfGSSz38i60x1ddYLyv
	hL6ZVB4/R9lrvfHQV8dYvQtVvpQF2+dWB6cGT4WGBQC3P+0
X-Google-Smtp-Source: AGHT+IGL4E9j9A1tMS6SuUyiiajyBjok8IwHS0bLS9tymQ53Yae5HQb0IhaVfgk6fsEuOcpfD85mUQ==
X-Received: by 2002:a05:600c:1d2a:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4362285f769mr38353035e9.24.1734028606518;
        Thu, 12 Dec 2024 10:36:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:32 +0000
Subject: [PATCH v3 5/7] arm64: dts: broadcom: Rename bcm2712 interrupt
 controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-5-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

CHECK_DTBS produces errors on bcm2712-rpi-5-b.dtb and bcm2712-d-rpi-5-b.dtb
of:
intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#

Rename the nodes from intc to interrupt-controller.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 39305e0869ec..bd78af0211b6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
 			#size-cells = <0>;
 		};
 
-		bsc_irq: intc@7d508380 {
+		bsc_irq: interrupt-controller@7d508380 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508380 0x10>;
 			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
@@ -344,7 +344,7 @@ bsc_irq: intc@7d508380 {
 			#interrupt-cells = <1>;
 		};
 
-		main_irq: intc@7d508400 {
+		main_irq: interrupt-controller@7d508400 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508400 0x10>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.34.1


