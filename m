Return-Path: <linux-gpio+bounces-12084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4509B01A5
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66723283550
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F026020370E;
	Fri, 25 Oct 2024 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPYAPnWv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4501D8E1A;
	Fri, 25 Oct 2024 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856972; cv=none; b=sM6TtsMW4v3Hqpa/1X0aoiB6Gu8pw1B5PgabEImsM4jGMmK6ZjgpJMONWTuQykMTvBZbPK2ca31YbKsV7JYJ+0pOAsDpDeaCVEuEAmuaHGfkCURZvzGOZajS2z5hgrHBZhM1TOUCl8PjxuDqVVjSjyjpF8MK1IByn2v718AfNFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856972; c=relaxed/simple;
	bh=+6OiIHZUXuK/rxdkmicJ+jQ7BZRkUgg5/YkiZrEKIBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbkhSNJ4K0Wbbs1aF5qS3UPz03rSLlX4BDIuG84D2npbi8MgMaKviTD3UoFgGXD/wfxYV8PbFGBVQZXNX+36s2gxavt8xJUFxvy13RgQdBljQVGVAB+nrYyMEUN7PPBOvVARgySqwYx89Wl5c2mL9bFbisf374dBBFgfcdYwIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPYAPnWv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so19474655e9.2;
        Fri, 25 Oct 2024 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856969; x=1730461769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0/wAHRYUulJtThCskv96/D77J9Pl3F9tDm+0Mz3HHA=;
        b=gPYAPnWvcGTNbK0F0q+VUG6XyWTCc2vD2YFrjf8PJyw4f8jrkfbXfuvNPqYn4S+NE7
         lxCnHtYXCf3+YB3qqwqu9yUGtTR51UMMXXseqAyA8Kv0geOkucciCmNbAc2oFMtQopqC
         i+DN0ip1ca2ESNpLoAoIDY1pUNHN9r1469zhw3b5Ic66HdWNCZzi/cVSrIVG+g+emALa
         aJ96xJVgHNvFTiCmMkfYhLLTQ3ssT39KU9KONh8CwfLt4rsc8QOHvG5VxKSZpnRqOZJB
         XGpX4k/px3XM2TueLx3LvxX+IOyRRJ2c+zDXCp42lMmZmH1SqeCO7RLEoJkYoHWb4two
         /HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856969; x=1730461769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0/wAHRYUulJtThCskv96/D77J9Pl3F9tDm+0Mz3HHA=;
        b=pau+1w4eLpwB8tpwecJq7DWo2TxLMJpph5Y/4++9eArrSjCKwxRHgJtz7W5AlMddHJ
         Sz0vCtl9/ymq8g1TT2F/ioqa9XPNR4AHpy9CKQ4anE3ekOn+PkzxyNcmEBTaL+Jb/EcI
         Rw6ZTXvHjLJc/xen/dH7XQqsodPD9lXGHbhNaluBYsxBykMVll2igNNW35m6CnsG5jie
         /sIc6No0ppRtDi1qW2JD4gmdzKW34Zs2fVYprHo8JtCDb6+BK21Yor0RODe4kVl1FOKv
         wNhE7Wlhoh91KmPno/AzFVjzLq87cj4fRXBzZSuo3FRG81WfG2Ym3sGMNqWjWTS2x7aG
         wGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpdwZzw2fmE8AWji25ljVsHt8/NjeQYf6JIQVxtxiqrgQ+8pcB4WGHPWlGFzqQZ2zM66CB+nd6SaLvfA==@vger.kernel.org, AJvYcCV3HkkHpo2Gmouds8zkkWOxk5gpbUDQKlpCIgmj7SuccBEFmHr7VRutEZO0ElBzIckLUkKLc6peza4e@vger.kernel.org, AJvYcCX8IO8NPidna08+T0KrpHy+Bp8de6QRxtvEAPOvBHakvTtqwhNCfP8tkSYPU1aCkNOlrJejF55yxkHT45k4@vger.kernel.org
X-Gm-Message-State: AOJu0YygYQP8S3eYtmdJauLaMVSQJoIPmwgJzmVuSGiX70wKzQx4fNox
	0h4ohS6nzRrUZFiJMDKJ04OfXU1AnWFex6Yb0wYhkopAP2A7qx0M
X-Google-Smtp-Source: AGHT+IFxNYNJYs0fHmZKVjoueOHBXiaK6/iUx1aK7IFXiShNcvj0onhgBcD5Sis1/NN7I7tf81nXWA==
X-Received: by 2002:a05:600c:190b:b0:431:5632:448b with SMTP id 5b1f17b1804b1-4318419a81bmr78264015e9.25.1729856968615;
        Fri, 25 Oct 2024 04:49:28 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56741fsm45109785e9.22.2024.10.25.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:49:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/6] pinctrl: renesas: rzg2l: Reorder function call in rzg2l_gpio_free()
Date: Fri, 25 Oct 2024 12:49:11 +0100
Message-ID: <20241025114914.714597-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- No change
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


