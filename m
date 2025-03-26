Return-Path: <linux-gpio+bounces-18015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8856A71903
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B863B178BF0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE11C1F4717;
	Wed, 26 Mar 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRNyq2hF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48201F8691;
	Wed, 26 Mar 2025 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000012; cv=none; b=YbdOhfun9P1CKrdY2AyNbm4dLoQUHzjR+g9l4Mz1Qxi0BeJ3/5Mh5FtDjXYenP3MLEoOX7sbcDLzBoaahj/zsiMy/22Lgt5vj5ISYlN94fezSCKDpZM0ESpaCbhWTiCC2su+d/TyVxXxExiH/sh5WE0BjpMNQK+TSY5k62lJ3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000012; c=relaxed/simple;
	bh=kpI3gp3MRY6M2LbTZYS2Bh+AcXVh5xJHYVQGkK/btjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0CEjpC+zA+BaLnpN52jVQTTD+6WiPNqum7w/gp+5BZRvHIiy4pHrt69QkPzr3gDTGsK+lRVRvyvALXapxIJqOaHukOUjKvZFqv3lknfchqAF2fCRd1vvpBUVMYSNdu6X2+W6fYY6yrTmC7hc4KtRDl0TVtWZd3xFy72TGOiOj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRNyq2hF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso45184665e9.0;
        Wed, 26 Mar 2025 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000009; x=1743604809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1j1BA+HGOgIyo6xuYGOrJ+5+PYPIB/d2Yf/ee1CtZE=;
        b=GRNyq2hFJqzsFrSBDQuG0UYDxpfHf1iEj0CZahhFzCCXBiv7a72dhuu2jYuhn8uivg
         9ADJxJ1X2fMTwz6AdJzF7yE43hjrJgjwU05XiMLHFZ7CjF8BG56kXGuncOHaV7mn5l5Y
         ITtTNOypgA88bpkeVBDN6XMso7vye/VGLBSvER5QtYyuU0Ydf0GY8o2DOTNsBr1uSpGd
         o7vxl5JIlJUUSM4iMnUADoJJlMBUVnjE7/KhhU0gGbNnjvFRSLxtAP1kLpBMS3gl1lES
         vY9+TYpBBK7KkPpnuNQqPvIX9uewhMNJM/09T1U8XwCulp+TI6FOofSFWYRoBhRiSf0F
         KuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000009; x=1743604809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1j1BA+HGOgIyo6xuYGOrJ+5+PYPIB/d2Yf/ee1CtZE=;
        b=Lve5T7j+khKt+zLFXGjoGDbFQRcW4dWdZ2NAEOCHwXMe3PfA/gkhtZ3P8F9A4HXxid
         IDvGvttGOjZn+t9sE+CMOpUe9gflsx0XSp9uj2cXU8YrM/6qGAGynqXQdwUTskRggrzU
         MlxpwRseHn7elSr2S23OBtbv8IgzAEPOWi2YJ8A5tE+7bWoaSDefAl6FZesHqko6SEhd
         6AJlQPOlXbP82KyZoPu1uy353P6gKfW82qPT7v6iXbML1Vgbv2XWhg1os1EuyxnJdZji
         Z21s+hwLzPct2QBTxuvfGJMtdQT4bTySPQLfkHKh+qNuOPQ54MZH9vaEUpHvfmP14e4k
         BH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUHSVoEG0TpNC3hn4l/WksWC6mbY174ktR+2P39lXTdZUFFidBuDZSXHtDwve3XYs9JffSuS77JnVhRqA==@vger.kernel.org, AJvYcCUMewj6w/Z9B9ryX2FMGNnV6pX8+fAvyQGLbDIBeSvcspfh08Y02KY6ADxqWQfnUzmtaFWV4Ux0Dwcu4NsI@vger.kernel.org, AJvYcCVV3AsH0TLRc1rqTrCiKyN09aXQyrgmbQgZD6CuNlplkj5/0L2DMG6iWOCWNaboNvZs2I+2M3L7eN/Foa9O@vger.kernel.org, AJvYcCWnplU35woGQgxusRAyNPyHuizYJAriFbaasNWqmchl34dydl48eeV5ntuvDt5s8oilk8mAqn0Tb7gq@vger.kernel.org, AJvYcCX9IUTDFdwsIlt3hw2nPH62QsB7Iorkml5ufez+q4rfkecuNZXdRYg7qO1kcXCCy2gq7I6Yzfej2aYf@vger.kernel.org, AJvYcCXtr2R6qoxfO8WyDqaHUeE5sk2q18dz8n9tjircRMlfKtyBUV8S2N/aCCS1vpzsZH/d7LequtO3Gf+1@vger.kernel.org
X-Gm-Message-State: AOJu0YzVe3iV2E+UTJZMu3bd6aHCNz0LEuxgVc/Adc11W68YoF+uO/yR
	2c8BoplyYRBNTunBvDiQj7HqK+3STEJ48wLqfcW2UBIoZV3bj5sr
X-Gm-Gg: ASbGncuoZ/7jtcrWah20eLZ9bTCe3rucmijz6kTI9KlWoqO4JR5K85ePIza5Mc1vWFz
	piC2ZrX9z7SD2lhDwRHQdCG5pV0I6Hr1Xa0ZkKxOXMVcSdNePCbQYzouSxefJ7RhGCCsKNAsD5K
	QQvL1TCA6EaZVxtm3qFiA11aORtnc2nUIWA1kLUfjAlNISlVyF0osrxWVJzNW2fD7mxzczTomhx
	Au5tXVT9zcHTOZ7JhOW08TpS5QyXHOLmsXT3AwDl0P5pNRHxpBc5rTFbEekDCNtVlbPFZpRRYKl
	VCpuiVJlJZFox2Qy74/r+5C7Sx/58wfoT4be1FajTgfENmcb/NW5JfI8p9qmyeJ+ztk98bWtHRo
	qZ+Y=
X-Google-Smtp-Source: AGHT+IEKbkR38dvRhy1sUXeJxZCnKrWnPS2l5frO3p+7xh9t3NKy5sNOQr2iTx/hFYOhXUCLD0Hysw==
X-Received: by 2002:a05:600c:4747:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43d509e43e3mr201240375e9.3.1743000008858;
        Wed, 26 Mar 2025 07:40:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 09/15] clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
Date: Wed, 26 Mar 2025 14:39:39 +0000
Message-ID: <20250326143945.82142-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the compatible entries in `rzv2h_cpg_match[]` to follow a
numerical sequence based on the SoC part numbers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 4c0247de6cb0..88ab26a077ae 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1367,17 +1367,17 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
-#ifdef CONFIG_CLK_R9A09G057
-	{
-		.compatible = "renesas,r9a09g057-cpg",
-		.data = &r9a09g057_cpg_info,
-	},
-#endif
 #ifdef CONFIG_CLK_R9A09G047
 	{
 		.compatible = "renesas,r9a09g047-cpg",
 		.data = &r9a09g047_cpg_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G057
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
-- 
2.49.0


