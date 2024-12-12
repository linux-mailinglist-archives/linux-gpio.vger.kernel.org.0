Return-Path: <linux-gpio+bounces-13825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01D9EF09C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F279328AC4B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 16:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984432336A7;
	Thu, 12 Dec 2024 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LN8c1uWk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83923231A48
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020350; cv=none; b=ZARTJ+wmcCv71kelizNrcxyTrOrTTUQ8++9kZW/dZo3dR9GErn15e9sL1rEZgzCf1RpwBSrIow9IdHXId7LUEAdFQiC6vmIPNnym1weuEBXP2rDXjluHpFq5gpGST9qFI0ejD9cb1hvGvI6IDQ0sZqC/z7xBBbjJNVicCi0rz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020350; c=relaxed/simple;
	bh=z49WJ/Ecx3cRmoavwvCyrBSrNBZWdJ5YBE+eW9OtjMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OCPRK1mqwlbRouc/XQTxRGKdJMYW+mFgrsYM7KNu6f4lfTIzKKo2dRGbbU5FWpv4TrUvA5JfX/dF/7AIzzLBFrWjlS7B266fEVaLU98TDZpFzlRKeCZuXR3xEb1ARqer3jYUjxwpfC0nL4RAdKUps47YN9gOKl1inxV5Jef04EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LN8c1uWk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-435004228c0so10350205e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 08:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020347; x=1734625147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=LN8c1uWky/LtsLuX3IMAYIO13wzKVv6rQ+KonJdKsm0AcTz6fEmhwIkf4nIYfEVwOF
         41MSaBvPoSGGJb5HxXKBaJuBm6FCcoaOHk1jeQ2aMZWjis5LDmnvnTbx3+hOd+XLu5By
         cpizOCm9Vf22CppP3GnY2xBv44Ulb+gtbFA8Bjjia+ke7BSNu1obegNEabbqYPco7jd7
         RGsEfvDdB5J3Mx47grWpo9q3GWTz+Du1qLRktQkvgk5Tv0h4O8QneiLJc5Tslo2wC83r
         Oehg61sxLO7eECzjKE/c2MHOJisWM4lEdfl1POlGB4XJYtklDn/JsUsJQomwZd4s5Q9D
         9F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020347; x=1734625147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=Jg+wlM8rRCxfA2BNTDvRTVvBxC5vWj4KYaRxR4sdb4YdQyIoLVokatmyy93i7JR13d
         DpcagJyIZnNYoffJP+K09kOrsWY+jipLWBcyrNCBV5DOOysLFSuabfortCVjSfrJZGgX
         Yh8GHWjz3jfk0A9awnNbyT9zJlD593pwoYMTfdp+Al0m0U6hi86w4O+G2vqtULPuVeqA
         kK6rIkb9RZ7Z40IqECCzbit1142V3jnQMOh0WErrKvZ5xgwsWfZCSu7xwALXozvH4Abk
         CW5Zol26Xsk/iTA+D6BUWiT72aP8KwICsVAX0CDRKGAF7ErTWENIhz9FQWXPHkSp9GEJ
         iPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWJtuppe3dSJqvclblIdEcf4ZVI5GBlsWUy7htZR2JBCu0XUWGxO1c9fBaiq6MrhuaW3YNhQr3Cq0c@vger.kernel.org
X-Gm-Message-State: AOJu0YywxFqHN7GS6TwNNdoCWzDp9CQm+yVstgo49HyRgb3SBOaD0rB6
	qaw0AXyxzWFP7myzmG+avcsUaBEX2aG2Q2l+Mje2qWFxlv0YWDIjdSUX9NnQuLA=
X-Gm-Gg: ASbGnctu7LgeaeTslSKjct75Ywwi1y5cFHKzFmcBJ3dLSvGS6z425ufiIGaCkLZKXUp
	ftlXPfdr1qhE/sIz9Kudo105zTtIwwmhYt7fglyfifdvPsmEvB4WZRdmKFBBvEnLaGQRkq2IfRS
	Zu/It0KSNPcKcTZG+lRiwNKN/aQ5WLpAo4OZ7nVddx98C6Lq4ulVxZAqSh9gJ+hvHdu3in2dDSt
	e8Yw8l+r5Eju4SPaQqPoe+4jZNcEdYO5VUYelLYjLUHj7l7
X-Google-Smtp-Source: AGHT+IHoZqbjRY4dxkOhKOSnSfMy3sMqazkkzCHwzeDCSj2+qMUGuSSsMXf/szART5dZ1m3BKwwUjQ==
X-Received: by 2002:a05:600c:468c:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-4361c396ad1mr69550575e9.5.1734020346842;
        Thu, 12 Dec 2024 08:19:06 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:06 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:53 +0000
Subject: [PATCH v2 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-3-35986e04d0f4@raspberrypi.com>
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

gpio-line-names is a generic property that can be supported by any
GPIO controller, so permit it through the binding.

It is permitted to have a variable number of GPIOs per node based
on brcm,gpio-bank-widths, so define an arbitrary maximum number of
items based on current users.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index f096f286da19..fbd69b4cecc7 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -64,6 +64,10 @@ properties:
 
   gpio-ranges: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 128
+
   wakeup-source:
     type: boolean
     description: >

-- 
2.34.1


