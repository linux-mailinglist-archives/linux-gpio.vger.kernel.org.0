Return-Path: <linux-gpio+bounces-15686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5FA2FE63
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 00:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F42013A6476
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4465F261367;
	Mon, 10 Feb 2025 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2zR/fy3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C0264607;
	Mon, 10 Feb 2025 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229959; cv=none; b=BFBvASqoan1LyQywdX6771Pz+L0ihHLgVQNpm7p05hByGz+DW+Pk8XYOyuH2fQ98okgfFYTEGtWfbeZ8szju+krLU0XIOqqVmG9RS3YOR1Oy0s8UoPzEvsbpdrneWRvM+WJo866WqTAVvWE89oIhiEnxRvxsex8NB8ZO1z3nrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229959; c=relaxed/simple;
	bh=KN77nCqnFYHqWvJ1p3RHQD50VswFZvR6dd2EgrNJCnk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dTfQGzZ15lIEIzoztWXFSfe14sKKUYEFECnhseuemMFgbtMv1h338dHQobG8efY14eZN3byH+k8U2U5Tcv9/Ffb+LWUWLvaHWziClBzA70dhTe42DNnt7rInzeiGEzzrKSli4OG0w9e+sR4g/tEeykxw3/hDDX6aeIJvlIHHEoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2zR/fy3; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c05aa6d3beso12126885a.0;
        Mon, 10 Feb 2025 15:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739229956; x=1739834756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8XenbubIJUWheqMjhkn1jG61lOTP/K0WRD37kJpkcU=;
        b=Y2zR/fy3E7wThIeD8n/g8OuAkmnxgX/0CmAIgH0mO0UfDL+X6ou3V7f+C95bqxrRdy
         DFSpc7SUiK1L0NCfUsZHEmHHKWdQSXj088onQ78pBMefQ6Wp3Pn9LocXd0O6rvdngp04
         XKPu+DN0WN+E9vrI/CipXLrctiG9ejO4h7U3ZfjtjBc7+UBe1ShAaNi1lk1q5sojWrN1
         xikHBIcaZeND3tGllzqBSQxDSonlUws3FUdSaY4XNboR6Z8pat3vavNt0VZplXwUzvqN
         YGuBuKCXjOyDYjxMtg8XD2XONHc3Oh8gf13HGS2uh8z6kQrS0ziZVAn0E41BFi2fi0mw
         7cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229956; x=1739834756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8XenbubIJUWheqMjhkn1jG61lOTP/K0WRD37kJpkcU=;
        b=IE+0jDC/hlxNzETiCbSqACAQx/fmqEXGPM0xnNT4x9uVFbgG0twUogocy6QANTmpaw
         E0xcLr+Q7ThkhLYOoElOCQ9y6pOr8ru+eZfW6nITIa8bnvD86ab0ojyxu5PY/4WECdLu
         0mxFrjUFZGE9ocDCo/7D77TdM5rEn/UVLfArWZPio8fNEOHF4wHvKFRoWVO0rDDyq1le
         OAhxyGMtrw/x56Od9Pd6jo0DKR/udnFm9tiUuz+BsCuQx/iM2Z+Sgvn+KbSeB3K02DpO
         ZNki3Rd5GbaWM3T4GaP0RV5Og7+Bv3qLhUxb5G119WQk2zEtFEgOvgxQKuhGYOgRvc9o
         I09w==
X-Forwarded-Encrypted: i=1; AJvYcCU/zqgzZAlD4W8ZHXHcgMd4ZJHvOF3OOuaRaw+R8Bj6VMnA9Sxiv3KC73Cp0B2TY4mTQJRM8/EXfuRL+yx8@vger.kernel.org, AJvYcCVyumoeeQaXOubIo8+xhrH03W8irCeydTTCmoOMjWA0EGO1PvNmbxdhl5fr/Ogg5JKHx8k161xz@vger.kernel.org, AJvYcCWq/AHSxTWvZsajqzdNO4lKUEv/LXQHs6mhV7W1YZH2kSoN/aVla0i385tSq0thv5vGDVGgqdmZ6DDR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/WWIlCh1FHYTml/EFu24CKHLOZpwiJcr7mvwDW3+3+06sG0BE
	HuSKb1vEzUMZiJWU7K5qv2FIDxu8+HDG7nHhmysgfUSRIK6qktY=
X-Gm-Gg: ASbGncunF97hHAbU4kfxun8VD2fP4fP4BUbU6PkXDO2hTXYDaKsLTuauqKjqX6NzDZ0
	gfKHngdvaIxXq4FxCEORqnCjRWf4Hsnra+MelES+SBlrffu+24byu1QWEprby7CO+5BMBasCObr
	AUlAUURgfI9EKaC97Yu5OYXUHMeKK/VdNQrr0fPLoIxuQyGkG02D6soy4HPNdnfX6MVQNbJJ358
	gQtxA9KFC/2iu8C+/GFDs1ujwai5pzBjDVt6+gZ/stkyqyNTqIl20Tp1b3T92a4TsO5Vc9OAPUy
	EyqEsSdIsUpe
X-Google-Smtp-Source: AGHT+IHNYHue1/6onrrPc27NAv7Yzt2CgxTI9Tchg6QmJ/oQr90zAJuy/Fy1+6xVffMwmut1Bs5bxg==
X-Received: by 2002:a05:6214:27c9:b0:6e4:67af:cc64 with SMTP id 6a1803df08f44-6e468dbbbc5mr2648146d6.9.1739229956435;
        Mon, 10 Feb 2025 15:25:56 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44f4835e6sm36479346d6.111.2025.02.10.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:25:55 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	richardcochran@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zzjas98@gmail.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] pinctrl: Fix potential NULL pointer dereference
Date: Mon, 10 Feb 2025 17:25:52 -0600
Message-Id: <20250210232552.1545887-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `chip.label` could be NULL. Add missing check in the
rza2_gpio_register().
This is similar to commit 3027e7b15b02 
("ice: Fix some null pointer dereference issues in ice_ptp.c").
Besides, mediatek_gpio_bank_probe() in drivers/gpio/gpio-mt7621.c also
has a very similar check.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index dd1f8c29d3e7..3da8b0d389c9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -246,6 +246,9 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 	int ret;
 
 	chip.label = devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
+	if (!chip.label)
+		return -ENOMEM;
+
 	chip.parent = priv->dev;
 	chip.ngpio = priv->npins;
 
-- 
2.34.1


