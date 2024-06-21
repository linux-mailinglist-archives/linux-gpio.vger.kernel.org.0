Return-Path: <linux-gpio+bounces-7607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DF9120B6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 11:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D3561F238B2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 09:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F253F16F0C4;
	Fri, 21 Jun 2024 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtNa0mZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10B16EC0B;
	Fri, 21 Jun 2024 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962446; cv=none; b=G45jEeWv53wk2FVmnCIC5LKGTu5miCxKeJpvA4IwSt8xzO4jrUOP9Ddyuv9AookaTnvHkhg+lHj4FPCvlKF+QfRzP7qoFWIOW0jC0xbaBM2k96w9oEM9M8Bw7TXyTR3S2WOry4PXJjbRxe2KK5jz/9mrFEdJ8UVTD2077FrIxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962446; c=relaxed/simple;
	bh=IYpgjkNJ+3p8GkMwRIoKvBaYq1yJLDn4XIpVSdU6z7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qPXVJfgmsKev+w1Rpi7QMjYOhZvReUk/eEhJGbO1or4Y+SIqeaynSOteJsAMLDq9NnIJ9Ric1QRMXW6MSaPJK6EcJRetXjGk/iH0v8acv2jlU0DA1kjwU63udYqCHmG76asDUw/o0+j33aNtZBZA6zXfsGwDl9miI9sW8Qal3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtNa0mZI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f6a837e9a3so11724915ad.1;
        Fri, 21 Jun 2024 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962444; x=1719567244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=FtNa0mZIFdfiZLdN/bQxlIE6Z51Ltp9jLDCGd/ZAOGHnOplYpKNCu4UtjAWnIX+vT7
         py2WeCst/TflQXQNOGHKMHrXrA/KHw0Nv4qmVOdK/YhGcKcIKdPkevVgMMTQkZL8oqbR
         r8tKDbh5AlQ/YteZVkZ58HOx6/she0wuuREkhkR8dVvnRB5JInFQlfVUXmuPPsihJTjy
         u3OQFrFjrBTcDEfW6J8u9Az7w6v40pd5/+B1kQS66Y7wiU0xK2v+PoHpMu3/fobWONme
         c5ag5WKY1vkgKzz9T7jZaa4vCEiUQ4k18VJVmJcj7zF3hoKJ4w8q2wBAFK2cat019f7k
         8F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962444; x=1719567244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=OlYvuDcEKKcDcHEkEl1Rv2f5JrXPEoMe6Uzdq4n+2HRo+DiuMeyp5+7VeykmcVj+wa
         iRHh0EUDKKD8lc9IVg/nCIB39xi9t+yJEKltOes7DFcxZT7CPnFQgkR1+ZxLhtTwgPfE
         VsG7pu+i+rL7NELGXsgym6+GgHCiB0kAWTL7jWcWsZYvuAfbROJPbz1vxZFTwn9e8SZg
         DjWyC50QIUcFY8utPiHCYRHTS/kMnd2g8fcX+ZtE/GeB7sZSxTedy62VpUCIObpyyJyU
         1oC2q3rYzwLh7gKjcpeZdNxWe1kQtn2Ja7nZE/YKu/PLiXrPlHoaccwe9PSILezC5uHT
         lyJg==
X-Forwarded-Encrypted: i=1; AJvYcCWTgDCZSy18Ackm4egr/Gg9qDUB21Utinpbkr4CiNZ53u3q2wDn9qhDHqGuOaw9WgMs21iMsugQSnxm5XMVeO5wdUp5CpnlDoulOqpOmHmqIrcvjyPJYQHLYhT3ArRyLYYE+9RoWxxdhS2NdCun3QaykLwRA4t+meVFYzk2mIxiLXIYgkM=
X-Gm-Message-State: AOJu0Yx/HtoCKCFPX26hvdj6lhZXJFxNitt2wi/4NqVEe24MkiputqnS
	o5QkRMdtTwyifR4nPARfk6COCxPLsbCEPZuLOXZfocIRdI5QGsTZ
X-Google-Smtp-Source: AGHT+IFOKXrh2SxGVKHFT+5si9TabUQXPaizDpK8J7kyQ+x11v7jWslxqA6il5ABG6GwYYLtHI0tSA==
X-Received: by 2002:a17:902:d4c1:b0:1f6:7f8f:65c7 with SMTP id d9443c01a7336-1f9aa3e9e54mr90810285ad.26.1718962444561;
        Fri, 21 Jun 2024 02:34:04 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc72e9sm9810365ad.296.2024.06.21.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:34:04 -0700 (PDT)
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
	Potin Lai <potin.lai@quantatw.com>
Subject: [PATCH v4 2/2] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Fri, 21 Jun 2024 17:31:42 +0800
Message-Id: <20240621093142.698529-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240621093142.698529-1-potin.lai.pt@gmail.com>
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
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


