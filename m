Return-Path: <linux-gpio+bounces-11525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F03669A2131
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB9B7288F14
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F059B1DD9AD;
	Thu, 17 Oct 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxxqJ84J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CC1B6D19;
	Thu, 17 Oct 2024 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165199; cv=none; b=H9B4aLdcQ3sLjhAXkPz4tLWS2befRU75mYTLupUO6oAArl7FsF8/QIwEVIz9JVy2YB5x5+VTS9jEfaXjBN5cJXhtKjM41sWBT5io7/KC6czhruw9kE39aQ1Xc2Al/fwBqlKGx30S5ZhjgnA6mnRDUEbmbAd5DZwwTU6vdbzrt7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165199; c=relaxed/simple;
	bh=gBUbX3Mv/+qXhdjCpowS6jf1QIk+tOIAinC+2M/tTlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHiYFh5/8+fct/DXHNS11CkFgk+qItMNLivw9NFOUGJqI6CCd1OrkNzuY1fjqszEN1TROBm0/KZB4U/MMEyxEkZmQ+kwJvmTuMAkFC2iMX2912DOC4o2iRxCT/1Bmq15ueSKv5yUI1NT4qwQtR9pwaRuggdxwNGcDA2iRwyA/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxxqJ84J; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so1848445e9.0;
        Thu, 17 Oct 2024 04:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165194; x=1729769994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZgQqASzGBDBW0b66de0nc2GHac+VUCef2suIWn/BQg=;
        b=FxxqJ84JBWp+y6/g4RXYS4nMZKABAd0TorcunLKGNA0H0SQGoiZTucioTZfT2LlNfE
         RXletBgRzHgd3leIhpLlfq7AmzWIFgU1SymknHV0QpEGvJPouUD+G+fhifa/q/lArkG4
         XKAsDuZLEPWZzy2I4Xt5NjfS/6U3GlazVV4gseKevcu75rotxCJy6wvQ9ij/IJOmcA8v
         4sJ05XpM0GWbk3U7uU6iAEdfYIIcx5szfFbTcIrQJeNVOP/iCj1MKX2oEuFbkJZ3OtX2
         SS0nV6IkJ4lcR5H+h/dkGilX9dcDWJEDY5gN9cekhNQ1SVF2qk3AK9N+xUdynEZdw09P
         oDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165194; x=1729769994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZgQqASzGBDBW0b66de0nc2GHac+VUCef2suIWn/BQg=;
        b=OEMChdwS9ShIHmLSGalAb18TV7VJg/JvMQC2WCIn7G0TcBzMkauX8hiEYmhnDHcDCK
         tx5H0hEJdkcaJyBHAUEXQq7AfUC3XyUvcPlQSbVDH1a/2ctx74Va6p25uSZ46RPY2fm5
         uetoZuIvS4KfTJSeAja+vn8C2TpB5UBUhSROvThVbbyzYTecgClfUWKRQ49WXR5HEHb5
         xKL2op7rk4PwNLZUQTK86c/TdiEvIfe4XrJq2tGjZ1OhfSriCjUWgz8qAOrpOHyAfJvI
         /5/V+9HFHlV62ZqaP1lF9Ch2mNEqRhz2c06xeQ5lxzce7pjitVya/nmJyS/vnbNNRLr2
         ceKg==
X-Forwarded-Encrypted: i=1; AJvYcCVqWSKJXOAGBAm4EJYdcow388HzfxXGgs1zjF9Vv1Y9Gaht+5bXWEZReIBq/W0KL6NvfU7bBE31mcZnbBxcRGLJYDg=@vger.kernel.org, AJvYcCXAb0GZXXppQLUX7lBQ2PnlMugP4FonsI5O2JYkPEcqjoieadpFJtl715sRLayCrXc9YwdrqGb3lO8t@vger.kernel.org, AJvYcCXIasULhynzCPeD1X4HwzsWgmh6K7bewDQizfReYMepjFBvqiiJHc/CTQ0L496UTMEra2LhBgrHqowbug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJS4m7iWTRMJ+C4BpabmDQU8pfMmZQxAhxaYmvbEbCmG0Sijx
	Vl+KT9OQxDeL9yvyFFCnX3swZYpursG1lGeDHvojD3F8pkWu0AAX
X-Google-Smtp-Source: AGHT+IFLb4+3vLX6gEnkvxd8eXyZdLCEp29poLkh1B/SwDAqKZBNOmBRtuoB/krce3DqXEMs5aRPCA==
X-Received: by 2002:a05:600c:510f:b0:431:5bf2:2d4 with SMTP id 5b1f17b1804b1-4315bf20381mr14176225e9.29.1729165193512;
        Thu, 17 Oct 2024 04:39:53 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/7] pinctrl: renesas: rzg2l: Reorder function call in rzg2l_gpio_free()
Date: Thu, 17 Oct 2024 12:39:39 +0100
Message-ID: <20241017113942.139712-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The order of function calls in the gpio free operation should be the
reverse of that in the gpio request operation. Thus move
pinctrl_gpio_free() call at the very end in rzg2l_gpio_free()

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 1a09ccbfebad..d8b942fbf537 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1774,8 +1774,6 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	unsigned int virq;
 
-	pinctrl_gpio_free(chip, offset);
-
 	virq = irq_find_mapping(chip->irq.domain, offset);
 	if (virq)
 		irq_dispose_mapping(virq);
@@ -1785,6 +1783,8 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	 * drive the GPIO pin as an output.
 	 */
 	rzg2l_gpio_direction_input(chip, offset);
+
+	pinctrl_gpio_free(chip, offset);
 }
 
 static const char * const rzg2l_gpio_names[] = {
-- 
2.43.0


