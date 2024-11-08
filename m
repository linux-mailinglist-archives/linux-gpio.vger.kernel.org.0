Return-Path: <linux-gpio+bounces-12726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F39C1B44
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 11:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4BF1C2662D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 10:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8AB1EBA08;
	Fri,  8 Nov 2024 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iebG5QP+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA81EB9E3
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063033; cv=none; b=dNxhAc6x3ihUaA49rqliaodC1ZKU/m7XOqTHFqrg7NvmoV6Z+hkCdVfFE3ZQlWt7pT/Q2r8ZtSc79Au17/txag3qHSV+gTmQ+arARyy+VAbsLGParumkQVeQYLU/nyRlYo7mRK1V19FTvkgE4EnwwVHMeYxoP7IxcdVg0xjYsY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063033; c=relaxed/simple;
	bh=uQfKkEoR32N0d989ZespVXFD+EYoWvBvpUMB8tvOdrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lhbnQjZZk9GXfFHa+E3dEIRtyIPSwh8W8Q3/AFvNd8q4mwtDJ+VNSzSsA3CiLx8duf77rP4tS2GtyE5ZY2dFsVNeCPeVq53kTHIShBy5wERuFktFrOblDv8YqWK1CnN13j8l0dH3Vfu+W0jHi6RZARBP5MxCEaXlrv0uFhapJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iebG5QP+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a628b68a7so331694066b.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063031; x=1731667831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVWcqtL2/z6hHqWPVR/NbA1tV+dgOCVHn7AuI7jqeJ4=;
        b=iebG5QP+iP6Inr3RzPjO2Qc4Mlyw9fr0dqb3vxbEk6xx1YTG7nVwApjBp1mYrppw0s
         rzQis8MO+CHhIWaZw0J25uvRxk2DcbHUNjdqrvX3lC3zTh4VUhk9E/FktQH8sxsALkgs
         ABTKObYNuq4zEnOMi35/rP7Gje6Ad6dK5CduxQ7w9SAhQyWQcA6igVqOnG21riZXE+CO
         bFr6Vm7EzB/sva6webN6ueneeGDS+ySJ3A/VQqNc7dGAaqA+mvSPW0IFpe88RpFs/g8H
         ouyIWQZhN0y/WK+pOBFj0OhWMgx/9uliiY2/qlQ7zu1WC1rYWevGYybR/OkPpNH7SqKO
         +ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063031; x=1731667831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVWcqtL2/z6hHqWPVR/NbA1tV+dgOCVHn7AuI7jqeJ4=;
        b=n6bveFua/+6+ZlnCU15CBDrxAOHB/j2cP9/A88GgLBTo6EqAomCkovNc4oxhroHJKK
         7bnJarT2r0ZrsuUYSmmN4dpJdV4frgLMCSGCuUdITgzAIQx0AWCKTYeJKAmna9kYpWna
         fJYVuxZUL2NJI/I3shHKNv5bVFp06syastgYWRZcFf7oRAhsCm9a7DDoLcQJ1f1gw5LV
         UMsz9EV5QD5bkbgvbBAkIXRGiaEgpqw7Glq10p+vrvtTDJZeeYwvBUlVUeZwZzgS8ygF
         u9cYJb4+SWxZf78JrGqzQ6iKSmWePIsGjxi3OB/hKv5njRbeN/sfUGZ/3spCuPRqCI1e
         4c6w==
X-Forwarded-Encrypted: i=1; AJvYcCVYqdDgM/eHwUzMU37lIeFee2V5R1ml1K9EnEHlJSjQLWY8SC0vh6vifrZl7INPoETe7jxgFJ0LJPSC@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/i1aHAgzAoE+OhH9oEiku9vO/Fc8b+LIYtd3xFcplnyKeh4A
	Rs8DNpuBPkS4NgZLfHN2KzyHOFqfa7tBdllvik1y8/L5LqCU+jDJXVaXmnb3CpI=
X-Google-Smtp-Source: AGHT+IFft6CwH3EePxmvnwbJFYSPRDnYeOJGj9yj1dd1M3Hdcr69b4JKtRaHUgCl0R3MhySJFo0PIQ==
X-Received: by 2002:a17:906:848:b0:a9e:f28c:3749 with SMTP id a640c23a62f3a-a9ef28c3ac0mr107670166b.32.1731063030575;
        Fri, 08 Nov 2024 02:50:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:29 -0800 (PST)
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
Subject: [PATCH v2 08/25] ASoC: sh: rz-ssi: Fix typo on SSI_RATES macro comment
Date: Fri,  8 Nov 2024 12:49:41 +0200
Message-Id: <20241108104958.2931943-9-claudiu.beznea.uj@bp.renesas.com>
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

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

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


