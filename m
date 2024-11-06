Return-Path: <linux-gpio+bounces-12593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 457319BE062
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 09:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A5C0284960
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084591DB956;
	Wed,  6 Nov 2024 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y7QszrUW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EA41DACAF
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881175; cv=none; b=ISYgXHr8sJLAAuFUvtXKF1KrGqECiktUpBJLXVlhnbIhzz+Zy6Fv7QwWGrC//cw/DQSF5AAvV7Ys8TqzLZV55I6tzQ8ogm6lhw3jO9L5/SCZvBU104d5EqXZFo5TCb4i1uxoWvwI6KJobJdbqSX7clBijEbWZQ7cwhtrzelhjnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881175; c=relaxed/simple;
	bh=a+IUchkvg57gxZbkyNp9bTZ3an2EXOBGERsCCV+NV2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HPz4lUXeXH1BFzL6hry8GjLkeQrsmCtK/Ayt+Y3NGxxGM8526hcRGTDJb4I66RFxwlaRaPej8R26yErOFdOiqjjgWMYbCJmrp+OwZbUB3tVdTMtfUk8wnA3lKbXmyoCiug5F1Lp6vzW15+3UseuhM0K8mk1WH4h0Sdp/ATHQowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Y7QszrUW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a0f198d38so1080305866b.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 00:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881172; x=1731485972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54nqiDHAf9M3O/5JYgCXuFRVc4rEVNuOCEXOJ805IPg=;
        b=Y7QszrUWozmghiossX93kjZkOO2rnwBuTn3wLXQ1HqdJYysAGEIxo9owGy2j3nO+c1
         WkpCC0H8OLsLBHBYS/Vo/lbmn0ggLaGdAwxM8HYvBtPP3FYaFYYgLIXpeNEeNq6fntUS
         smNKazFySj8V54iPpK+zxbm29e4F+GI48kS4kJc+3HwNeXsVl71aTVKpvK2orW1T3GRY
         Cj3AOzR+larPoeJuC+NgnfPjaXAaOJJ1qg++dj0TIGKcnCqHC5W35SJwFASDyvrHHIWR
         CX4eGegfWi7u492uwqR1/S2fp9d3DNESXdRLG1e7qLDr1233NwbZhECHKTs+w5jPJ+jC
         M2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881172; x=1731485972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54nqiDHAf9M3O/5JYgCXuFRVc4rEVNuOCEXOJ805IPg=;
        b=ImyjAOjH+zfW7VU9YCDq1Ox9WnjvVa0hR6+QudGspO8OQVPPblCg++L1hKecr8mJZ7
         /yYDFeez9FeFU8KvWRDqw8+tt5ncCpYsynBdoV6aBX0LDswD4Bu/Ly8ZWC0yHgyy0Gqj
         IXcQmkw63yU8l17D32EnlF0WedDecwsd6lq9Qt808Z5UzoyndjN2eJDNqcBHyvx3J+Rt
         OU4pnp96O1m80ut7FfRvN2tUTKWEUG6C8hUdqVFJy2ZKEchi4nqc/NX0E2f4CdWHLpKE
         NuKBw1wQ5kzkGXUdnSHcCrPv5x4zuXS7ZUfpUn9WU4+mMucNXmWd27cMkSg455HQVoAA
         h/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX7SWyQaLGDWj5KnCuYj4hkfHiwgxC850AuOn0rCOa+3D2P2xck0vmkw7QU+1o024j7KxjnlOz3w017@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBfQygdmpV9tCIkAXM83yyKf1Gr3MRgrrll92UUAUcfu5nEV3
	4DNzlGsucd7b3bvKxzW/IcfDnKdvZ5TJyWOjLGOmrkQlq5Hsa0+Ot055G+ZE9nc=
X-Google-Smtp-Source: AGHT+IF/XT22UAeG19xPFVLsEumo/uwLEK05hyFiHlUZcUMHq9+9v5dsaFc4UYukkjyQ8GsIJhfNjA==
X-Received: by 2002:a17:906:bc02:b0:a9e:b150:a99d with SMTP id a640c23a62f3a-a9eb150ac01mr535571666b.5.1730881172333;
        Wed, 06 Nov 2024 00:19:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:31 -0800 (PST)
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
Subject: [PATCH 08/31] ASoC: sh: rz-ssi: Fix typo on SSI_RATES macro comment
Date: Wed,  6 Nov 2024 10:18:03 +0200
Message-Id: <20241106081826.1211088-9-claudiu.beznea.uj@bp.renesas.com>
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

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b4439505929f..a4d65be17eb1 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -71,7 +71,7 @@
 #define PREALLOC_BUFFER		(SZ_32K)
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
-#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-44.1kHz */
+#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
 #define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
-- 
2.39.2


