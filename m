Return-Path: <linux-gpio+bounces-12733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE15F9C1B6B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 11:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866BA1F23B2F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 10:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E93C1F5833;
	Fri,  8 Nov 2024 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V8j+OEBM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B51F473D
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063053; cv=none; b=fYNrCf7qurfV62W1E6MbVbjlJunaZnzbnNEvoY/zhQbqFA4ObCde7F36ibUCY3ydKS6H6C19UNylddE4uLF1dr+1cWKgwUTg8sHN735MGX1KblbdPjfoG2OVy1q7F372NxiKv1MzM6KVw86wHRH5v6P/KXGRR1ZqXI48wRjV1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063053; c=relaxed/simple;
	bh=VonvejSvZtz2cWZ7EWWkpJ5UBzctxv952aKOBg6yZy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K8/vZSNmBwl8O4UTKM9mTdRHHUnZLo8qrSiK7k7CWnmpTIX4oDTLw3/t7triBZLm4A/wBVmSWuFTgfwO6dNQqJppl2EjmCBiXYu8DXKGPqg+LK7EtmDvwxqRK8fym/PeUUc0hos2RQ6WD1v8tjngjvLch0O24WE+yB6JVafaisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V8j+OEBM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a850270e2so340516666b.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 02:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063049; x=1731667849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxD29TLdBIx0OFMI1iZi4DJrptnupP/yjljls2N0w4U=;
        b=V8j+OEBMF6WFGysv6HOLU7vp2a0ENEL/8q80spkfXN12CLjlPnIi83qYEcaU2vMLaq
         xBPdPxRAuaM9jYYDco/Dg3aaG9Y03jNhGCMGqavUmwacrHfwLajn5S0Q/rWTw4yv+ifP
         ZoWVcwveM0nKI5tdRK2HNrJZ2dS2y7vq4BuxjacNcMApNv9ulldYWSaZr8TXx3lJZB/i
         8ScpginyP8OOQznIB/eM+q/brvVJx5mZx+VeV9dqV7IA3fnzOzgQbT2nh0WBKae+tYUz
         trimE07bo6OjLRQhrWIvhrC/f/rYFCYYM8z1XlSMfhNFI8oJwazT2tGMiLFy1TE8yvkm
         gLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063050; x=1731667850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxD29TLdBIx0OFMI1iZi4DJrptnupP/yjljls2N0w4U=;
        b=oK99XZobstQmP/B8qlhcJvXnpiGvnBKCaq61r8yR6RTxEjMVQttq7toYp3lYgdkny1
         OYq/yKyayXedqmfqsQZErYAD6jS3vU66uWXYjQeNnmDbXDb0MqaImv0QIU0EgtEluGgx
         LFr0tEjaYFSzoHZ5Cv/X8WbQusIgQrVTBAkjGrosX1aWPXBx8FLUnX7LlVjyvTjRaqD7
         AIPukAJUjhqPodqqmXdiO1iR3YeMiJy9O/Qf5BZSY77qsCls/UCLKFVQKKAPK+QNaQv9
         4PaTlM/xfbHqEEHf5AwhQ9ZdJ8Z+5+/DdC7C3YHAoWmIjOxGc3KvHEqnyxto+JgDMaYh
         vXpg==
X-Forwarded-Encrypted: i=1; AJvYcCVonZ3su7lMgnZAVNEmry5K0AlGI7nfZC8/tT4lLsdKFpRKFQ3CLIwBb9fjFiF0eHzAbEIoOIzunkVn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlg5X39j2wXtQgQgNjlPj8Thp88GsqzLVN12RE3ICBX+TY/yiA
	YrfrfnID7n1OVgQqa+ZbpJ8mYlB0G0iAfB3AveUk9uucWDFjU6Dksyr723tAIDk=
X-Google-Smtp-Source: AGHT+IHvN0EL1LXToTh6UC1+zMH3D9cZ2TY8Jb6+WnY25RpAHLyVeWrjFPA7b1je8e1yRCDrv5kzpQ==
X-Received: by 2002:a17:907:6d05:b0:a9a:19c8:740c with SMTP id a640c23a62f3a-a9eeffeeb1bmr219199566b.47.1731063049500;
        Fri, 08 Nov 2024 02:50:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:48 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 15/25] ASoC: sh: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend the SSI
Date: Fri,  8 Nov 2024 12:49:48 +0200
Message-Id: <20241108104958.2931943-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The ASoC subsystem takes care of runtime resume/suspend the audio
devices when needed. Just enable the runtime PM on the SSI driver and
let the subsystem runtime resume/suspend it. While at it use directly
the devm_pm_runtime_enable().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 4af381f6d470..35172630be8b 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,11 +1140,10 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
-	pm_runtime_enable(dev);
-	ret = pm_runtime_resume_and_get(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		goto err_pm;
+		dev_err(dev, "Failed to enable runtime PM!\n");
+		goto err_reset;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1152,15 +1151,12 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_pm_put;
+		goto err_reset;
 	}
 
 	return 0;
 
-err_pm_put:
-	pm_runtime_put(dev);
-err_pm:
-	pm_runtime_disable(dev);
+err_reset:
 	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
@@ -1174,8 +1170,6 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 	rz_ssi_release_dma_channels(ssi);
 
-	pm_runtime_put(ssi->dev);
-	pm_runtime_disable(ssi->dev);
 	reset_control_assert(ssi->rstc);
 }
 
-- 
2.39.2


