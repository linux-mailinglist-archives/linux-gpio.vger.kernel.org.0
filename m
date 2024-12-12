Return-Path: <linux-gpio+bounces-13822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB2F9EF092
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221EE287611
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52A0231A36;
	Thu, 12 Dec 2024 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GB8IKFnM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F7223E7C
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 16:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020347; cv=none; b=dfQY5I8IgJ4hi6wYVuY4/Da4qPIk3Htd5vcjmDhG338dC1xVzsc3xSr5woXDUJQ3QxcXK7diDfttCjuwMn0L1xcZNPCMqayU8Msk3oytSQz6gU+xJiiBOPJ/gW6d1HwXcZFbrdcvqpWheprt0s5+fi+M9eYcA/Kt3BaiMSV3NUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020347; c=relaxed/simple;
	bh=ediPT7Oqlg+YRMFwjtENctOZgPBi+bwG3vdK1w45XiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qFmpZpb14VnXMB6QcrtQ/AbykNJabvDRblp7xTCKhNr4Y7sOnPTT13ZkwwxEW0Zk0PNwiupr9KmyzAvmzH24SmJ4tUHyfxvTNTEzKo1eNLqomXjfUCxtklsSELoHdT/9sWG8WoU/17cQHpoejzSGSdIh6w3RZBWcwD32rDm2mP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GB8IKFnM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso5843685e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020343; x=1734625143; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68JInAhAW5Is8mwm4BYMUDXa8RJRJvDNCf4zhjotoGo=;
        b=GB8IKFnMSUixu4Jo6png8ZJAqTiwIQIdTrtZSXCOKoy8yB/48qj7FkXO/zvz94LRFe
         y3euJQjjkoRaTr9Vf/BDw6gaWvxFrMqASBnwCo5bRX3C9Gpu5AOXJ+PddTsg0rN8RFxK
         F43gU48Tl/rYNGymMAu7Fp0fY2vAJ6hWf4RyLCx1JjM22qwhkEbVoysj30PejHYEjgBS
         TOGAhusfscd0Fmwj9CUqXaqfi2qJPQZ8uw7liDVmKtPN0GB82J92a92oqgbxf/QFSkEf
         vHmTSISW58+Q6qr8ninUifposl6iLs0Dz9fjNTBs4c83kyfzUhemcB2ll3Pa4AITd+be
         7imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020343; x=1734625143;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68JInAhAW5Is8mwm4BYMUDXa8RJRJvDNCf4zhjotoGo=;
        b=HQgSKd5BctCmpBJkSN9c4BWT55hPyxBY4wBb2DtyzWLYAlSaLoAOEXKTxNG4TJ+ill
         x17aCmIupRoZcrd/H00NySJwrUZRV4kSq0tnC4kuaQoTD5o1RUt9wLBrkneQNxkmHl/3
         g61vasDU0pi6mgFn62r96hPdv5fVoWItx4T79+bbsgDk5o+63MaoUy6Cs7PXHquGQoaR
         Tb7N5CbVQw2Nji+NF0sgJsB5C/9XyQqRjG0nKXbm06MZdIb70ncPiUG0vehTJYqu+x17
         ckE6940uVL04JMHxTGfaAmS3kM6PQ/e9Vi4qkZuutn8LvM7aK5g+Ho7YsM7uz5GbKB5r
         STmw==
X-Forwarded-Encrypted: i=1; AJvYcCU+d2CWodkf9iod12vjq4kKuQxbj5Lzba9wKExZMTnXhzwxIklYQ+bt8Vtc10yPyV+g19jEoj6lWtyL@vger.kernel.org
X-Gm-Message-State: AOJu0YytOtC/3/TV2YP5pg+jM2sgIaawsMbGmf8e7xBMeJYm/pL3ZQG8
	KmOHhH3C+T3XCB2By5QPoaVqQ61mOR1YADWa4ZS5lla01JgHz5JkAZYj74mG07w=
