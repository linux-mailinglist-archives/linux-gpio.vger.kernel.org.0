Return-Path: <linux-gpio+bounces-6970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E18D5141
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BB371F21C55
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1B14CB35;
	Thu, 30 May 2024 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGCvgbjU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E7C50A6A;
	Thu, 30 May 2024 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090927; cv=none; b=famWvC/ogSzdCeqlFvaZWiv2im8vWc08dLg8ONL6AHsz5+wj0KOshfMIl57Wshv8A6HQ0l8LZ9qBBNvFIuNAi+1h0ew9PNPl19bfFrDzjbDpXtN7FLKOGZJczNdkfrOFx0LwegAD4BKDe83hQjyDhVirPmIT1zdUkPRlkOXGlUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090927; c=relaxed/simple;
	bh=Y63eZj5ynJlTxp3nqOXtbXsLRO4yqErLE+JF/wE/wa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NhwPmTdU2CWM/jnICMXj1NO7VLCAJtOnP+7aW4wFFHypR/+D9t6iU/d+SxZ6QvzMfZV2Tmn01iuWLSonBzgdcLac/aotenuboJYc0q3dLFmGfm0c7rC82brD/kgw3BczNcQq7Qhtp4xrfQBMlPgSGWp2r3szkq1X8DeeUss0Ppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGCvgbjU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f47f0d8ec9so9966085ad.3;
        Thu, 30 May 2024 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090925; x=1717695725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiG47SSKhvKKnIa+4m37tigTBR5LjSSvO/WTRu8YSHo=;
        b=VGCvgbjUGo+R0Sn0IElNSEgM/y9G76CKpNZ9yyMpYYJobKl7stI9wTZXBOT9SNQsHT
         V9ysMzp1xR+T9tIwb6KoJq0Rmg9jTz9etBqQdboOgROpoqzjrGLrs8uzAj3PcGzg7eid
         e6FpL1QVXsK3xQvQo27WyzNmI18UBgK7Q/t8LcB/E95n1QVOV7WuJF2M9V7OMHxyJdyG
         2iv+8F/KNfqEmnNfMGNSwfoc72ljwmfkUEpxceDoHgO1NmIhEOVBXlIIsEWtMUImBFUV
         c97TVmqZOebVElHstgPHh3lcv+lsSeztQw+U3hXxhibgaJMv26K+k2l+jhmnuVGlwlMv
         ynkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090925; x=1717695725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AiG47SSKhvKKnIa+4m37tigTBR5LjSSvO/WTRu8YSHo=;
        b=GqrbOirHFGeq3E+ISomDO6BOqzFRPM3IR2Z+VCeFh/utBFYu+ACbK0PJnRuO2WFGmI
         GjOnpcXk6GxxMkneRz1LxfIUt0EQzGEfd2f1EmSE18uL94GvwT2B8fuf0tXknC+zejVK
         K/lAD20JuZ9CaMwzxO1uKy/2C4TkId6v7uN3oGUuy6hNpDJIrQnZXZIWCBFzFSSVimPM
         SdLAijtX6crNAwkISRoM/G7Z1+tZL77Gw73QL21ueKReBLVrS+A6unFEKKqM1HF/cdgT
         ABXVK5mnpjwTwuzFeXabLi3FN4q96U8jhsiKfQwbQwriUyBXEDFvtfnggbJKgmr5FkLn
         a4pw==
X-Forwarded-Encrypted: i=1; AJvYcCVRg0odvk9XwTJW/4CRBrow4TVBA5Tk/E2oJsIbjIdgeHQNcAyD5ZSWUa1LggSYN7YrBGNgC7qjyr8tpMUpMxS9PZ60g6PcwqW+kSSyp2ZVXx5bituNghKBKoVWFzBx3IQHDHVLtelHToGa4ymttmB4lsuMORPuEiD7X+fjXtMeahLsCTY=
X-Gm-Message-State: AOJu0YwfVA/6RrGwJ/Xjy+T+V+W85AJ0BnZiVG1dTGcggYbtvxEj0+zL
	XCmqvLUM/LaoDnqykBYPfR06xHyUg7DC/lc8/sAvE1JZLkfhgXre
X-Google-Smtp-Source: AGHT+IEx735/UTJN5pjZSIrJE7MoozX5l9iuKJoGuRlDf9QySZL70tvBmvuKLU1qgUQoPqfixg/HRA==
X-Received: by 2002:a17:902:ce87:b0:1f3:83d:ee82 with SMTP id d9443c01a7336-1f6195fabd6mr29893205ad.25.1717090925313;
        Thu, 30 May 2024 10:42:05 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 05/15] pinctrl: renesas: pinctrl-rzg2l: Allow parsing of variable configuration for all architectures
Date: Thu, 30 May 2024 18:38:47 +0100
Message-Id: <20240530173857.164073-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable parsing of variable configuration for all architectures. This patch
is in preparation for adding support for the RZ/V2H SoC, which utilizes the
ARM64 architecture and features port pins with variable configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag

RFC->v2
- No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 84d5882099a0..89716e842c63 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -317,7 +317,6 @@ struct rzg2l_pinctrl {
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
 
-#ifdef CONFIG_RISCV
 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 					      u64 pincfg,
 					      unsigned int port,
@@ -336,6 +335,7 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 	return 0;
 }
 
+#ifdef CONFIG_RISCV
 static const u64 r9a07g043f_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(20, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
 					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
@@ -2219,13 +2219,11 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 		if (i && !(i % RZG2L_PINS_PER_PORT))
 			j++;
 		pin_data[i] = pctrl->data->port_pin_configs[j];
-#ifdef CONFIG_RISCV
 		if (pin_data[i] & PIN_CFG_VARIABLE)
 			pin_data[i] = rzg2l_pinctrl_get_variable_pin_cfg(pctrl,
 									 pin_data[i],
 									 j,
 									 i % RZG2L_PINS_PER_PORT);
-#endif
 		pins[i].drv_data = &pin_data[i];
 	}
 
-- 
2.34.1


