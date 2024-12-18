Return-Path: <linux-gpio+bounces-13988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C235C9F6920
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 15:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 977471745B2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 14:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C581F12F7;
	Wed, 18 Dec 2024 14:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="saK397Qw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694F1D5CD1
	for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533333; cv=none; b=jsYwUDsKTmWfRqT9o3jicQth6Qk2MS6OOjCdY1jyVq3zz1EB3Q4EpdfkHjTZGtOA7cscZg+/KmbMdFTzXklwPleDpeuzx1L49VagPUCmGoX6BhwUDJg9sUljCVYC9IcwteUbe4pakQXgL21+U+LrH9bzc4wBBLIEN7CxbDwNgn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533333; c=relaxed/simple;
	bh=f4JY6yOakOEmuyUC4NcRoVc5/HAIx8k6tCo3tXdIsWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBuGZ2HvjV4W5iyiiTNsrLnHUmR59C1bVwsmzD1VU1vavIg4lMJMuFUnawtlxwJDAc9lklMl0jUPkJMrAm/ZZ+3rdvElubnnWcE9Sl19IuVpNWVnHYaS6Z3n2iUmEgXgKv1SB5u1XZFIrHSICv/ikrkk+Z9Wo2SfoGd9w+fIdLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=saK397Qw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43618283d48so47706765e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533329; x=1735138129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=saK397QwWQB0F4H40bq1cr59lkMFhZKLPxkNbqtZT+f7aYAxjS8dk11KvIoPspTPmU
         GKob+E/LGoNfXlTGbU5esYYEXUgQpTxp0qFyEscIyfXOfL4YMdlcOA3WxYBq9On3cYJg
         EgQMGTraymWGP3ImkYyZ9RQWpa2fQBMroU1aSOVzZOg/qmNKxk14dDoZYlAn1RkNKpt6
         KJGI4MCbjSobn9vEgJBeulUxE36gWFN93/HorlerJ6NVCqPj2DX+LUflbwmnvpuVMre+
         JdbHjwHCME0Ex+5OSb+DEY75KlJWEYugpjrp0d3Q3lZqJ7dyjJlH3z7qY4XwNMvXHBLR
         DK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533329; x=1735138129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=Zs7tF/ASn6UMhVPGzg2XmqMiIxZtLjaGPEeaOaaUNhZFQmQj1NAkYRS9/N9hk9xI1v
         V/cgZulaAl3q/cJ4vLs+PCh/kmJ7tGNkve3R22oNKm5MdJLiOV4FV6xOMFFJTaalloZ8
         XYezQ48Hk20+q/AvSoBZEwwxXcPtAYxx7c+zGaiR3WYYblfGCK4Cb+jklII3iOFquY3Y
         4aJEHYrXjYQAcR/UbWPsEsXu6SLSanJOmDN3FYrnRJeVRV8QNJYEI66ZIJs6QCeCczhx
         5P27nLJOrdCUQ70ibPyujnSovIToc3EInUCW4FKNWBJRlok0XnJo83BageXk66jn9IXW
         rFdw==
X-Forwarded-Encrypted: i=1; AJvYcCUSEWB90A3P4Raq7f59f0v0bXQYnKkaKjfxtZ7zxgkHfq2EzNnAimBQyWj0W/G9Uwk2iiIe/Ldh/D+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7x6sMJzeWZNn2bz0apxuQ+eA7C+1VkC54bF6Iax2HYWs6tu5x
	rbqserRTWpBCUTXREYPjty7ixkHvHeuY/wl+a31PccP+mh/x7HfXMIat037dy20=
X-Gm-Gg: ASbGncs8URUwwlUhieXJ10uVQC4dP3yNccZsv3gajzutasmG34Lo+YEbQZXOqOuO7cD
	5B29e4CtkJc0iEVo7mJo/7rxySKdu5+3UAGyASn5fcuo0UTqWp6TBY7i448awg6FwQ/PcqS6v2T
	aszpZZmOXLK/BqCvbnHvFm6UN+vB0DEomSXHeiQMy3/f7u6rxwdKSi81GtcLlY1Hw+vah39kJx2
	sizASRFPxWmt/9GXG+TgeJ1yUZJvQXtT5CjdJGXVdYNW2LN
X-Google-Smtp-Source: AGHT+IFUOlaIMq0ju4X1pMuz5qrQnXVsaODM2WgRs4TsUqex3ceWQT/oN7hnGqCDlfDO4YNtuXpslQ==
X-Received: by 2002:a05:600c:198c:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-43655345207mr24910305e9.1.1734533328637;
        Wed, 18 Dec 2024 06:48:48 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:48:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:34 +0000
Subject: [PATCH v4 3/3] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-3-54cc88b6c229@raspberrypi.com>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
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
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1

Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
base address for the smp_boot_secondary hook on 32 bit kernels. It is
not used as an interrupt controller.

Drop the binding requirement for interrupt-controller and interrupt-cells
to satisfy validation on this platform.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
index 5fda626c80ce..2ff390c1705b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
@@ -34,8 +34,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-controller
-  - '#interrupt-cells'
 
 additionalProperties: false
 

-- 
2.34.1


