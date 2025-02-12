Return-Path: <linux-gpio+bounces-15885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E7A330BC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 21:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72F063A714B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 20:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA69201269;
	Wed, 12 Feb 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNgPYjKF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9C202F8F;
	Wed, 12 Feb 2025 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739391810; cv=none; b=SdQgaZq29UmZmNJOVncKCKXxW8DsOVX1JPOFFSBF2npM6Ql52hnlowLbwwgWMmG53ayYcvbRdt443mhuv8tuyLWUkvvGSlcJlfTGTGxUYPNGK8v667iljtyqVm3i+WQmR6Og2IbUtOHHs4QgDlCCIzQ0UVhJiCalsSj+/Gt//VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739391810; c=relaxed/simple;
	bh=T4SN9qQTVCRprL18w226gEvL0hjMQ/9J2Lehg+8OR1I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BVojlTH3fnzaLhe8LKXras0VlBGxJXtFA+cthsSMU3rnYpK9BmQhxcmWlA1YfHi5rdsmZd7qmjXhFk+z+aKVfc6azZxb9ikBmuHIhgQ8m9ViHRQxeiokHfIvXWKK4x0P+F1IMo9ocUOxXFR3BTpfsw7wfr/kkcdTcQHOOe1+qxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNgPYjKF; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d90044ac35so262176d6.1;
        Wed, 12 Feb 2025 12:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739391807; x=1739996607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFqfug0dvo4+SvGxTEfuy1Nbc66z9jbXayYAmndjSOM=;
        b=gNgPYjKFzO5gkTVkOrS4OTXKb7mQc8j5yq7PQt6UZOWpYx5L79SmCil5DwWqylW2I+
         Mc5HYq6ZAji2T6uagUEfGuT1NoZBBTi1yAQXCrHqY72IaO908CL+Utz5cOEXlCZjif58
         6KhgatH37SwxSp/+W1/Vl1oCkM6d3W/LvZgaPhjvyU/7x7oojrrRoB8/P9HNz3JV5Gjk
         P1GOMFHFYqAMnjbyZ4DOzdgJoA7S/rlmzB2i6x3+bA5P71ZkauHb9lD+GxgxBPdGH4CY
         YBi6yXWaPXuQ0l555px/1CsCvSxmoipQEMW3ImblNjrP3z7ybxrGDH8KuAKdvf9hyN5o
         HZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391807; x=1739996607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFqfug0dvo4+SvGxTEfuy1Nbc66z9jbXayYAmndjSOM=;
        b=d8og5DoEaN0Ovd+vf85TuP36wmtyjQABKh5+15w4qwFzjL83ceu8TuGiL1kR7jrB+A
         aWuh+hg/wNPXfOZjjWbkl9TPbREr9FuaPnp/RVQD/SV/RZeHD8l9FubCgPSDuHLyk4kl
         shNDs8RZtQ0NeLi935JnczFaJlUOaLRu8v0wuAgNFmokfrO6CP0DGllCRb7bYq1qEJvJ
         wcylhG83r/C3trRT50eGXY+rGFZiQPs14cUXGuSMTXvgmL4RDEr27TFpRfo9Reu21VWX
         mfS3YRzIts6VC7bD/A1YlRbJdsirHFH/6OS7I6Sgit74ROLG3IJgf/MtMAoUa8h56DtY
         kRsg==
X-Forwarded-Encrypted: i=1; AJvYcCUWA1PUTWhpSSOJ5fhg0Vvfg7ckpkcJYv9WRKDmY0vu6SKIIcB2Gh4kKd5B+OetLW+oVXuS2FmjPXraGpWr@vger.kernel.org, AJvYcCVvhg7HUv/+sR4TpjbjCK5qLXMMKAn2Q/zYYksovWOuYlYEoXmir0BhrnQstXrYhEmJLrog+bDroaVW@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMdjvr5TNkUZ+iV1jN8aDGVkwS6o0qM20gDNtgLTh7S1RlGqZ
	4S5//wFV+Hn2JHq2GvR0DXBXUq5jAxhQ67HN/hf55tLtQz9NQwc=
X-Gm-Gg: ASbGncvadT+w/SqcbVIbqZ4PXPYM1aNIFI/Fzx2zswk4YwtdAJFn5Gji6I9HIp0M6pq
	TSU7FW+LC81h8viEtCC4OTcJr7m13s7KlERj9D9z/zw4Hmml7nl5lIm+mrXUC57qg39mxlgl6IH
	m7SWAOOvOI/6A9N5SUMvDltoxYF15P/jDd93052+kI4cVe2opMoM/fWYDMpJj2XtGY/tFVCDziH
	yixvl0M/Q7JT5oY4ucEq39D962sET2noSjj1DjtLghsyS7rGK8pV/h/k/weaaxbUESBOITLl4Z7
	SeMfwe9dW6Sp
X-Google-Smtp-Source: AGHT+IHrunwFa9y1n/VCE/JHLro3uaHsjKV1AuCg8NjkBGyKTg9Jo6/WpWR9TxBMa0++i/xfgPtU4Q==
X-Received: by 2002:a05:6214:20e9:b0:6e1:a79c:4cb8 with SMTP id 6a1803df08f44-6e46ed772damr30480456d6.2.1739391806803;
        Wed, 12 Feb 2025 12:23:26 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43baacee1sm82943076d6.84.2025.02.12.12.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:23:25 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	linus.walleij@linaro.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] pinctrl: nuvoton: Add NULL pointer check in npcm8xx_gpio_fw()
Date: Wed, 12 Feb 2025 14:23:11 -0600
Message-Id: <20250212202311.3741443-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a NULL pointer check for pctrl->gpio_bank[id].gc.label in
npcm8xx_gpio_fw() to prevent potential NULL pointer dereference.
This is similar to the fix in commit 3027e7b15b02 
("ice: Fix some null pointer dereference issues in ice_ptp.c").

The npcm7xx driver already has this check in its npcm7xx_gpio_fw()
function, which provides similar functionality.
Add the same protection to npcm8xx.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 471f644c5eef..d09a5e9b2eca 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2374,6 +2374,9 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].gc.parent = dev;
 		pctrl->gpio_bank[id].gc.fwnode = child;
 		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (!pctrl->gpio_bank[id].gc.label)
+			return -ENOMEM;
+
 		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
 		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
 		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
-- 
2.34.1


