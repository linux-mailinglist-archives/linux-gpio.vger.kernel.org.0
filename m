Return-Path: <linux-gpio+bounces-12942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB849C70CC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 432BA28A05E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5685E20102D;
	Wed, 13 Nov 2024 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YxOyr/ar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE5200BA8
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504955; cv=none; b=BBdeqwxJ/muhplVldBVYxb5ub7aD/uB0CjHfHnOC70wk0E1TGqnm3YlHrVV+4JlsZB48/iFLGyaJLLgsmM92r/oNO3fO1XfTpVOCTzpx3z6OGmJenTfQLbGlTLU4yrSxOVyjKmdbeuEAXEDf2Sm2S9JoJ61ajCrnzkDF+bMC5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504955; c=relaxed/simple;
	bh=hvPyCBg0Ub380Oer84TP7TBiOE9lRasIFgVz5JcxaTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iVpF/TSIJsL0GmJ24ELUZx7tOS58mBpR3wj2lo33XRKuLw3eOrVhJZ9SJtUdcJGQlgv+ErFmbRTloKvECzUaJeZADiedxs+ZOmZ3wM5XjPCt/Ec60ynLc3jgKMaWLUIguArEaQCfkRhgbbYW+X+dioZ43z1V82pqGszjq6HE9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YxOyr/ar; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so56409635e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504951; x=1732109751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M39uGs9YqOaYwvk+mW8A+OZczlIwAy9DMfbQh/7ugtM=;
        b=YxOyr/ar/UEJJkPC5H7RfwYV24srrsCd8k8sx/Wsu9MmWlCOKeORpJ/7tq/YDm2ctf
         ELqCkjIHc3E/PXIugfgjUThbJFG2UV+lLxINfdhCvfa7MkQ+C69HamGwT8rxgyQCXfNT
         ohX0jq6mv0dZN1a/kvg0eznOhxA6nUGsXvKzLKFP5OCwWhn+tiZv3EOFzHglYbJ38lNY
         s5enT2XD/dMYElBhPpooHcmS52qJunftvMFvcGekDAuXsjzb9Aq/C/n6x5F5wlYaedLa
         3aZzTRnQ3wPw3lVwz9fZJOhy5NhdHa+NL/zJQ5tkm/1q9SzNidwVAVW17h6/k9W39+cB
         JNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504951; x=1732109751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M39uGs9YqOaYwvk+mW8A+OZczlIwAy9DMfbQh/7ugtM=;
        b=IYY6U3u9NBqPoY9Tk/fnzyJq92w55sKGNQvwBAvgYVuxX2mnVMFuohZd2yA+fN5AvA
         yuzLQsjpEQiykNoNMgE9mZ0semfc5uGCLn2xkOyxxYrDCGONZy9yCbaabz1XIhkxC9Tb
         PG24oRLuk2WPlaycs9ur2dGe+e5zFjwlnfrS2yuNVEYHSnUOdxtamM/d70B7Gbzf3uxP
         sXr47vibFK0VFvToguPDEcmFWct9BGZgL0xnuOx857BKd0A1Ok/wvn/9SdKP76o5bKBR
         g6KGaeZYX6aehlqW2me0rrQ5VfcFn5WW46SedBDNz07a5paTVZzE1Dq6gCTLFH+c1lK5
         FgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlKvIL+YXUAADo4+pquFcjoQP1UTzgH+Czsw9KiUA4i/d7xTZzXCMfgl23wVW0pIKeWXG4eMKaiEj3@vger.kernel.org
X-Gm-Message-State: AOJu0YxHeBAC/z6LzhcieDfhtRWj1HbB3VuoI8SFSAPCJfvqWMusxvId
	w54Km5FNyga1jgeB4DTciVapFhB401jbRPO0UprIy6RHqPKB5mYxQYghoruEpTY=
X-Google-Smtp-Source: AGHT+IH2ugJaSPEuNVTVb2TRcI8mLVkS7FRoCthfFGJrkjmYo7s857ZhiNnPrsmgApA/a3Xpwba8AA==
X-Received: by 2002:a05:600c:1f13:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-432cd47dac2mr60776305e9.30.1731504951418;
        Wed, 13 Nov 2024 05:35:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:35:51 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/25] dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock generator
Date: Wed, 13 Nov 2024 15:35:18 +0200
Message-Id: <20241113133540.2005850-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There are some differences b/w 5L35023 and 5P35023 Versa3 clock
generator variants but the same driver could be used with minimal
adjustments. The identified differences are PLL2 Fvco, the clock sel
bit for SE2 clock and different default values for some registers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/clock/renesas,5p35023.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 42b6f80613f3..162d38035188 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -31,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - renesas,5l35023
       - renesas,5p35023
 
   reg:
-- 
2.39.2


