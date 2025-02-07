Return-Path: <linux-gpio+bounces-15575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722CA2CD78
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EF81188D681
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4AD1AF0AE;
	Fri,  7 Feb 2025 20:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9VwxMcv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185EC19E998;
	Fri,  7 Feb 2025 20:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958580; cv=none; b=YYdhQ/qBDFzZOAHP1mH2EUO4qUvIedT6LKsBuPq3BNYmMN8xFvZWcZNpaRbZumPX6McEd4EXQ2wUzr3EK6FHkHVAAkHvYAMeeVqrHTwPGjctXBOXiX4EJoPwvbjtZNKZg4+OZyBfKtW+vuoZAq8A3Os7saufFN2IU6fwfvDQPvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958580; c=relaxed/simple;
	bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzZGfmfOLK60J4BlRANdz+lEm6GxevdMmf/SH8AJ921P2qVi0U2BoIEoYpgnJfARo5xu9i1U1Mf9Mm1yZw0NGUTuFWbpVptma9R1QWp3iwNWbqhryVcBH/OrYATJCvFaJKmu10ljwtU48YYwtFyabeRajP3LhNElDO+zbeuzHyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9VwxMcv; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so1597795a12.2;
        Fri, 07 Feb 2025 12:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958577; x=1739563377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=A9VwxMcvQ6Lww09fWn2L8EwUDFziOOnQKZSDwvifgsQiKS3lIDBnCCTvqiT4SpHF3i
         m7JL6baQn1EntWsLKOCYzSNiNowIBkNqs+SeChuyBUIDCwDLMVQTQUei8P+MrIzToNKZ
         6jWNtJ7OV9q/cyUvevq4Cr8o1QfjmET1jUQp2NrTVCVgKpz0fbAeed9brydK//n2Eb0F
         pG658fThTW2iMN7zR3gT7o0c4K+0w12e7N/R8gCDFPrl5Glm5y5PfxhFV9Ry023Mxok/
         q2Jdjfi6kNyZPCP7aWILccg7/fHi3ExEyD4ID82lzgIL6UJ55FN8Oj0SxEYN2+4nSOsu
         0MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958577; x=1739563377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=vG1+tim1wmazPqribLo3ao2TASxFuwpCWPAIbwEWDdwV2GQ4bku0Nr4hV90LbKbu6k
         t5brR39T95DrfUq29AsqqZTipZZDpX9/xAlK8SqFyDU4ANmUf4LjcuH8oVt12dOL9A8/
         x3NC/cVBPDZ7bQcjQmbc/09SeMSEQ6SwJeOUPAFZthCHtlbwmPpmEG+qQQaUrhRlT4uL
         EYxRMh0Fg07IIeuIVQF2pCmirnv8B7HhzxmtDM50JljCndymHK3AwGoNiv5JP/iBJhgt
         KnVjAy9iFxFItKB6BT55eRhE+OY0H4A/5K76C4W2ckkRQSvQ077BWKyQE1J7PFVxee5r
         HMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmV5Qo6oPMRkEOh0e3NhXo/y43TzC0ELFFQSHL68JpmhKAt6hjpDvJk3LrgZnb5REPNUaIG6J+ieA4pUWf@vger.kernel.org, AJvYcCXAB8HY0AQ7gDRFrwjI974s0f3Y0xmeUBPRFxKiWu18rsKfCY7qI+9Q+D0nZh5+6DQUTNI3gK/4Do9w@vger.kernel.org
X-Gm-Message-State: AOJu0YwIo7xX9wbescDG7TCVd86HWU6p1IfMBWyDLpHRa1rcDX4HvGTi
	Kk7XJjgBiGSbf99pPNUNVJ952aVImF2cHSpyGgNy0pDBgtOz/s9TBrHPPg==
X-Gm-Gg: ASbGncu56MzA0ykMNISFQHkHIXdgOyyWrsv0Omv+/sbxMl5FcMRS/GQX0fRmcENEHXO
	C0UAEXGjDF1hL1bJNSbTZHOv/emrkkJqjr1p41e3debdi5x0mkWMpWO8Gahtx6NkCjx8BJtKg7r
	SG+XL9AKk2+zjhEhG2LA4SKZ9mJppBOpmQd6tolTQVijAaO7Uz38mjrDqmLFFX94FrO8HQlDo5/
	Gor0Q4d6J0igQnlLBACIxgqofR39AicswTL7oElm7grw/JlKG4W9cY6IACCmfGzXBIpXT0rIp78
	rvaUnEsIDv4vW7+gL8LNk9fvkoYYhmPzi/IR0rNnlmbVpPEy6kcITq1S
X-Google-Smtp-Source: AGHT+IGArd5o2qj6FwAk4rsMGV7oNGar9jIgapAxx7P2O7Qq52Z6y8B+OG9m+chp8Y9vTLBqHIGQ/g==
X-Received: by 2002:a05:6402:13c5:b0:5dc:88dd:38b3 with SMTP id 4fb4d7f45d1cf-5de4500570bmr6006538a12.12.1738958577134;
        Fri, 07 Feb 2025 12:02:57 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:56 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:45 +0100
Subject: [PATCH 6/7] ARM: dts: bcm2166x-common: Add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-6-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=896;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
 b=ME2xPUcnl/FnRX4iZX+HH0rzRwVkalggFVStR7ufRE0Jy5Hs4Kr1KmlbvGiyk9yFUh1XD9qge
 0bkt7oiEe7iDA4YqFr6lYcmFOGTUdshsElxxrS7QdA1CAt0FFP2lWv2
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


