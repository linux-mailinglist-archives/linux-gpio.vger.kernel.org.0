Return-Path: <linux-gpio+bounces-14101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C29F997C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 19:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6679B189B6AF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 18:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA04E21A45E;
	Fri, 20 Dec 2024 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bc3Fd/+T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF52C21E092
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734718290; cv=none; b=o0SEHlHW9m7TDnFUb2pu/X9aUsvcKaB47jKKe3+D30J7UY0Am8DUSQ7MJrw37mt5lhhnA6lnHD5aWZLi1G4m/k9j7J0SLY9u/i6k2Szh8jdtNL4u920Nw5goEhXEdGsGmhqdjHuguj/1N/SuK/thZOXTA7CsHVk0y0cxrHKye6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734718290; c=relaxed/simple;
	bh=f4JY6yOakOEmuyUC4NcRoVc5/HAIx8k6tCo3tXdIsWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nc3yXH/A9OBK4O3UyHavP2MXWKmOO/+/t4SFuK0I0zlLFM2u8CzMU5VXW/lY26OqFsEwjA9jobXof4denRgSOUHcVUsA0LU+/039R+OvVXHZCQ6yo2HkiAwNQyt1rOC2qIteF5KbP25tc8cmGLf19wQD90VIaGXpbyKG2kBToKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bc3Fd/+T; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43622354a3eso15511465e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718286; x=1735323086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=bc3Fd/+Th5cqI+TKDeiUhgnsEJ/Jx1OQpO/cUfFJxOP7HdSaYOl3220MAc5cHOhOV/
         vQVfMtmz1GAffmoptyCbBNrXe1jul7da5WafKwiab5IGg37ej29C82VuIAXSB7t7K5Fo
         luCDVznrFKT3v9wu0KkXl7duZXswEMbetckN+LMq/j4xPmpRgwXSjRXn9+7JD4r8WdN1
         +kcc6Pf7Z+peaCBOdQtIgfGx08hNM7xexs6l7lBqdS5Z1o2ql/ZgAgT91j0gXkDwo9e1
         u8ZGQ1D6BH50s78tSqdvpg5YKwcMG8WkjyKvnEkAT3UYqR1QXAefofyhDqB6EURxfoc0
         +iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718286; x=1735323086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=CHCr6jDHVDm8XDlyQIBy9Q7LPuNhnucgjY2nOIX+AHQ3uJkc9xJqMWdXLPZXDSpAQo
         jOsJYXHEABd8OlLlwnWX5AZ79TMh605XC5c7zQme/mtmwDCaL+7pM6vlKwjyIb62o0RX
         lrMF2wqfN9Vy4CXdVwmVjBvlYo6d2r/yQkQv9pwnlsrwdK9wWTrWzwsNWgluEmaE2G0x
         fMASpgzQtV6/liTNeZS8A/dMfYh/IQ266qoA5EBm6fI2M27SxmC9fNs4GhEfyTUNxpWR
         coDBEwOhQmjlk5Bfl36MapbyrmsJIdLZYlwkh2sEf5NsOTvCa9Vcbvqu9RIH1TNvkX+/
         WXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkX0H5DGdmv+DVsDOUJDrAJik3PwWnzeFcNNR1U0Le81XM336Wg03ZfY/1GZryreNH778n/vIqrd8T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1QBsZfEqmWuXPmFl4JO/aahQLSsBzGmcCkhOIWF6kZfiZT+gK
	IpX/399JZCrlsYTrCl9RXwMtYImFjD27MqBeKVczW2Z8zfyQqTTm+uG98fRTnco=
X-Gm-Gg: ASbGnctU3OUJ2mdFaJkCPVNE9U9op/ABbZW8AVWCmM1TlLovcWWcs+e+ENVaZMFQRXJ
	KMdMGruxEm/Tj6K0aJdtSOjteoCvmJuvPyAji+oui53J6u2YSGi+qZftmx2AxPfH8BgEYx0xPa5
	KMpdbg59fP9ccPb/TvcEbCkNToeM+kjY6VH4QqpWM+17bVZZrYN+gcvpGdJ6fIBgEDHgpZB0nc8
	+BofQHVPLdHM5TCdlim+z0pPrw/NQb/PyaAiaXZzrbZ4wpw
X-Google-Smtp-Source: AGHT+IGkUJ6wiQ+PFzhrRg9QEs0JFLnzOAYHhAM3qA2cpb4nCgeQZdE914UHndE0hNBgPmIssevaTg==
X-Received: by 2002:a05:600c:4586:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-4366864364dmr37590895e9.12.1734718286362;
        Fri, 20 Dec 2024 10:11:26 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:25 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:13 +0000
Subject: [PATCH v5 3/3] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-3-cbbf13d2e97a@raspberrypi.com>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
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


