Return-Path: <linux-gpio+bounces-13827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B31839EF151
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53D7A189C3D4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 16:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357D9235C23;
	Thu, 12 Dec 2024 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mYQ3yWoN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2909B235883
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020353; cv=none; b=WO4HnUCB+5kNtuAP7rQlMRJ6R/kGHMDg2c/s3JJjd1m97Q/lCQ66fpFNUqyi8Mzg0X2j3TKX/VQyi42yrC0cOFfggmsHFZTAbz/gAv93EZZx/Rgwb/RZHXQ8b8k0tvfAX0VLvvH4kEuOT56v5oNuTILjjnG7Ipjj1XCnXJtySiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020353; c=relaxed/simple;
	bh=FBDqCJYmfxkJaZt8Un7aPuYwrUM7R7Q4/pNQK9op6mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=deqgN+p/FQoU/NFGIO7z0DRXLSsWtCQE2JxkL7tbKD8Zipy8Hu4+hbpDUgRm459N07Y2vhHaaSThMUCuZobXgmvR3sxoDblOjwKhRYUI+WjLPpoOqryw7A5n2XcBtEyUhuL1xDOgHNkjjDVNPeG8UgIZIRvx7dKM5OlAoEoAtOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=mYQ3yWoN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1303912f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 08:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020349; x=1734625149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=mYQ3yWoNgk5+yC40u/pzvk5IGNib/lLqCQBX923bLbpyPgmId5uYWHvIYjYx3A324P
         jJyhn+5XiA3EiyBmUaxbz0v1Rw6gZAoG8v0HxDTFHb1f1mZPGzqHCNF4+Q/O4qh6w6Io
         6XpBAkTl1JeKGSnaQcZnJufxgzOfmVLqgjdGoRUbP8Vrf6JLvqLwoJETuHdRjXANvMtx
         giT3RQbe7lChFnjYFBKOY7+q6os145eZo5HlOsehFxOKcPYV8z0cPz3JJkFtKJ2oOi5j
         tTKN0z+wEEOahrCAYgbptvn253ktzQ+5+QI0Bwa+uDkIzVVIXA3Vbz5DikVNuZWZTbcI
         pD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020349; x=1734625149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=UevwLijH0vxZJUy01XX/DsdTXPEQkD7Uova/PW2diR4dcFvBGP0nOsm/YOU3pAMOdb
         Ou1cv8agWl5eKd8lpw4D7GtuPCNPxyY1kyakJqlhLCvqk/Qv66dQdht6Q0utnm0KzUHw
         ARFSN6d9nHT6xTlY3zFNYDubzhgxBkrd6cSGEr9rvVKOi/8tW5KLEGmt/YZJaHhR7bo6
         Ze7nUpcN/mZJZTovXjon4IHUMM+NIKYssN0FYlsW+n4rLWiSGEvfbrirsioSbtwQbCGE
         Cf1Zp3g3G5xnFmor2parfwJpOl+8KtjCFpr7X5dS/FK91C5vDOlhLbhdkf1Kmle0G9hc
         KnEg==
X-Forwarded-Encrypted: i=1; AJvYcCV7jDmfYqdfq9LtaxdOlF9ppfC9d8m1VBQlek7ppr2i88r1J5HbmCCzYVR0OLfWwELTtgbTbS3E2LZo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wnWycop8LHtsFFo5/sISPRU8bRawchWTlXvsQ378JjIVKDWy
	ubtr9bxNQf3Hfy/uI3/aWwmPQNtohk5VK9+zojB5JnC19BQaE4Gk/eAUYRPhg4c=
X-Gm-Gg: ASbGncvCL9jBS/1q2abWIzRNzQu4ROHWf3NCo9mZ8+dhKIFZmQEE1Hmmm2WETAP6jbt
	CTgE9hqVAeBrMvSMSpWxHubvr4ms6b145F1LTHvhPc2grdNgSX9OICyHFnmcTKJ60GtbB95Tbri
	k47gIqIjAZ1KpvrIbf+Gd4gC0Ve4Kiwwq7naKFyab7UGGUSG5T5OG5E4aHcMw6rxTv3J5xCSTZu
	Bjg7maXPx4fSCLVlGPZAgEoLc2OrIEu/czHmG8e/XgKZuAJ
X-Google-Smtp-Source: AGHT+IF5fGK4r7ZLa2m+qI5r0OgFGblEAcI0fkSDXGfPScJLkRcm9817axtMEaqmzm5LoWtpIkmCVA==
X-Received: by 2002:a5d:64ae:0:b0:386:321e:f124 with SMTP id ffacd0b85a97d-387887fe47cmr2895855f8f.13.1734020349363;
        Thu, 12 Dec 2024 08:19:09 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:08 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:55 +0000
Subject: [PATCH v2 5/7] arm64: dts: broadcom: Rename bcm2712 interrupt
 controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-5-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
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


