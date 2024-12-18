Return-Path: <linux-gpio+bounces-13985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51D9F6908
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 15:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E6321881C2C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 14:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE421C5CD8;
	Wed, 18 Dec 2024 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VKAuyiJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D2F1B422B
	for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533329; cv=none; b=smx5KRfv/lt+1NdLwQ3bF2BYXlu9EkSNBlAdG3L0Jg8lcsew8zJqrMwS/cXs6r7ulBslVRNiUBylPjPUUTZJddI6UL+jSLhUOjlVkbjvO6CPlOovvpp0XiV6KoFo/jr7ZXeUA7yzkYpObmfYXCgKyEjAKpB31Vhwq3fy7IlQdTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533329; c=relaxed/simple;
	bh=BYkeQ6I1SppgA+w3nw0Cj/xI6Q/rY3ZxcnNW92aOxjk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mIXwIfNpXbhYaWs7vBa4U/VLgej6tbMBGFJLaQq71LHVhJq4AulYzioBrghLOy8SqdnYDPBmRi0wTMPNcKq1yp7RLjxOl/Fzr4vcGvvQA1B3+t50coq5sZM0Oam9L+otRI5A1OmRjYO7OdyF+Tu0opqtzkk1yh0CCJw/M6+fSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VKAuyiJe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso68223325e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 06:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533326; x=1735138126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDXweG3kfjLb98/KJdEpbSiDTI7ao8N9Ii+NpOdwthU=;
        b=VKAuyiJeCVN+bB7rOGIgA4zvz0bzcvr8xymdFGuAgljAWHk0NZcI3XIL0p/ISkXTJg
         yvKSziW9YETzkV9WJGl2OQswsGuxOJC8gheQazwLfXU804muBeiqv6lckAVInjFYklwy
         xfSP87tT9QCC0SCFY9rQ3GCGGKdEjGJC9ah9Q2HUGdBwy1Z+uB6srQdvuS03oXw9qUXD
         J2SmW1dKvLaxU4dxRB7x2Hh7f13pL72CA+RsHaqCFB3T+l1PfuIr3QWwEJQ7rVKfBG/W
         Qq+qK7ul4NQ67P79zLkdzYn3TPi8en4fwxC3S0PbEDOzioQHkn4XmoCRip3MVXEREegF
         yS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533326; x=1735138126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDXweG3kfjLb98/KJdEpbSiDTI7ao8N9Ii+NpOdwthU=;
        b=JMf4kjxgylP53gFAiG+CRCYJELRQFoqgGq8a0B5PssMTsSEJWW73AFxy2OL/cMgQJu
         BCQGIKXpolzTgGfugXNwJgfh8wtaVhQLbthWlVqKeAl8vw79bz8ti2fnhGSQj2rFsjwB
         XDnC8goPQ28EVPNGgx/5PZK9Xgd1Fx0ME+dI2kS0HzFKJXlM3pZw/YFmwPg85IAye2i1
         0h9HvsgUDHjQ6S2gp4x5van777shBYJnylWdtBZcsYTF6ce+hsPJXHEqqDLHn8DTLm1d
         jOJCIPTzaTcufrL2ZrVWUIdTD8A+qUhRUvDBNaGtJg/vmJKwTMxvi+/TgiunZGPta/Q5
         o+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXzAGVVpJuKlKex2nM3KKpg4XJp+I8mzDXg+wJCdOJL1k5RMbXR+6cI6qZ/WzZ7DTtC0dpPP8amrGCM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHjY5K5jhpKAB6Pm+js+J3P9sIJSEjc4puDapheS/MdrHamE91
	IJ8SD1Vj9esK+GiK1Z5RE6rhZFKDEPLcQ4PwDAW5tv/Sd2K0ndHngx4BnMqyEZU=
X-Gm-Gg: ASbGncuBYU2oUb/t+IFenCYB5FXd5kzOwhHLKrQCHpfvvuila4QjZpSc+/J3m2ZWOtj
	ZOcB+SasVuFPaCDbOuVxmxFA+Rfr9uQ1U0ePttP3xO5A61SKyP3EZdWDfeIAWlUX2Ld/fil8pYQ
	C1LtAYsLliDuElr2wVcpFK4uQTuEzcekrID8RCs/58tPx5C0c/lgA+kfNK10CNXfme1cZy6Ga1A
	mO6Xm9UN/IfaGYrzQMQ03cMu63VqD9sLiCElNIpaX1m9jd0
X-Google-Smtp-Source: AGHT+IFfdDvNqrmdKCha+Q3H8l6Dk2KAYhMhcpN6o1VocErcndhaGCI/5Ui3FTDsVOBZ1XMcpPOdcQ==
X-Received: by 2002:a05:600c:1c1c:b0:434:edcf:7461 with SMTP id 5b1f17b1804b1-4365540c077mr31551435e9.30.1734533325609;
        Wed, 18 Dec 2024 06:48:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:48:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v4 0/3] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Wed, 18 Dec 2024 14:48:31 +0000
Message-Id: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDgYmcC/4XNTQqDMBAF4KtI1k3JX03sqvcoXcQ4qVlYJZFQE
 e/e0W4KCt0MvBneNzNJEAMkci1mEiGHFPoXBnUqiGvt6wk0NJiJYEJxLgxtRlq7TmguqA9vSNT
 6moGxzCpdEqwNEbYDtu4PzG1IYx+n7UPm6/aL4dhjmVNGvXWldk74ythbtGmoIcZpCGfXd2Qls
 /hh+BEjkJGXypTAVMO8OmbkP0Yio5TVXsqKScn3zLIsH/vnawREAQAA
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
Changes in v4:
- 1/7 Removed the duplication
- 2/7 Added "minItems: 2" and added to the commit text that the clock
  and interrupt names are required for bcm2712
- 3/7 Already applied by Bartosz, and 5-7/7 applied by Florian
- 4/7 added Krzysztof Acked-by
- Link to v3: https://lore.kernel.org/r/20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com

Thanks Krzysztof for your comments. Terms such as "widest constraints"
may be obvious to those regularly doing dtschemas, but not to me who
does them once in a blue-moon.

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
Dave Stevenson (3):
      dt-bindings: display: bcm2711-hdmi: Add interrupt details for BCM2712
      dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 +++++++++++++++++----
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |  2 -
 3 files changed, 137 insertions(+), 30 deletions(-)
---
base-commit: 29978a81e62128d2cee56f066ec92de584f4ab5f
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


