Return-Path: <linux-gpio+bounces-13836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0059EFB19
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BA71882CA1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C53223C46;
	Thu, 12 Dec 2024 18:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OJ5vDW3G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA7218594
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028603; cv=none; b=oE/b+UcA6gR75FUAKQh8fqZvNMmxGpKoYdNCGCCoIe3qGMCrr4UrKnbLwb5L5Adyb4vL3zjt1HorRLthYCPKhDcMo1T1dxf5p1yEzFF5kJ4EibhPuADXW2AUQhddNOTDeRWeeura+uhBh/4rUWL7XnCj0HPrjAjRRXJib7q+tHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028603; c=relaxed/simple;
	bh=E6wM/3T38SY7+DkdVv8mz0g9eJS9zIkOcgoxLdEo2xo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MFZbxG7hAVCyoYP2e+70keS4mTi5dFewItoIF9/MlAC2wiIosJD603EXWSI/8VQoQX9eBZzjqNdYbwUz/hH509poDOmSvfzS1k5kyItFhnayypiWp8ZeRxGoOJL+JqlrwBkvl5UtYUr5Rs/kTK6Gl2Fk+RgEhfK4k4YYFDcismM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OJ5vDW3G; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso10079535e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028600; x=1734633400; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv3fbXAGrIYdfjN2UmggTGBbw/plczA+5BniWAkzYYI=;
        b=OJ5vDW3GO7vMCzkjwF+2Lwqy1q/6FLmMO8VdLKYr7Rqjkzx0BehtpEAxdCYQJxIwh8
         OHLfcB8TXy48cn/3J2E7khLy19BfGoJarg1Ag7IVDKOA7nK6zuiPwXYJiy6GLVfiZZZl
         riQ/lszscS0jZJTsJsDmGNNMLU7TElzOS5yCoyLsleL7je1jbxfUCCxCV/Cr49Gok7Sf
         etVHrDk9APXAyaBQdAv/696ppN70OS+di2wgFULS+rQNkcZUkJ1BrHcz/ZQSkwRMVPC6
         bT1yYFGcIBVyugGPFjWg1rlXiQ75bxabZ9jOFrZYyCp25RaKTR0MuRFwAkxpDIIWtFkR
         vGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028600; x=1734633400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv3fbXAGrIYdfjN2UmggTGBbw/plczA+5BniWAkzYYI=;
        b=OI6fSHDgMHN8HBurJGd7eixN7jq4b8j7OsSn7NG8YVry8n1OxoHzZ4QIxZyLxwqQXs
         ZOyHDXkMIcdeMf58YWzwWtQtFmc764QWBsWDUyKWN6lR3xprHv3e4q0HbeurjtqG558K
         +TkWtXoZxdeqhJTYUt2Mq8/Zckwtq7LqJlGPkZbXbVl53vSTRVirguD7VL7K76R+ANib
         ULwWSbSYwD54PwAGfTG/MeWeEVqxT6hl7m2mFyu2tljMxzb3As0/ednKkmPLnFdnvoI+
         8ryKzCi4KNUHXVjEt9i1W0X2nFVaDZ2ZN62HRK0e7O6fG7DBzdkJCHHZMXgDIg3b+230
         PTLw==
X-Forwarded-Encrypted: i=1; AJvYcCXNFtPqCXaedQ2e/r8R6scwCPOedW82lY9/1E88F9/y3mDsYUmyh5CHr+FtOx+VqHVQxFc7/Cp6ZhvT@vger.kernel.org
X-Gm-Message-State: AOJu0YzzVLM/RPt7TTyGgtJbe8WahYzoQsnnVYWwmWcww4HQ/GRYAICa
	1LcL6Vh196CEfHRlCY1ChBtD0byInTnuTmw0XYUCRE5+t6GbWRnfEWvajbnbMbY=
X-Gm-Gg: ASbGncvGkkekazwCkViTE11BiutEOdr8/t0ygadxQVHBz/RmInIzCfmJ4fb+qYzP1sZ
	YOfuZpiqe+07xGb+RzoRbrPGJJuaZ9he/jOCdgD3hUfnicpNsYby1eIy17hZZgiatAG8MqY/tI8
	H82sOtMuswQZjyPfLMTU1M/P8AJFhxJxRJ/e4BX/WHRv5oEu4+RNmgWLjI8SO9UH+XIBSc+CSgI
	RwaiVCYFQ5oHHxlBOtLawoICnNps58E9atrQmJ661rvJ90i
X-Google-Smtp-Source: AGHT+IGhmyt8mpOnXb+dJ711Uf3mlUnOYDVx9MCQVeQjzLSO7tEtY0jrOPhc109rLLEz5hKiOUUacw==
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id 5b1f17b1804b1-43622883cd8mr39949565e9.33.1734028600168;
        Thu, 12 Dec 2024 10:36:40 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:38 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Thu, 12 Dec 2024 18:36:27 +0000
Message-Id: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACstW2cC/23NPQ6DMAwF4KugzHWVmBQCU+9RdQjBKRn4UYKiI
 sTdG+hSiS6Wnq33eWWBvKPA6mxlnqILbhxSyC8ZM50eXgSuTZkhRykEKmhnaEyPpUCw7k0BtG0
 4Kc21LAuWapOn45Baj2fKnQvz6JfjQxT79oulccaiAA5Wm6I0Bm2l9N3rMDXk/TK5qxl7tpMRf
 xjxj8HE5LdKFcRly608M9u2fQDf01M7/QAAAA==
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
Changes in v3:
- Fixed up indentation on 1/7. (I fixed it once, but obviously reworked
  things and lost it).
- Link to v2: https://lore.kernel.org/r/20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com

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


