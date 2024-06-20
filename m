Return-Path: <linux-gpio+bounces-7572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493590FAE5
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 03:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEC5A2837CA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 01:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB4A171A1;
	Thu, 20 Jun 2024 01:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPj/PdYm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8918E1E;
	Thu, 20 Jun 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718846849; cv=none; b=h3nVI5w0wD16YZc1+z1tDjoKa6Oxbn+AS5N7H/EBAPy1hQLR0jTMzCwuacprs2k8prkglFO2rYL6QUq2W+GxJ0M/Kz1WSyyIWa4ZnJmAXWjjYFGHVqB1z9Mi3VZWLrFFdVsWFMJ+rBV/WUlNdq8cV2BxmDozGpnYJTcLpiaI2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718846849; c=relaxed/simple;
	bh=wRuzi9Pcy2O35Z/Z8TVOkCVbK3LZwvFBU3RJco4GeqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LsGQaBaPfAm1nXXT4NsRqwyu2eeSUteJ6AE0Bum78lcTyRmPvEfWRWhQ0oGnixRHlEAm4NxO+rV7XSKKzMWiOZEiRQZJhCASakV8AWPikTcY/LKyMl/gFgktQ+nFmMuBNtFv8byiy7xy27miTmlm0DA48cZa9FRRzkDE5zoDBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPj/PdYm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f717ee193fso2707305ad.0;
        Wed, 19 Jun 2024 18:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718846847; x=1719451647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=UPj/PdYmqkilp5QJNozsem+n24Zb+7kSFD9o+mf7uz8lB10agFViDcCkGfGOIb8lr2
         MAzWDMRpNpNHXbOVhmRYTyZl5ZUDpltSIXNM7T/1riHAYK/y/q7a54o6WjVGP92a3hg8
         EvreC8uESwxIaVRVi/kNh2mk7jB4CmQCE2O+QB2bqfdK2HG55p+d5t5HsCxJ5ozppvP/
         DBMv6CbIMKqY9V1bFWQPes5eglMucSGqUoNz1MAQkmxbECld3i0DkHc/U/bz8Z4mhIkM
         uMZCRqUGVFeU5pb6WcUuetSCg0pm5vq3a8oeSnz491EQCO4j6ffNUKOC7UD7zzkjR5Pj
         0WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846847; x=1719451647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=QY2qYMcMS2WX0e1nZil0wHGMfk6nAgcl3AwwRBI0SIXziZfj6iElG1qDIMqUxjuz70
         jVeH7T8ybeAyd/Hmodr/ejoFeA4DkdHWwvC//gge1F4oyS8PjzygTJGK9bxLUBqaOxoz
         AhG2A7rSUYAloVCoCnwq05mCtHlTg7jtCgTgPE6Se4tLCuzfyrRK71UuJtyKfYAJXH06
         ZNJKDTdleAO/42nXIPdP5bkmAoF2sPUsvjPeBPkHqJfF+Jk3Dw3a+vUcnIgOYMFIoBMc
         HGscAEih0ATA3WBARxPvQ6sCO2gPtZNl1M49nBTxay+STO/U7PShYTAq6fYB6stUCc7Z
         NaHw==
X-Forwarded-Encrypted: i=1; AJvYcCV8mSg55Qlc/JMCbjgqv9+qtaAHl3C91qNr39saCN2ZrD74s7413/ziNw4HgilGCVUpkKGryshh11gLaTV7daTBE2JXkqY+DycD+UDOcL3N3ucvvOGp/cylQ0GVBkRxc5IMHKXWVyvBqW74KXc9zx+AanaHVcJOO5FKQHsdBvPKkTeJTs8=
X-Gm-Message-State: AOJu0Yw4MdUSHQRb2X5tfMWtiR3jaYC2/Dxw43xm2fzJSbd6mn1LfFvs
	uCBJ3XSYw8M9+CRxTSFbQBuAMvunLas+SzjW8H4zEJM53HhhUiHc
X-Google-Smtp-Source: AGHT+IFHltDAazsMVth4tkcJZ+j2/bVyouoA9oII0f88tUI4qTUzL/WWNrangeocByNlrlSB2hmB2w==
X-Received: by 2002:a17:902:daca:b0:1f8:67e4:3985 with SMTP id d9443c01a7336-1f9aa45eaa7mr51151795ad.49.1718846846933;
        Wed, 19 Jun 2024 18:27:26 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d021b98fsm105855ad.33.2024.06.19.18.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:27:26 -0700 (PDT)
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
Subject: [PATCH v2 1/2] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Thu, 20 Jun 2024 09:25:11 +0800
Message-Id: <20240620012512.3109518-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
References: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLKO,
reducing the number of required pins.

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


