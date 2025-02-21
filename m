Return-Path: <linux-gpio+bounces-16414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECBA40100
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4237018E1
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E01254B09;
	Fri, 21 Feb 2025 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1b8cVnM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E04A253B64;
	Fri, 21 Feb 2025 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169976; cv=none; b=CCJ/KhkbxzlsRxuFEepfCsMz0KZdBRBoGx0sbVgiGKf7BqQDgjagKdkLXWgR0jpXq0+ZTvfQnqH6LmwELOSQOLaAppNuIK2MkXRJu2cC/hJQqW24FqVaLTxACLYPllKktuat5I+jx4lEYfupYgXalFABLzy6dCup3wn+DDBbMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169976; c=relaxed/simple;
	bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aETwh0vVGs2LscalKPxUlfzfws5reCi7j1t4ENzOF6vnqedrvWxUNZ4fEJu5EOCJnTbnnwlSpZ2cPa83RJ1lv6wy7/P0Ayi+8kgb6tdP4Ye/YcEekFzcNPeyiZ98YCQoyjtovfwUEH4ZdjSVz6oYmdcGa2YrCBLivp7HLtLFNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1b8cVnM; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0813bd105so4207522a12.1;
        Fri, 21 Feb 2025 12:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169972; x=1740774772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=Q1b8cVnMXosZ+B4puVOXWC5DTZiwjKy2B7QIIlNbRtmyoDhEcvTy57UDkcO4tnsNDw
         poDYxiG/W0WGmPVjru5X2+fTWhRJhXV1brm4hhG/o/SMJ2XkQuAoBszRVQ0A2W3ByOMP
         s30qce2nGC1P+bBwty07jjNCqE9epTboxyC6398Sk030j/BiVUxp6Mg2kh+JLskhSPOq
         fmxkA/kPGixYL4MM9+nCbGjYqEVkE5kexXLyyZL54dJl68lneHjLxwv6Wo1KB1wDDPWn
         5shuL4DU31QrPOSekADf1NtBxHijA9r/grDRmcgQuPsQ81Q6dcZz0G3uHliWY0Pev/AZ
         3Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169972; x=1740774772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=xEpGEkaRbmhuBc4qXvUJ/Rg8Cs7/7SdS9vJwYh9vwYp0PbSmNg8XyhV9AEqzJlCXfq
         ZpG2h9Qs+/I3tvED6GROnmEI3s9Dr76d+KIUWKmQj0XXzo13qUDqSp75wm0F8oS+v7aV
         t+fDNSxIYc6i4SH7Bb5Aq9lDIGyelE/uK18pfH2pZbVi84ioyMtKRUZCDYs+dzT+TCY+
         ExT0SyAbKL5O3dRZCMcwFwrEP4Bc+/8GWI5G7N/eas2HNrtQj/9bP8HluKAXuuE64d4I
         R7Gl98PSrJpnB8Z4p3E6FYiMAcwPyP4wEWSOu6hiVqv+VLqNK+GRAt68KG1VtwqXzujx
         Jb5w==
X-Forwarded-Encrypted: i=1; AJvYcCUWxIVmxS1f8ZeALWP65dIHWcZPAar4hSA8fQLPYYYRGGp3vX/4RBxjtib7M1R1NLvqJ2SVsfpH335C@vger.kernel.org, AJvYcCVT95/iAfVFR8rm6z3B2beV/j3CGFV+dBvUHGx+g1ZcrEgM3wRygj1XPA3YxfYUp5jiVgwGMVuLQh4AXhB2@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJCODBGJgQJ/oBALEwpr7bqYsuXbL5pKYOkse5DdB5X4rrtFe
	jiKg4Kcrjz1JmfRijLflgGrUnBWgw8f2fYaSY8GCCsxFDgE+oCYy
X-Gm-Gg: ASbGncsSxO5mI7ADDR5THwb+AaKLX6G8zK0UpAMZKwI1k4tEDhM/hEDFYN6CA+9WO2j
	yjf5ICoxfpLwHqfzktKqsUjMJy0O0e1VxlMf2WIe3tuq1MHdVmYZzwAR8eV1VfbpK06bJHzbJ0R
	IfpmtCOiYYx6/MBlvBdRmIiYWj5YqcR1l7LoMZ0AFbEB5bBbBpCHYUwkLYPL8DR+QnkVpwC3PJu
	s/MYig7Y+uhx0pAw+cmJveFZzM8iM/pjSElQVxNk/T0pvV581OgayrxV1UyOyjYVWC/MGAQ1c42
	bT3KjC39GmQHFkMpoBg/4/Rse3EORoRr7RZTj2p5oxFwRGQTdogBRsO+ap7U6jiFq68VvKl6
X-Google-Smtp-Source: AGHT+IFX16OnZk9d1DL8WxnUdqDk352LK10QFk5bhYj/vuHbbpoHUx8vxoyOPPZmEZpTd3FXudXcXw==
X-Received: by 2002:a05:6402:388e:b0:5de:de30:dd0d with SMTP id 4fb4d7f45d1cf-5e0b7248363mr3572711a12.32.1740169971704;
        Fri, 21 Feb 2025 12:32:51 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:51 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:41 +0100
Subject: [PATCH v2 5/6] ARM: dts: bcm2166x-common: Add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-5-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=896;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
 b=imTpwTI+Jp+A/uOxco0Ul0XB7DjOg3uyuqGuJeRn+bIitq+0cRSB7FHVyh6HSkhgxCIe5UP1C
 dCspq25gqPyBmoECI0KxT/cToXGsSGsHmG69DnJQy0vRcYNrYHSRGJs
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Now that the pinctrl driver supports the BCM21664, add a node for
pinctrl in the DTS to allow for controlling pinmux pins.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index 87180b7fd695e65b52c52743e6315cbcca385fba..d4b412ac8b0343bd3773f50c59a20fa00a3923f8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -46,6 +46,11 @@ gpio: gpio@1003000 {
 			interrupt-controller;
 		};
 
+		pinctrl: pinctrl@1004800 {
+			compatible = "brcm,bcm21664-pinctrl";
+			reg = <0x01004800 0x7f4>;
+		};
+
 		timer@1006000 {
 			compatible = "brcm,kona-timer";
 			reg = <0x01006000 0x1c>;

-- 
2.48.1


