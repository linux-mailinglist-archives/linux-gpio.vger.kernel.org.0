Return-Path: <linux-gpio+bounces-12594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAF9BE066
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 09:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72BF1C23223
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 08:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3B51DC1AB;
	Wed,  6 Nov 2024 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LsD99UAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5501D5AD7
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881177; cv=none; b=X0eHQi/HLLUvG9tUE7fsyeQmouBRDFnw9QeawXmKskha4CCLyIYj3mNf/Q7UvgBcsZStwQh4b3QfND0QvSwMn/dHs/y0/K/BAbOdb1fswL06zQ0c9KsefrzN3YX2d7enX3u5BQuXmu55xfohPOz7GR1s0c98JnITtlh4bgGX1s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881177; c=relaxed/simple;
	bh=mPMc+AF/vlJROlCObatgVXliT++4ROpN8Q/2wbdWDrk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tHPREZcYss8vNr3+qx/kUSh1xNO9FcX8g7TFLXLbOYvxNQHrvjYvGIgtAHcdxOmnQOFrwFCoX5E4RCaW1cE3CHMhNwO43kjRQZmK24xgAe0kJ1eXxiiEr0Z0V/LrK4x4eg172rEM3zR9lIrb0Bo7MzWRvITdwzIqha9CzEGBwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LsD99UAV; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9eaaab29bcso417156266b.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 00:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881174; x=1731485974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBAuoz3tKBWR03gOjJllr++JmJ/mfkVVEbr7EkinvMo=;
        b=LsD99UAVW1QLt+R55TV6vkUOUUBrOFFk14VzlqPM97YyNQFyEep1bAMnadnrU7THt+
         BuuoBtoOlgA7e9STZ/1+ktYWtmc3uIQ0w9cdTqTzSk8l8FPGT0tXLecuvfUN6BB91BdK
         /BYUIWWC2FZ8eP27GOxKd+vRhMrmnty9++t7UcgOI7as3BgURwfv6HwHshdoJAoLku2d
         chEYhyQkhIh11nEDiyaUyCZsKp6VVovTRc027ksMg9Wyc2TIkoCWsa5G3k4MUgb5/HjZ
         pyt5gI55Jzq37fnFwsrYJ3d6+GhuuHHC//9Aict1EfU3zHOyLZuSIjwDblapF3t5yNwl
         l6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881174; x=1731485974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBAuoz3tKBWR03gOjJllr++JmJ/mfkVVEbr7EkinvMo=;
        b=Yhph+a/iWDuyyI+5xAo6igdI5SYTgcmWiV4YLu8rUBJJc4bHMvYLyCCPiSaIrsz1SF
         Um4ITm848nyIyadMMNFx9ZJrk3IF0OhA74ryP5xpTP8y/r20s2/jEIvPKOFb/mx6TaCm
         MM3+yDqP+Mm5fyytW6l32ecTOAhr8H41LmzgHReWqyNOqkTNzHl2S0ILo38vbg2EOnB7
         4xu+Bs0J6tK36CRVjglmHjf3gzpvrnjxu/HwWqey+WTkWIOwOfv2rokzbXqenauNxQfH
         1PVVVBmdaxemeF2VPFJVUKENHD79qa0sbuiIB9hEc+wyIzKvcPLLos2EsYX6ZC0MwAXF
         BTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCULFRnwbrE3MYQA3GmgAQ7rReNvK8ChzC+tJ7xX/YPTvRa3701Kezgb+c+QptzbeDrKJeHFibpJp8Oq@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqoArceFcqvMd/7LSLDMTtV5OdF+PsFUlgDd+qHXNgP5TsbV+
	cjJNHzSk1BxT7StGRZwzGMwUkMN14lMDlXRAWpNeJeFqCjbpqjsZwFNdW+thLhA=
X-Google-Smtp-Source: AGHT+IEwWlrK88WIb1wNQGuBxXyAjVdXhR30N25VSy/E7pqQApgtSLL+zYLhkyw+puly/i3rzm4dFA==
X-Received: by 2002:a17:907:7242:b0:a99:ee1c:f62f with SMTP id a640c23a62f3a-a9e5094307emr1876407366b.34.1730881174308;
        Wed, 06 Nov 2024 00:19:34 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:33 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 09/31] ASoC: sh: rz-ssi: Remove pdev member of struct rz_ssi_priv
Date: Wed,  6 Nov 2024 10:18:04 +0200
Message-Id: <20241106081826.1211088-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the pdev member of struct rz_ssi_priv as it is not used.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index a4d65be17eb1..a359235b55af 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -99,7 +99,6 @@ struct rz_ssi_stream {
 
 struct rz_ssi_priv {
 	void __iomem *base;
-	struct platform_device *pdev;
 	struct reset_control *rstc;
 	struct device *dev;
 	struct clk *sfr_clk;
@@ -1043,7 +1042,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	if (!ssi)
 		return -ENOMEM;
 
-	ssi->pdev = pdev;
 	ssi->dev = &pdev->dev;
 	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
-- 
2.39.2


