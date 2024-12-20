Return-Path: <linux-gpio+bounces-14098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB49F995D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 19:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D171980BCD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 18:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8061921D59E;
	Fri, 20 Dec 2024 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QVXO6xqI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7518215195
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734718287; cv=none; b=WuF3tAROOW5WacMEXL/R/bJUwOc1QoJAyF6X/ETG/Ni3cefOruNnvRMEX+f1G7p2f78RgM9k4aRpohsQ4pAPR0SMGo8JQtj9yV3kPdkqg1vpPxRdPaNLSSLXxCJwh9SZ28tVmbJGMItxKDF4GHQo6pTi826RnZRAIo6f8i6dplk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734718287; c=relaxed/simple;
	bh=p3izt486lgaqxHlyOHlJvYgabCV89bQ+h8+ZoXaCJWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FHKxtwYrNnKS9EB4da1r+ln8gAe8M2qF9CpaHXJqd0hRij+AZs7YcPcoHifnizLTFou7zIu6hiaNvoofDgTjnO22gezDSyCNwXdkL4pzdpzBNm5LwlvyN5h/XmmqESSGfm+Hf2hrdvZVBN9GXXNkq+0jdxX2FA269EnDOsr8+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=QVXO6xqI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385eed29d17so1183879f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 10:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718282; x=1735323082; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6BQVShD3NoC5b7ILwEQ6K46fu5E4ShUBfYTzpiyij8=;
        b=QVXO6xqI9jK4ghcxBgYL1K3BQGERH9kV1ly/3IVFj/zNc72rPHifTdn46cc78POPTb
         RGJgGRnAiHMWWzsr1jr0svFx8gnU+1043gEPOJs6KF+AP//Z1k9sK8LayZJlgCjztky6
         Bp+Mc8sHwiWfWqsdQlA5kXf02mObc/fgYEScpiuYQoZvfzZQlBtjDvMEHW/Bsg7c6zcq
         w9VDPXn9/k1ofjTjGjpzrVobnpl0OET8RgPLQ0W76VArwEZlohKKuV0hOa08ETZ/ppHm
         wW4DUc7pTAOtgXF+bZP4SVNoh0KMsD4xiqb/kigjm7wObBBcTuEuRako6lBlOlxW21jf
         3t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718282; x=1735323082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6BQVShD3NoC5b7ILwEQ6K46fu5E4ShUBfYTzpiyij8=;
        b=QRAqa3qYltZ62EL7i1IkS6BePv7qmiTyymMzmLZUet+7ACZncVcTnhr/THIFbA5Ztd
         VBL0+sUSW9/tz9JQ6bdTZL+6YOs01awbmL9f9Qgv/zfVvbRF70m/wgHxKtO0L+PYi4wZ
         oCfjsXqr7MBCitmX2tuwY9g2zRaklfePGF3ZIxdV3sH7cz73X+MmwFaRMHU2ssoTWoyq
         fjZGAyvM2h+YrmFF+EvBwHQ+cEBNSHIBP0+gyqZomf6CjFyXeHHFWD6duic9t7LFjHPp
         BcQ7rW7KJJRqYck7gWBHJkSTLhi1S0gsRcpWsSO4pYIovXvlr2tz0jBawS/JiefwIJnh
         feiA==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZRFcc7dAYu/+ysGrSR/vgJTn26cWkLYiIUU2Jxxr7d4SKRgTY3INLUkqRlP0xz/PC69+E8Y0CWex@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90K6cZtjobyGJb0VpiK9fg/cgQYnC8Ow6IdgOl/WAEqhPiQf2
	gsfdprqB7ojsFfmFA+sMpbr9kKQxpzH8hko7DZSYuSfsn2lNgL12kmGxwIIRlEs=
X-Gm-Gg: ASbGncs7wK/fW6DeiBuuRks0smj2IACapWPvA7H/iRuTR3n5weeXLqqk0rdTrhzoPZw
	SFQve7Nj5RUtIOApIkP7DSyBEmpb/7QyKd8pjwMvA+VF7gvRoGLRF0+/Yl8rSrm9cUMrRm1tk/T
	pAPK1sF1xqiXj96VG33/7C3oW0KGtLpKAO8q0GmcyhzSBYF3AGaojRLKQ4athBwf71LqNRYgyXG
	IHipvmGiz+K3vGEydDfYP1Q+O9iQUuT2UBad2K9XdiT/06T
X-Google-Smtp-Source: AGHT+IGbM/Tx3G6ve1QyNsrVLV/jOarA/uAXeuaovxRW6LqTq8ldWR2fwVR13hiCBtPxlntlYTq/qw==
X-Received: by 2002:a05:6000:4023:b0:385:f220:f788 with SMTP id ffacd0b85a97d-38a223fd77bmr3911254f8f.48.1734718282035;
        Fri, 20 Dec 2024 10:11:22 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v5 0/3] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Fri, 20 Dec 2024 18:11:10 +0000
Message-Id: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+zZWcC/4XQQavCMAwH8K8iPVtp02zrPL3vIR66LNUedKOV8
 kT23V/0XQQHXgL/hPwCeajCOXFR+81DZa6ppOkqodluFJ3D9cQ6jZIVGEBrwevxpge6QGdBx/T
 LRYc4GPbBBOxaJWtz5tdAtg5HyedUblO+vy5U++z+Y1I+sWq10TFQ2xFB7H34yaHMA+d8n9OOp
 ot6khXeGLvGgDCu6X3LBkcTcZ1x3xgnDGLoonO9cc6uM/jOrHyoojANEnk/tATQfzLLsvwBjLr
 YbosBAAA=
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
Changes in v5:
- Removed all changes to HDMI bindings for earlier hardware revisions.
- Updated commit text to make it explicit that clock and interrupt names
  are required by the driver for 2712.
- Added clock-names and interrupt-names: false for 2711 and 2835 (the
  existing variants).
- Updated commit text to state clock and interrupt names are required
  by the driver for 2712.
- Link to v4: https://lore.kernel.org/r/20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com

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
      dt-bindings: display: Fix brcm,bcm2835-hvs bindings for BCM2712
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 76 +++++++++++++++----
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 88 ++++++++++++++++++----
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |  2 -
 3 files changed, 136 insertions(+), 30 deletions(-)
---
base-commit: 29978a81e62128d2cee56f066ec92de584f4ab5f
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