X-Gm-Gg: ASbGncvQn+xsVTNCO70V1v06399SIapg3iUhRVCAQ0fto1Bu34cWCCf/BTqTkF7DZCU
	SGpC25Ae/T9Kam06PeaXkb1JcXD2OKha6Wy/gfNftCq9gygwkeqHcHpIgkFiu4wkz2kn9ecmFaV
	sN+F2CxtcLjpYnyvA7xWSCvHgc4VP4IH9Y17ts0lpIfo0K++a/CePJMCYi0+bhbtisAwhuyDbix
	Xp+M/suvdWel8jpfyTWvzz7uKauNbPzvKM3Q7bpjfTHMQeD
X-Google-Smtp-Source: AGHT+IHBf/CkYwwV5YCDCoDlBGs3t7DJrHBFw8STBH4yNhFZK8NKI7+uk6ZO9cjpKuabgBSSS8Q7eQ==
X-Received: by 2002:a05:600c:3acf:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-4361c346253mr66269165e9.4.1734020343031;
        Thu, 12 Dec 2024 08:19:03 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:02 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Thu, 12 Dec 2024 16:18:50 +0000
Message-Id: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoMW2cC/2WNzQqDMBCEX0X23C3JImp76nsUD2vc1Bz8YSOhI
 r57U3vsZeCbYWZ2iKJBItyLHVRSiGGeMtClADfw9BIMfWYgQ6W11GC/YudGqi2hD2+JyL4z0rD
 hsq4g1xaVM8itZ5t5CHGddTsfkv26v7Es/2PJokHPrqqdI39r+KEcl05UtyVc3TxCexzHBw0Ef
 TW2AAAA
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

I missed the DT errors from the recent patchset[1] (DT patches
in linux-next via Florian, DRM bindings patches on dri-misc-next)
as Rob's bot report got spam filtered, so this is a fixup set.

Largely it was changes to number of interrupts or clocks in the
bindings, so those are now covered.

I've fixed up the missing "interrupt-controller" flags for 2711
and 2712 whilst here.

I can't get my head around what is meant to happen with ranges:
"soc@107c000000: firmware: 'ranges' is a required property"
The meaning seems obvious.

However if I add it then I get:
"firmware: '#address-cells', '#size-cells', 'dma-ranges', 'ranges' do
not match any of the regexes: 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

There's obviously some other flag I need to set in the bindings,
but I can't work it out. We have similar errors for all the Pi
platforms for one or more nodes.
Please advise and I'll happily fix them all.

Thanks
  Dave

[1] https://lore.kernel.org/linux-arm-kernel/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Thanks to Stefan and Krzysztof for their reviews.
Hopefully I've addressed all points raised in the correct manner.

Changes in v2:
- Commits have now be merged from drm-misc-next to linux-next, so all
  commit hashes are valid on linux-next.
- 1/7 Removed references to "previous commit". Fixed up indentation.
  Added maxItems
- 2/7 Defined widest constraints
- 3/7 Added maxItems and removed reference to Linux
- 4/7 Described the errors. Split into two for fix of node name vs addr
  being wrong.
- Added new patch removing "required" for interrupt-controller and
  interrupt-cells for bcm2836-l1-intc
- 5/7 (now 7/7) Removed the intc node for 2712 - it's irrelevant on 64bit systems
- 6/7 dropped as updating the binding is the correct answer
- 7/7 dropped. simple-bus claims ranges is required, but adding it
  creates other errors. I'm unclear as to the right solution.

- Link to v1: https://lore.kernel.org/r/20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com

---
Dave Stevenson (7):
      dt-bindings: display: bcm2711-hdmi: Add interrupt details for BCM2712
      dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: gpio: brcmstb: permit gpio-line-names property
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
      arm64: dts: broadcom: Rename bcm2712 interrupt controllers
      arm64: dts: broadcom: Correct hdmi device node names
      arm64: dts: broadcom: Remove intc controller on BCM2712.

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
 .../bindings/display/brcm,bcm2835-hvs.yaml         |  83 +++++++++++++---
 .../bindings/gpio/brcm,brcmstb-gpio.yaml           |   4 +
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |   2 -
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  13 +--
 5 files changed, 170 insertions(+), 39 deletions(-)
---
base-commit: 3a6b7ba51f16c093420959ab2bd3476d180547fa
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


