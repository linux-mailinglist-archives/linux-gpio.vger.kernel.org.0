Return-Path: <linux-gpio+bounces-13842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92A9EFB32
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BADFC1887DDA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC5C22966B;
	Thu, 12 Dec 2024 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cAgBQ7jP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A21322655D
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028610; cv=none; b=jR0gJ/o2747HAnoI2xkeGF5XFntDE4n3fvPYWRC2acaRdtQOmfVKteQDfxTKUruphD5y6WqtShj5oqw2X+sCu4kZWnQz90KuJFtPChwxgIBz6MovyXIjzN0JfliQnmLnv7luOgk3Tqi1XAudIaLw20kF5J8CHRu+/JZE6t45CxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028610; c=relaxed/simple;
	bh=p0I2HVUBbWRZhBgsdTrryTL6GkY8GKKUGtVy3VSjrfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUwkMkLEMNn21AffMCDuLuOyzQRl4wT5z0svC5Y3W+GFPE96FxbvKFwOZQBmsBcZd5ESDYH/WLNs+c10RnaumG5pW3cIcPbCTBfK8v7V4BsmyMEVwXZTmSno/UPLEaQBFYJAwJ3tgoBJAW7xuyFlnPwliWFfkXi0AERC/ZheX4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cAgBQ7jP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436249df846so6998315e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028607; x=1734633407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=cAgBQ7jPLZW9c/hx2yATjDQqoWuJnK65lVnqng/WuEspcgF2LDmHTLqC/fkUSzsrJn
         ZGqllXgxGS432jdTbTFPhJr9zEQd5a3tIulgvaL7gkDB0cOC7SKB3H8lBnVpgjWOFSss
         aruyt9ds2vl/tvk58dd2we8Wrhejc4MuObsKbRQs/y953YFAwHMbiGC7+icX3K5JBd49
         2fXGol8wnh9YyoGRf8UMaOyHghhdjgfjYeAYv5Ur2BIR6ZJA8ww1BfJ5iKsXWom5E0fq
         bVVJkT6oM+UltVScpXHge1SjRmJPsIEwnMhQLpMgVuo0n4n2j7RyRJbNvAzAh+phd/7u
         Z4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028607; x=1734633407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=FZpIAW1FketOot1cPwYnwQW/WtOG2SPm+4lvl+RaltMBcLIY3MIP9VN3wFRvmu3ed8
         pF4QRvI1M0du91O9Se6YgKnEeSOjxg1vt3l3jPnnERnCmYpCkUOXzLnql4ndnDhAPWXG
         Mvd84csgphml7RjLXbAAB+y2HZBu3k+1pTOR8p2KE+6fMFMoWFhyfcFv2v0+BOeZEJpO
         k3MUVZmP/Pd8cSsteflEPJxJQZVWQp8zWyGXCRNNYnguZAuESIWxTv4cDnyd7YZdLqql
         lS2QLVx+7CrWSfcPnv9y41dajOiJtTNpPe/fAJNNdSo6r/TloxxQSjj9l3C+TKI6m1bY
         edTg==
X-Forwarded-Encrypted: i=1; AJvYcCVzfufRZDD6kV4cZmheCI+poxzpGZqbFMJ2ODyFXsX5Vlp3cqlTJ2eyoTFrNXO14KQ0MFe/2PFUM5jk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn7pABaqAh6q2XKJMg4ZzWaINYws86xEtXTHlYiQUmB0O/gq5I
	r2Qahci4/Tdv86agJJ4r8mOrCyvE5k2jUxJ/N/LhETFkKHN0QbzYTTDpdx9ITgU=
X-Gm-Gg: ASbGnctvNYmI5gHOUh4MuM6e37CzX35qkwWuAkcdWGhoMxrmRxuFE4oyOzt9e7uwwZj
	6g1FCAYVMH0g3ELB7GSOhQSQrUK1NpmysuECGJLDRnsO+HUTkCy0I6i3rzWL0edgou2c9hU6RXF
	liLzpwLSECDgSjGI5UKoDhtxK883q2T4+vEQ2GIowuLB/Cwy5zlxFC/BXxqCSmqiYeHR8HLbBxq
	49mrph8sp0zgSmGX7N1i9R7vOrDdj1bM481yahgPebg2iRp
X-Google-Smtp-Source: AGHT+IEu2xL/+FXU63UNRhzK1AOzvmFc4RtXIaDc5vdsewo82JD1gWWmf7YI8MTxRmnxwh6YKbXzGQ==
X-Received: by 2002:a05:600c:19cd:b0:434:a07d:b709 with SMTP id 5b1f17b1804b1-4361c441bcdmr59652015e9.29.1734028607573;
        Thu, 12 Dec 2024 10:36:47 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:47 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:33 +0000
Subject: [PATCH v3 6/7] arm64: dts: broadcom: Correct hdmi device node
 names
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-6-44a7f3390331@raspberrypi.com>
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

The names of the hdmi0 and hdmi1 nodes had addresses that
didn't match the reg properties for the nodes.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index bd78af0211b6..f42fad2d8b37 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -352,7 +352,7 @@ main_irq: interrupt-controller@7d508400 {
 			#interrupt-cells = <1>;
 		};
 
-		hdmi0: hdmi@7ef00700 {
+		hdmi0: hdmi@7c701400 {
 			compatible = "brcm,bcm2712-hdmi0";
 			reg = <0x7c701400 0x300>,
 			      <0x7c701000 0x200>,
@@ -381,7 +381,7 @@ hdmi0: hdmi@7ef00700 {
 			ddc = <&ddc0>;
 		};
 
-		hdmi1: hdmi@7ef05700 {
+		hdmi1: hdmi@7c706400 {
 			compatible = "brcm,bcm2712-hdmi1";
 			reg = <0x7c706400 0x300>,
 			      <0x7c706000 0x200>,

-- 
2.34.1


