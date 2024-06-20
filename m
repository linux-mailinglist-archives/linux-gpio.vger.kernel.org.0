Return-Path: <linux-gpio+bounces-7580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B590FF57
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 10:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4698F1F21AB9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 08:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928FC1AB91F;
	Thu, 20 Jun 2024 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BflZkvXV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BBF1AB90F;
	Thu, 20 Jun 2024 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873161; cv=none; b=Gg+/QYHkZiHcOJXbeiQpgAbfuwlmntMQ6Q+7wMlPDnO7dGPWOe9e5iu1s8TTnHC4qrtVaGiwH7fQSeUir3lGosfvoQLncjnxEZekdiUxxv/FGhHVbPpi9H0YhXagZzayjd7UNZYsse3t97ulfmRw3+lEnrsWUK7X2UyIxnTPhXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873161; c=relaxed/simple;
	bh=IYpgjkNJ+3p8GkMwRIoKvBaYq1yJLDn4XIpVSdU6z7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVv3TiXXM8x41FsZpNSpPTibtMnLNEC6hztSwBbMgYprVQKk4SmOg2P7/0EsSCeLS6v+XmT6AvKU6/c7B4TdqRd2i2XLyHrpvaW/ywVhthpOGVi8lURRx0j5FhrFCEvCwTGnb7c9EukwSl0bY6OOwpoK3N0dYromEbfK5qq74qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BflZkvXV; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d229826727so415095b6e.1;
        Thu, 20 Jun 2024 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718873159; x=1719477959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=BflZkvXVDni/8Fe0N+z2Z8DLQuUNjyMcMWyzW+dJF+oWSVN91xQVh4x2VynCyg6yzl
         yxjUDrpSHrnqCXddmb3YE6qx0ufR/s3S6Ej4S3xEKFbMvWaucL4a2j7QGcCcxV1MKw8h
         peDBy5AvkW1/tdOrqh+fLgg2LyZwQAl+M/jE4s2eKUA3Y8SWuSnruiTOeZvc3YYcfpSP
         +d2hcA54oaK4+XqQQK2Ka5GnyweTBMTGHEzzDsjhHc6dB1466q2W77CyXKTJj/LPIk0g
         /wseu0IF+c0ojhSH66dJwkLzVXNbkwElj2RlN/dPKUmvvGcGq8zyHaYXVltLBQHmNxQn
         Pd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873159; x=1719477959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=j/ynDyrMNaym+x4f84RTqM71aOvVJdjV83TYRxREukbIIP4zDft1uqpwC7WzZhJQiL
         oRfs2znSIQ6kh70wbG4Uum7Kf7fFhCIujbv/OcWDCxUU17B+dT4SK9ATFLMLaUprCCGq
         xYtq9xRpJB1kQgM3EPsUiPwtZOdLOGHOgFvqD/7gEHTCa4thMiOpe0yonmYgP+hCAjpD
         beyJopnNHmdWyZEuNAmtxWRH9EeI4Abm44pwJ9oTWOuyhyimb8yOmKw+zjgRF+9cAlOe
         N/gjynXhBcUScsxS5EpGzoI3DwCIXpNlue9ZoPl7okehzZ7wAdB+/476B+D4TzN3py2D
         CsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHiB0IJ4wla4OpOlzmtIAhOZluzi28I9B+602RmQvH7gdFkRHaqrToNFjLTCA1VymMptmQ0luOCkSsNwMXEquGj18bfOaGluaviVSapjDe21HTC29JAOJCiNm6IA7m/fGl4MiVHeG27PblppL5dPXz/gkbL+f0SMB46JvHcEgOCBHo1nw=
X-Gm-Message-State: AOJu0YwTGWFuIiZAtmLK2JTg9d2eTHocqK8zcQH836EIN8UCFjItt3ZN
	hh5uCB79CHqd1bvSW4QDAvNpUVtww6aVz1cbxRyz+P9rvJY/3mSX
X-Google-Smtp-Source: AGHT+IGhGDKSgAv0T6Xql5g7csBDAeTCcq8i/P2W7WhnsCqa2jWpcloUNmsMrFYRH/C43jnjpNWvwg==
X-Received: by 2002:a05:6808:199c:b0:3d2:1e98:cb04 with SMTP id 5614622812f47-3d51b9824c4mr5393367b6e.7.1718873157886;
        Thu, 20 Jun 2024 01:45:57 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9besm11895592b3a.165.2024.06.20.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:45:57 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v3 2/2] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Thu, 20 Jun 2024 16:43:37 +0800
Message-Id: <20240620084337.3525690-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on the NCSI pin table (Table 181) in NCSI spec[1], the reference
clock output pin (RMIIXRCLKO) is not needed on the management controller
side.

To optimize pin usage, add new NCSI pin group that excludes RMIIXRCLKO,
reducing the number of required pins.

LINK: [1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.2.0a.pdf

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 7938741136a2c..31e4e0b342a00 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
 
 FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F26, F25,
 		E26);
-FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
+GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
+GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
+FUNC_DECL_2(RMII3, RMII3, NCSI3);
 
 #define F24 28
 SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
@@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
 
 FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26, B25,
 		B24);
-FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
+GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
+GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
+FUNC_DECL_2(RMII4, RMII4, NCSI4);
 
 #define D22 40
 SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
@@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(MDIO2),
 	ASPEED_PINCTRL_GROUP(MDIO3),
 	ASPEED_PINCTRL_GROUP(MDIO4),
+	ASPEED_PINCTRL_GROUP(NCSI3),
+	ASPEED_PINCTRL_GROUP(NCSI4),
 	ASPEED_PINCTRL_GROUP(NCTS1),
 	ASPEED_PINCTRL_GROUP(NCTS2),
 	ASPEED_PINCTRL_GROUP(NCTS3),
-- 
2.31.1


