Return-Path: <linux-gpio+bounces-13411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E039E09A5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 18:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1E03B80D02
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 14:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D8520E016;
	Mon,  2 Dec 2024 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="rOVlOKqN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E6C20DD62
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149951; cv=none; b=jbBYT+bO3kKJdCamh/vwfZzYVweatsIQittX6E3WRMvZHkMawIHQUrtlfbpxnhgam929RIfqCALYxbmyCZWY134/YU47/AtdWEdhMGPec0T1sJXoxR9Swdd5hDGREQOGddP4mV3ZINDLmQEbi9j/CZZ1DAEV2Zh+sxWX5FhnJek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149951; c=relaxed/simple;
	bh=VpIZ3WAj8mBewaf40+mFXB+hswqRhINEMgjB6sIu+Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCoGTwyMfMIbZa+oZUcl7CRE+XCsNMytmGAN7Nwq+JG8QDoKiVLwnGUkf3KWUMn13pR0nSSQHGxWj0Qt4/vgWSGK/PLPvk4ntdbL+8mFxksVzEI4+2J5j3gMS1BoBkZVQg2xMP22ndnJEVPs2EXOJkqpNCuVH8wio+xjvy1SSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=rOVlOKqN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a736518eso54702075e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 06:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149948; x=1733754748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoO0W1lzMLcOdS6iQBTqdnnGTSDtRuJivefn0QP3emg=;
        b=rOVlOKqNRaLJKPfY3LeLf/dLnSSeXjaRxsQZ3ndhAbTn+WPM5mMOfZK5mHYLoTAoTb
         rIPIjMCgH/IsLoxPZ/VVtYOPR7kS8tBpQ6xhvkTOPHFalKq4exvumPcgA+1I/JpLUXkV
         30hEk+3a9ctVtM49gCRKGKVcYtgoCM2JSzNkUi3RXX7oQDjEB3GkAwz3xOs1B+FA/WrI
         8JkweOd3LotNUxRnQfTBL6TFRFUK2hLA4Hd/5E8xw9K0iahBAVWnSo4Dto8vUaKF3hdb
         dNw/xE1mVKyGuD1KYR5pnQgnUJIRZgsRECau15nVVwLSjPmG06W7bswQjth7a6Fp3Cou
         WZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149948; x=1733754748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoO0W1lzMLcOdS6iQBTqdnnGTSDtRuJivefn0QP3emg=;
        b=uSFOHulFpaSQ31/ZExhTUhpdVro+NHmL8MR3j0G7ntZE3Qi8NgTwP0QrBQTwgQsaeU
         eJ4is6dBB3HrHwziWsC0MNdwG+Pu5Tx/+rutIHyrTJuCFJNSAodUdru7a++ZNMmFlbEX
         VrMKaOo/BWuRW+Sj7CbRvnKFpQqLZw1rqS9lSluC+pV6NQtvYjpBRHE2B4dhoT5kBUeS
         DSG60/h3r3Q2mVRDVy3n6XC2l9W7wZrgabZgwRPsTrHzNAHR4qDRRK2ASzldb442tCJ+
         1H2N8STZFk96FmjyrdWCTXwBTPfdj92gGVv9YPESstvqnm7Qdheyw8N4+8l61c7sfLcf
         cynA==
X-Forwarded-Encrypted: i=1; AJvYcCUfDKJTeyC3qXnlaWa6gLwiuSRY65WZJVj1sFN2oRN0XuzkJv6K451H+La5B/5I0h8g2hR9shC4Mafq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx08MHb+WcQz+z4rH9Q2Q8NpSg6OlPf+MDV4Ms7UoKJPY4JyQk
	H1T4XmZjS3d8yE8BGBSnhO6qnS79C6nZwhy6EW5hS+/khBvOMCDx0AmYJ9ZLvBE=
X-Gm-Gg: ASbGnctULyyphMB3NAdqQk/Oeh6O608WFp4jkWsdmilEbZvv2FRdajpR1Xdf8UC21e+
	9lAPYZs+G0eWkRuBmB/dkrfbz3klbr97n80NF5q1KH6Dk1lse79iw6qy7sN3f/IHP54Dcnf2Mtj
	dvI4WNMmbw/t6bDNLO+to+TSnUhN8sRylGwIEseN93E0TG/TE8ip7WHThS1qFkKjU7GVuYPljwe
	elpycphat6Zfw2EUj3K463Uh+UxZEVfzfgAui5X9A==
X-Google-Smtp-Source: AGHT+IE0KkUbbY+W4pZJfpChMoM/Bgrd/vrm1xb0nOBeoKJCjAgqt5slzwSLTSLUpuVmedDgVR+CWQ==
X-Received: by 2002:a05:600c:3549:b0:434:a923:9321 with SMTP id 5b1f17b1804b1-434a9dbb626mr248858685e9.5.1733149941245;
        Mon, 02 Dec 2024 06:32:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:59 +0000
Subject: [PATCH 6/7] arm: dts: broadcom: Add interrupt-controller flag for
 intc on BCM2711
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-6-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

BCM2711 DT was producing dtbinding validation errors of

interrupt-controller@40000000: 'interrupt-controller' is a required
property
interrupt-controller@40000000: '#interrupt-cells' is a required property

Fix them by adding the required flags.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index e4e42af21ef3..313b1046d74f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -51,6 +51,8 @@ soc {
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
 			reg = <0x40000000 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		gicv2: interrupt-controller@40041000 {

-- 
2.34.1


