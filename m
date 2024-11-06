Return-Path: <linux-gpio+bounces-12651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E11EC9BF8E4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 23:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED56F1C21C9B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 22:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EDD20D511;
	Wed,  6 Nov 2024 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9Rob0+I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659EB20D4F7;
	Wed,  6 Nov 2024 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930744; cv=none; b=PDA9VTouA3kk0KrsghYatbLbVZY7n4zEGx0qsrZnwqLddFXZ7c/snGel8sh7Hlxxsuv2LEmXMbfYYLBHxYhkDadEyAWzxp9AAEg7w1JnFPWrw3y3nLbUV2RJu3GUvdS9auCFfIPdTuNXewI4TBZ5fwK2h22E0CtURaY+8WsDe9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930744; c=relaxed/simple;
	bh=HZ84kAwePXH0iKsBrbTmJ8UZTEP9+KZqEVc88CIyNII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDqBWFw3M7M0irBGokVRSahmaloPCfUw+qsEEcTNKGtmqFxb1YXn+D1HHf6N5uVC6mWD9ZOaW9NUoOJgpadeGBipUwPwEMxzyI9KouZzwE10FnA6X8cVB+1cTqq0jDHUtTmG6BaZhucYK87gB2tyn0Eesy8nYfOeEC0yFe41jsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9Rob0+I; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4c482844so160486f8f.0;
        Wed, 06 Nov 2024 14:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930739; x=1731535539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TG5UJizDLgMxZKPQD1e03z/iuF1AG30m4Ug3E1znb/k=;
        b=a9Rob0+IK54HjhsormB4S1WNTYbMItsuFFhaOFCIairgVF8yVx4rMNyoSqg/RCF/U1
         cue/Nqjs8ippbPj3ORi2xsmIDwoQ4mwgUVgMUubeXXy/v/BFGfWOIrwwBNfrr58Pcm4B
         nqHKk8HP78z9gRsJE/xb/TUxhKj9QmmW199gK/MFGyTg4xUlOjwhbSJAycrCrGx9s0XQ
         tujeQPadqdgVloNhrVOF/iGIY/Agf9rDigGXTdLs3ULPdY+tn4+TzZtV8ucU0pTjCskd
         UWC7yj4CePX3bD/1FVxmYRLqv3LsUBTTXpEM001ud0amON9t/pVy3Qi8Y2xofTYvlxnG
         stgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930739; x=1731535539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG5UJizDLgMxZKPQD1e03z/iuF1AG30m4Ug3E1znb/k=;
        b=ssqamVANq0a2r1PMe5eZ32uh69seDF2baBPcQwiiFFGKFKB0CTqoLRctRh2TDdQhvK
         b48eETE3JOmicjUhnCfeCDp84Z4B8MNnrvz2NIiWvMsGSo3abPWRdpEZVEjhdOTceNkl
         PjtNHuu73P1M4kTXWAEZhcRWBeMsw/C8e5lXk+j/VBIXWACtyaL2sPB9oMeF134s2A0R
         VG0iVydyhJ9/0M3mnM8/zQlppd5Dh+A8LyOWDkYauoJPdhwDDhh6Ac0APoZgOsugj8Z8
         bKaSr3AGBGDdJUMjxWNKoXEgwV5QdDDS5LJyoDWZPAEucABSuSukMDuc0V6d9ZVcauXo
         6Zhw==
X-Forwarded-Encrypted: i=1; AJvYcCU6OHjATnxGHYpaKRrbOvL4f9Ahpct4SunM3CJFi3cizO9X+dfiT+XBkFqkGemiXOKo/KSV7JelqAv0@vger.kernel.org, AJvYcCUBJ3R+4mCSREES2s0QK+czZNRoEolTFl8SUk8CVlL5seG+O3Sdnfow1yN+Z2pvxchFOEWKJMsEo2YV03Tl@vger.kernel.org, AJvYcCVXv8vltnOGb6qjyt3yZYq2E+Ap/oXCGldBvmV1bf5cyBy+dDM5Kxg0Ew5tbjIJL6+d5+B71Zkd9syaBalqqay22xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRom17Q0tf+LXYIL0s9mS7uAqLnI6XESpr9/vwiDynFCN5/KXq
	zX9eXUKbtOm/CdPxFZb+6angBZUO2bWDfQ/3HaTXolrFc2CK4KF81VvzsQ==
X-Google-Smtp-Source: AGHT+IHseJSgbFNBVjoWiS3THi9dEo+NtqEvSttov0W6mgBFSYQFz5OMcDBoMLaZeVcaYvk10rAg0A==
X-Received: by 2002:a5d:4106:0:b0:37c:d558:a931 with SMTP id ffacd0b85a97d-3806115902emr28098034f8f.31.1730930738992;
        Wed, 06 Nov 2024 14:05:38 -0800 (PST)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-20b4-40af-8ae8-9c61.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:20b4:40af:8ae8:9c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b0eesm20288493f8f.106.2024.11.06.14.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 14:05:38 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 06 Nov 2024 23:04:40 +0100
Subject: [PATCH 2/2] pinctrl: samsung: update child reference drop comment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-samsung-pinctrl-put-v1-2-de854e26dd03@gmail.com>
References: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
In-Reply-To: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730930732; l=1049;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=HZ84kAwePXH0iKsBrbTmJ8UZTEP9+KZqEVc88CIyNII=;
 b=GY6vOISzcv48AjyktwTvRi2p1sfYnHYxMpMijViPTLIYSWCBj4YfC+77AwLWNjcrZw5AN774I
 AJUXkmiayo/C8hgHn0p2gOJGfHYpceafRuVWOX8TmTl5w5PqmY565mo
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Commit 954445c72fc7 ("pinctrl: samsung: Drop redundant node parameter in
samsung_banks_of_node_get()") modified the name of the function used to
release child nodes from samsung_drop_banks_of_node() to
samsung_banks_node_put(). Update the comment to use the current function
name.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 3ab5878b69d1..cfced7afd4ca 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1172,7 +1172,7 @@ static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_dr
 		else
 			dev_warn(dev, "Missing node for bank %s - invalid DTB\n",
 				 bank->name);
-		/* child reference dropped in samsung_drop_banks_of_node() */
+		/* child reference dropped in samsung_banks_node_put() */
 	}
 }
 

-- 
2.43.0


