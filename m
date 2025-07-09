Return-Path: <linux-gpio+bounces-23024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C2AFEE93
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1344842F7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2107D2E8E1C;
	Wed,  9 Jul 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyEHCYZ7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A582227EAA;
	Wed,  9 Jul 2025 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077316; cv=none; b=XLJusQDhz2xAt5S4An45x6gT815dJCQZWrRtD07+Yz5Q/SxnM5oPGMZiDEkcB09+RHdKchcPdPXc5ZwuMalOsTW2rwDlmZ0IYgQjXlcmutru9xua+y2A/3KWuEU9VpSrRrGNMrMUdsd4WiBcMnvo84VeRE/gVGBK4+x45OETVeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077316; c=relaxed/simple;
	bh=Ehs/IxozPcMhYr1TDm8jNGouEFl9DWXgjxz/LIgengk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/kwNtXodklmY8qaPhQ9OHzLL3tlzbEZdX5r4V4vYC4h+aFdylBUvz+xyHUc4ohuoWtt7qxoxCij/Ux5xeIQ/ZFAdZivuJjdbGwv+6K88qPHaE5qbs7V1685pR6ZVLptmh9rl7ozaKHSPJF2rFAXVntVQyeXh/htvC+zD8lp2ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyEHCYZ7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a522224582so64319f8f.3;
        Wed, 09 Jul 2025 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077313; x=1752682113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ey7WdkVLv0tBLLtK0Co00XDASEfL95KiYEFMTV+z8Ug=;
        b=QyEHCYZ7X+TQP+k21Vmby3ilz20mY8bPkQQeqrgD0Kwgg7d1ZZRIuUFZ2hvJhXOYbY
         xzYdr4kCeE6p3f16D3TWX+jywM5R3z1twANCgWRmvgOAQHEFCCfsAutMv1CsPDJifQJd
         2+n3YB9E3w+RGjew2OsWzhDz7Z2AUH+NY2PjYg6aHc9GMbTvwyYVQyi0ML2tz7GVPK8i
         5wuJLQW0+fDIMmvEkJ4FLxm8dWQ5wpzredBi8hjBbD+ty1wF42hx+g/wZr4ygLv+uGJf
         K9qgg5xuLmPQ7lgPO6+ESXKlR1eyJ/bstsZz1EQ/Tl+IYpF3NXwPArYQ4qg33h7B2S5W
         DkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077313; x=1752682113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ey7WdkVLv0tBLLtK0Co00XDASEfL95KiYEFMTV+z8Ug=;
        b=jbxfPCdu8a+ncybzE39o1mv+4ipIMTtiOe89nHzTLPM0CLtJHx4navTBCYqMJYTdR6
         ksP0D3kDM6ZIyVV3Jy05HQIzsaZ3CysF0e+DEtzRbwKAI7SfZPkfkBvmuNDk7ZVeM2mB
         5g3n7y2rVPXeJqQ3oQ/Q83lPcVqMvckXy4KNEOSwy3pjtH1RGohtbbN7zQ3neUE4FJeO
         hgHxuO9w7DL8tAyab8ftk7W6/BTRfSMWAQ/zh4MsbYbN/a6FvYBTZZYfaVQisAvWsEWS
         HEXpKvc+PIbz35tKuTInvUZtjThf8NHxVYEUVaWozoKadg1l8RJ9KtZDCTGTrEDGIoic
         VBpw==
X-Forwarded-Encrypted: i=1; AJvYcCVO+mMHQa0Wo0dRPjxtqMKUX1a1zoXKb0Di+z8WjCuHSAullFCw9g4LGTPA26TtRfeHyTRLxpoYz2eYcbyD@vger.kernel.org, AJvYcCWJr6+vVVTu2g9pfZJE7mmP/JkRqoQOgvCzbC2VaEMi1oX2gm86KKmCcRA6Ybey9nwBf6BsLyQQGX49@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqy6lnND/NUxVGOj9jNYSw4Ota9z1vNNIQwIVSxwASBSWIQH0
	zmhRaOKLWu6CPx6DM2iVO4PiCT+YRQtCcIGChiD/1xWXI+WexY6NLONr
X-Gm-Gg: ASbGncs2bkNSUpDt3JVY+W6+OGailM9RsKqMWAn2/17yti2zqGSn4+3cvnK+KhVuGMU
	Z9bzmZ/unbyrHNKbQQnRNjUUePkYcEVuHrE5msfwnUH0uyEooDujV46h5PXtsUjPNj5cIZv92fy
	D5e4OFI2c2j1VvNdFdS6UPizmzHtsuy+tiecQ5AvXsACR0C2EgAm20r6uQNM+iv7TzXTCavyv1m
	hNDIBzJL5XqLmcBJmZ1kQ9S1Btp6mfgBhJASQ8vsSmXVD3TYOSkZrpQoPoLXWrEiIx90uid3bJR
	q4bQze4/hJR7W226Fx8+LIS3/JdB3bceA7jNepjqcnK/sCBpdUA6aUjyx+l9jezkeekv4wk5b4J
	FK48S8AJxj8A=
X-Google-Smtp-Source: AGHT+IFyhTKnTrcnRIYB6EpfCGhWfyHCSHFHwr02yaTHMXSzLsNU4t0ih3bdjbzCXrVig39NY454vw==
X-Received: by 2002:a05:6000:26d0:b0:3a4:cfbf:51a0 with SMTP id ffacd0b85a97d-3b5e44e9f8emr2910253f8f.21.1752077313198;
        Wed, 09 Jul 2025 09:08:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/7] pinctrl: renesas: rzg2l: Fix invalid unsigned return in rzg3s_oen_read()
Date: Wed,  9 Jul 2025 17:08:13 +0100
Message-ID: <20250709160819.306875-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rzg3s_oen_read() returns a u32 value, but previously propagated a negative
error code from rzg3s_pin_to_oen_bit(), resulting in an unintended large
positive value due to unsigned conversion. This caused incorrect
output-enable reporting for certain pins.

Without this patch, pins P1_0-P1_4 and P7_0-P7_4 are incorrectly reported
as "output enabled" in the pinconf-pins debugfs file. With this fix, only
P1_0-P1_1 and P7_0-P7_1 are shown as "output enabled", which matches the
hardware manual.

Fix this by returning 0 when the OEN bit lookup fails, treating the pin
as output-disabled by default.

Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2a10ae0bf5bd..af4a40ca0a98 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1124,7 +1124,7 @@ static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 
 	bit = rzg3s_pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
-		return bit;
+		return 0;
 
 	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
 }
-- 
2.49.0


