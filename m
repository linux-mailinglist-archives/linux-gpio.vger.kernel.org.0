Return-Path: <linux-gpio+bounces-13843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4D9EFB35
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB2328A179
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABAA22A7E8;
	Thu, 12 Dec 2024 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CmwF6xds"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E13822966E
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028612; cv=none; b=YDXdbwZLi8V1WO5wK8aSLEDsE+lEIDHqF6IwIN4Yp4DfeioZ+8wsKFAu566xWWgdOv9FaHNRjrBldgGY/1lgvYHxgcsV1sweqqtkBcjT/u1wVCAMK7QI9bIKUPNKGVXzW3adte4o6nKoe8MEYU09305Z4fnsA3/O8r05lutrxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028612; c=relaxed/simple;
	bh=Qqxoymj22X4R98zAPdTR2WxILJdbVSevs8eEpI4zaVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fne38JwNOOxAKBfMrR29EjBDWrWjD+Ll9Wl3Wpy8V+tEKNEEMudU1glaHPnMDIXxIyOSGHb0ti499aQQEAckbDeGTzkIaCe+Xdb88d2FSh9kEcvtT0iHlnobXMT0VccXl6jwyXlubYNXh9hnTqztoAjQ28qDvMTz33xP2gJoewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CmwF6xds; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso10071655e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028609; x=1734633409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
        b=CmwF6xdsMw0+T6NYcQYsopv4cTrT3SeGlco5yU+thZif3jU4Jy292itbCv2lYiP9rL
         3u8R2lFpr9t/2dVp9ZScKtBbYx4/f6icj12Qbi3dW9UZP1xwYT5krOiDQ3AeqWhJrC2Z
         ARXSKtbd//PnDXBmzQLlMw9jPIDR7hiuxRONTSov0gQgRwSacHD9OVHYcMK3t+NWJRgp
         h00n/vVCHMjR7M601hBATTdkhH1yBbTyKlnPeFRJKDmyE7U50NACr0DpiNELyZ4CdPVK
         qSESpYWd/tb/ai21wzxDVQJsvM9yRqPFoXiwBPzx16DzQ6R49SijwHs0fduH9AespLkB
         CtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028609; x=1734633409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
        b=UsbQ9ZA1MmwaCr6vjVNElvtnWiOKjUlrM/XYydbznTi5o9q5abodA+jJi61ryRMG8s
         DBY/4qDqV62dkZH6ZEUTj0dcF9O+NRXh4XVtSbosfTG05LNN9HP9DpzpVsFJg1WhD36B
         yu3rwWDzlp/XShhgjD9jMolCWSn1DeuAkQUo4xLrklckwlAdTvxsahTQBGRroph5sK41
         IXeqeavkeQr6A5XPo/s7UWMjYY/9fLoaxko0FPlAT88Xe2svuR8SwSblu1S9zcrpRpPX
         tu4EVqC3YeBaBPmFP70jcwepK8cO2S/7MajjpVM4yTK7aSuCmRoiBjrHMn6qrAcjlw6a
         O+iA==
X-Forwarded-Encrypted: i=1; AJvYcCVY3BXGpXWYN8oqUw5HZZPAQSJmgZi9hQdSMCU6jEUdpJZaND8swzSjg81yqUEYfw69gKK4jNHNl/AT@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCKJ8RdsLnMjyNfaD9lkF6XwNXwFqzUI46dlF0w5tm6xgs2A5
	n4NIqwuZpJj/TwFLnUTIM9v5CFVRlqRkprX3jIZyKj/6uQLex4Zla/Nn3QSW5ng=
X-Gm-Gg: ASbGnctTge8WFgDUdLuJTcIKNVNDr68Knj1pRVs2jynLd6QSBzPf9gfwV4M2ugjaFLH
	c1oF+uXucG+PTLCNGIIi2jcwzW7W7tFK2wnQ+XP/usL+f15h9W7GLpfEz4I+WuKL5obV3OkTRHT
	GpvHzvtd2osO+x7JZi8fAS4xA37cWHlebtgHUjKuOaBhqdLz5E6oIauG/LMDjX1sQbUUc7XC9nn
	0P/9oKBBU/OWNRrOPAkxEUnbhbf+36iJZ4tGpfzcdSCG6NJ
X-Google-Smtp-Source: AGHT+IHxOChpNRcv2gtV3EutMkkx5eEcKsuaWzHm1MNie1E2mh6dZNeg/6vYwQX7jygVWMDmg6R6rw==
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id 5b1f17b1804b1-43622883cd8mr39952895e9.33.1734028609546;
        Thu, 12 Dec 2024 10:36:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:34 +0000
Subject: [PATCH v3 7/7] arm64: dts: broadcom: Remove intc controller on
 BCM2712.
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-7-44a7f3390331@raspberrypi.com>
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

The brcm,bcm2836-l1-intc controller isn't used on this platform.
It is used on 32-bit kernels for the smp_boot_secondary hook, but
BCM2712 can't run a 32-bit kernel.

Remove the node.

Fixes: e1417095a139 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f42fad2d8b37..9a426aa27c74 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -221,11 +221,6 @@ mailbox: mailbox@7c013880 {
 			#mbox-cells = <0>;
 		};
 
-		local_intc: interrupt-controller@7cd00000 {
-			compatible = "brcm,bcm2836-l1-intc";
-			reg = <0x7cd00000 0x100>;
-		};
-
 		uart10: serial@7d001000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x7d001000 0x200>;

-- 
2.34.1


